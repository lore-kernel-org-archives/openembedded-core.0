Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f48.google.com (mail-qg0-f48.google.com
	[209.85.192.48])
	by mail.openembedded.org (Postfix) with ESMTP id 56E2273710
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jul 2015 19:45:27 +0000 (UTC)
Received: by qgep37 with SMTP id p37so41990614qge.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jul 2015 12:45:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Jo8O1tfuk9LxZp2x9A74lU8lYvBbO/nb33+uGGFWfVU=;
	b=P8tSCR23kZ1NcKS6os9gefYtGBdkaqn7sD8mA2orPI6Pwl5+BbOI1SmzNDBjqWE+EM
	2NXD9eLa38idA0OfVSxEIt6rOiRWrTkiFQCDxaMOajoNUR4buwm75U2J4/SZuQYeScRg
	r48xpW4sIgu+/Cij48oyWdGx7qsGC64R/j6mrpFo85CaI4C6KiH8uNC6v2IG4N7z9sP/
	y8tE2GBZtO7L85gCJc0L4BRO6/Smbltoq+EMGDFgPRj8lhhbM2BAQnuhA2mdhCHwS4Nv
	DKz2wBInwllN+xoYJLvuwVO+wU0lxbLniRITTIZrj8qgSeGRmhpTa/3wbVph8yEx5hs4
	E2JQ==
X-Gm-Message-State: ALoCoQmaF/hunD79xY+fSnJSPpGJa6dfZZzd2vmhj2MVO3NH7A87cpKFwtSVh5buH1FnbTu9NoRd
X-Received: by 10.140.43.100 with SMTP id d91mr36195537qga.77.1436557527781;
	Fri, 10 Jul 2015 12:45:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Fri, 10 Jul 2015 12:45:08 -0700 (PDT)
In-Reply-To: <1436552179-25621-1-git-send-email-randy.e.witt@linux.intel.com>
References: <1436552179-25621-1-git-send-email-randy.e.witt@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 10 Jul 2015 20:45:08 +0100
Message-ID: <CAJTo0LYrOdAOeW6=-Z_K8OWtUZimX62YdURkM3M2LvdsKP_YVQ@mail.gmail.com>
To: Randy Witt <randy.e.witt@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python-smartpm: Have native smart use nativepython
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
X-List-Received-Date: Fri, 10 Jul 2015 19:45:35 -0000
Content-Type: multipart/alternative; boundary=001a113a989c24b05b051a8a9de2

--001a113a989c24b05b051a8a9de2
Content-Type: text/plain; charset=UTF-8

On 10 July 2015 at 19:16, Randy Witt <randy.e.witt@linux.intel.com> wrote:

> Currently when trying to use smart via devshell or in the bitbake
> environment, it will fail without inheriting pythonnative. Since the
> native tools should "just work" use nativepython in the shebang line for
> smart.
>

smart was recently upgraded to 1.5, can you rebase this please?

Cheers,
Ross

--001a113a989c24b05b051a8a9de2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 10 July 2015 at 19:16, Randy Witt <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:randy.e.witt@linux.intel.com" target=3D"_blank">randy.e.witt@linux.intel.=
com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":60c=
" class=3D"a3s" style=3D"overflow:hidden">Currently when trying to use smar=
t via devshell or in the bitbake<br>
environment, it will fail without inheriting pythonnative. Since the<br>
native tools should &quot;just work&quot; use nativepython in the shebang l=
ine for<br>
smart.<br></div></blockquote></div><br>smart was recently upgraded to 1.5, =
can you rebase this please?</div><div class=3D"gmail_extra"><br></div><div =
class=3D"gmail_extra">Cheers,</div><div class=3D"gmail_extra">Ross</div></d=
iv>

--001a113a989c24b05b051a8a9de2--
