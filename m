Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f174.google.com (mail-qc0-f174.google.com
	[209.85.216.174])
	by mail.openembedded.org (Postfix) with ESMTP id 22E7C60167
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Dec 2014 13:35:31 +0000 (UTC)
Received: by mail-qc0-f174.google.com with SMTP id c9so11528711qcz.33
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Dec 2014 05:35:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=HpnWhY+coG1dvkI2oru7P+pHwwLVdk/En91PXxnLPSE=;
	b=PkluAVdfVn1iD5+fQ/Q9BHVYd3shUGL1KJg5r2yRH4MpE/GN13LJFgcRTlXLlED1W0
	Spcnn/R7pg0UY4Ff3irAjoW9SiCGiMVrHHHuqhKS+6uY/PP+HtSJ1SdqDhfaHzbHcyav
	Vjnsgdai4Eu1LR4YQQDfU5rxf2Ielh4TZb1ZtCjbiaqHaYE1wLr/QvbXzDke3qWcszH0
	4oJ7MRvCyFuJ73hy9PquXrBS7aZLxpnU4mm0Nil7oUmifu4frct3T6GFOWTYunKv7Zww
	rz7pmUU5zyshgmk/HEqzKf3k7ZFTlO+/iMhG5MEtvSMOub4AHvZ3NyeErD7PpNB2Pb8A
	mIFg==
X-Gm-Message-State: ALoCoQkqIV+TSnYJhdwJkt6w1cQh7WgABMRuy0Ltue6gwpUUYVRaXVBoBMv2btBnDClKDW/cSrbi
X-Received: by 10.140.94.168 with SMTP id g37mr31547094qge.80.1420032932400;
	Wed, 31 Dec 2014 05:35:32 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Wed, 31 Dec 2014 05:35:12 -0800 (PST)
In-Reply-To: <54999162.7080409@gmail.com>
References: <1419224101-24900-1-git-send-email-akuster808@gmail.com>
	<CAJTo0LaOaz=vsqPPCy-f47vuAHx-rfgd7zZpLXNd3Qyhi36rww@mail.gmail.com>
	<54999162.7080409@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 31 Dec 2014 13:35:12 +0000
Message-ID: <CAJTo0LYKWwP1fEv8JaMvK9t7AyZoHmvRUzmKR-=+6+2gqXZcZA@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/5] [RFC] Move packages from meta-oe to core for X11
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
X-List-Received-Date: Wed, 31 Dec 2014 13:35:35 -0000
Content-Type: multipart/alternative; boundary=001a113a9b34816bce050b832e3c

--001a113a9b34816bce050b832e3c
Content-Type: text/plain; charset=UTF-8

On 23 December 2014 at 15:59, akuster808 <akuster808@gmail.com> wrote:

> So are you open to move 'xinit' from core to meta-oe?
>

No, xinit is used by all X11 images to start X.  The default script starts
twm etc, but images provide their own.

core-image-x11 installs matchbox-terminal and matchbox-window-manager so if
the init isn't working in that images then that's a bug.

Ross

--001a113a9b34816bce050b832e3c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 2=
3 December 2014 at 15:59, akuster808 <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:akuster808@gmail.com" target=3D"_blank">akuster808@gmail.com</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex"><div id=3D":4xo" class=3D"a3s" =
style=3D"overflow:hidden">So are you open to move &#39;xinit&#39; from core=
 to meta-oe?<br></div></blockquote></div><br>No, xinit is used by all X11 i=
mages to start X.=C2=A0 The default script starts twm etc, but images provi=
de their own.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail=
_extra">core-image-x11 installs matchbox-terminal and matchbox-window-manag=
er so if the init isn&#39;t working in that images then that&#39;s a bug.</=
div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</d=
iv></div>

--001a113a9b34816bce050b832e3c--
