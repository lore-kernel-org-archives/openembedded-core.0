Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 3BD116B325
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 13:55:08 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 24 Jul 2013 06:55:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,735,1367996400"; d="scan'208";a="375664457"
Received: from unknown (HELO helios.localnet) ([10.252.122.156])
	by orsmga002.jf.intel.com with ESMTP; 24 Jul 2013 06:55:07 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Muhammad Shakeel <muhammad_shakeel@mentor.com>,
	Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Wed, 24 Jul 2013 14:55:06 +0100
Message-ID: <2332743.8PXxt6HHNa@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-26-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <51EFD503.9070404@mentor.com>
References: <1374573823-27458-1-git-send-email-muhammad_shakeel@mentor.com>
	<ly4nblpn8m.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<51EFD503.9070404@mentor.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] systemd: Remove init.d dir if systemd unit file is present and sysvinit not a distro feature
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
X-List-Received-Date: Wed, 24 Jul 2013 13:55:08 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 24 July 2013 18:22:11 Muhammad Shakeel wrote:
> On 07/23/2013 03:46 PM, Enrico Scholz wrote:
> > "Shakeel, Muhammad"
> > 
> > <muhammad_shakeel-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org> writes:
> >> If systemd is supported DISTRO_FEATURE and sysvinit is not and also if
> >> systemd_unitdir contains a service file(s) then no need to keep init.d
> >> scripts for sysvinit compatibility.
> >> ...
> >> +            for filename in os.listdir(systemd_unitdir):
> > 
> >> +                if filename.endswith(".service"):
> > why only .service?  Other systemd files (.socket, .mount, .path, ...)
> > can also replace initscripts.
> 
> Other systemd unit files are normally accompanied with a .service file
> (this is just I observed and not mandatory).
> 
> If we come across any package which is not providing .service file but
> only some other type of systemd unit file for initscripts replacement
> then we can always add check for that type.
> According to systemd documentation there can be 10 types of systemd unit
> files and checking for all here can be a little overhead.

Would it work to simply check for any files instaled into systemd_unitdir?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

