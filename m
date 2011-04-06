Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q7Zmd-0008Hg-2i
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Apr 2011 22:56:59 +0200
Received: by fxm19 with SMTP id 19so1441785fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Apr 2011 13:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=Hw6QZdEJPHcHs0yyGkolKMwVX/4pQY/l8uvEobFp1z0=;
	b=LX+mV6860J5ADmF3LbwhGDoL9uNmRM+fVJ+HnF/zzXA6N+HNW8y2zIRG9/Rr40lGia
	FJNcQtov1T5+bLyW4WbpEZRZX8J8QAkV6c179AyVQCNjQrTwrpkp3CfuAq7p2vWgTlNB
	zfvFSC1oY5voD1ExCcTgsTeAkAdcEm+bgy8Jw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=VOxmCIy+dvsWVfuzwu1k+T1VYRVl7kOf4FUeiQyc+hn1VWs6USxPXbPgPaKkHn+y2T
	blDkyRMQ9zfwZ8C8v9/9xrQ+zy1jEyIMH1MBobMaXailb7e7N07I88jMEQJkEYxiQWzt
	C2hMR+5QSyt8g6Hb4FYYq1jg7Kho24psRU1d4=
Received: by 10.223.29.4 with SMTP id o4mr81217fac.27.1302123283150; Wed, 06
	Apr 2011 13:54:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.23.136 with HTTP; Wed, 6 Apr 2011 13:54:13 -0700 (PDT)
In-Reply-To: <1302115114.22904.77.camel@rex>
References: <cover.1302050252.git.tom_rini@mentor.com>
	<95d636004deffc0d6473c67ee9b5ce62937dc085.1302050252.git.tom_rini@mentor.com>
	<BANLkTi=RTLB21JAz4N2B2kPWu6H3uTHn1w@mail.gmail.com>
	<1302115114.22904.77.camel@rex>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 6 Apr 2011 13:54:13 -0700
Message-ID: <BANLkTinQ-SJWwYs7rUmbOU8Kxpz-nfepRQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] ncurses: Update to 5.9
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
X-List-Received-Date: Wed, 06 Apr 2011 20:56:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 6, 2011 at 11:38 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Tue, 2011-04-05 at 23:18 -0700, Khem Raj wrote:
>> On Tue, Apr 5, 2011 at 5:38 PM, Tom Rini <tom_rini@mentor.com> wrote:
>> > The previous 5.7 release was relatively close to 5.8 due to it bringin=
g
>> > in a patch to sync with upstream work-in-progress. =C2=A0We skip over =
the
>> > 5.8 release and move to 5.9.
>>
>>
>> there already are patches for 5.9 available too
>> ftp://invisible-island.net/ncurses/5.9/ncurses-5.9.patch.gz
>
> Can someone summarise what the benefits of these patches are? I'm
> trying to figure out whether we lose anything due to this upgrade or
> not...
>

ftp://invisible-island.net/ncurses/5.9/README

> Cheers,
>
> Richard
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


