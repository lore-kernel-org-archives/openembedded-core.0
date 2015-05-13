Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id 2C20C7408D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 May 2015 23:39:18 +0000 (UTC)
Received: by qkgx75 with SMTP id x75so39600396qkg.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 May 2015 16:39:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=vePAro0lbuu0hWDbSRNQemX0Rq9SpAtThnz7e8RXbYs=;
	b=OarIR4lTiy8kZlX/S2q+1Qa0x7r/dWUFIfhoHD0adVo+A+NICCWIKFEpRQ9ShRuwvd
	BGkEfbejT8HvseaoZwMKD4Qz0EGWZ+fbXvvd9Rqk0mvN657vRFE46l35APgjbMLWbCuv
	UAFy99BHG5WbyRARxnABYJ7ObrUioRbpBSXXKMbv/DnrfZKANS/R2RJseWLa3nOP4Ibe
	g1RxdQXw/O9o/KY++rhWh4tfZnmYnLphLLmMVtiNvnY7dKSoZL2BafSi4HyVnSqsfSkL
	znUNV/LWE08vxMc5CLOwoyJnIVh/e81EDy1bQEZBNwV9/ztJp1OQ92RDmavSydToY7ux
	NPPA==
X-Gm-Message-State: ALoCoQk2iK8j1QOZ0UYPYDqCO+wyNB7/CBvdjYF/IdkxEwh6iXw86ehvHroGINZZWDy9gt4rv6Ig
X-Received: by 10.140.235.77 with SMTP id g74mr1978811qhc.64.1431560359731;
	Wed, 13 May 2015 16:39:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Wed, 13 May 2015 16:38:59 -0700 (PDT)
In-Reply-To: <5552A982.3090100@windriver.com>
References: <cover.1431333085.git.liezhi.yang@windriver.com>
	<d81cfb100f102438213c54a72c1f412323a80dd2.1431333085.git.liezhi.yang@windriver.com>
	<CAJTo0LZ40TNQ4NiFKChiYikMsyKN3hUyZ9GjhezVeEtSQqSeVQ@mail.gmail.com>
	<55516887.5080908@windriver.com>
	<CAJTo0LYsOyP27CHxMvy87fgU=+YhMREtfbodMSv4o+C4jgh1_g@mail.gmail.com>
	<5552A982.3090100@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 14 May 2015 00:38:59 +0100
Message-ID: <CAJTo0LZTnpZ6jkWO1aQFSVK54g=0wOaSLUFUVkwcu2iqbjXTFw@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] xserver-xorg: disable xwayland
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
X-List-Received-Date: Wed, 13 May 2015 23:39:19 -0000
Content-Type: multipart/alternative; boundary=001a11354a00b7a1ba0515ff1e44

--001a11354a00b7a1ba0515ff1e44
Content-Type: text/plain; charset=UTF-8

On 13 May 2015 at 02:31, Robert Yang <liezhi.yang@windriver.com> wrote:

> I've updated it in the repo:
>
>   git://git.openembedded.org/openembedded-core-contrib rbt/3fixes
>

Actually looked at the build output this time...  we should have each
xserver in a separate package really, so can the xwayland binary go into an
xwayland package?  We don't really want to force the xwayland binary (and
extra dependencies) on everyone's X11-based images just because wayland is
a default distro feature.

Ross

--001a11354a00b7a1ba0515ff1e44
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 13 May 2015 at 02:31, Robert Yang <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":ye" class=
=3D"a3s" style=3D"overflow:hidden">I&#39;ve updated it in the repo:<span cl=
ass=3D""><br>
<br>
=C2=A0 git://<a href=3D"http://git.openembedded.org/openembedded-core-contr=
ib" target=3D"_blank">git.openembedded.org/openembedded-core-contrib</a> rb=
t/3fixes<br></span></div></blockquote></div><br>Actually looked at the buil=
d output this time... =C2=A0we should have each xserver in a separate packa=
ge really, so can the xwayland binary go into an xwayland package?=C2=A0 We=
 don&#39;t really want to force the xwayland binary (and extra dependencies=
) on everyone&#39;s X11-based images just because wayland is a default dist=
ro feature.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_e=
xtra">Ross</div></div>

--001a11354a00b7a1ba0515ff1e44--
