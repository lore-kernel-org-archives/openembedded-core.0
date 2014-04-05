Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4B20060144
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 Apr 2014 04:50:09 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s354o70V015540
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 4 Apr 2014 21:50:09 -0700 (PDT)
Received: from [128.224.162.226] (128.224.162.226) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.169.1;
	Fri, 4 Apr 2014 21:50:05 -0700
Message-ID: <533F8B7C.8010409@windriver.com>
Date: Sat, 5 Apr 2014 12:50:04 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>, Valentin Popa
	<valentin.popa@intel.com>
References: <CAP9ODKoLt=HMhiGQZmQhDUUFm-efPavZRftR7A8Wf7gECw+Amw@mail.gmail.com>
In-Reply-To: <CAP9ODKoLt=HMhiGQZmQhDUUFm-efPavZRftR7A8Wf7gECw+Amw@mail.gmail.com>
Cc: "meta-freescale@yoctoproject.org" <meta-freescale@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [dora][regression] mesa failed to build
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
X-List-Received-Date: Sat, 05 Apr 2014 04:50:12 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


Yes, seems related to the following one, add Valentin Popa in the loop:

commit bcfbddd8fa9760f681d7366c8d507fd0bef3a854
Author: Valentin Popa <valentin.popa@intel.com>
Date:   Thu Feb 27 11:51:17 2014 +0200

     mesa: build fix for gallium-egl

// Robert

On 04/05/2014 12:38 PM, Otavio Salvador wrote:
> Hello,
>
> In one of our custom BSPs we saw a build failure in mesa:
>
> | make[1]: Leaving directory
> `.../build/tmp/work/cortexa9hf-vfp-neon-mx6-oel-linux-gnueabi/mesa/2_9.1.6-r0/build'
> | sed: can't read
> .../build/tmp/work/cortexa9hf-vfp-neon-mx6-oel-linux-gnueabi/mesa/2_9.1.6-r0/image/usr/include/EGL/eglplatform.h:
> No such file or directory
> | WARNING: exit code 2 from a shell command.
> | ERROR: Function failed: do_install (log file is located at
> .../build/tmp/work/cortexa9hf-vfp-neon-mx6-oel-linux-gnueabi/mesa/2_9.1.6-r0/temp/log.do_install.17155)
> recipe mesa-2_9.1.6-r0: task do_install: Failed
> ERROR: Task 2643
> (.../sources/poky/meta/recipes-graphics/mesa/mesa_9.1.6.bb,
> do_install) failed with exit code '1'
> recipe gnutls-2.12.23-r8.4: task do_configure: Succeeded
>
> This seems not related to the bbappend we have in meta-fsl-arm[1], in
> Dora. I think this came in today's changes in the branch.
>
> 1. http://git.yoctoproject.org/cgit/cgit.cgi/meta-fsl-arm/tree/recipes-graphics/mesa/mesa_9.1.6.bbappend?h=dora
>
> This builder has PRServer enabled.
>
> As I am going to be traveling so won't have time to debug this bug I
> preferred to report it so someone can debug.
>

