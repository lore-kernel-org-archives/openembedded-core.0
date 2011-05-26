Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QPb1k-0002mx-EO
	for openembedded-core@lists.openembedded.org;
	Thu, 26 May 2011 15:55:04 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 26 May 2011 06:51:59 -0700
X-ExtLoop1: 1
Received: from unknown (HELO [10.255.12.181]) ([10.255.12.181])
	by orsmga002.jf.intel.com with ESMTP; 26 May 2011 06:51:59 -0700
Message-ID: <4DDE5B0F.5080901@linux.intel.com>
Date: Thu, 26 May 2011 06:52:15 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <c83bebea4e1c4dd15422ad2cb75eab977cea4a59.1306385875.git.dvhart@linux.intel.com>	<f29f5f7343d2b8b23b8ad25245efe9c205c8ca6e.1306385875.git.dvhart@linux.intel.com>
	<6EC98D6A-BEF1-468A-A69B-7CBF4EAB28BA@beagleboard.org>
In-Reply-To: <6EC98D6A-BEF1-468A-A69B-7CBF4EAB28BA@beagleboard.org>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [pull-oe-uboot 2/2] u-boot: rename u-boot_git.bb to u-boot_${PV}.bb
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
X-List-Received-Date: Thu, 26 May 2011 13:55:04 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 05/26/2011 12:58 AM, Jason Kridner wrote:
> On May 26, 2011, at 12:02 AM, Darren Hart <dvhart@linux.intel.com>
> wrote:
> 
>> In order to facilitate reuse of the oe-core u-boot recipe, there
>> needs to be some assurance that the oe-core version won't change
>> without a clear indicator to people extending it.
>> 
>> By renaming the recipe to include its version string instead of
>> "git", BSP layers can extend a specific base version of u-boot,
>> ie. u-boot_2011.03.bbappend. When 2011.06 becomes available, we can
>> create that file without instantly breaking all the BSPs depending
>> on oe-core version of the recipe.
>> 
>> As a matter of policy I would recommend we not carry more than 2
>> versioned u-boot recipess at any given time. This will provide BSP
>> layers time to migrate to the newer version, without cluttering
>> oe-core with numerous stale versions of u-boot. We may decide later
>> to resurrect u-boot_git.bb as an AUTOREV recipe to faciliate
>> upstream development on u-boot in the oe environment.
> 
> This sounds especially useful for automated testing of upstream. I'd
> be interested in setting up a public daily build and test report in
> such a configuration. Let me know if it would be redundant.

That is the sort of thing this caters to, yes. And no, I don't think
your testing in this way would be redundant - at least not with respect
to anything I'm doing.

--
Darren

> 
>> 
>> Signed-off-by: Darren Hart <dvhart@linux.intel.com> Cc: Richard
>> Purdie <richard.purdie@linuxfoundation.org> Cc: Koen Kooi
>> <koen@dominion.thruhere.net> Cc: Jason Kridner
>> <jkridner@beagleboard.org> --- .../uboot/{u-boot_git.bb =>
>> u-boot_2011.03.bb}     |    0 1 files changed, 0 insertions(+), 0
>> deletions(-) rename meta/recipes-bsp/uboot/{u-boot_git.bb =>
>> u-boot_2011.03.bb} (100%)
>> 
>> diff --git a/meta/recipes-bsp/uboot/u-boot_git.bb
>> b/meta/recipes-bsp/uboot/u-boot_2011.03.bb similarity index 100% 
>> rename from meta/recipes-bsp/uboot/u-boot_git.bb rename to
>> meta/recipes-bsp/uboot/u-boot_2011.03.bb -- 1.7.1
>> 
> 
> _______________________________________________ Openembedded-core
> mailing list Openembedded-core@lists.openembedded.org 
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--
> 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


