Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id 6F93260620
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jan 2016 21:04:06 +0000 (UTC)
Received: by mail-ig0-f174.google.com with SMTP id ik10so40798171igb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Jan 2016 13:04:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=vbnimR4PjhK5MHWSzRkWebMOYE3GMvniNGW3L5UWGak=;
	b=XiH83IDnwLc8I335GJ+DmhutwH4HQOWBVtsqLLz6/tUxB5NOo5LIxl6b1G1Qx/bfIQ
	XPdGjOJ04gMBx1xu1dmBPqfuwb/f636KzZzbiZBb4KpF3jwiEI9OFGQ1R9KJClSmCevg
	0CR3hllXUw80zL5LEG34Lr2RvTbITSwWHI97nx8d7VrUZ1qlWwxxNte5pF2fgFEC+iX/
	dsPpqh6oTDirilVdDSBtkZ6/sdtZGe9HK69raMmmC2ficV4JfRs4ELXN0VoHe78mQvvP
	Jmb7sZKI6fejyI4GmlbW4uuchvJg2QGiMLfJzsh+P3rmz6rRW/92lN1pRX+HfiqtaHwR
	hQPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=vbnimR4PjhK5MHWSzRkWebMOYE3GMvniNGW3L5UWGak=;
	b=amLzKfM6pNItq/gwpQ57+gUuiUC/IHKykRktHJWMZfMG/p0vLCMRXbXUYUNrcwsT6A
	iYp2bCPdZQQbmY/DBSINGveib5s2ZFXiF93hCK12B+bWVpGrz+nAG6+z7MWGudzZgyID
	FKxhk5QOs0Elg7NUGXMMOc/Y6WPPwRDEApxRzzYSxbZ9pYCLBV5n3cBOrinehzpzEua4
	Kw9s1d0bb1yWW73ZaE31qYOKcoHN+uviKQHieCK2tRa/lYoDiwa4VbPztTv1tRLmt9BE
	A8pHuSv2K9d+Fo4ZYTXwVqjKgVVQYzN841pcRtVYyQ/qjsjsOsnZQuw9H/CFVKbZcjY4
	wq5A==
X-Gm-Message-State: ALoCoQnT1fXOHMjL+MzGOYZl9jQBQhLKILM9WZkAcFhKcQwnuhSiP+MAN7WzbLrbOfqItH3+qEOxay+GPhb6wfc5NQvjrkt/q5N/3fu2JY/Z4Kql4ul2pS8=
X-Received: by 10.50.55.4 with SMTP id n4mr4927088igp.64.1452114246259; Wed,
	06 Jan 2016 13:04:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Wed, 6 Jan 2016 13:03:46 -0800 (PST)
In-Reply-To: <1452101461-20892-1-git-send-email-lukas.bulwahn@oss.bmw-carit.de>
References: <1451986361-10021-2-git-send-email-lukas.bulwahn@oss.bmw-carit.de>
	<1452101461-20892-1-git-send-email-lukas.bulwahn@oss.bmw-carit.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 6 Jan 2016 21:03:46 +0000
Message-ID: <CAJTo0LZLmJvCHPN=6e1EBSTUaLu8rhPKx8ZQDuqoBsO1L=xqgA@mail.gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] boost: update to 1.60.0
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
X-List-Received-Date: Wed, 06 Jan 2016 21:04:07 -0000
Content-Type: multipart/alternative; boundary=e89a8f3b9b49d2728c0528b0b1b0

--e89a8f3b9b49d2728c0528b0b1b0
Content-Type: text/plain; charset=UTF-8

On 6 January 2016 at 17:31, Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>
wrote:

> The commit f50e7bc9fed323c5705c0ed992c03e80eeec1dd6 from the
> boostorg/test github repository (branch: develop) [2] addresses
> that issue, but it was not merged in the 1.60.0 release. This
> commit adds this upstream-accepted patch, which was created by:
>

Thanks Lukas, much appreciated.

Ross

--e89a8f3b9b49d2728c0528b0b1b0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 6 January 2016 at 17:31, Lukas Bulwahn <span dir=3D"ltr">&lt;<a href=3D"=
mailto:lukas.bulwahn@oss.bmw-carit.de" target=3D"_blank">lukas.bulwahn@oss.=
bmw-carit.de</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div i=
d=3D":12v" class=3D"a3s" style=3D"overflow:hidden">The commit f50e7bc9fed32=
3c5705c0ed992c03e80eeec1dd6 from the<br>
boostorg/test github repository (branch: develop) [2] addresses<br>
that issue, but it was not merged in the 1.60.0 release. This<br>
commit adds this upstream-accepted patch, which was created by:</div></bloc=
kquote></div><br>Thanks Lukas, much appreciated.</div><div class=3D"gmail_e=
xtra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--e89a8f3b9b49d2728c0528b0b1b0--
