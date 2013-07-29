Return-Path: <djszapi@archlinux.us>
Received: from mail-pb0-f44.google.com (mail-pb0-f44.google.com
	[209.85.160.44])
	by mail.openembedded.org (Postfix) with ESMTP id BFE796A3ED
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 10:22:06 +0000 (UTC)
Received: by mail-pb0-f44.google.com with SMTP id wy7so4463768pbc.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 03:22:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:x-gm-message-state;
	bh=nCyKsLroBDQpabH5kYL5U2l2dM4CQj7ikAUcjzYSAzs=;
	b=Kxk39EBl4NdL8cUby349mOUr/p8ze+4gL5WESIkc3Xek32lcegswHVasH7t9cBx4VQ
	DCBHYc+G0uyx5doh9bnumcSOLK9cdpXOAOwp81C5ZbV2636R6QjYln8CIZeZblpw6ad5
	7ay+Nxy9mt0UV4CsRMcaHVLxnu2FTZPuuGoLwbvO/xNl1QnUYD+Zy4PZXhzAlDgl1CuL
	af0Mut9ukKu1pSPwH63fBR9w+/5tr8thk3pP70EI2VpJk6VosFgcgeXwDT2z03P38WpK
	2FkZbpklSCbj3njrK+ncFMdGCIBhNRvtmSKyH35margeEWesWpFYP7rpaL6FV5UpeJXn
	xZxg==
MIME-Version: 1.0
X-Received: by 10.68.172.34 with SMTP id az2mr66249828pbc.201.1375093327522;
	Mon, 29 Jul 2013 03:22:07 -0700 (PDT)
Sender: djszapi@archlinux.us
Received: by 10.70.37.237 with HTTP; Mon, 29 Jul 2013 03:22:07 -0700 (PDT)
In-Reply-To: <1375093253.13247.5.camel@phil-desktop.brightsign>
References: <1375082184-14871-1-git-send-email-lpapp@kde.org>
	<1375092018.6324.176.camel@phil-desktop.brightsign>
	<CAOMwXhNqXneU6UzeHZJJVM++RmNmmdvNMp3mbNV=YpFVE6tOdw@mail.gmail.com>
	<1375093253.13247.5.camel@phil-desktop.brightsign>
Date: Mon, 29 Jul 2013 11:22:07 +0100
X-Google-Sender-Auth: cAlMTdKx13MhWWs-9a8VIh307cw
Message-ID: <CAOMwXhO6+sJWjKAKVh=y1gymGoSUNVgs+nV9fz8G8eo9WHyAkw@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: Phil Blundell <pb@pbcl.net>
X-Gm-Message-State: ALoCoQnsnc1BW07Cd4lzW1lhJDz6gBPa1t2cGq38j2e+VFIQj2Hf9KYfhdyAPINRVe2NmaahfFJa
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
X-List-Received-Date: Mon, 29 Jul 2013 10:22:06 -0000
Content-Type: multipart/alternative; boundary=047d7b10c92b52045f04e2a3ddb7

--047d7b10c92b52045f04e2a3ddb7
Content-Type: text/plain; charset=ISO-8859-1

I disagree. This change should not have gone in the first place causing the
regression for the users. Please be consistent with the history.


On Mon, Jul 29, 2013 at 11:20 AM, Phil Blundell <pb@pbcl.net> wrote:

> On Mon, 2013-07-29 at 11:01 +0100, Laszlo Papp wrote:
> > No, that was intentional. That is why the change has been updated.
> >
> >
> > I can update the commit message if that is what you wish?
>
> As a general rule yes, please always make sure that the commit message
> describes what the patch is actually doing.
>
> But in this particular case, your new patch seems to have more serious
> problems since it will cause rfkill to silently disappear for many
> people who do currently have it.
>
> If your distro selects a toolchain which doesn't contain the necessary
> bits to support rfkill then it seems as though the appropriate course of
> action would be to either:
>
> a) patch rfkill so that it does build with your headers; or
>
> b) introduce a PACKAGECONFIG option for busybox to turn off rfkill even
> if it would naturally default to on, and set this in your distro
> configuration; or
>
> c) just add your own .bbappend for busybox to do what you want.
>
> p.
>
>
>
>

--047d7b10c92b52045f04e2a3ddb7
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I disagree. This change should not have gone in the first =
place causing the regression for the users. Please be consistent with the h=
istory.</div><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">=
On Mon, Jul 29, 2013 at 11:20 AM, Phil Blundell <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:pb@pbcl.net" target=3D"_blank">pb@pbcl.net</a>&gt;</span> wrot=
e:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On Mon, 2013-07-29 at 11:0=
1 +0100, Laszlo Papp wrote:<br>
&gt; No, that was intentional. That is why the change has been updated.<br>
&gt;<br>
&gt;<br>
&gt; I can update the commit message if that is what you wish?<br>
<br>
</div>As a general rule yes, please always make sure that the commit messag=
e<br>
describes what the patch is actually doing.<br>
<br>
But in this particular case, your new patch seems to have more serious<br>
problems since it will cause rfkill to silently disappear for many<br>
people who do currently have it.<br>
<br>
If your distro selects a toolchain which doesn&#39;t contain the necessary<=
br>
bits to support rfkill then it seems as though the appropriate course of<br=
>
action would be to either:<br>
<br>
a) patch rfkill so that it does build with your headers; or<br>
<br>
b) introduce a PACKAGECONFIG option for busybox to turn off rfkill even<br>
if it would naturally default to on, and set this in your distro<br>
configuration; or<br>
<br>
c) just add your own .bbappend for busybox to do what you want.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
p.<br>
<br>
<br>
<br>
</font></span></blockquote></div><br></div>

--047d7b10c92b52045f04e2a3ddb7--
