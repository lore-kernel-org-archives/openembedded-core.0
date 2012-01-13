Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1RlVrf-0002sm-Ce
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Jan 2012 02:23:31 +0100
Received: from mail-iy0-f180.google.com ([209.85.210.180])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 12 Jan 2012 17:15:48 -0800
Received: by iadk27 with SMTP id k27so3799462iad.25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jan 2012 17:15:48 -0800 (PST)
Received: by 10.50.217.168 with SMTP id oz8mr3297589igc.24.1326417348167;
	Thu, 12 Jan 2012 17:15:48 -0800 (PST)
Received: from [10.6.18.227] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id l28sm23095333ibc.3.2012.01.12.17.15.46
	(version=SSLv3 cipher=OTHER); Thu, 12 Jan 2012 17:15:47 -0800 (PST)
Message-ID: <4F0F85C1.8070601@intel.com>
Date: Thu, 12 Jan 2012 17:15:45 -0800
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1326307011.git.bruce.ashfield@windriver.com>
	<6468addcd5e4729270ebc0152504eb8f35a3cd3f.1326307011.git.bruce.ashfield@windriver.com>
In-Reply-To: <6468addcd5e4729270ebc0152504eb8f35a3cd3f.1326307011.git.bruce.ashfield@windriver.com>
Subject: Re: [PATCH 5/5] linux-yocto: consolidated fix SRCREV updates
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Jan 2012 01:23:31 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/11/2012 10:52 AM, Bruce Ashfield wrote:
> Updating the SRCREVs to include the following fixes from Khem Raj and
> Zumeng Chen.
>
>   6f5b118 compiler.h: Undef before redefining __attribute_const__
>   fe80c1e oprofile, arm/sh: Fix oprofile_arch_exit() linkage issue
>
> Signed-off-by: Bruce Ashfield<bruce.ashfield@windriver.com>
> ---
>   meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb |    4 ++--
>   meta/recipes-kernel/linux/linux-yocto_3.0.bb    |   13 +++++++------
>   2 files changed, 9 insertions(+), 8 deletions(-)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
> index c6bf446..145e548 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
> @@ -14,8 +14,8 @@ KBRANCH_qemuppc = "yocto/standard/preempt-rt/qemu-ppc32"
>   LINUX_VERSION ?= "3.0.14"
>   LINUX_KERNEL_TYPE = "preempt-rt"
>
> -SRCREV_machine ?= "bcf4107c7f22d10952618a2ad146e6149d240cd2"
> -SRCREV_machine_qemuppc ?= "1e5511ea2cb5f150ffce86071035a81c0499494b"
> +SRCREV_machine ?= "f1cc220f4ddf434bf254707c83a45794a63f117f"
> +SRCREV_machine_qemuppc ?= "8bd5b80cb3243dadc9d6c5c09482c49994dff1a8"
>   SRCREV_meta ?= "73dafd44ea875df654129b32b2877f342d5573e4"
>
>   PR = "r1"
> diff --git a/meta/recipes-kernel/linux/linux-yocto_3.0.bb b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
> index e624b48..0b79bee 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_3.0.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
> @@ -12,12 +12,13 @@ KBRANCH = ${KMACHINE}
>
>   LINUX_VERSION ?= "3.0.14"
>
> -SRCREV_machine_qemuarm ?= "c498cc6e4b56784b3c2c547cb9a7af435b9412c1"
> -SRCREV_machine_qemumips ?= "791c3f4124a238a798e2360340800f4989fad695"
> -SRCREV_machine_qemuppc ?= "10e808d1c304b14cf42903fd637f239766b78476"
> -SRCREV_machine_qemux86 ?= "e04f9f8e564c60b1ce907d64074c18730f8dab4e"
> -SRCREV_machine_qemux86-64 ?= "53c2fa060d34e9a0b59e19398aeebbe73f24d89b"
> -SRCREV_machine ?= "fe80c1e343bf8f038328a612cef7f821d7ec8dbf"
> +
> +SRCREV_machine_qemuarm ?= "c0386e4195c685b0ff94b7e21581ec47008ab13b"
> +SRCREV_machine_qemumips ?= "56e4361a1bfc10042d83a7d8a5f96932056e3f35"
> +SRCREV_machine_qemuppc ?= "53e71af30e30162e17e32b2f57e4481f5bc0573e"
> +SRCREV_machine_qemux86 ?= "9e73573b6b227ab2c62e66e63470866d136f8d76"
> +SRCREV_machine_qemux86-64 ?= "3551fd0412965b1f6b0b2f6ba35f7fecdaddb58a"
> +SRCREV_machine ?= "6f5b11830deba4a6262c8c4abf67e608924f649e"
>   SRCREV_meta ?= "73dafd44ea875df654129b32b2877f342d5573e4"
>
>   PR = "r2"

Bruce, with this change I am getting the following error, I did a 
linux-yocto cleanall and refetched.
ERROR: Logfile of failure stored in: 
/intel/poky/builds/sanity/tmp/work/qemux86-poky-linux/linux-yocto-3.0.14+git9+73dafd44ea875df654129b32b2877f342d5573e4_6+9e73573b6b227ab2c62e66e63470866d136f8d76-r2/temp/log.do_validate_branches.3693
Log data follows:
| ERROR: Function 'do_validate_branches' failed (see 
/intel/poky/builds/sanity/tmp/work/qemux86-poky-linux/linux-yocto-3.0.14+git9+73dafd44ea875df654129b32b2877f342d5573e4_6+9e73573b6b227ab2c62e66e63470866d136f8d76-r2/temp/log.do_validate_branches.3693 
for further information)
| ERROR 9e73573b6b227ab2c62e66e63470866d136f8d76 is not a valid commit ID.
| The kernel source tree may be out of sync
NOTE: package 
linux-yocto-3.0.14+git9+73dafd44ea875df654129b32b2877f342d5573e4_6+9e73573b6b227ab2c62e66e63470866d136f8d76-r2: 
task do_validate_branches: Failed
ERROR: Task 511 
(/intel/poky/distro/meta/recipes-kernel/linux/linux-yocto_3.0.bb, 
do_validate_branches) failed with exit code '1'
Waiting for 2 active tasks to finish:
0: ncurses-5.9-r4.1 do_package_write_rpm (pid 5986)
1: util-linux-2.20.1-r2 do_package (pid 5983)
Waiting for 1 active tasks to finish:
0: ncurses-5.9-r4.1 do_package_write_rpm (pid 5986)
NOTE: package util-linux-2.20.1-r2: task do_package: Succeeded
NOTE: package ncurses-5.9-r4.1: task do_package_write_rpm: Succeeded
ERROR: '/intel/poky/distro/meta/recipes-kernel/linux/linux-yocto_3.0.bb' 
failed
Summary: There were 6 WARNING messages shown.

Summary: There were 2 ERROR messages shown, returning a non-zero exit code.

Thanks
	Sau!




