Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-yw0-f182.google.com (mail-yw0-f182.google.com
	[209.85.161.182])
	by mail.openembedded.org (Postfix) with ESMTP id 40EF5719DD
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Feb 2017 11:38:54 +0000 (UTC)
Received: by mail-yw0-f182.google.com with SMTP id u68so59125365ywg.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Feb 2017 03:38:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+j8gsGwgsgtOuFF1J/Mw8fFxOCndyCDZRFDJ9gTrz/E=;
	b=gOac9jixiNCluJs8fYCPvrTBSNKDmuD1ZA1F2aRQ6B+S0EILcZdvzb1pixwxspNZ3Q
	QRrBPnmsKh52x1NwWKIcuJ4X+aBM54AZ46YwvFFfClAcyBvl8bNTvWreLVsyv+FqtYYR
	Jjfj6t2jv1PNyDVCt8pNTUXRUqo+tClwpG+t+aSJZC0Bk4Ae2clR9o0mmxxWDj9MIE9A
	272YZEyt2anRDLy5hp2Eh3Qi0zxSVSq4fdJMYiqW5gxqE5+OoJiDTi/2pMI7tZ7YeE42
	ag5ttW48AIKVBZPIgL3vY1+b4pb/QJ6wh/De88VEgfKtaulPVzHK739zRQUcWIy3jSO3
	iM0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+j8gsGwgsgtOuFF1J/Mw8fFxOCndyCDZRFDJ9gTrz/E=;
	b=FJys0blvaNInzWqlvsUg/L71pjIXzyYp3XvQ+ABLEq2KbJ9FRfekjPEG1FzHDcKlGK
	xM7uDIlVifh93J+3SlZL4ErShZ/IlA0pZQJ5Mesc5MToWb7QbUN7usdI0NAh5aNmBFFw
	IrSQ0vWVAMdQ63zwZBy7eecnxAE9pM/47erKXcusxbPoftaYhR8KKZRWMQLWV8TWYBXy
	WFf1CO3bwDeatKTU1BW2g5NJwHQY/hYimUD0otJ9gLz172tajx67Q9k9ae/1/M/8/dOt
	g6/Zc8Z/beMKeyft2ijcmJYTneaMZ9SO3cZwUaNo0ouD1dKHywt0w+PJ6retAphxxGel
	nlRg==
X-Gm-Message-State: AIkVDXLun89Agmu9dkjGO4VorwFCX2pgNkVVCO/qb3WSHFNM9t1LN0eNtrKL2qQoUqmRLWDAn/LJpdGx4hgKb5U5
X-Received: by 10.129.152.77 with SMTP id p74mr1180017ywg.177.1485949134919;
	Wed, 01 Feb 2017 03:38:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.13.234.11 with HTTP; Wed, 1 Feb 2017 03:38:24 -0800 (PST)
In-Reply-To: <1485912129-4012-1-git-send-email-tom.hochstein@nxp.com>
References: <1485912129-4012-1-git-send-email-tom.hochstein@nxp.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Wed, 1 Feb 2017 13:38:24 +0200
Message-ID: <CAHiDW_ESMwJK3xaE3sBUYXuhioBa51=QQ+aXudmFM0bSZ_ewuQ@mail.gmail.com>
To: Tom Hochstein <tom.hochstein@nxp.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] xserver-xorg: Fix X server 1.19 crash
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
X-List-Received-Date: Wed, 01 Feb 2017 11:38:56 -0000
Content-Type: multipart/alternative; boundary=94eb2c0bbf56578d900547767e87

--94eb2c0bbf56578d900547767e87
Content-Type: text/plain; charset=UTF-8

On 1 February 2017 at 03:22, Tom Hochstein <tom.hochstein@nxp.com> wrote:

> Commit 6a5a4e60373c1386b311b2a8bb666c32d68a9d99 removes the configure of
> useSIGIO option:
>
> xfree86 SIGIO support is reworked to use internal versions of
> OsBlockSIGIO and OsReleaseSIGIO
>
> The check for useSIGIO is no longer needed.
>

Can you explain what the crash is or how to reproduce, I can't figure it
out from the patch. Link to possible upstream ML discussion is fine as well.

Thanks,
  Jussi

--94eb2c0bbf56578d900547767e87
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 1=
 February 2017 at 03:22, Tom Hochstein <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:tom.hochstein@nxp.com" target=3D"_blank">tom.hochstein@nxp.com</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">Commit 6a5=
a4e60373c1386b311b2a8bb666c<wbr>32d68a9d99 removes the configure of<br>
useSIGIO option:<br>
<br>
xfree86 SIGIO support is reworked to use internal versions of<br>
OsBlockSIGIO and OsReleaseSIGIO<br>
<br>
The check for useSIGIO is no longer needed.<br></span></blockquote><div><br=
></div><div>Can you explain what the crash is or how to reproduce, I can&#3=
9;t figure it out from the patch. Link to possible upstream ML discussion i=
s fine as well.</div><div><br></div><div>Thanks,</div><div>=C2=A0 Jussi</di=
v></div></div></div>

--94eb2c0bbf56578d900547767e87--
