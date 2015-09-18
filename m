Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id 085D97687B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Sep 2015 17:43:56 +0000 (UTC)
Received: by igcpb10 with SMTP id pb10so40994872igc.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Sep 2015 10:43:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=qfombl+oEYeGrVpjESq6uDGUw/ORELsEc9DNub49+r8=;
	b=ko0/Fqr5mD0+fYJq33d1tYFd3XeNtOCErzcpRn0u6Uh4d0g8Y7GFHzmaRjIuHRuKxB
	erlbrleFA+NmJt1Sdg6QefB+yVu+EyOdTFnVSo5LCWsGVwl6i0zFKg+H0Cgkyj1EbSXP
	879jyMurQppBWFN8BJwoNAowCy9D8MFmJh1rJJFSvIZcG3I0t0LAEQMb5hsFdsFwBFpH
	UAQYj0hgdKYskIH8vN1weeQyjzt0vHQMqfq0H/GsxirkMKCLUENUIGmWpsBFJ8l5S1rb
	HdDlrASUbmpTv08oGUY5qlzFiaDyos63MATVlyQG3UP50cUXEI5FMv+tsXy9vi30vET2
	S51w==
X-Gm-Message-State: ALoCoQm++V/9I3ygChdS3WaKywK33V/ry4YqtpgjM3OqbxY/dn4wE4oHLnpQutkBzVKsy4xSFJ4E
X-Received: by 10.50.92.179 with SMTP id cn19mr218881igb.13.1442598236901;
	Fri, 18 Sep 2015 10:43:56 -0700 (PDT)
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com.
	[209.85.223.179]) by smtp.gmail.com with ESMTPSA id
	n14sm4140059ioi.15.2015.09.18.10.43.55
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 18 Sep 2015 10:43:55 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by iofh134 with SMTP id h134so64162099iof.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Sep 2015 10:43:55 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.107.131.134 with SMTP id n6mr15000901ioi.192.1442598235438; 
	Fri, 18 Sep 2015 10:43:55 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Fri, 18 Sep 2015 10:43:55 -0700 (PDT)
In-Reply-To: <55FC3163.7010603@windriver.com>
References: <cover.1442503745.git.alejandro.joya.cruz@intel.com>
	<55FBDAF1.3030906@communistcode.co.uk>
	<55FC3163.7010603@windriver.com>
Date: Fri, 18 Sep 2015 14:43:55 -0300
Message-ID: <CAP9ODKou_CxyPY1z-2qwdCtWTnQQaaMbHQ-NEK7ZyzeRDLm4xA@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] Dynamic common utilities
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
X-List-Received-Date: Fri, 18 Sep 2015 17:43:57 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Sep 18, 2015 at 12:44 PM, Mark Hatle <mark.hatle@windriver.com> wrote:
> On 9/18/15 4:35 AM, Jack Mitchell wrote:
>> On 17/09/15 17:20, Alejandro Joya wrote:
>>> It provide a virtual reference for the common utilities.
>>> it replace of the lock to busybox, it will be simple exchange between other
>>> common utilities like gnu core utils or toybox among others.
>>>
>>> In order to enable its required to fill at the distro conf or local.conf
>>>
>>> VIRTUAL-RUNTIME_login_manager ?= "busybox"
>>> PREFERRED_PROVIDER_virtual/anybox ?= "busybox"
>>> PREFERRED_RPROVIDER_virtual/anybox ?= "busybox"
>>> VIRTUAL-RUNTIME_anybox ?= "busybox"
>>> VIRTUAL-RUNTIME_anybox-hwclock ?= "busybox-hwclock"
>>>
>>> The following changes since commit f0189829498e30231d826c9f55aad73e622d076e:
>>>
>>>    qemu: Update to upstream patches (2015-09-14 11:22:02 +0100)
>>>
>>> are available in the git repository at:
>>>
>>>    git://github.com/Ajoyacr/openembedded-core anybox
>>>    https://github.com/Ajoyacr/openembedded-core/tree/anybox
>>>
>>> Alejandro Joya (3):
>>>    core-mage-minimal-initramfs: overwrite hardcoded dependency to virtual
>>>      reference
>>>    initramfs-framework: overwrite hardcoded dependency to virtual
>>>      reference
>>>    packagegroup-core-boot: overwrite hardcoded dependency to virtual
>>>      reference
>>>
>>>   meta/recipes-core/images/core-image-minimal-initramfs.bb   | 2 +-
>>>   meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb | 2 +-
>>>   meta/recipes-core/packagegroups/packagegroup-core-boot.bb  | 6 +++---
>>>   3 files changed, 5 insertions(+), 5 deletions(-)
>>>
>>
>> is 'anybox' a good name for the virtual provider? What happens if we have a new
>> suite of core utility replacements without box in the name, I assume it will be
>> a nightmare to retroactivly change the name so we should probably come up with a
>> more generic one now. virtual/core-utils, virtual/base-utils?
>
> Personally I like this better -- however, I think we're "too late" in the
> current development cycle to do it..  but for the next cycle, we should
> certainly consider going through the system and doing this instead.
>
> (It will definitely make it easier in the future to get rid of a "box" based
> system if desired.)

Agreed; this should be postponed for 2.1 and than we come up with a
proper virtual name when revisiting this patchset.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

