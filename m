Return-Path: <dvhart@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 9B27E6C6B7
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2013 14:52:24 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 05 Sep 2013 07:49:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,847,1371106800"; d="scan'208";a="391512021"
Received: from unknown (HELO [10.255.14.80]) ([10.255.14.80])
	by fmsmga001.fm.intel.com with ESMTP; 05 Sep 2013 07:52:09 -0700
Message-ID: <1378392729.14029.73.camel@dvhart-mobl4.amr.corp.intel.com>
From: Darren Hart <dvhart@linux.intel.com>
To: "Burton, Ross" <ross.burton@intel.com>, yunguo.wei@windriver.com, 
	"Kamble, Nitin A" <nitin.a.kamble@intel.com>
Date: Thu, 05 Sep 2013 07:52:09 -0700
In-Reply-To: <CAJTo0LY-oi+tQy7rs84axy4R71Y4j=HtEgXALN20aVdATwzVdg@mail.gmail.com>
References: <cover.1378339881.git.dvhart@linux.intel.com>
	<4562a00806c5a6573b5aa650764ad12bc93edda7.1378339881.git.dvhart@linux.intel.com>
	<CAJTo0LY-oi+tQy7rs84axy4R71Y4j=HtEgXALN20aVdATwzVdg@mail.gmail.com>
Organization: Intel
X-Mailer: Evolution 3.8.5 (3.8.5-2.fc19) 
Mime-Version: 1.0
Cc: Poky <poky@yoctoproject.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] xf86-video-mga: Pull in Matrox MGA support from meta-intel
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
X-List-Received-Date: Thu, 05 Sep 2013 14:52:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-09-05 at 10:57 +0100, Burton, Ross wrote:
> On 5 September 2013 01:18, Darren Hart <dvhart@linux.intel.com> wrote:
> > In support of the more generic x86 BSPs, pull in the Matrox driver
> > recipe from meta-intel.
> 
> What machine is this for in particular?

This was reported when someone was testing on a Romley machine.

>   In discussion with Nitin
> about MGA a few weeks back the conclusion was that the vesa driver
> should be sufficient.  As far as I'm aware the reference platforms
> don't ship with MGA hardware so it's up to the owner of the platform
> to install whatever they have to hand (mga, nvidia, ATI, etc), or am I
> wrong about that?

Nitin?

Yunguo?

> 
> > Remove the checkfile patch from Ross as this is now handled adequately
> > with the configure prepend hack which assumes success for any checkfile
> > calls.
> 
> Assuming success in an distro where opengl isn't enabled will result
> in the driver believing that DRI is enabled when it isn't, so expect
> to see build failures from this.

Should we be adding a distro depends on opengl for this driver as is
being done for others currently?

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel



