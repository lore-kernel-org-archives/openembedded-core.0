Return-Path: <djszapi@archlinux.us>
Received: from mail-pd0-f177.google.com (mail-pd0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id 6FE996B03A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 10:37:03 +0000 (UTC)
Received: by mail-pd0-f177.google.com with SMTP id u11so5299470pdi.22
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 03:37:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:x-gm-message-state;
	bh=RXiS+MidSpYZJCjJeiABJSXMIxdSOKylRHGUm1uOq10=;
	b=I8cFLz0yDUHBFpXydDh0E7Bv1AGNNCsVwQIyGDQsNDvb3dXHgdbbIY2llmWIEVA6qF
	nSlnAvu1XB29m28B5QWgfI+OHYbebh6MRBmiGQZ23lDt4nUYBtIaXdFU0ERPUDwoVO9X
	g9u3xTdkijLSoIzVUFWGrsdJVvBx+jJUJLVuL3vzNE935ZzrDsCWs+OH6JKX6UVbFY++
	IfCiL2epY81TS1K2NpgJQS0oWURnRWQr/rCRZZ+WRilzXIsevLicZXICNdTTEbDI2bG2
	xv4jhkRSTjsq2enE9IMKMWBeGISixz+I2vF4UZrjadJrzrPkYDk+TS2BDr8Pd5qC/R38
	NLQg==
MIME-Version: 1.0
X-Received: by 10.68.12.165 with SMTP id z5mr66224412pbb.172.1375094224423;
	Mon, 29 Jul 2013 03:37:04 -0700 (PDT)
Sender: djszapi@archlinux.us
Received: by 10.70.37.237 with HTTP; Mon, 29 Jul 2013 03:37:04 -0700 (PDT)
In-Reply-To: <1375094111.13247.9.camel@phil-desktop.brightsign>
References: <1375082184-14871-1-git-send-email-lpapp@kde.org>
	<1375092018.6324.176.camel@phil-desktop.brightsign>
	<CAOMwXhNqXneU6UzeHZJJVM++RmNmmdvNMp3mbNV=YpFVE6tOdw@mail.gmail.com>
	<1375093253.13247.5.camel@phil-desktop.brightsign>
	<CAOMwXhO6+sJWjKAKVh=y1gymGoSUNVgs+nV9fz8G8eo9WHyAkw@mail.gmail.com>
	<1375094111.13247.9.camel@phil-desktop.brightsign>
Date: Mon, 29 Jul 2013 11:37:04 +0100
X-Google-Sender-Auth: V2Brq9gYxDwD2vJQ6TlSFRgr28k
Message-ID: <CAOMwXhOtV_YdwG3s+_+t6=-XA-BZn_2OTpG8rNh3WUwGJCFEYg@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: Phil Blundell <pb@pbcl.net>
X-Gm-Message-State: ALoCoQkXIj7i/Hsc/9fSylyG6AIMOarc4hGUuHgu9jUCLi5j4gwMkj7+6tskge80mslAag1ZnThJ
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
X-List-Received-Date: Mon, 29 Jul 2013 10:37:03 -0000
Content-Type: multipart/alternative; boundary=bcaec51f9077c7a94304e2a412ec

--bcaec51f9077c7a94304e2a412ec
Content-Type: text/plain; charset=ISO-8859-1

Exactly, so you broke the update for the last two new versions on the
*build* level.

Anyway, if you do not have any sympathy for older users, then I am very
disappointed.

After this change, the image will build just fine for the "new" people.
Also, if you do not write a change on top of mine, it is probably not so
important anyhow?


On Mon, Jul 29, 2013 at 11:35 AM, Phil Blundell <pb@pbcl.net> wrote:

> On Mon, 2013-07-29 at 11:22 +0100, Laszlo Papp wrote:
> > I disagree. This change should not have gone in the first place
> > causing the regression for the users. Please be consistent with the
> > history.
>
> If this was a recent change then I would have some (limited) amount of
> sympathy for your position.  But the commit you are complaining about
> has been in the tree for over a year, and it was presumably included in
> at least one if not two of the most recent stable releases.
>
> p.
>
>
>
>

--bcaec51f9077c7a94304e2a412ec
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Exactly, so you broke the update for the last two new vers=
ions on the *build* level.<div><br></div><div>Anyway, if you do not have an=
y sympathy for older users, then I am very disappointed.</div><div><br></di=
v>
<div>After this change, the image will build just fine for the &quot;new&qu=
ot; people. Also, if you do not write a change on top of mine, it is probab=
ly not so important anyhow?</div></div><div class=3D"gmail_extra"><br><br>
<div class=3D"gmail_quote">On Mon, Jul 29, 2013 at 11:35 AM, Phil Blundell =
<span dir=3D"ltr">&lt;<a href=3D"mailto:pb@pbcl.net" target=3D"_blank">pb@p=
bcl.net</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<div class=3D"im">On Mon, 2013-07-29 at 11:22 +0100, Laszlo Papp wrote:<br>
&gt; I disagree. This change should not have gone in the first place<br>
&gt; causing the regression for the users. Please be consistent with the<br=
>
&gt; history.<br>
<br>
</div>If this was a recent change then I would have some (limited) amount o=
f<br>
sympathy for your position. =A0But the commit you are complaining about<br>
has been in the tree for over a year, and it was presumably included in<br>
at least one if not two of the most recent stable releases.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
p.<br>
<br>
<br>
<br>
</font></span></blockquote></div><br></div>

--bcaec51f9077c7a94304e2a412ec--
