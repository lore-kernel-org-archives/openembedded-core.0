Return-Path: <dvhart@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 7658A615F4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2013 03:35:04 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 04 Sep 2013 20:35:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,843,1371106800"; d="scan'208";a="291007139"
Received: from unknown (HELO [10.255.14.80]) ([10.255.14.80])
	by AZSMGA002.ch.intel.com with ESMTP; 04 Sep 2013 20:35:01 -0700
Message-ID: <1378352101.14029.52.camel@dvhart-mobl4.amr.corp.intel.com>
From: Darren Hart <dvhart@linux.intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Wed, 04 Sep 2013 20:35:01 -0700
In-Reply-To: <CAP9ODKou8KFNUVjjMq7wcY8wJ5m-rh4YGpuFTA_JugiSis7dEQ@mail.gmail.com>
References: <cover.1378339881.git.dvhart@linux.intel.com>
	<CAP9ODKou8KFNUVjjMq7wcY8wJ5m-rh4YGpuFTA_JugiSis7dEQ@mail.gmail.com>
Organization: Intel
X-Mailer: Evolution 3.8.5 (3.8.5-2.fc19) 
Mime-Version: 1.0
Cc: Poky <poky@yoctoproject.org>, yunguo.wei@windriver.com,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] Updates in support of genericx86*
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
X-List-Received-Date: Thu, 05 Sep 2013 03:35:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-09-04 at 22:16 -0300, Otavio Salvador wrote:
> On Wed, Sep 4, 2013 at 9:18 PM, Darren Hart <dvhart@linux.intel.com> wrote:
> > As this series bridges both oe-core and poky and is best viewed as one series, I
> > opted to send the series to both lists.
> >
> > These patches address bugs/feature requests for additional support of
> > linux-firmware and xorg-video-* drivers for the new meta-yocto-bsp genericx86
> > and genericx86-64 machines.
> >
> > Some of the oe-core changes could be contained in the meta-yocto-bsp layer, but
> > as these changes come from meta-intel, they are needed by multiple layers, and I
> > felt it might make more sense in oe-core. If people object to the mga or intel
> > xserver video drivers, I can respin those for meta-yocto-bsp.
> 
> QEMU does not need them so they should be in meta-yocto-bsp.
> 

I'm fine with that if that is the consensus. Does anyone else care to
weigh in?

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel



