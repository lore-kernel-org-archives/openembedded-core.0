Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1Rk89k-0008Gm-UK
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jan 2012 06:52:29 +0100
Received: from mail-iy0-f180.google.com ([209.85.210.180])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 08 Jan 2012 21:43:55 -0800
Received: by iazz13 with SMTP id z13so6464252iaz.25
	for <openembedded-core@lists.openembedded.org>;
	Sun, 08 Jan 2012 21:43:55 -0800 (PST)
Received: by 10.50.236.67 with SMTP id us3mr8138061igc.14.1326087834380;
	Sun, 08 Jan 2012 21:43:54 -0800 (PST)
Received: from [10.6.18.233] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id he16sm37853229ibb.9.2012.01.08.21.43.52
	(version=SSLv3 cipher=OTHER); Sun, 08 Jan 2012 21:43:53 -0800 (PST)
Message-ID: <4F0A7E97.50904@intel.com>
Date: Sun, 08 Jan 2012 21:43:51 -0800
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1325792752.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1325792752.git.bruce.ashfield@windriver.com>
Subject: Re: [v2 PATCH 0/3] linux-yocto: consolidated pull request
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
X-List-Received-Date: Mon, 09 Jan 2012 05:52:29 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/05/2012 11:49 AM, Bruce Ashfield wrote:
> Richard/Saul,
>
> This is a resend of my series from yesterday. Richard noted the
> following two issues:
>
>   http://autobuilder.pokylinux.org:8010/builders/nightly-ppc/builds/210/steps/shell_67/logs/stdio
>   http://autobuilder.pokylinux.org:8010/builders/nightly-arm/builds/247/steps/shell_14/logs/stdio
>
> The ARM build issue was introduced in 3.0.13, and has a mainline fix,
> which I cherry picked into the kernel tree and pushed out. I'll likely
> be able to drop it with 3.0.16 (assuming there is one).
>
> The qemuppc one was due to stricter patch checking. I updated the meta
> branch and that is now fixed.
>
> Take all three as a unit, and the builds should be fine now.
>
> Cheers,
>
> Bruce
>
>
> The following changes since commit 021848be9eeb71de8acfba6c66c11645b01523b8:
>
>    valgrind: Fix for automake update (2012-01-04 16:04:08 +0000)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib zedd/kernel
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel
>
> Bruce Ashfield (3):
>    kern-tools: import flexible branching support
>    linux-yocto: bump kernel version to v3.0.14
>    linux-yocto: use src_patches for out of tree kernel feature support
>
>   meta/classes/kernel-yocto.bbclass                  |   67 +++++++++++++++++++-
>   .../kern-tools/kern-tools-native_git.bb            |    2 +-
>   meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb    |    8 +-
>   meta/recipes-kernel/linux/linux-yocto_3.0.bb       |   18 +++---
>   4 files changed, 79 insertions(+), 16 deletions(-)
>

Merged into OE-Core

Thanks
	Sau!


