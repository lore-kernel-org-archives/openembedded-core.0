Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 76F546102A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 06:14:52 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 30 May 2013 23:15:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,776,1363158000"; d="scan'208";a="346038955"
Received: from unknown (HELO [10.255.13.98]) ([10.255.13.98])
	by fmsmga002.fm.intel.com with ESMTP; 30 May 2013 23:14:52 -0700
Message-ID: <51A83FDB.4010309@linux.intel.com>
Date: Fri, 31 May 2013 15:14:51 +0900
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Bruce Ashfield <bruce.ashfield@windriver.com>
References: <cover.1369970703.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1369970703.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/4] kernel-yocto: consolidated pull request
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
X-List-Received-Date: Fri, 31 May 2013 06:14:53 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/31/2013 12:28 PM, Bruce Ashfield wrote:
> Richard/Saul,
>
> While I continue to battle with gcc 4.8, I've got a collection of other fixes
> that don't need to wait. Here's part of those pending changes.
>
>   - Remove the yocto 3.2 kernel, early in the Yocto 1.5 cycle as promised

Did I miss a request to remove the .bbappend from meta-yocto-bsp?  There 
seems to be a 3.2 bbappend still.

Thanks
	Sau!

>   - Fix the reported issues with linux-yocto-custom recipes by restricting
>     NFSD kernel feature requirements to full linux-yocto kernels
>   - Refresh the 3.4 and 3.8 kernels with stable updates
>   - Fix a kernel feature processing bug reported with some of the Intel BSPs
>
> Cheers,
>
> Bruce
>
> The following changes since commit 647db80298da0a8da212449fdd80d318773eacef:
>
>    hicolor-icon-theme: keep inherited dependencies and switch to gnomebase (2013-05-30 22:31:37 +0100)
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib zedd/kernel
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel
>
> Bruce Ashfield (4):
>    linux-yocto: remove 3.2 kernel recipes
>    qemu*: restrict NFSD to linux-yocto only
>    linux-yocto: v3.8.13 and v3.4.46
>    kern-tools: expand kernel features that point to a directory name
>
>   meta/conf/machine/include/qemu.inc                 |    2 +-
>   .../kern-tools/kern-tools-native_git.bb            |    2 +-
>   meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb    |   29 -----------------
>   meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb    |    8 ++---
>   meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb    |    8 ++---
>   meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb  |   26 ---------------
>   meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb  |    6 ++--
>   meta/recipes-kernel/linux/linux-yocto-tiny_3.8.bb  |    6 ++--
>   meta/recipes-kernel/linux/linux-yocto_3.2.bb       |   33 --------------------
>   meta/recipes-kernel/linux/linux-yocto_3.4.bb       |   16 +++++-----
>   meta/recipes-kernel/linux/linux-yocto_3.8.bb       |   17 +++++-----
>   11 files changed, 32 insertions(+), 121 deletions(-)
>   delete mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb
>   delete mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb
>   delete mode 100644 meta/recipes-kernel/linux/linux-yocto_3.2.bb
>

