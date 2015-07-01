Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f41.google.com (mail-qg0-f41.google.com
	[209.85.192.41])
	by mail.openembedded.org (Postfix) with ESMTP id 581C073C63
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Jul 2015 22:42:45 +0000 (UTC)
Received: by qgat90 with SMTP id t90so6794413qga.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Jul 2015 15:42:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=GKbpSEEwAQ117VthObvD90rx/zMqLO9F1QZfVCxExxw=;
	b=MVvD5ytrj4w9pkOw+ZVXAeYdni7+IBxyQfbZUVDIO5ZF2SZ3rnuvhJa0ZojnBnbP7w
	Hd8RG1NpWdUahmfSEfl7Bp+OdhmhLRpo02M45szG0dmYwLKj9BB1dCnA5CiMHe44J9G9
	WQ+YyMiZ56TEEjHma0WZ4zmdAU4ElW2oAl29qLzbzzcjs/Brm/63JsPidAWEP3JF36k1
	nkdX5tdAIrE6UiWQk03UGkOH5PEVRKAWqJNTpT0qU5xJ6ehDzqjwzq5aRywRz38vtiU7
	v+FIBjGjGe9pUCe/uyH9w6CEUL8vgiaWdnZsk8JLQuXGhfjWiLN8H1mymq7UKUjM93Eo
	KLcg==
X-Gm-Message-State: ALoCoQlw77KG61aV+OnebPXd1Qo5B4DpS5vv7ljK4PvNMRFLBEzAhBdI7HBn8PHHF2GS8OM8Zx8k
X-Received: by 10.55.15.129 with SMTP id 1mr59829437qkp.29.1435790565208; Wed,
	01 Jul 2015 15:42:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Wed, 1 Jul 2015 15:42:25 -0700 (PDT)
In-Reply-To: <6769ffd59132415288582211bed1c32739a52430.1435497302.git.akuster808@gmail.com>
References: <cover.1435497302.git.akuster808@gmail.com>
	<6769ffd59132415288582211bed1c32739a52430.1435497302.git.akuster808@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 1 Jul 2015 23:42:25 +0100
Message-ID: <CAJTo0LZ58Ojrb=9ctie+VvB7F9BQJHSKsVghsSgedSn0EbnRQg@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] nettle: update package to 3.1.1 version.
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
X-List-Received-Date: Wed, 01 Jul 2015 22:42:48 -0000
Content-Type: multipart/alternative; boundary=001a1146f1009c84d50519d80ac5

--001a1146f1009c84d50519d80ac5
Content-Type: text/plain; charset=UTF-8

On 28 June 2015 at 14:18, Armin Kuster <akuster808@gmail.com> wrote:

> this requires the gnutls 3.4.1  update or the current gnutils build will
> break.
>

This appears to brake our partial support for building core-image-base
without GPLv3:

https://autobuilder.yoctoproject.org/main/builders/nightly-non-gpl3/builds/372/steps/BuildImages/logs/stdio

Either we trim down what we consider buildable without v3, disable gnutls
in iputils, or include the older versions in oe-core.

Any thoughts?

Ross

--001a1146f1009c84d50519d80ac5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 28 June 2015 at 14:18, Armin Kuster <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:akuster808@gmail.com" target=3D"_blank">akuster808@gmail.com</a>&gt;</s=
pan> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-lef=
t-style:solid;padding-left:1ex"><div id=3D":10m" class=3D"" style=3D"overfl=
ow:hidden">this requires the gnutls 3.4.1=C2=A0 update or the current gnuti=
ls build will break.<br></div></blockquote><div><br></div><div>This appears=
 to brake our partial support for building core-image-base without GPLv3:</=
div><div><br></div><div><a href=3D"https://autobuilder.yoctoproject.org/mai=
n/builders/nightly-non-gpl3/builds/372/steps/BuildImages/logs/stdio">https:=
//autobuilder.yoctoproject.org/main/builders/nightly-non-gpl3/builds/372/st=
eps/BuildImages/logs/stdio</a></div><div><br></div><div>Either we trim down=
 what we consider buildable without v3, disable gnutls in iputils, or inclu=
de the older versions in oe-core.</div><div><br></div><div>Any thoughts?</d=
iv><div><br></div><div>Ross</div></div></div></div>

--001a1146f1009c84d50519d80ac5--
