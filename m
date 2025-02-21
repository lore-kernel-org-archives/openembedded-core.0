Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A4F1C021B3
	for <webhook@archiver.kernel.org>; Fri, 21 Feb 2025 14:34:25 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.24180.1740148455550355892
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Feb 2025 06:34:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=FlcQlisn;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6D1994326B;
	Fri, 21 Feb 2025 14:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1740148453;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MfPNfinsoZ2rMd9mitQehyxn1xJ4e22aJH7FFkWkzno=;
	b=FlcQlisnkQB8AZfOQrGx1soq0cNVRkhgCyO0J8sjJZIw11KsNzSLQHOk3ZJBiw+uWH1OYm
	y5JW89XbTZaiVXzs09R6spn7STEoIMZJ3ZIjcbobpLgohCz19ZJewbLDIV81WwbTEZeD7F
	RInM/651kc+IhdF0pkLVEqsCO9Qxi5mJbrUPc0cg8wYnnBgfYqvsIi/+gjvPI2VEEnnrEf
	IfAGYv+UJohLdd6A68q0u1s2QKbAj6QRaKn50K9CUaT5deDQ/p3tCw0ukp53yiQgWZc4pN
	IZD4928NFIpK9miSntEd9j4N886WgIIZDdcPZxn3l1SnLxuVPxTZbo9qnGZlGA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 21 Feb 2025 15:34:12 +0100
Message-Id: <D7Y7576F5D4R.128DYAUZ74YXF@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <changqing.li@windriver.com>,
 <openembedded-core@lists.openembedded.org>, <joerg.sommer@navimatix.de>
Subject: Re: [OE-core] [PATCH] Revert "python3-ctypes: depend on ldconfig
 only if distro-feature set"
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20250220035724.1460062-1-changqing.li@windriver.com>
In-Reply-To: <20250220035724.1460062-1-changqing.li@windriver.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdejtddvlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpegggfgtfffkhffvuffofhgjsehtqhertdertdejnecuhfhrohhmpedfofgrthhhihgvuhcuffhusghoihhsqdeurhhirghnugdfuceomhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepledufeevteegteetgeehieeujeehgeelfeejvdeliefhfeffkefhgfejieeigffhnecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdrohhrghdprhhoohhtfhhsrdhphidpghhithhhuhgsrdgtohhmpdihohgtthhophhrohhjvggtthdrohhrghdphihotghtohdrihhopdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemsggvjedumeekfedtugemfhekvggvmeefgeguudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemsggvjedumeekfedtugemfhekvggvmeefgeguuddphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopegthhgrn
 hhgqhhinhhgrdhlihesfihinhgurhhivhgvrhdrtghomhdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdprhgtphhtthhopehjohgvrhhgrdhsohhmmhgvrhesnhgrvhhimhgrthhigidruggv
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Feb 2025 14:34:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211801

On Thu Feb 20, 2025 at 4:57 AM CET, Changqing Li via lists.openembedded.org=
 wrote:
> From: Changqing Li <changqing.li@windriver.com>
>
> In oe-core, function ldconfig_postinst_fragment use exist of
> /sbin/ldconfig to decide if ldconfig is runned to generate the cache,
> and function _run_ldconfig will run ldconfig to generate cache during
> generate rootfs.  ldconfig.service is actually not used since we have
> generate ld.so.cache during do_rootfs, refer[1][2][3]. ldconfig
> dependency is necessary when ldconfig not in DISTRO_FEATURES.
>
> The reverted commit causes regression when ldconfig not in
> DISTRO_FEATURES, before, without ldconfig in DISTRO_FEATURES,
> ctypes.util.find_library(name) can find the lib if it is installed, now,
> since ldconfig is not installed, ctypes.util.find_library(name) cannot
> find the lib even if it is installed.
>
> Here is one usecase(gtk+3 lib is installed, ctypes.util.find_library
> used to find the lib):
> import wx.lib.wxcairo as wxcairo
> File "/usr/lib/python3.13/site-packages/wx/lib/wxcairo/{}init{}.py", line=
 59, in <module>
>   from .wx_cairocffi import _ContextFromDC, _FontFaceFromFont
> File "/usr/lib/python3.13/site-packages/wx/lib/wxcairo/wx_cairocffi.py", =
line 189, in <module>
>   gdkLib =3D _findGDKLib()
> File "/usr/lib/python3.13/site-packages/wx/lib/wxcairo/wx_cairocffi.py", =
line 181, in _findGDKLib
>   return _findHelper([libname], 'gdk',
>                      "Unable to find the GDK shared library")
> File "/usr/lib/python3.13/site-packages/wx/lib/wxcairo/wx_cairocffi.py", =
line 170, in _findHelper
>   raise RuntimeError(msg)
> RuntimeError: Unable to find the GDK shared library
>
> [1] https://git.openembedded.org/openembedded-core/tree/meta/classes-glob=
al/package.bbclass#n394
> [2] https://git.openembedded.org/openembedded-core/tree/meta/lib/oe/rootf=
s.py#n316
> [3] https://github.com/systemd/systemd-stable/blob/v255-stable/units/ldco=
nfig.service
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---

Hi,

Thanks for your patch. However, I believe this is introducing some
regression: I've got some ptest failures on the autobuilder:

AssertionError:
Failed ptests:
{'python3': ['test_timerfd_TFD_TIMER_ABSTIME', 'python3']}

https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/992

You can get some more advanced about ptest failures in there:

https://valkyrie.yocto.io/pub/non-release/20250221-33/testresults/qemux86-6=
4-ptest/core-image-ptest-python3/

Can you have a look at this issue please?

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


