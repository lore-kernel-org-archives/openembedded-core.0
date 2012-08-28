Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1T6MtI-0001Jj-PE
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Aug 2012 16:35:41 +0200
Received: from mail-pb0-f52.google.com ([209.85.160.52])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 28 Aug 2012 07:22:21 -0700
Received: by pbcxa7 with SMTP id xa7so9087870pbc.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2012 07:22:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:organization:user-agent:mime-version:to:cc
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding:x-gm-message-state;
	bh=7OHwPp4qFMqNaHK2dSGff8XNwDQ5clbGSi0LBu73oaU=;
	b=g8InGaOJWjbWwNroNfe6d0iscbaWhRa68s8QeUCsQcMFE60vgdP6N2KypmOfYtiAwy
	gcjSF3oBeEE+H/FQOJlybMxgorkK/B2ohyXApfvtGnR1rIAu6q5MdhrNrrFv0sZ8tlsx
	jPe77RryUMvI1evxQi5QUldSsqpMGTPIuZVXEg6WZ2rKR4ohYsGpiVffPQqjRNAjkkJg
	PdGlyGMjvXZR/9zJre9qO+EAnPrnAOZtbWsuF82NWlxGYQ0z5FSB/Ud+LXsRF9o92i8T
	7U29W/PzneZcoC3TbX9TgehpnLTLmFombaGt0JAh8kMuBuuNzk6y6RJZA2fLzCnTv7Kl
	yG5Q==
Received: by 10.66.76.227 with SMTP id n3mr37883085paw.53.1346163741153;
	Tue, 28 Aug 2012 07:22:21 -0700 (PDT)
Received: from [10.6.18.71] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id gh9sm17145440pbc.20.2012.08.28.07.22.17
	(version=SSLv3 cipher=OTHER); Tue, 28 Aug 2012 07:22:18 -0700 (PDT)
Message-ID: <503CD416.7000100@intel.com>
Date: Tue, 28 Aug 2012 07:22:14 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Bruce Ashfield <bruce.ashfield@windriver.com>
References: <cover.1346042224.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1346042224.git.bruce.ashfield@windriver.com>
X-Gm-Message-State: ALoCoQlOFe6pb6vuzv01JOBx+wmr/bdLPklShtG60BIBSncvcYDshPLExuXI/+I9L0jVuzEdtgDV
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/3] linux-yocto: consolidated pull request
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 28 Aug 2012 14:35:41 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/26/2012 09:49 PM, Bruce Ashfield wrote:
> Richard/Saul,
>
> Here's some changes that I've staged over the past week or so,
> everything checks out here, and there are some good changes in
> this set of -stable updates, and and the linker fix from Khem.
>
> I've also got a small tools fix here as well, that was needed
> for some of the yocto-bsp builds. I think we've worked through
> most of them now, and everything is looking good.
>
> Cheers,
>
> Bruce
>
> cc: Khem Raj <raj.khem@gmail.com>
> cc: Tom Zanussi <tom.zanussi@intel.com>
>
> The following changes since commit b4c5725af4cd85d5644f0373e2674e903c4eab2b:
>
>    yocto-bsp: add missing xserver-xf86-config .bbappend for qemu (2012-08-25 14:47:07 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib zedd/kernel
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel
>
> Bruce Ashfield (3):
>    kern-tools: fix forced branching
>    linux-yocto/3.4: v3.4.9, unionfs, perf and configuration changes
>    linux-yocto/3.2/3.4: arm: Fix linking errors with binutils 2.23
>
Bruce,

I saw some problems with serveral hardware BSP platforms in do_patch on 
the Autobuilder.  I think your traveling this week, so I am going to 
hold off on this set.

> ERROR: Function failed: do_patch (see /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/linux-yocto-3.0.32+git1+bf5ee4945ee6d748e6abe16356f2357f76b5e2f0_1+3ab688a78cac7b2e32afc83376a53370f2bd13b7-r4.1/temp/log.do_patch.8680 for further information)
> NOTE: recipe python-2.7.3-r0.2: task do_populate_lic: Succeeded
> ERROR: Logfile of failure stored in: /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/linux-yocto-3.0.32+git1+bf5ee4945ee6d748e6abe16356f2357f76b5e2f0_1+3ab688a78cac7b2e32afc83376a53370f2bd13b7-r4.1/temp/log.do_patch.8680
> Log data follows:
> | DEBUG: Executing shell function do_patch
> | Branch meta-temp set up to track remote branch meta from origin.
> | Deleted branch meta-temp (was 620917d).
> | [INFO] validating against known patches  (beagleboard-standard-meta)
> |   [##                                                ] (|)(5 %)
>   [###                                               ] (/)(7 %)
>   [#####                                             ] (-)(10 %)
>   [######                                            ] (\)(13 %)
>   [#######                                           ] (|)(15 %)
>   [#########                                         ] (/)(18 %)
>   [##########                                        ] (-)(21 %)
>   [###########                                       ] (\)(23 %)
>   [#############                                     ] (|)(26 %)
>   [##############                                    ] (/)(28 %)
>   [###############                                   ] (-)(31 %)
>   [#################                                 ] (\)(34 %)
>   [##################                                ] (|)(36 %)
>   [###################                               ] (/)(39 %)
>   [#####################                             ] (-)(42 %)
>   [######################                            ] (\)(44 %)
>   [#######################                           ] (|)(47 %)
>   [#########################                         ] (/)(50 %)
>   [##########################                        ] (-)(52 %)
>   [###########################                       ] (\)(55 %)
>   [############################                      ] (|)(57 %)
>   [##############################                    ] (/)(60 %)
>   [###############################                   ] (-)(63 %)
>   [################################                  ] (\)(65 %)
>   [##################################                ] (|)(68 %)
>   [###################################               ] (/)(71 %)
>   [####################################              ] (-)(73 %)
>   [######################################            ] (\)(76 %)
>   [##################################################]  (completed in 4 seconds)
> | ERROR: branch yocto/standard/beagleboard was requested, but was not properly
> |        configured to be built. The current branch is yocto/standard/beagleboard/base
> | ERROR: Function failed: do_patch (see /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/linux-yocto-3.0.32+git1+bf5ee4945ee6d748e6abe16356f2357f76b5e2f0_1+3ab688a78cac7b2e32afc83376a53370f2bd13b7-r4.1/temp/log.do_patch.8680 for further information)
> NOTE: recipe linux-yocto-3.0.32+git1+bf5ee4945ee6d748e6abe16356f2357f76b5e2f0_1+3ab688a78cac7b2e32afc83376a53370f2bd13b7-r4.1: task do_patch: Failed
> ERROR: Task 444 (/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/meta/recipes-kernel/linux/linux-yocto_3.0.bb, do_patch) failed with exit code '1'




>   .../kern-tools/kern-tools-native_git.bb            |    2 +-
>   meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb    |    4 ++--
>   meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb    |    8 ++++----
>   meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb  |    2 +-
>   meta/recipes-kernel/linux/linux-yocto_3.2.bb       |   12 ++++++------
>   meta/recipes-kernel/linux/linux-yocto_3.4.bb       |   16 ++++++++--------
>   6 files changed, 22 insertions(+), 22 deletions(-)
>



