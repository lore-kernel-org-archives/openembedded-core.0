Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C74DF60068
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Mar 2018 21:32:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w2HLWhv6027671
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 17 Mar 2018 14:32:43 -0700 (PDT)
Received: from server.local (128.224.20.180) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Sat, 17 Mar 2018 14:32:42 -0700
To: <auh@auh.yoctoproject.org>
References: <20180317204657.19574440002@auh.yoctoproject.org>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <f2d0bd91-81f9-ff08-2f0d-944e7eafa9c7@windriver.com>
Date: Sat, 17 Mar 2018 17:32:42 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
	Gecko/20100101 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180317204657.19574440002@auh.yoctoproject.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [AUH] linux-yocto: upgrading to 4.15.7 FAILED
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
X-List-Received-Date: Sat, 17 Mar 2018 21:32:52 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

How do I get linux-libc-headers and linux-yocto removed from the
AUH list of recipes ?

These follow a specific cadence, and shouldn't be included in these
attempts.

Bruce

On 2018-03-17 4:46 PM, auh@auh.yoctoproject.org wrote:
> Hello,
> 
> You are receiving this email because you are the maintainer
> of *linux-yocto* recipe and this is to let you know that the automatic attempt
> to upgrade the recipe to *4.15.7* has Failed (devtool error).
> 
> Detailed error information:
> 
> The following devtool command failed:  upgrade linux-yocto -V 4.15.7 -S cb4a115a42867def71fdcbf0d7b714f268ff37fd
> NOTE: Starting bitbake server...
> Loading cache...done.
> Loaded 1281 entries from dependency cache.
> NOTE: Extracting current version source...
> NOTE: Resolving any missing task queue dependencies
> 
> Build Configuration:
> BB_VERSION           = "1.37.0"
> BUILD_SYS            = "x86_64-linux"
> NATIVELSBSTRING      = "universal"
> TARGET_SYS           = "i586-poky-linux"
> MACHINE              = "qemux86"
> DISTRO               = "poky"
> DISTRO_VERSION       = "2.4+snapshot-20180317"
> TUNE_FEATURES        = "m32 i586"
> TARGET_FPU           = ""
> meta
> meta-poky
> meta-yocto-bsp       = "tmp-auh-upgrades:096c67796ac50aa6059494f32104e6c1c520bbfc"
> workspace            = "<unknown>:<unknown>"
> 
> Initialising tasks...done.
> NOTE: Executing SetScene Tasks
> NOTE: Executing RunQueue Tasks
> NOTE: Tasks Summary: Attempted 367 tasks of which 358 didn't need to be rerun and all succeeded.
> NOTE: Writing buildhistory
> NOTE: Copying kernel config to srctree
> NOTE: Extracting upgraded version source...
> ERROR: Revision cb4a115a42867def71fdcbf0d7b714f268ff37fd was found on multiple branches:
>    v4.15/base
>    v4.15/standard/arm-versatile-926ejs
>    v4.15/standard/base
>    v4.15/standard/beaglebone
>    v4.15/standard/edgerouter
>    v4.15/standard/fsl-mpc8315e-rdb
>    v4.15/standard/intel
>    v4.15/standard/mti-malta32
>    v4.15/standard/mti-malta64
>    v4.15/standard/preempt-rt/base
>    v4.15/standard/preempt-rt/intel
>    v4.15/standard/qemuarm64
>    v4.15/standard/qemuppc
>    v4.15/standard/tiny/base
>    v4.15/standard/tiny/common-pc
>    v4.15/standard/tiny/intel
> Please provide the correct branch in the devtool command with "--srcbranch" or "-B" option.
> ERROR: Revision cb4a115a42867def71fdcbf0d7b714f268ff37fd was found on multiple branches:
>    v4.15/base
>    v4.15/standard/arm-versatile-926ejs
>    v4.15/standard/base
>    v4.15/standard/beaglebone
>    v4.15/standard/edgerouter
>    v4.15/standard/fsl-mpc8315e-rdb
>    v4.15/standard/intel
>    v4.15/standard/mti-malta32
>    v4.15/standard/mti-malta64
>    v4.15/standard/preempt-rt/base
>    v4.15/standard/preempt-rt/intel
>    v4.15/standard/qemuarm64
>    v4.15/standard/qemuppc
>    v4.15/standard/tiny/base
>    v4.15/standard/tiny/common-pc
>    v4.15/standard/tiny/intel
> Please provide the correct branch in the devtool command with "--srcbranch" or "-B" option.
> 
> 
> 
> Please review the attached files for further information and build/update failures.
> Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler
> 
> Regards,
> The Upgrade Helper
> 


