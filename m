Return-Path: <kergoth@gmail.com>
Received: from mail-lb0-f174.google.com (mail-lb0-f174.google.com
	[209.85.217.174])
	by mail.openembedded.org (Postfix) with ESMTP id E060060135
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2013 20:45:46 +0000 (UTC)
Received: by mail-lb0-f174.google.com with SMTP id w6so1358935lbh.19
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2013 13:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=8gjQtrnaAdLNSZ8bLWvwRomRFpS0/B1mfqcM6NCG/Rs=;
	b=F+gg1ZZpQ7ULF6uft39JIsSMBXJSrehmWHegGwUuaKrbKCrMV2cR+J8ETWfsV7xlrR
	WMIdBE6Gw6w9ZEGlS5Xg7sSF0SlzSqakKF9sFClXhsxcvF0EZJh2A/oT/qjocGA4jKoP
	cCTR9/4yJo7TxSG6GCICxSzZuKwMij4BIUegpxs1NnwGGqzFrVCHN1qe92Iy3G78M0jI
	VoH3+nzvEJx8EM9PpEuos4dARkH1sh4TM+sMZSvHHnc9QlockqL4d8KSDLjijAYTSfR0
	QGUrjvlKakIroP5IvxHbdjec9jRxKd9eCXUdqjlBdjX/yBUajIYYBg1d05mceEIvsQaK
	PSmw==
X-Received: by 10.152.29.103 with SMTP id j7mr7470024lah.7.1379018747814; Thu,
	12 Sep 2013 13:45:47 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.35.200 with HTTP; Thu, 12 Sep 2013 13:45:27 -0700 (PDT)
In-Reply-To: <dec697bffb0eebaeb34f5acd32929ba866174585.1378890742.git.rongqing.li@windriver.com>
References: <cover.1378890742.git.rongqing.li@windriver.com>
	<dec697bffb0eebaeb34f5acd32929ba866174585.1378890742.git.rongqing.li@windriver.com>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 12 Sep 2013 13:45:27 -0700
X-Google-Sender-Auth: kkFXFKaG_CPfWkTZ4kQRqofcdu0
Message-ID: <CABcZANk8PQkxHUZ93-bSzgoSzc2_W3ArNT7_cD1v47oLBL7X7g@mail.gmail.com>
To: rongqing.li@windriver.com
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] ptest-runner: trivial fixes and refine
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
X-List-Received-Date: Thu, 12 Sep 2013 20:45:48 -0000
Content-Type: multipart/alternative; boundary=089e0160b8289a299b04e635d280

--089e0160b8289a299b04e635d280
Content-Type: text/plain; charset=UTF-8

On Wed, Sep 11, 2013 at 2:17 AM, <rongqing.li@windriver.com> wrote:

> +    for x in `find -L ./ -name run-ptest -type f -perm /u+x,g+x`
> +    do
>

As far as I can tell, busybox find doesn't support -L, so this adds an
implicit, undeclared dependency upon findutils.
-- 
Christopher Larson

--089e0160b8289a299b04e635d280
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On W=
ed, Sep 11, 2013 at 2:17 AM,  <span dir=3D"ltr">&lt;<a href=3D"mailto:rongq=
ing.li@windriver.com" target=3D"_blank">rongqing.li@windriver.com</a>&gt;</=
span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">+ =C2=A0 =C2=A0for x in `f=
ind -L ./ -name run-ptest -type f -perm /u+x,g+x`<br>
+ =C2=A0 =C2=A0do</div></blockquote></div><br>As far as I can tell, busybox=
 find doesn&#39;t support -L, so this adds an implicit, undeclared dependen=
cy upon findutils.<br>-- <br>Christopher Larson</div></div>

--089e0160b8289a299b04e635d280--
