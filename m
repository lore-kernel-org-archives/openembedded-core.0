Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f52.google.com (mail-it0-f52.google.com
	[209.85.214.52])
	by mail.openembedded.org (Postfix) with ESMTP id 0423A7307B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2017 17:47:35 +0000 (UTC)
Received: by mail-it0-f52.google.com with SMTP id 203so185647599ith.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2017 09:47:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=EDkMW466rNQoYb7VqC/UIhrs/0mn0gJSy7+f4YdgYLc=;
	b=KxZIyT1mL7Ansj+Bu3FKjgsh6tpSL/hxcP3sZew6jEqrSub9ungMnT1qF7IN3wXt3v
	r4xzQy2QEINc+BCTwjvOO+KTXrzCax2mhG0ETVKlLFO7elisb1BKzT3iaBRXfOntuTWl
	20BtzkZciptkW3Mo7YcpQ7KacWHvoZ0evs4lirXcyjqAIuVCr5BR+F1RhbiMIzgFvtqj
	E+LHWpppN2EP2jnsp+dpokdHvLOk1k7PzORi/+7nFJusGkpto5mnWtbPfiQcjziBReqn
	Gw4tMT2MetvXwbt9jjI0+wr/z0GUfCHL53PfGNT0p0VSXGyPzQ/MyIH/JWV3eMSLGRQ2
	j8KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=EDkMW466rNQoYb7VqC/UIhrs/0mn0gJSy7+f4YdgYLc=;
	b=cmYt2JjHLsqISaMCXTcFaD4Caw/dQNSC/PHrYTZ/1RBsXYoSXLuIriWz2i1Y/nfLHh
	H+b96v9UAsL7M5Wo0Q8lONib0hpkw3gHqMQ5OAtRCSdApsaUoAToNLmuiF1gVBiv1ZO+
	YSigA/TQl4NR08iHhv0k2hgeYR9WZL2fcxU60gCMWYrD4DTBdjaDofRyTlpFtGfengrR
	xHUUSoVZReawUOytGSgmWzIKHszDmjh3g4W485CyVCESVQhIYPoxYViaO87nTcMoq6de
	oWgSJ5ktWlw/qVLYXmmp4CZ3ukr2TF9HELVizi7ljpKUDR7d4AkDMs56ftBp40HARAwQ
	rDEg==
X-Gm-Message-State: AMke39kjpThRHsb3mGVP0zkPIAQGS/wMD3Yo/4z4qd03cnFhmHvoDuP/zajS2a5eb82UjvFU
X-Received: by 10.107.6.215 with SMTP id f84mr29640158ioi.210.1487872056705;
	Thu, 23 Feb 2017 09:47:36 -0800 (PST)
Received: from pohly-mobl1 ([67.23.202.154]) by smtp.gmail.com with ESMTPSA id
	w77sm2041996ioi.20.2017.02.23.09.47.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Feb 2017 09:47:35 -0800 (PST)
Message-ID: <1487872053.11306.39.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Khem Raj <raj.khem@gmail.com>, "Neri, Ricardo" <ricardo.neri@intel.com>
Date: Thu, 23 Feb 2017 18:47:33 +0100
In-Reply-To: <20170218020440.GB30443@haswell>
References: <cover.51e0eb88ea69468cf5a410aa7194c25cf61d57b7.1485530988.git-series.patrick.ohly@intel.com>
	<cb8f971b4cb03c90f6459374609be3dce53f2ab1.1485530988.git-series.patrick.ohly@intel.com>
	<1487365856.4999.47.camel@linuxfoundation.org>
	<20170218020440.GB30443@haswell>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v5 03/12] ovmf: move from meta-luv to OE-core
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
X-List-Received-Date: Thu, 23 Feb 2017 17:47:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2017-02-17 at 18:04 -0800, Khem Raj wrote:
> On 17-02-17 13:10:56, Richard Purdie wrote:
> > On Fri, 2017-01-27 at 16:30 +0100, Patrick Ohly wrote:
> > > From: meta-luv <luv@lists.01.org>
> > > 
> > > This is an unmodified copy of
> > > github.com/01org/luv-yocto/meta-luv/recipes-core/ovmf revision
> > > 4be4329.
> > 
> > https://autobuilder.yocto.io/builders/nightly-world/builds/156
> > 
> > which boils down to:
> > 
> > | "gcc-ar" cr /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-world/build/build/tmp/work/x86-pokymllib32-linux/lib32-ovmf/git-r0/git/Build/OvmfIa32/RELEASE_GCC5/IA32/MdeModulePkg/Library/BootLogoLib/BootLogoLib/OUTPUT/BootLogoLib.lib  @/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-world/build/build/tmp/work/x86-pokymllib32-linux/lib32-ovmf/git-r0/git/Build/OvmfIa32/RELEASE_GCC5/IA32/MdeModulePkg/Library/BootLogoLib/BootLogoLib/OUTPUT/object_files.lst
> > | make: *** [/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-world/build/build/tmp/work/x86-pokymllib32-linux/lib32-ovmf/git-r0/git/Build/OvmfIa32/RELEASE_GCC5/IA32/MdeModulePkg/Library/BootMaintenanceManagerUiLib/BootMaintenanceManagerUiLib/DEBUG/BootMaintenanceManager.c] Error 2
> > | VfrCompile: ERROR 1003: Invalid option value
> > |   VFR file name /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-world/build/build/tmp/work/x86-pokymllib32-linux/lib32-ovmf/git-r0/git/Build/OvmfIa32/RELEASE_GCC5/IA32/MdeModulePkg/Library/BootMaintenanceManagerUiLib/BootMaintenanceManagerUiLib/OUTPUT/BootMaintenanceManager.i is too long.
> > | "gcc-ar" cr /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-world/build/build/tmp/work/x86-pokymllib32-linux/lib32-ovmf/git-r0/git/Build/OvmfIa32/RELEASE_GCC5/IA32/OvmfPkg/Library/NvVarsFileLib/NvVarsFileLib/OUTPUT/NvVarsFileLib.lib  @/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-world/build/build/tmp/work/x86-pokymllib32-linux/lib32-ovmf/git-r0/git/Build/OvmfIa32/RELEASE_GCC5/IA32/OvmfPkg/Library/NvVarsFileLib/NvVarsFileLib/OUTPUT/object_files.lst
> > 
> > i.e. path length issues.
> > 
> > We saw this on multiple builds :(.
> 
> I wonder why its using gcc-ar that should actually be <cross>-gcc-ar
> so probably we need to set AR to point to <cross>-gcc-ar, but I would
> like to see if we can use normal ar since  gcc-ar would fail with clang

The actual error wasn't in the gcc-ar invocation but rather the
VfrCompile tool, so for now I haven't done anything about gcc-ar vs. ar.
I have patches for the VfrCompile path length and the acpica+musl issue
which I will send momentarily.

Richard, Ross, they apply on top of the patches that I had sent earlier.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




