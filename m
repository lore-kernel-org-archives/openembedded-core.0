Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 74BAC73BB7
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jun 2015 06:37:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t596bw2D007577
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 8 Jun 2015 23:37:58 -0700 (PDT)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 8 Jun 2015 23:37:58 -0700
Message-ID: <557689C4.1010504@windriver.com>
Date: Tue, 9 Jun 2015 14:37:56 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: issta Hu <hcu5555@gmail.com>, <openembedded-core@lists.openembedded.org>
References: <CAD5oO7mBCi=DoXVCwy5yytdkbJaj1k4GN6MZnv5ATGPxqT7QNg@mail.gmail.com>
In-Reply-To: <CAD5oO7mBCi=DoXVCwy5yytdkbJaj1k4GN6MZnv5ATGPxqT7QNg@mail.gmail.com>
Subject: Re: build yocto error
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
X-List-Received-Date: Tue, 09 Jun 2015 06:38:00 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit


I read log.do_package_write_rpm, there isn't many more info, have you tried:

bitbake init-ifupdown -ccleansstate
bitbake init-ifupdown

// Robert

On 06/09/2015 02:25 PM, issta Hu wrote:
> hi ,
>
> I am very trouble in build the yocto. The error log is like this.
>
> chunyun@ubuntu:~/share/yocto/ZC702$ bitbake core-image-minimal
> Loading cache: 100%
> |#################################################################################################|
> ETA:  00:00:00
> Loaded 1303 entries from dependency cache.
> Parsing recipes: 100%
> |###############################################################################################|
> Time: 00:00:00
> Parsing of 896 .bb files complete (894 cached, 2 parsed). 1303 targets, 58
> skipped, 0 masked, 0 errors.
> NOTE: Resolving any missing task queue dependencies
>
> Build Configuration:
> BB_VERSION        = "1.27.0"
> BUILD_SYS         = "x86_64-linux"
> NATIVELSBSTRING   = "Ubuntu-14.04"
> TARGET_SYS        = "arm-poky-linux-gnueabi"
> MACHINE           = "zc702-zynq7"
> DISTRO            = "poky"
> DISTRO_VERSION    = "1.8+snapshot-20150609"
> TUNE_FEATURES     = "arm armv7a vfp neon cortexa9"
> TARGET_FPU        = "vfp-neon"
> meta              = "fido:b5ba70b47fff227e4381fcac93defccb79e3d8f1"
> meta-xilinx       = "fido:5aa58bbbf8ddcc59f8746805d62fd156d7cff461"
> meta-yocto
> meta-yocto-bsp    = "fido:b5ba70b47fff227e4381fcac93defccb79e3d8f1"
>
> NOTE: Preparing RunQueue
> NOTE: Executing SetScene Tasks
> NOTE: Executing RunQueue Tasks
> ERROR: Function failed: write_specfile
> ERROR: Logfile of failure stored in:
> /home/chunyun/share/yocto/ZC702/tmp/work/cortexa9-vfp-neon-poky-linux-gnueabi/init-ifupdown/1.0-r7/temp/log.do_package_write_rpm.8848
> Log data follows:
> | DEBUG: Executing python function sstate_task_prefunc
> | DEBUG: Python function sstate_task_prefunc finished
> | DEBUG: Executing python function do_package_write_rpm
> | DEBUG: Executing python function read_subpackage_metadata
> | DEBUG: Python function read_subpackage_metadata finished
> | DEBUG: Executing python function do_package_rpm
> | DEBUG: Executing python function write_specfile
> | DEBUG: Python function write_specfile finished
> | DEBUG: Python function do_package_rpm finished
> | DEBUG: Python function do_package_write_rpm finished
> | ERROR: Function failed: write_specfile
> ERROR: Task 833
> (/home/chunyun/share/yocto/poky/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb
> <http://init-ifupdown_1.0.bb>, do_package_write_rpm) failed with exit code '1'
> NOTE: Tasks Summary: Attempted 1396 tasks of which 1395 didn't need to be rerun
> and 1 failed.
> No currently running tasks (1395 of 1889)
>
> Summary: 1 task failed:
>
> /home/chunyun/share/yocto/poky/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb
> <http://init-ifupdown_1.0.bb>, do_package_write_rpm
> Summary: There was 1 ERROR message shown, returning a non-zero exit code.
>
> The
> /home/chunyun/share/yocto/ZC702/tmp/work/cortexa9-vfp-neon-poky-linux-gnueabi/init-ifupdown/1.0-r7/temp/log.do_package_write_rpm.8848
> can see the affix.
>
>

