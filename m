Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QL0ex-000187-Bh
	for openembedded-core@lists.openembedded.org;
	Sat, 14 May 2011 00:16:35 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 13 May 2011 15:13:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,366,1301900400"; d="scan'208";a="642493946"
Received: from unknown (HELO [10.255.12.119]) ([10.255.12.119])
	by orsmga002.jf.intel.com with ESMTP; 13 May 2011 15:13:44 -0700
Message-ID: <4DCDAD17.2040401@linux.intel.com>
Date: Fri, 13 May 2011 15:13:43 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.10) Gecko/20100621 Fedora/3.0.5-1.fc13 Lightning/1.0b2pre
	Thunderbird/3.0.5
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1305229934.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1305229934.git.bruce.ashfield@windriver.com>
Subject: Re: [PATCH 0/1] kern-tools: error if features are not found
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
X-List-Received-Date: Fri, 13 May 2011 22:16:35 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/12/2011 01:21 PM, Bruce Ashfield wrote:
> Richard/Saul,
>
> I'll repeat the patch contents here, since they explain
> the change
>
> ---->---->---->---->---->---->
> Fixes bug: [YOCTO #955]
>
> Updating the SRCREV to pickup the kern-tools change:
>
> [
>      updateme: error if features are not found
>
>      Rather than silently dropping addon features, we emit a warning
>      and then exit with a failure code. The caller can then abort a
>      build and not simply miss features.
>
>      Passing --no-strict to the script disables this new functionality
>      if for some reason a feature description is missing on purpose.
> ]
> ---->---->---->---->---->---->
>
> This takes care of one thing we hit during 1.0 development,
> and provides a clear message about features that are not
> part of the kernel being built.
>
> In a test of a forced invalid feature, the output is:
>
> | WARNING: addon feature "cfg/non-exisistent" was not found
> | ERROR: required features were not found. aborting
>
> .. and the build stops.
>
> Thanks,
>      Bruce Ashfield<bruce.ashfield@windriver.com>
>
> Pull URL: git://git.pokylinux.org/poky-contrib.git
>    Branch: zedd/kernel
>    Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel
>
> ---
>
>
> Bruce Ashfield (1):
>    kern-tools: error if features are not found
>
>   .../kern-tools/kern-tools-native_git.bb            |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
Merged into oe-core and master.

Thanks
	Sau!



