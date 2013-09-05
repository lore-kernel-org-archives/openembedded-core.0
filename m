Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 834FF61788
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2013 11:07:02 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r85BIdCh004965; Thu, 5 Sep 2013 12:19:54 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id hM7BMQt0rw3J; Thu,  5 Sep 2013 12:19:53 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r85BJmwR004978
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Thu, 5 Sep 2013 12:19:49 +0100
Message-ID: <1378379194.32427.33.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 05 Sep 2013 12:06:34 +0100
In-Reply-To: <CAJTo0LZb5hTNAjTJvL2ueRWqe1PWPUv3yU-fbobwjcAis-7JCg@mail.gmail.com>
References: <cover.1378339881.git.dvhart@linux.intel.com>
	<CAP9ODKou8KFNUVjjMq7wcY8wJ5m-rh4YGpuFTA_JugiSis7dEQ@mail.gmail.com>
	<1378352101.14029.52.camel@dvhart-mobl4.amr.corp.intel.com>
	<CAJTo0LZb5hTNAjTJvL2ueRWqe1PWPUv3yU-fbobwjcAis-7JCg@mail.gmail.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: yunguo.wei@windriver.com, Darren Hart <dvhart@linux.intel.com>,
	Poky <poky@yoctoproject.org>, Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [poky] [PATCH 0/4] Updates in support of genericx86*
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
X-List-Received-Date: Thu, 05 Sep 2013 11:07:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-09-05 at 10:47 +0100, Burton, Ross wrote:
> On 5 September 2013 04:35, Darren Hart <dvhart@linux.intel.com> wrote:
> >> > Some of the oe-core changes could be contained in the meta-yocto-bsp layer, but
> >> > as these changes come from meta-intel, they are needed by multiple layers, and I
> >> > felt it might make more sense in oe-core. If people object to the mga or intel
> >> > xserver video drivers, I can respin those for meta-yocto-bsp.
> >>
> >> QEMU does not need them so they should be in meta-yocto-bsp.
> >
> > I'm fine with that if that is the consensus. Does anyone else care to
> > weigh in?
> 
> By that logic nearly all the X drivers in oe-core should be in
> meta-yocto-bsp (synaptics, intel, modesetting, omap, omapfb, keyboard,
> mouse), but then we'd be forcing people using anything other than qemu
> to use meta-yocto-bsp (or duplicate the recipes).  A more nuanced
> rationale for keeping modesettings/intel/etc is that whilst the driver
> isn't used on QEMU it is in use on a large number of machines so it
> can be centrally maintained in oe-core.  I'm not convinced this holds
> for -mga (unless you're reading this from the late 90s) so it should
> be in meta-yocto-bsp.

There is some thinking going on at the moment about merging genericx86
and qemux86 since the two machines are converging and any differences
could be dealt with at runtime. To me, this is a key detail.

I agree that -mga is a push for OE-Core but the other drivers are useful
and I can see a case for moving them towards the core rather than having
several layers needing them.

Cheers,

Richard


