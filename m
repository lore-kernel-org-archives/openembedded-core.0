Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1RiBnZ-0005R4-4Q
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jan 2012 22:21:33 +0100
Received: from mail-iy0-f180.google.com ([209.85.210.180])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 03 Jan 2012 13:14:10 -0800
Received: by iazz13 with SMTP id z13so29516099iaz.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Jan 2012 13:14:10 -0800 (PST)
Received: by 10.42.155.136 with SMTP id u8mr43380343icw.12.1325625249867;
	Tue, 03 Jan 2012 13:14:09 -0800 (PST)
Received: from [10.6.18.227] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id h9sm180958406ibh.11.2012.01.03.13.14.08
	(version=SSLv3 cipher=OTHER); Tue, 03 Jan 2012 13:14:08 -0800 (PST)
Message-ID: <4F036F9F.2060503@intel.com>
Date: Tue, 03 Jan 2012 13:14:07 -0800
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1324576164.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1324576164.git.bruce.ashfield@windriver.com>
Cc: dvhart@linux.intel.com
Subject: Re: [PATCH 0/4] linux-yocto: consolidated pull request
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
X-List-Received-Date: Tue, 03 Jan 2012 21:21:33 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/22/2011 10:05 AM, Bruce Ashfield wrote:
> Richard/Saul,
>
> Here's a consolidated pull request that adds the cedartrail, and
> updates some remaining reference platforms to 3.0.x, including
> updated -rt support.
>
> There are also a couple of minor bug fixes that I found when working
> on M2 functionality.
>
> Built and boot tested everywhere that I could.
>
> The bulk of my changes are pending on the patch refactoring changes
> that have been proposed, and will follow once something merges for
> that, and I can re-test.
>
> Cheers,
>
> Bruce
>
> cc: Darren Hart<dvhart@linux.intel.com>
>
> The following changes since commit dee0fc1462ba18551571c3b2d0f2b443a2feca18:
>
>    multilib.conf: Enable shadow-sysroot and libffi (2011-12-21 17:24:44 +0000)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib zedd/kernel-oe
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel-oe
>
> Bruce Ashfield (4):
>    linux-yocto: add cedartrail BSP support
>    linux-yocto: update hardware reference boards to 3.0.12
>    kern-tools: update SRCREV to pickup git operation fixes
>    linux-yocto: use PATH to locate kconf_check
>
>   meta/classes/kernel-yocto.bbclass                  |    4 ++--
>   .../kern-tools/kern-tools-native_git.bb            |    2 +-
>   meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb    |    2 +-
>   meta/recipes-kernel/linux/linux-yocto_3.0.bb       |    2 +-
>   4 files changed, 5 insertions(+), 5 deletions(-)
>
Merged into OE-Core

Thanks
	Sau!




