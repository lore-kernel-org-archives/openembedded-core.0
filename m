Return-Path: <dvhart@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 190506C6B7
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2013 14:49:17 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 05 Sep 2013 07:49:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,847,1371106800"; d="scan'208";a="391510830"
Received: from unknown (HELO [10.255.14.80]) ([10.255.14.80])
	by fmsmga001.fm.intel.com with ESMTP; 05 Sep 2013 07:49:18 -0700
Message-ID: <1378392558.14029.70.camel@dvhart-mobl4.amr.corp.intel.com>
From: Darren Hart <dvhart@linux.intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Thu, 05 Sep 2013 07:49:18 -0700
In-Reply-To: <1378371047.32427.29.camel@ted>
References: <cover.1378339881.git.dvhart@linux.intel.com>
	<b2e7d64bcfed785d28da77202d46157f4ce7dfd6.1378339881.git.dvhart@linux.intel.com>
	<CAP9ODKqGdoGoaNh9e_3gZ5A+HhCDq-_wCVygYKHcShajCNXyvg@mail.gmail.com>
	<1378352047.14029.51.camel@dvhart-mobl4.amr.corp.intel.com>
	<52282B4E.9050204@linux.intel.com> <1378371047.32427.29.camel@ted>
Organization: Intel
X-Mailer: Evolution 3.8.5 (3.8.5-2.fc19) 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	yunguo.wei@windriver.com, Poky <poky@yoctoproject.org>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [poky] [PATCH 1/4] linux-firmware: Update SRCREV, pull in iwlwifi-7260 support
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
X-List-Received-Date: Thu, 05 Sep 2013 14:49:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-09-05 at 09:50 +0100, Richard Purdie wrote:
> On Wed, 2013-09-04 at 23:57 -0700, Saul Wold wrote:
> > On 09/04/2013 08:34 PM, Darren Hart wrote:
> > > On Wed, 2013-09-04 at 22:04 -0300, Otavio Salvador wrote:
> > >> On Wed, Sep 4, 2013 at 9:18 PM, Darren Hart <dvhart@linux.intel.com> wrote:
> > >>> Fixes [YOCTO #5110]
> > >>>
> > >>> Add support for the iwlwifi 7260 adapters. This creates a new package
> > >>> and includes support in the default linux-firmware (everything) package.
> > >>>
> > >>> Update the iwlwifi and radeon license checksums. Extensions to the
> > >>> copyright date ranges were the only change to the LICENSE files.
> > >>>
> > >>> Signed-off-by: Darren Hart <dvhart@linux.intel.com>
> > >>> Cc: yunguo.wei@windriver.com
> > >>> ---
> > >>>   .../linux-firmware/linux-firmware_git.bb           |   10 ++++++----
> > >>>   1 file changed, 6 insertions(+), 4 deletions(-)
> > >>>
> > >>> diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
> > >>> index 3825889..1b7db08 100644
> > >>> --- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
> > >>> +++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
> > >>> @@ -7,12 +7,12 @@ SECTION = "kernel"
> > >>>
> > >>>   LICENSE = "Proprietary"
> > >>>
> > >>> -LIC_FILES_CHKSUM = "file://LICENSE.radeon;md5=e56b405656593a0c97e478513051ea0e \
> > >>> +LIC_FILES_CHKSUM = "file://LICENSE.radeon;md5=9c2faab1bfca55e1510d6bde67206f9c \
> > >>>                       file://LICENSE.dib0700;md5=f7411825c8a555a1a3e5eab9ca773431 \
> > >>>                       file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
> > >>>                       file://LICENCE.ralink-firmware.txt;md5=ab2c269277c45476fb449673911a2dfd \
> > >>>                       file://LICENCE.qla2xxx;md5=4005328a134054f0fa077bdc37aa64f2 \
> > >>> -                    file://LICENCE.iwlwifi_firmware;md5=11545778abf78c43d7644d4f171ea1c7 \
> > >>> +                    file://LICENCE.iwlwifi_firmware;md5=8b938534f77ffd453690eb34ed84ae8b \
> > >>>                       file://LICENCE.i2400m;md5=14b901969e23c41881327c0d9e4b7d36 \
> > >>>                       file://LICENCE.atheros_firmware;md5=30a14c7823beedac9fa39c64fdd01a13 \
> > >>>                       file://LICENCE.agere;md5=af0133de6b4a9b2522defd5f188afd31 \
> > >>> @@ -23,10 +23,10 @@ LIC_FILES_CHKSUM = "file://LICENSE.radeon;md5=e56b405656593a0c97e478513051ea0e \
> > >>>                       file://LICENCE.via_vt6656;md5=e4159694cba42d4377a912e78a6e850f \
> > >>>                      "
> > >>>
> > >>> -SRCREV = "c530a75c1e6a472b0eb9558310b518f0dfcd8860"
> > >>> +SRCREV = "600caefd83a406540b2a789be6415e44c9b87add"
> > >>>   PE = "1"
> > >>>   PV = "0.0+git${SRCPV}"
> > >>> -PR = "r1"
> > >>> +PR = "r0"
> > >>
> > >> I know this is OK but I'd prefer to omit the PR when it is r0;
> > >> specially now we use PRServer.
> > >
> > > Well, what is the official policy here? I'm happy to respin if
> > > necessary, but I'd rather not burn cycles if the policy is hazy on the
> > > subject.
> > >
> > Darren, sorry to say it is removal when possible.
> 
> Policy was hazy, however to me at least its now clear. 
> 
> PR values are to be handled by the PR server and therefore we're
> clearing them out of recipes as and when we can (same applies to
> INC_PR). Ultimately they should disappear, the sooner the better as far
> as I'm concerned.
> 

OK, I'll remove the PR and include in a V2 series.

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel



