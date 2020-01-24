Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id CB3747FDA2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2020 19:13:21 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id a6so1180484plm.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2020 11:13:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=FKSdfssIT5O1QfsEwMe0Y2KJUYMDd/LBeMvc1r+EtVY=;
	b=PYNrkS6OxM9n5ww90/PPvhMWtymuUUTYa9Ve9jvI+jRbHRcNyOUDUPOpTRZd/DPXbY
	VhlE8MLsoc0x/nEtvb5MNqDGXb4W7xG8mcfc1epWfmx/p5H7vpvQBHaVAK3U+6WDUQmp
	SP376ste6R5okxRrfgXZMEYcJgHLNwgc+VFyor36URI38J7SHy0l428Y3DMJsYMFRYVY
	3SVPrHxbTG1r6Jso06Z3rmdk5fBvXiSuLKjNsYcEO8MxGi/CClhR0fR39hHVxZq1jsfm
	c6LMjLvmfVWTgkJZWh6HVwyZMYQegDHkZ3UznjVpYcLp1hLFzyDj/NtPuNr8OfWHji7X
	Helg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=FKSdfssIT5O1QfsEwMe0Y2KJUYMDd/LBeMvc1r+EtVY=;
	b=OZm9J+n2HhYVmXB5Ucl9PjQjYc4bzF8cwa9HMyByvvIM287fJS7eRGCdZFOhVEZecW
	NP7fc69J9fMMTuTgFiaVNe6f6ykUPu61I8wz25I+s4oXT4qQAMGEe/nMLPHtWaYloEqp
	KOiRY8Imw6vnwm5nWrHTgR+bfe7N1lOdM4e9MuCKg7nmRLNU0k/KHFYUYGqLDctNpLm5
	Ojj8skwyAUYDZ/JQ0DJ1RTLXxv+sglSdVTwUvFeSnY2SuyTFF6OkAgolAJHcMNld4zNq
	FHD59rvBamfKGYUGPpNxMBro6jQaMRR++nL2POKGsuNjydexOuBdrySTfb2yT4asgdvA
	jqSA==
X-Gm-Message-State: APjAAAURVQN0RKe9dpebcRGj1oMhTHNKVp5Km5xlyJaXUr3YdJ6hQeck
	LwnCvfV+QLDouIiIHlxvrQEr1/rHV4g=
X-Google-Smtp-Source: APXvYqzrWN+hwxa0ffsEUhk1Cf82WTqGD2wKf/Pjm8hkYsZyDmxMN68VuSsw5x1i5w44W65EUhtjWw==
X-Received: by 2002:a17:90a:8a96:: with SMTP id
	x22mr721616pjn.139.1579893202117; 
	Fri, 24 Jan 2020 11:13:22 -0800 (PST)
Received: from ?IPv6:2601:646:9200:4e0:5dac:ba30:48e4:cb20?
	([2601:646:9200:4e0:5dac:ba30:48e4:cb20])
	by smtp.gmail.com with ESMTPSA id q4sm3746433pfs.65.2020.01.24.11.13.21
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 24 Jan 2020 11:13:21 -0800 (PST)
To: Christopher Larson <kergoth@gmail.com>,
	Jason Wessel <jason.wessel@windriver.com>
References: <20200123223449.90548-1-jason.wessel@windriver.com>
	<CABcZANnAW-HYaJmDs8U2iwfzJSb1ig3KsVMvXuz6QjTAR6vqtw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <6027c983-71be-659e-5ca8-e203b57f528d@gmail.com>
Date: Fri, 24 Jan 2020 11:13:20 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <CABcZANnAW-HYaJmDs8U2iwfzJSb1ig3KsVMvXuz6QjTAR6vqtw@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] module.bbclass: swap AR and LD order
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
X-List-Received-Date: Fri, 24 Jan 2020 19:13:21 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 1/24/20 10:19 AM, Christopher Larson wrote:
> What makefile change caused this? That behavior doesn't make much sense 
> given how make processes its command-line arguments.
> 

I agree with you here, it could be a rare check where one want to define 
what collect progam should be used ( ld or ar )

besides, recently we moved AR to be gcc-ar/llvm-ar by default in config 
metadata, which is not going to work out of box for compiling kernel and 
modules, so overriding it with KERNEL_AR in 
module_do_compile/install/configure tasks is good change.

> On Thu, Jan 23, 2020 at 3:34 PM Jason Wessel <jason.wessel@windriver.com 
> <mailto:jason.wessel@windriver.com>> wrote:
> 
>     The 5.x kernels seem to have made a change to the linker command
>     line processing.
> 
>     When trying to build out of tree kernel modules, such as the
>     virtualbox guest additions, the following error is printed:
> 
>     | make[1]: Entering directory
>     '/opt/build-x86-64/tmp/work/qemux86_64-poky-linux/vboxguestdrivers/6.1.2-r0/vbox_module/vboxvideo'
>     | make[3]: Entering directory
>     '/opt/build-x86-64/tmp/work-shared/qemux86-64/kernel-build-artifacts'
>     | make V= CONFIG_MODULE_SIG= CONFIG_MODULE_SIG_ALL= -C
>     /opt/build-x86-64/tmp/work/qemux86_64-poky-linux/vboxguestdrivers/6.1.2-r0/5.2.28-yocto-standard/build
>     M=/opt/build-x86-64/tmp/work/qemux86_64-poky-linux/vboxguestdrivers/6.1.2-r0/vbox_module/vboxguest
>     SRCROOT=/opt/build-x86-64/tmp/work/qemux86_64-poky-linux/vboxguestdrivers/6.1.2-r0/vbox_module/vboxguest
>     modules
>     | make[3]: Entering directory
>     '/opt/build-x86-64/tmp/work-shared/qemux86-64/kernel-build-artifacts'
>     |   LD [M] 
>     /opt/build-x86-64/tmp/work/qemux86_64-poky-linux/vboxguestdrivers/6.1.2-r0/vbox_module/vboxvideo/vboxvideo.o
>     | x86_64-poky-linux-ld.bfd: cannot find AR=x86_64-poky-linux-ar: No
>     such file or directory
> 
>     The AR arguments passed to the make command are being processed as
>     command line arguments to the linker due to some changes in the
>     kernel's Makefile.  For now the easiest fix is to just swap the
>     arguments in the module.bbclass.
> 
>     Signed-off-by: Jason Wessel <jason.wessel@windriver.com
>     <mailto:jason.wessel@windriver.com>>
>     ---
>       meta/classes/module.bbclass | 3 +--
>       1 file changed, 1 insertion(+), 2 deletions(-)
> 
>     diff --git a/meta/classes/module.bbclass b/meta/classes/module.bbclass
>     index c0dfa35061..e1e5fdaa72 100644
>     --- a/meta/classes/module.bbclass
>     +++ b/meta/classes/module.bbclass
>     @@ -38,8 +38,7 @@ module_do_compile() {
>              unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
>              oe_runmake KERNEL_PATH=${STAGING_KERNEL_DIR}   \
>                         KERNEL_VERSION=${KERNEL_VERSION}    \
>     -                  CC="${KERNEL_CC}" LD="${KERNEL_LD}" \
>     -                  AR="${KERNEL_AR}" \
>     +                  CC="${KERNEL_CC}" AR="${KERNEL_AR}"
>     LD="${KERNEL_LD}" \
>                         O=${STAGING_KERNEL_BUILDDIR} \
>                         KBUILD_EXTRA_SYMBOLS="${KBUILD_EXTRA_SYMBOLS}" \
>                         ${MAKE_TARGETS}
>     -- 
>     2.23.0
> 
>     -- 
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 
> 
> 
> -- 
> Christopher Larson
> kergoth at gmail dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Senior Software Engineer, Mentor Graphics
> 


