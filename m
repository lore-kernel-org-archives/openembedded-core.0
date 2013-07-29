Return-Path: <djszapi@archlinux.us>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id 410E66B03A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 10:42:12 +0000 (UTC)
Received: by mail-pa0-f52.google.com with SMTP id kq13so5640763pab.39
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 03:42:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:x-gm-message-state;
	bh=/7RyqHip7A4AT3qV+Zz7gCpwJ8DDoAse9umrML0jsF4=;
	b=Keax8oEkpOf+lnxLz0QidCUnUzv+zVv6i/XPEJKR+5SfmKoXHMNBs1yjtQBDN+1HNj
	r7YyMES24VneOhhUN911K+btPo/pAz3L3HvnzTWdymEuabGV3yMV25+KY+RI4hNz09Vn
	hcZIkHlf/uV6/m9EgOisqkvB2DhP5gXg72FgVtPkxyHc1WxOGgtYD3DBg+EDVynPMU/V
	UWUNE3PYcbgviOZjTM8sTJwNFJHZar1Vlf1h4HgB8L5nSUOQP/7ZkhHmdy2mzJB/jFYh
	Ew8D1Ep/MWi40RsyuG3Uz75TDzkT/m3nvPTzR4rbv10515ZuC3SSktFza5MK40EQ7zvQ
	Vwhg==
MIME-Version: 1.0
X-Received: by 10.66.119.35 with SMTP id kr3mr68649588pab.149.1375094533095;
	Mon, 29 Jul 2013 03:42:13 -0700 (PDT)
Sender: djszapi@archlinux.us
Received: by 10.70.37.237 with HTTP; Mon, 29 Jul 2013 03:42:12 -0700 (PDT)
In-Reply-To: <1375094306.13247.11.camel@phil-desktop.brightsign>
References: <1375082184-14871-1-git-send-email-lpapp@kde.org>
	<1375092018.6324.176.camel@phil-desktop.brightsign>
	<CAOMwXhNqXneU6UzeHZJJVM++RmNmmdvNMp3mbNV=YpFVE6tOdw@mail.gmail.com>
	<1375093253.13247.5.camel@phil-desktop.brightsign>
	<CAOMwXhO6+sJWjKAKVh=y1gymGoSUNVgs+nV9fz8G8eo9WHyAkw@mail.gmail.com>
	<CAOMwXhN556gDMxEGGSaFwYMJ7EU=Pvn+4mZcy0Q4eLyn7ShjqA@mail.gmail.com>
	<1375094306.13247.11.camel@phil-desktop.brightsign>
Date: Mon, 29 Jul 2013 11:42:12 +0100
X-Google-Sender-Auth: 9vFq2sLR5cfZYyRxhGzD7iwgC2M
Message-ID: <CAOMwXhNsgLaOtmCouNmB3d7wuACAt7iSLfO5zMq-ph0FBi8w0A@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: Phil Blundell <pb@pbcl.net>
X-Gm-Message-State: ALoCoQlKBkqcd9AMnizfO2M6ZFs3WiexIm7YPw45eEaLxFkcuul+Y4Pwr9ytZiNd5o3rMY3MbmN/
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] busybox-1.21.1/defconfig: disable rfkill
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
X-List-Received-Date: Mon, 29 Jul 2013 10:42:12 -0000
Content-Type: multipart/alternative; boundary=047d7b0721ca2d9b5904e2a425ca

--047d7b0721ca2d9b5904e2a425ca
Content-Type: text/plain; charset=ISO-8859-1

You *do* realize rfkill is a hardly common feature?

Not to mention, you would cause a "runtime" issue which is pretty simple to
fix for a very minor portion compared to a *large* user base using older
toolchains. There is a huge difference between a few people cannot use
rfkill for those applications (2, ridiculous), and that a slightly old
toolchain cannot even build the *whole* project.


On Mon, Jul 29, 2013 at 11:38 AM, Phil Blundell <pb@pbcl.net> wrote:

> On Mon, 2013-07-29 at 11:30 +0100, Laszlo Papp wrote:
> > Not to mention, there is a huge difference between build time
> > regression and run time,
>
> Quite so, run-time regressions are much harder to detect and debug.
>
> p.
>
>
>
>
>

--047d7b0721ca2d9b5904e2a425ca
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">You *do* realize rfkill is a hardly common feature?<div><b=
r></div><div>Not to mention, you would cause a &quot;runtime&quot; issue wh=
ich is pretty simple to fix for a very minor portion compared to a *large* =
user base using older toolchains. There is a huge difference between a few =
people cannot use rfkill for those applications (2, ridiculous), and that a=
 slightly old toolchain cannot even build the *whole* project.</div>
</div><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">On Mon,=
 Jul 29, 2013 at 11:38 AM, Phil Blundell <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:pb@pbcl.net" target=3D"_blank">pb@pbcl.net</a>&gt;</span> wrote:<br><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex">
<div class=3D"im">On Mon, 2013-07-29 at 11:30 +0100, Laszlo Papp wrote:<br>
&gt; Not to mention, there is a huge difference between build time<br>
&gt; regression and run time,<br>
<br>
</div>Quite so, run-time regressions are much harder to detect and debug.<b=
r>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
p.<br>
<br>
<br>
<br>
<br>
</font></span></blockquote></div><br></div>

--047d7b0721ca2d9b5904e2a425ca--
