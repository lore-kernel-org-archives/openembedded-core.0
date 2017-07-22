Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id BFFAB71BA6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Jul 2017 15:20:09 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id m4so10026100wmi.4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Jul 2017 08:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=zGqkqv6qaHWxrXGLg1R4ds8eBVDDVV9DdrG9sGoD6ZM=;
	b=cR590dof9sBmZQx8MphkPOtaI6xs4R7E3Ye4Htg0WzTu0TRko+RGKcVGrSotqIc9Cy
	lYVhtvBPBxN/C6KgeuyjCj8VmFHjfOuYKx1Rsw33mBfdk4oKs3PIotN2t7oYXBJF9LlI
	W5S19JhYI8Gd7ymxUTKBhehjfDEr5NAM1Q3LexCoS2Vckbm+QfKBvIPyBnvLMd8Sg5DD
	xbAe2tkVX8hu3PEm00l+FAKIRHn77gFjxWZdEj5JYEKiRS0FkBKQ6RTM6rJJV/xUzNEE
	6Z8NT6cSf3ShoODPk/WteRggrrRK85mXyb9/Fa1sePXsawsYB6bqxtjCy52k0RmRxI//
	z0Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zGqkqv6qaHWxrXGLg1R4ds8eBVDDVV9DdrG9sGoD6ZM=;
	b=DBQa6A8t1/iDIYCSOS/tqwYeBf4uCXLNjZS6KP16OO/ACX0gUfeiEs6ntjCEeTFhm9
	jwKEvfxYzFxPdApCzeNSbkCEMUh3iXbvuDVRXYLFBJtVqkYcjBdATivDW3NuKOm3RPQ4
	jXU3YmYv+P+R8NkV0++wVl5/lhkdq2JS0rXSs2L/ETfuj7YzqSGWUYV5l3XDbFiiwwVG
	56snz5VEYk+DqMZui5Ff0wC0859SenA/qbK22CJyfqKLNIExfn9+VGQWxVhIxEYuonlc
	M4KQLT59Y0X7lypsvX2p0QrRdg4BKTf+0DTQJCq1Nl9CMrCWwNf5+3uJuwiMaygzXTTr
	WmqQ==
X-Gm-Message-State: AIVw112i1128mPBoBug+GbDuPTRpkOvFU40f0/KYwtcoBPzAV5QqR1ez
	VT3N1eIZlchzynR52GH3so+jvynzvA==
X-Received: by 10.80.159.202 with SMTP id c68mr5273842edf.11.1500736810479;
	Sat, 22 Jul 2017 08:20:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.149.181 with HTTP; Sat, 22 Jul 2017 08:19:40 -0700 (PDT)
In-Reply-To: <CAJTo0Lac01Ny9N5D0p8Qv+GCFXRNv0qF_BjGdXx4Q3zvc+1How@mail.gmail.com>
References: <cover.1500357604.git.dengke.du@windriver.com>
	<dd968ff528a0928627a3bb12b4b1e8d77a1ff829.1500357604.git.dengke.du@windriver.com>
	<CAJTo0Lac01Ny9N5D0p8Qv+GCFXRNv0qF_BjGdXx4Q3zvc+1How@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 22 Jul 2017 08:19:40 -0700
Message-ID: <CAMKF1soL-B5ryhSUD9twYD6BUwSQOpRN37uxd=OkC9HNLQaC1Q@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] expat: upgrade to 2.2.2
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
X-List-Received-Date: Sat, 22 Jul 2017 15:20:10 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Jul 22, 2017 at 2:24 AM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 18 July 2017 at 07:01, Dengke Du <dengke.du@windriver.com> wrote:
>>
>>     using getrandom syscall on linux 3.17+, so when we compiling
>> expat-native
>>     on the kernel older than 3.17, that would be failed.
>
>
> It's failing on Debian 8, which is kernel 4.9.0:
>
> | ../expat-2.2.2/lib/xmlparse.c:56:3: error: #error You do not have support
> for any sources of high quality entropy enabled. For end user security, that
> is probably not what you want. Your options include: * Linux + glibc >=2.25
> (getrandom): HAVE_GETRANDOM, * Linux + glibc <2.25 (syscall SYS_getrandom):
> HAVE_SYSCALL_GETRANDOM, * BSD / macOS (arc4random_buf): HAVE_ARC4RANDOM_BUF,
> * libbsd (arc4random_buf): HAVE_ARC4RANDOM_BUF + HAVE_LIBBSD, * Windows
> (RtlGenRandom): _WIN32. If insist on not using any of these, bypass this
> error by defining XML_POOR_ENTROPY; you have been warned. For CMake, one way
> to pass the define is: cmake -DCMAKE_C_FLAGS="-pipe -O2
> -DHAVE_SYSCALL_GETRANDOM" . If you have reasons to patch this detection code
> away or need changes to the build system, please open a bug. Thank you!
>
> (https://autobuilder.yocto.io/builders/nightly-ppc/builds/379/steps/BuildImages/logs/stdio)
>
> I suspect the detection code is well and truly broken.
>

I posted another patch doing this upgrade. I wonder if it has same
issue. it works on my 3.12 kernel based host.

> Ross
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

