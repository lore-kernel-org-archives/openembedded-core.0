Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 9417B619DD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2013 09:25:13 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 15 Jul 2013 02:25:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,668,1367996400"; d="scan'208";a="345719189"
Received: from unknown (HELO helios.localnet) ([10.252.122.64])
	by orsmga001.jf.intel.com with ESMTP; 15 Jul 2013 02:24:59 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>
Date: Mon, 15 Jul 2013 10:24:58 +0100
Message-ID: <1510613.ezlYfIjzn1@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.4 (Linux/3.8.0-26-generic; KDE/4.10.4; i686; ; )
In-Reply-To: <cover.1373872671.git.sgw@linux.intel.com>
References: <cover.1373872671.git.sgw@linux.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [CONSOLIDATED PULL 00/18] Final Review Pending
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
X-List-Received-Date: Mon, 15 Jul 2013 09:25:13 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 15 July 2013 00:23:38 Saul Wold wrote:
> Ross, Paul:
> 
> Please do a review of this set from over the weekend.
> 
> Hongxu's patch set includes an atom-pc patch that should have
> been on poky, I removed it from here.
> 
> I have reviewed the 2 package from the Auto Package Update (my
> recipes) and they are correct.
> 
> Thanks
> 	Sau!
> 
> 
> The following changes since commit 43c28375f97161e618fa54349c65be2058c33c53:
> 
>   distrodata.bbaclass: change in git and svn package reporting (2013-07-12
> 10:12:13 -0700)
> 
> are available in the git repository at:
> 
>   git://git.openembedded.org/openembedded-core-contrib sgw/stage
>  
> http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/
> stage
> 
> Alexandru Palalau (1):
>   lib/oeqa/runtime: add tests for syslog and df
> 
> Auto Package Upgrade (2):
>   libidn: upgrade to 1.28
>   mc: upgrade to 4.8.9

The author field for these isn't set correctly.

> Chen Qi (1):
>   core-image-lsb.bb: add 'package-management' to IMAGE_FEATURES
> 
> Hongxu Jia (5):
>   pmount: add version 0.9.23
>   udev-extraconf:fix xuser write to usb storage failed
>   udev: fix invoking pmount failed based on sysvinit
>   pmount: allow users in disk group to perform pmount/pumount
>   xuser-account: add xuser to disk group

I have some reservations about these changes. pmount is obsolete
according to its author:

https://lists.ubuntu.com/archives/ubuntu-devel-discuss/2011-February/012421.html

I appreciate it may solve the problem we're trying to solve but we need
to be pretty confident about pulling this in before we do so since we'll
likely be supporting it ourselves.

> Laurentiu Palcu (1):
>   xinput-calibrator: move it from meta-oe to oe-core

I've just noticed this drops PR (previous value was "r6"). I know it seems
trivial but we're not increasing PV so if we hope to supersede the recipe
from meta-oe, this will have to be preserved. Same goes for
pointercal-xinput which had a PR value of "r4".
 
> Saul Wold (1):
>   initscripts: Update to 9.48
> 
> Stefan Stanacar (7):
>   lib/oeqa/runtime/dmesg.py: whitelist dmesg message for systemd net
>     interface name
>   lib/oeqa/utils/sshcontrol.py: fix passing command to subprocess
>   testimage.bbclass, lib/oeqa/utils/qemurunner.py: make boot timeout
>     configurable and increase it
>   lib/oeqa/runtime/multilib.py: use readelf instead of file
>   lib/oeqa/oetest.py: provide a ps command for all tests
>   classes/testimage.bbclass: use a copy of rootfs for tests
>   testimage.bbclass, lib/oeqa: add headers and comments

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

