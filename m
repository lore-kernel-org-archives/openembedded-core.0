Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 89F6761663
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2013 15:15:37 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 15 Jul 2013 08:15:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,669,1367996400"; d="scan'208";a="268501742"
Received: from unknown (HELO helios.localnet) ([10.252.122.64])
	by AZSMGA002.ch.intel.com with ESMTP; 15 Jul 2013 08:15:13 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Jul 2013 16:15:12 +0100
Message-ID: <15615026.ItR7X5Z2oF@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.4 (Linux/3.8.0-26-generic; KDE/4.10.4; i686; ; )
In-Reply-To: <cover.1373900913.git.sgw@linux.intel.com>
References: <cover.1373900913.git.sgw@linux.intel.com>
MIME-Version: 1.0
Subject: Re: [CONSOLIDATED PULL 00/15] Ready to Pull
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
X-List-Received-Date: Mon, 15 Jul 2013 15:15:46 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 15 July 2013 08:12:12 Saul Wold wrote:
> Richard,
> 
> Here is a set of changes, mostly OE-QA change with a a few
> package updates and a LSB fix.
> 
> Thanks
> 	Sau!
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
> Chen Qi (1):
>   core-image-lsb.bb: add 'package-management' to IMAGE_FEATURES
> 
> Saul Wold (3):
>   libidn: upgrade to 1.28
>   mc: upgrade to 4.8.9
>   initscripts: Update to 9.48
> 
> Stefan Stanacar (10):
>   lib/oeqa/runtime/dmesg.py: whitelist dmesg message for systemd net
>     interface name
>   lib/oeqa/utils/sshcontrol.py: fix passing command to subprocess
>   testimage.bbclass, lib/oeqa/utils/qemurunner.py: make boot timeout
>     configurable and increase it
>   lib/oeqa/runtime/multilib.py: use readelf instead of file
>   lib/oeqa/oetest.py: provide a ps command for all tests
>   classes/testimage.bbclass: use a copy of rootfs for tests
>   testimage.bbclass, lib/oeqa: add headers and comments
>   lib/oeqa: fix dependecy check
>   lib/oeqa/runtime/df.py: limit output to /
>   lib/oeqa/runtime/syslog.py: fix restart in case of systemd

Acked-by: Paul Eggleton <paul.eggleton@linux.intel.com>

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

