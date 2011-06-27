Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QbI0X-0002Om-Db
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Jun 2011 22:02:09 +0200
Received: by pvf24 with SMTP id 24so3256909pvf.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jun 2011 12:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=zf2vKbTNlEBjy9aQiiyyunFGyMLE5fGqGAsH57KTS4A=;
	b=rOAB2Gt4Ah0YXxzbLGCT4uOJ/37KZnXbwSv++uJsYCjNJD7QoAMizvfIdwqdmte4c6
	p8JXw/+8G/xnWbAMy4+hkt06VmvlJWvVSrWscM5Txhdr3tbHLW8+39ZUPem9cPuHGF5a
	4lIf8v1Tkp1uY1+xbJ0qU6f0dgJ+g21qrj4p4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=nnjxSwKXLdaLWUoaxcEm/EVIPov5YlsweWRDIy6wMaU+QdAYSfAcHOfvJB4xIviKrx
	qn63FW3VcjCRl99QYpslJmpyBUJPv/nzs3UB8HjFQY54ytDKHegMKwYt9d8WpWdcxhM2
	cn9wXHJhkTVsky/SvEKbW3LkAMOsRr11v90zg=
Received: by 10.68.12.65 with SMTP id w1mr3630727pbb.294.1309204708212; Mon,
	27 Jun 2011 12:58:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.48.105 with HTTP; Mon, 27 Jun 2011 12:57:58 -0700 (PDT)
In-Reply-To: <1309204078.3035.1.camel@lenovo.internal.reciva.com>
References: <1309203709-25406-1-git-send-email-raj.khem@gmail.com>
	<1309204078.3035.1.camel@lenovo.internal.reciva.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 27 Jun 2011 12:57:58 -0700
Message-ID: <BANLkTin5U4ddEc4UxZqUUpnA8COWNfQJLQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] uclibc: Set ARCH_USE_MMU for armeb configs
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 27 Jun 2011 20:02:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 27, 2011 at 12:47 PM, Phil Blundell <pb@pbcl.net> wrote:
> On Mon, 2011-06-27 at 12:41 -0700, Khem Raj wrote:
>> After the last cleanup. armeb/uClibc.machine
>> gets picked up by default for ARM Big endian
>> so bring it uptodate.
>
>> -UCLIBC_HAS_FPU=3Dy
>> +# UCLIBC_HAS_FPU is not set
>> +UCLIBC_HAS_SOFT_FLOAT=3Dy
>
> Is this deliberate? =C2=A0That seems to be a change in behaviour but it i=
sn't
> mentioned in the commit message.

yes forgot that though.
>
> More generally, does armeb really need its own config file?

thanks for pointing it out. Indeed it does not need its own config
file since we already munge the endianness based on TARGET_ARCH in
uclibc-config.inc

I think thats a better approach to delete it. Let me see how that pans out

=C2=A0It seems as
> though there shouldn't be any difference between arm and armeb except
> endianness, and it should be fairly trivial to select that automatically
> in the same way as we do the other uClibc config customisations.
>
> p.
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


