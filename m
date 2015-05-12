Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f177.google.com (mail-qc0-f177.google.com
	[209.85.216.177])
	by mail.openembedded.org (Postfix) with ESMTP id 7E04B73FE5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 May 2015 14:26:02 +0000 (UTC)
Received: by qcvo8 with SMTP id o8so5107773qcv.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 May 2015 07:26:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=xHJ/QHp5hjUmTh8qs95C4HvbV9YPC7qKjR7fKduAqao=;
	b=DfgsSj3NkVXxMsGfgvobjWgbFFYOWBYZQXIjIY4MePzkqNUnOoY/B80P7LNUk2F1U+
	XhFtxUo+pbJ4mOwb6OsMDM3N9ephdOBwEghXPPP4lbXofQo3PZqtAzrjtOXY6VGB1dvn
	7ytew5wwi4Bgmqnd+aRl+2rIj5M83oKRNu0KAzU1ninuLKfRpgMTcraXUeUcsizwisF1
	w1vWVAOIxLozJkgX1qqbd9gaHxNMRSFqRZASHWiFT9VdSA+yV+LuU044XFRe8xjsflyH
	gMAjdBqHtFoULy4te8Rqy+Okd2QT7LWWTMibJbtwinZpFWqTDj7tP/egcFKsUsqnZ/Jl
	SWtw==
X-Gm-Message-State: ALoCoQnzpHOeLCFE/KT3jHmKlTN959+k/Jdzoh/KkKEi4edYgoEIQl7+2WqlwhoyZOD1HWCo3rMk
X-Received: by 10.55.23.16 with SMTP id i16mr33712039qkh.14.1431440763724;
	Tue, 12 May 2015 07:26:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Tue, 12 May 2015 07:25:43 -0700 (PDT)
In-Reply-To: <1431373976-20993-1-git-send-email-dmitry_eremin@mentor.com>
References: <1431373976-20993-1-git-send-email-dmitry_eremin@mentor.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 12 May 2015 15:25:43 +0100
Message-ID: <CAJTo0LZUd4bcbfTL+TbtiXOU1wc9ZaFGP0mTM_Y0hVMb1eMqWg@mail.gmail.com>
To: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RESEND][PATCH 1/3] meta: add new qemuarma9 machine definition
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
X-List-Received-Date: Tue, 12 May 2015 14:26:08 -0000
Content-Type: multipart/alternative; boundary=001a1146f4ba3d33a60515e3463c

--001a1146f4ba3d33a60515e3463c
Content-Type: text/plain; charset=UTF-8

On 11 May 2015 at 20:52, Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>
wrote:

> Currently qemuarm is limited to 256 Mb of RAM. Sometimes this is too
> little to run necessary applications. Add a new arm configuration based
> on Versatile Express board, Cortex-A9 CPU, allowing up to 1Gb of RAM.
>

Not sure I'm keen on oe-core having two almost-identical qemuarm machines.
Why not just change the qemuarm machine to use the A9?

Ross

--001a1146f4ba3d33a60515e3463c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 11 May 2015 at 20:52, Dmitry Eremin-Solenikov <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:dmitry_eremin@mentor.com" target=3D"_blank">dmitry_eremin@men=
tor.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D"=
:87" class=3D"a3s" style=3D"overflow:hidden">Currently qemuarm is limited t=
o 256 Mb of RAM. Sometimes this is too<br>
little to run necessary applications. Add a new arm configuration based<br>
on Versatile Express board, Cortex-A9 CPU, allowing up to 1Gb of RAM.<br></=
div></blockquote><div><br></div><div>Not sure I&#39;m keen on oe-core havin=
g two almost-identical qemuarm machines.=C2=A0 Why not just change the qemu=
arm machine to use the A9?</div><div><br></div><div>Ross=C2=A0<br></div></d=
iv></div></div>

--001a1146f4ba3d33a60515e3463c--
