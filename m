Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 24EF46B220
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jul 2013 15:50:26 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 16 Jul 2013 08:52:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,677,1367996400"; d="scan'208";a="371154667"
Received: from unknown (HELO helios.localnet) ([10.252.122.80])
	by fmsmga002.fm.intel.com with ESMTP; 16 Jul 2013 08:50:22 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>
Date: Tue, 16 Jul 2013 16:50:21 +0100
Message-ID: <1574655.tqEqNr1Yfc@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.4 (Linux/3.8.0-26-generic; KDE/4.10.4; i686; ; )
In-Reply-To: <cover.1373985134.git.sgw@linux.intel.com>
References: <cover.1373985134.git.sgw@linux.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [CONSOLIDATED PULL 00/17] Rebased C-Pull, needs review
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
X-List-Received-Date: Tue, 16 Jul 2013 15:50:26 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 16 July 2013 07:39:05 Saul Wold wrote:
> Ross, Paul:
> 
> I rebased after RP pulled, most of this has been run through the
> Autobuilder.  It contains changes to patches that missed the AB run.
> 
> Please review / ACK this email for RP.
> 
> Thanks
> 	Sau!
> 
> 
> The following changes since commit cf1790d992f067be8d5f9894458f55f6f1bdc61f:
> 
>   lib/oeqa: fix dependecy check (2013-07-15 10:29:27 -0700)
> 
> are available in the git repository at:
> 
>   git://git.openembedded.org/openembedded-core-contrib sgw/stage
>  
> http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/
> stage
> 
> Hongxu Jia (2):
>   udev-extraconf: allow users in disk group to write vfat filesystem
>   xuser-account: add xuser to disk group
> 
> Jonathan Liu (1):
>   gdb: add PACKAGECONFIG for Python support
> 
> Kai Kang (1):
>   tcl: fix typo of upstream status in patch file
> 
> Khem Raj (1):
>   gcc-4.8: Fix on-device SDK C++ runtime issue
> 
> Mark Hatle (4):
>   sanity.bbclass: Update gcc sanity check
>   terminal.bbclass: Fix BB_RUNFMT processing
>   busybox: fix ip reference in simple.script
>   dbus-ptest: Disable python module check
> 
> Paul Eggleton (3):
>   qt-mobility: tighten up config generation and use PACKAGECONFIG
>   classes/insane: fix regression in libdir QA regex
>   classes/insane: allow libdir QA check to be skipped using INSANE_SKIP
> 
> Roy.Li (1):
>   dpkg: backport a patch to support mipsn32el and mips64el

Acked-by: Paul Eggleton <paul.eggleton@linux.intel.com>

(I'm probably not the best person to be acking my own patches though so I'm 
assuming extra scrutiny from others on those ones :)

-- 

Paul Eggleton
Intel Open Source Technology Centre

