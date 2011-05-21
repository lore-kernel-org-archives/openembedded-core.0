Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QNvHO-0004fY-My
	for openembedded-core@lists.openembedded.org;
	Sun, 22 May 2011 01:08:18 +0200
Received: by ewy5 with SMTP id 5so1536329ewy.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 May 2011 16:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=mSXkx6OhG4PVHRPz2Ej+Xho/tM8BvO2AEvLBYTtgH+w=;
	b=nea9HkzHYVHY35E+YIZdDM3hO/dzpxTHkZAx++sJ8P8W4D55T68RUJrnsxvqtjAwbr
	JP+/FzTn+dVhjQ+Z8AK90cD8lEMSM4g7QsMs4SeF2CsEh2jzrE+kDnY9SktXPatAtHqG
	SC5mqi1sbsxjPXBN0IxraCmMebp6xz8H0gtjU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=tuIFq5c1o93KatAz/6ciqbLSPRy58fpnvpEETFK27xS/aVjBkK4Nzd5yZQmuDQx3Do
	/T234PWsRcQBdm9q6UJGK5fBRar1tAEXe+qxM9KTB8abK/cza+j3xc18gf/3jL8e0uCd
	LJ0e2n2qVIDu6tbZk1Zp5UCjnrYRsrmxYFNKg=
Received: by 10.14.9.18 with SMTP id 18mr329292ees.236.1306019120284; Sat, 21
	May 2011 16:05:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.53.78 with HTTP; Sat, 21 May 2011 16:04:50 -0700 (PDT)
In-Reply-To: <1305964848.18415.257.camel@lenovo.internal.reciva.com>
References: <cover.1305933509.git.raj.khem@gmail.com>
	<43cfb965113150ea56c55c3880b67ba272b3c719.1305933509.git.raj.khem@gmail.com>
	<1305964848.18415.257.camel@lenovo.internal.reciva.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 21 May 2011 16:04:50 -0700
Message-ID: <BANLkTimzZ6FzOjYoZCYtQL8nEMDNJFdEhg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] opkg_svn.bb: Install rcS.d into ${D} instead of ${IMAGE_ROOTFS}
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
X-List-Received-Date: Sat, 21 May 2011 23:08:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, May 21, 2011 at 1:00 AM, Phil Blundell <pb@pbcl.net> wrote:
> On Fri, 2011-05-20 at 16:19 -0700, Khem Raj wrote:
>> - =C2=A0 =C2=A0 install -d ${IMAGE_ROOTFS}/${sysconfdir}/rcS.d
>> + =C2=A0 =C2=A0 install -d $D/${sysconfdir}/rcS.d
>
> Just as a note in passing, this sort of thing is best written as:
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0install -d "${D}${sysconfdir}/rcS.d"
>
> i.e. you don't need a slash after ${D}, and the whole argument should
> ideally be quoted to protect against characters that are special to the
> shell.

ok done and patch is in pull branch with this fixed
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


