Received: from mail-qa0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1T6dLy-0003f8-OU
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Aug 2012 10:10:22 +0200
Received: by qadc11 with SMTP id c11so4091917qad.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Aug 2012 00:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=SEOQsSIkUuEP0h5GZoAaUTmw1E0IVEAhkgA05mLHfyU=;
	b=fDcnbghykTZiYc0IBZuSjdTwR647xKttHgjLH+fCQ2hE61bZVdbOB56eHCMlUXoF7h
	JrLVVfiyT7H4HDQPFKaK5ukwTUBiaxpO9+ToypF7wu5IdkOhrGBB03N8fqYx6vNgQgLc
	BFon7/fv3w/iH4QHUTDmh2bo1NGNXhgko+SN08GM9lqV3Ya5fO8EhbXKPkC/PysYKJYu
	l3ciuA8ZXlVV+nfIeoBZH8zaw8uH6/btsmR5CGgPtXIw8gz4qQ9Y9rbYl1YDc9qUXNOS
	MFJGmDDhPBQNA79OmEfkZNn6EA05t0768TvZY35+e+AN5NzsIomoQAWqIE6UtQsBPgzr
	4YuQ==
MIME-Version: 1.0
Received: by 10.224.216.7 with SMTP id hg7mr2028828qab.3.1346227088671; Wed,
	29 Aug 2012 00:58:08 -0700 (PDT)
Received: by 10.229.247.198 with HTTP; Wed, 29 Aug 2012 00:58:08 -0700 (PDT)
In-Reply-To: <503CD416.7000100@intel.com>
References: <cover.1346042224.git.bruce.ashfield@windriver.com>
	<503CD416.7000100@intel.com>
Date: Wed, 29 Aug 2012 03:58:08 -0400
Message-ID: <CADkTA4P74r8gJi=tfa30OsrpFZG+tjVogfH98canqqh3VC_w3A@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Saul Wold <saul.wold@intel.com>
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
X-List-Received-Date: Wed, 29 Aug 2012 08:10:23 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Aug 28, 2012 at 10:22 AM, Saul Wold <saul.wold@intel.com> wrote:
> On 08/26/2012 09:49 PM, Bruce Ashfield wrote:
>>
>> Richard/Saul,
>>
>> Here's some changes that I've staged over the past week or so,
>> everything checks out here, and there are some good changes in
>> this set of -stable updates, and and the linker fix from Khem.
>>
>> I've also got a small tools fix here as well, that was needed
>> for some of the yocto-bsp builds. I think we've worked through
>> most of them now, and everything is looking good.
>>
>> Cheers,
>>
>> Bruce
>>
>> cc: Khem Raj <raj.khem@gmail.com>
>> cc: Tom Zanussi <tom.zanussi@intel.com>
>>
>> The following changes since commit
>> b4c5725af4cd85d5644f0373e2674e903c4eab2b:
>>
>>    yocto-bsp: add missing xserver-xf86-config .bbappend for qemu
>> (2012-08-25 14:47:07 +0100)
>>
>> are available in the git repository at:
>>    git://git.pokylinux.org/poky-contrib zedd/kernel
>>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel
>>
>> Bruce Ashfield (3):
>>    kern-tools: fix forced branching
>>    linux-yocto/3.4: v3.4.9, unionfs, perf and configuration changes
>>    linux-yocto/3.2/3.4: arm: Fix linking errors with binutils 2.23
>>
> Bruce,
>
> I saw some problems with serveral hardware BSP platforms in do_patch on the
> Autobuilder.  I think your traveling this week, so I am going to hold off on
> this set.

I am, and good plan. But I do have a fix for this one (Tom and I saw
it earlier),
I'll queue it and send it ASAP.

Cheers,

Bruce

>
>> ERROR: Function failed: do_patch (see
>> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/linux-yocto-3.0.32+git1+bf5ee4945ee6d748e6abe16356f2357f76b5e2f0_1+3ab688a78cac7b2e32afc83376a53370f2bd13b7-r4.1/temp/log.do_patch.8680
>> for further information)
>> NOTE: recipe python-2.7.3-r0.2: task do_populate_lic: Succeeded
>> ERROR: Logfile of failure stored in:
>> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/linux-yocto-3.0.32+git1+bf5ee4945ee6d748e6abe16356f2357f76b5e2f0_1+3ab688a78cac7b2e32afc83376a53370f2bd13b7-r4.1/temp/log.do_patch.8680
>> Log data follows:
>> | DEBUG: Executing shell function do_patch
>> | Branch meta-temp set up to track remote branch meta from origin.
>> | Deleted branch meta-temp (was 620917d).
>> | [INFO] validating against known patches  (beagleboard-standard-meta)
>> |   [##                                                ] (|)(5 %)
>>   [###                                               ] (/)(7 %)
>>   [#####                                             ] (-)(10 %)
>>   [######                                            ] (\)(13 %)
>>   [#######                                           ] (|)(15 %)
>>   [#########                                         ] (/)(18 %)
>>   [##########                                        ] (-)(21 %)
>>   [###########                                       ] (\)(23 %)
>>   [#############                                     ] (|)(26 %)
>>   [##############                                    ] (/)(28 %)
>>   [###############                                   ] (-)(31 %)
>>   [#################                                 ] (\)(34 %)
>>   [##################                                ] (|)(36 %)
>>   [###################                               ] (/)(39 %)
>>   [#####################                             ] (-)(42 %)
>>   [######################                            ] (\)(44 %)
>>   [#######################                           ] (|)(47 %)
>>   [#########################                         ] (/)(50 %)
>>   [##########################                        ] (-)(52 %)
>>   [###########################                       ] (\)(55 %)
>>   [############################                      ] (|)(57 %)
>>   [##############################                    ] (/)(60 %)
>>   [###############################                   ] (-)(63 %)
>>   [################################                  ] (\)(65 %)
>>   [##################################                ] (|)(68 %)
>>   [###################################               ] (/)(71 %)
>>   [####################################              ] (-)(73 %)
>>   [######################################            ] (\)(76 %)
>>   [##################################################]  (completed in 4
>> seconds)
>> | ERROR: branch yocto/standard/beagleboard was requested, but was not
>> properly
>> |        configured to be built. The current branch is
>> yocto/standard/beagleboard/base
>> | ERROR: Function failed: do_patch (see
>> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/linux-yocto-3.0.32+git1+bf5ee4945ee6d748e6abe16356f2357f76b5e2f0_1+3ab688a78cac7b2e32afc83376a53370f2bd13b7-r4.1/temp/log.do_patch.8680
>> for further information)
>> NOTE: recipe
>> linux-yocto-3.0.32+git1+bf5ee4945ee6d748e6abe16356f2357f76b5e2f0_1+3ab688a78cac7b2e32afc83376a53370f2bd13b7-r4.1:
>> task do_patch: Failed
>> ERROR: Task 444
>> (/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/meta/recipes-kernel/linux/linux-yocto_3.0.bb,
>> do_patch) failed with exit code '1'
>
>
>
>
>
>>   .../kern-tools/kern-tools-native_git.bb            |    2 +-
>>   meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb    |    4 ++--
>>   meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb    |    8 ++++----
>>   meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb  |    2 +-
>>   meta/recipes-kernel/linux/linux-yocto_3.2.bb       |   12 ++++++------
>>   meta/recipes-kernel/linux/linux-yocto_3.4.bb       |   16
>> ++++++++--------
>>   6 files changed, 22 insertions(+), 22 deletions(-)
>>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


