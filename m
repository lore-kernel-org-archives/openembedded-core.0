Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f171.google.com (mail-ie0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 0FC577018F
	for <Openembedded-core@lists.openembedded.org>;
	Sat, 26 Jul 2014 16:33:45 +0000 (UTC)
Received: by mail-ie0-f171.google.com with SMTP id at1so4985371iec.30
	for <Openembedded-core@lists.openembedded.org>;
	Sat, 26 Jul 2014 09:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=EEuDQNOhkSVWm+lFU/eO52VjcwZFOT4WEouFozZbFcg=;
	b=xFm05BS98EBajmiJLuELPuyO/PM5TM6JZIVsVKC5jn3N7uYcXPmHVqxSgnGXUIlWM4
	JfRbisnHmkU0ehRBXq2rSwK7QtxPiViWWhsXXA5R4haoPCQhSIhbG/BP7pVbN9BYMgnR
	PYPv3gCSnIhlHnpcRhfriOk5D83mRaCQFR/DYNO3DMnjBph2msoIZ5CRbSeA5YnEoGZJ
	wzKYhVttAOhyxTEMOWzaw4Vd3dmXWAxkyVg4SIhnf3IrP98lOrq84TSnLMfvAAXRB1Vr
	uWykg/XLdzsKCo9q2ZDbm2LIB3c/eXej1ejTE8AUyDdxJSuw0jY+rtDzlyVsb1G5uSG8
	xPrQ==
X-Received: by 10.50.13.102 with SMTP id g6mr16149726igc.20.1406392426271;
	Sat, 26 Jul 2014 09:33:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.78.105 with HTTP; Sat, 26 Jul 2014 09:33:16 -0700 (PDT)
In-Reply-To: <CAAQYJAt1sQtz_sb=5NdWG2Ypkwgz+BRYAYiRWgA+hh9EaszT8Q@mail.gmail.com>
References: <CAAQYJAt1sQtz_sb=5NdWG2Ypkwgz+BRYAYiRWgA+hh9EaszT8Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 26 Jul 2014 09:33:16 -0700
Message-ID: <CAMKF1sp=PD0RfP4_Un49N=QJex77UubaQv3BjFv5JX2Na-VhsA@mail.gmail.com>
To: Andrea Adami <andrea.adami@gmail.com>
Cc: openembedded-core <Openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] libgcrypt.so.20.0.1' has relocations in .text [textrel]
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
X-List-Received-Date: Sat, 26 Jul 2014 16:33:48 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jul 25, 2014 at 3:21 PM, Andrea Adami <andrea.adami@gmail.com> wrote:
> Hi, somehow this QA is repeatedly here:
>
> andrea@mizar:/oe/oe-core/build$ bitbake core-image-base
> Loading cache: 100% |###########################################| ETA:  00:00:00
> Loaded 2519 entries from dependency cache.
> Parsing recipes: 100% |#########################################| Time: 00:00:07
> Parsing of 2066 .bb files complete (2065 cached, 1 parsed). 2519
> targets, 115 skipped, 0 masked, 0 errors.
> NOTE: Resolving any missing task queue dependencies
>
> Build Configuration:
> BB_VERSION        = "1.23.1"
> BUILD_SYS         = "x86_64-linux"
> NATIVELSBSTRING   = "Ubuntu-14.04"
> TARGET_SYS        = "arm-oe-linux-gnueabi"
> MACHINE           = "poodle"
> DISTRO            = "nodistro"
> DISTRO_VERSION    = "nodistro.0"
> TUNE_FEATURES     = "arm armv5 thumb dsp"
> TARGET_FPU        = "soft"
> meta              = "master:188545ba82119d75f80dde322a73712ce1f0f762"
> meta-initramfs    = "master:1060b4a157c5854f071f0dd7b48d55faeef3f818"
> meta-handheld     = "master:b61b450a0639aaac6f17ec4656950e28545c90e0"
> meta-oe
> meta-networking   = "master:1060b4a157c5854f071f0dd7b48d55faeef3f818"
> meta-opie         = "master:369016695601cea46915fe47de1d86d31dd9acd7"
>
> NOTE: Preparing runqueue
> NOTE: Executing SetScene Tasks
> NOTE: Executing RunQueue Tasks
> NOTE: validating kernel config, see log.do_kernel_configcheck for details
> WARNING: QA Issue: ELF binary
> '/oe/oe-core/build/tmp-eglibc/work/armv5te-oe-linux-gnueabi/libgcrypt/1.6.1-r0/packages-split/libgcrypt/usr/lib/libgcrypt.so.20.0.1'
> has relocations in .text [textrel]
> NOTE: Tasks Summary: Attempted 2368 tasks of which 1071 didn't need to
> be rerun and all succeeded.
>
> A quick inspection of the configurations shows th elibs are compiled
> -fPIC -DPIC  so one common cause seems ruled out.
>
> But I'm confused after reading
> http://lists.gnupg.org/pipermail/gnupg-devel/2014-January/028163.html
>

Generally you use -fpic thats sufficient and optimal in most cases and
on most architectures, in some cases when GOT is really larger than
ABI limits you can use -fPIC it makes difference on architectures like
ppc
where it will use 3 instructions to access larger GOT whereas -fpic
will use 1 instruction.

For this case it could be that there is some assembly file which is
not getting the right flags, try adding --enable-noexecstack thru
EXTRA_OECONF and see if that helps.


> Worth opening a bug?
>
> Cheers
>
> Andrea
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

