Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 10FAC70245
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jul 2014 16:33:46 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 16 Jul 2014 09:33:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,673,1400050800"; d="scan'208";a="574160312"
Received: from unknown (HELO [10.255.12.224]) ([10.255.12.224])
	by orsmga002.jf.intel.com with ESMTP; 16 Jul 2014 09:31:54 -0700
Message-ID: <53C6A8FA.6000801@linux.intel.com>
Date: Wed, 16 Jul 2014 09:31:54 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Matthieu CRAPET <Matthieu.CRAPET@ingenico.com>, 
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <8672BB614B4CCA40A6B3BDD6FD82050BA8B27988@COSNADEXC13.usr.ingenico.loc>	<1405436079-13220-1-git-send-email-Matthieu.Crapet@ingenico.com>	<53C55932.2050206@opendreambox.org>	<8672BB614B4CCA40A6B3BDD6FD82050BA8B27F6E@COSNADEXC13.usr.ingenico.loc>	<53C63845.2060407@opendreambox.org>
	<53C63ADA.5010903@opendreambox.org>
	<8672BB614B4CCA40A6B3BDD6FD82050BA8B280C6@COSNADEXC13.usr.ingenico.loc>
In-Reply-To: <8672BB614B4CCA40A6B3BDD6FD82050BA8B280C6@COSNADEXC13.usr.ingenico.loc>
Subject: Re: [PATCH v3] libav: set LICENSE and LICENSE_FLAGS according to PACKAGECONFIG options
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
X-List-Received-Date: Wed, 16 Jul 2014 16:33:57 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/16/2014 02:05 AM, Matthieu CRAPET wrote:
>>> However, the libav 'LICENSE' clearly states that it's still the case anyway, but for non-technical reasons.
>
> If so, I'll post a v4 patch asap.
>

We also saw a build failure with this patch last night, please see this 
log file:

https://autobuilder.yoctoproject.org/main/builders/nightly-world/builds/164/steps/BuildImages/logs/stdio

>
> You can also run generated qemu images with a command like 'runqemu qemux86'
> Parsing recipes...done.
> Parsing of 889 .bb files complete (0 cached, 889 parsed). 2154 targets, 166 skipped, 0 masked, 0 errors.
> NOTE: Resolving any missing task queue dependencies
> ERROR: Nothing PROVIDES 'lib32-x264' (but virtual:multilib:lib32:/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-world/build/meta/recipes-multimedia/libav/libav_0.8.11.bb DEPENDS on or otherwise requires it)
> ERROR: lib32-x264 was skipped: because it has a restricted license not whitelisted in LICENSE_FLAGS_WHITELIST
> ERROR: Nothing PROVIDES 'x264' (but /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-world/build/meta/recipes-multimedia/libav/libav_0.8.11.bb DEPENDS on or otherwise requires it)
> ERROR: x264 was skipped: because it has a restricted license not whitelisted in LICENSE_FLAGS_WHITELIST
> ERROR: Nothing RPROVIDES 'lib32-libav' (but virtual:multilib:lib32:/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-world/build/meta/recipes-multimedia/libav/libav_0.8.11.bb RDEPENDS on or otherwise requires it)
> ERROR: No eligible RPROVIDERs exist for 'lib32-libav'
> NOTE: Runtime target 'lib32-libav' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['lib32-libav']
> ERROR: Nothing RPROVIDES 'lib32-libav-dev' (but virtual:multilib:lib32:/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-world/build/meta/recipes-multimedia/libav/libav_0.8.11.bb RDEPENDS on or otherwise requires it)
> ERROR: No eligible RPROVIDERs exist for 'lib32-libav-dev'
> NOTE: Runtime target 'lib32-libav-dev' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['lib32-libav-dev']
> ERROR: Nothing RPROVIDES 'libav' (but /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-world/build/meta/recipes-multimedia/libav/libav_0.8.11.bb RDEPENDS on or otherwise requires it)
> ERROR: No eligible RPROVIDERs exist for 'libav'
> NOTE: Runtime target 'libav' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['libav']
> ERROR: Nothing RPROVIDES 'libav-dev' (but /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-world/build/meta/recipes-multimedia/libav/libav_0.8.11.bb RDEPENDS on or otherwise requires it)
> ERROR: No eligible RPROVIDERs exist for 'libav-dev'
> NOTE: Runtime target 'libav-dev' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['libav-dev']


Please look into this failure as you work on your next version of the patch.

Sau!

> Regards,
> M
>

