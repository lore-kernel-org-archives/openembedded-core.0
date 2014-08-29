Return-Path: <max.eliaser@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 175D86FEA9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Aug 2014 18:24:11 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 29 Aug 2014 11:23:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,425,1406617200"; d="scan'208";a="591826031"
Received: from jfdmzpr06.jf.intel.com (HELO [10.7.196.68]) ([10.7.210.25])
	by fmsmga002.fm.intel.com with ESMTP; 29 Aug 2014 11:23:45 -0700
Message-ID: <1409336458.8504.3.camel@maxtothemax-Studio-XPS-8000>
From: Max Eliaser <max.eliaser@intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 29 Aug 2014 11:20:58 -0700
In-Reply-To: <CAJTo0LZ_fZsexOVt2M1Tb4Pv-zghRJa=2ALMxxAKrHwFPc9Vqw@mail.gmail.com>
References: <cover.1409074419.git.max.eliaser@intel.com>
	<ef8574dfdd5992bdd42b788a909d0610d8b23b21.1409074419.git.max.eliaser@intel.com>
	<CAJTo0LZ_fZsexOVt2M1Tb4Pv-zghRJa=2ALMxxAKrHwFPc9Vqw@mail.gmail.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/5] qemux86: support X11 when QEMU is emulating a different GPU than vmware
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
X-List-Received-Date: Fri, 29 Aug 2014 18:24:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

My understanding is that xf86-video-modesetting is completely
unaccelerated, whereas xf86-video-cirrus does some 2D acceleration. Is
that not correct?

-Max

On Wed, 2014-08-27 at 15:48 +0100, Burton, Ross wrote:
> On 26 August 2014 18:34, Max Eliaser <max.eliaser@intel.com> wrote:
> > QEMU is capable of emulating four different VGA adapters: cirrus, std, vmware,
> > and QXL. By adding the cirrus and fbdev X.Org drivers to the qemux86 image,
> > the image can be made to launch an X server on when cirrus and std are chosen,
> > in addition to just vmware. (The build of QEMU in OE-Core appears to have QXL
> > disabled, meaning a driver for it is unnecessary.)
> 
> I knew there was something missing...
> 
> http://lxr.free-electrons.com/source/drivers/gpu/drm/cirrus/Kconfig
> 
> The kernel has a minimal DRM/KMS driver for the Cirrus that qemu
> emulates, so we should also add xf86-video-modesettings driver to this
> list and ensure that the qemu images enable this kernel driver.
> 
> Ross



