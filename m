Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f169.google.com (mail-qt0-f169.google.com
	[209.85.216.169])
	by mail.openembedded.org (Postfix) with ESMTP id 2F07D72F0E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Apr 2017 16:12:54 +0000 (UTC)
Received: by mail-qt0-f169.google.com with SMTP id g60so49313541qtd.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Apr 2017 09:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=xiqRTAXrLXG3H60sxQLADSaIU8HteEpmDNeK3KcHVpY=;
	b=iB4WDXhUKKqrpbsndEUyH5ZryLeyELKhjYZI1EAlXCvKQIw/S8iRag2Ne9V9rRbj0r
	iS+P9vWb9tjQ6hQrHgVuwPEQNfbdknANAo93YDrmn6gEzneOKhaLGhwAkd2qP7jwazcq
	fft+HxeUIZLxXsvwffqi/7SdXZTE8I0Pq2DQv0Nq0oFYV/Fq5NU9gGTwQUIn5gx9hWu0
	Jhg0ZyBWjC7Fs1L8uEZx7qunU5PQF10GoXeHZaPZnPZmGh79qiJI55/z914zgbuyuXue
	WKbk+sL6QhmF8iPZ+WucewApfQ5LdapIPYXv+lR0rTSXnexMeaCvRq+y+8Q0WhOp4so7
	t/oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=xiqRTAXrLXG3H60sxQLADSaIU8HteEpmDNeK3KcHVpY=;
	b=K9t7cg1WgUcwP+5agYBwQYHDSva8DxbY09T6l/U9TJs9gH5CfhZWdLvTVmFwImxexw
	H7789tVcG+F1nW7D7fGta3n9M3jN4FzUtHr43Xp6S9HJsgU4tPkdV+++8/DogjOZ8RJs
	cC3i93/aNiWYHRKRMpYZvGrOVjWyM0iG3TcegYiOG0MGePRhJtuBp6NmcyIMJGoE/78g
	DXbjUV5tRfcf8JcjX1pd33VFu8T5RwBZAs/B7hyMGMDIt2mx2eYlt5czB7Ari8hqp0Fd
	rDMjywUUH/fmGyJ5jnaC3V6yigYo9YtYjkwxcUUbOFSIFggQCZmoGwFb6GMgdwwQPdAH
	X8Wg==
X-Gm-Message-State: AN3rC/7HHeQZ7pNhEJhsyRIFSz665kei4KilGdwYygnPvg5Jr5iAIjyl
	TGbYUuTyYJSi5wcnkgEV3KUHeu+Oyy1L
X-Received: by 10.200.46.26 with SMTP id r26mr9592731qta.197.1492704775436;
	Thu, 20 Apr 2017 09:12:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Thu, 20 Apr 2017 09:12:35 -0700 (PDT)
In-Reply-To: <4130d91cdc58431bbea8292c7cc30498@XBOX02.axis.com>
References: <4130d91cdc58431bbea8292c7cc30498@XBOX02.axis.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 20 Apr 2017 17:12:35 +0100
Message-ID: <CAJTo0LbNUuNXdnXw3QRU+LfSfHSNa4PcWPRhe0B2N0RVhH68Xw@mail.gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
	Michael Halstead <michael@yoctoproject.org>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Building logrotate for older releases is broken (was: RE: [PATCH 1/1] logrotate: set downloadfilename)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 20 Apr 2017 16:12:57 -0000
Content-Type: multipart/alternative; boundary=001a114708cce527ba054d9b69cf

--001a114708cce527ba054d9b69cf
Content-Type: text/plain; charset=UTF-8

On 20 April 2017 at 13:51, Peter Kjellerstedt <peter.kjellerstedt@axis.com>
wrote:

> The integration of this patch into OE-Core has broken building old
> releases that rely on fetching the logrotate-3.9.1.tar.gz tar ball
> with MD5 checksum 4492b145b6d542e4a2f41e77fa199ab0 from the mirror
> at http://downloads.yoctoproject.org/mirror/sources/. Can you please
> change the recipe to not call the downloaded tar ball the same name
> as it had in Jethro, Krogoth and Morty (given that the checksums do
> not match), and then restore the original tar ball in the mirror?
>

Eek, of course. :(

Staged a revert locally for pyro/master.

Michael, would it be possible to restore this older logrotate tarball to
the mirror?  We might need donations of a tarball...

Ross

--001a114708cce527ba054d9b69cf
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 20 April 2017 at 13:51, Peter Kjellerstedt <span dir=3D"ltr">&lt;<a href=
=3D"mailto:peter.kjellerstedt@axis.com" target=3D"_blank">peter.kjellersted=
t@axis.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=
=3D":2g2" class=3D"a3s aXjCH m15b8b6ba7bbbf4b1">The integration of this pat=
ch into OE-Core has broken building old<br>
releases that rely on fetching the logrotate-3.9.1.tar.gz tar ball<br>
with MD5 checksum 4492b145b6d542e4a2f41e77fa199a<wbr>b0 from the mirror<br>
at <a href=3D"http://downloads.yoctoproject.org/mirror/sources/" rel=3D"nor=
eferrer" target=3D"_blank">http://downloads.yoctoproject.<wbr>org/mirror/so=
urces/</a>. Can you please<br>
change the recipe to not call the downloaded tar ball the same name<br>
as it had in Jethro, Krogoth and Morty (given that the checksums do<br>
not match), and then restore the original tar ball in the mirror?<br></div>=
</blockquote></div><br>Eek, of course. :(</div><div class=3D"gmail_extra"><=
br></div><div class=3D"gmail_extra">Staged a revert locally for pyro/master=
.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Mich=
ael, would it be possible to restore this older logrotate tarball to the mi=
rror?=C2=A0 We might need donations of a tarball...</div><div class=3D"gmai=
l_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a114708cce527ba054d9b69cf--
