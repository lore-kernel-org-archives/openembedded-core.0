Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 0F80A6CC37
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2013 15:55:30 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 11 Oct 2013 08:55:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,1081,1371106800"; d="scan'208";a="306662444"
Received: from unknown (HELO helios.localnet) ([10.252.120.209])
	by AZSMGA002.ch.intel.com with ESMTP; 11 Oct 2013 08:55:26 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: ml@communistcode.co.uk
Date: Fri, 11 Oct 2013 16:55:25 +0100
Message-ID: <2500881.NDRv60Yfos@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-31-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <5258178A.9060606@communistcode.co.uk>
References: <5258178A.9060606@communistcode.co.uk>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Nasty tar breakage
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
X-List-Received-Date: Fri, 11 Oct 2013 15:55:30 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Jack,

On Friday 11 October 2013 16:21:46 Jack Mitchell wrote:
> I upgraded my host distribution today which pulled in tar 1.27 [1] and
> caused a nasty breakage. Downgrading to tar 1.26 fixed the problem, I
> would expect this is something we want to fix before 1.5 goes out the door?

I think this has unfortunately come up too late for 1.5. If we get the fix in 
master it could go into a 1.5.1 point release however.
 
> DEBUG: Executing python function sstate_task_prefunc
> DEBUG: Python function sstate_task_prefunc finished
> DEBUG: Executing python function do_populate_sysroot
> DEBUG: Executing shell function sysroot_stage_all
> tar: --same-order option cannot be used with -c
> Try 'tar --help' or 'tar --usage' for more information.
> tar: This does not look like a tar archive
> tar: Exiting with failure status due to previous errors
> WARNING:
> /home/jack/Work/oe-core.git/test-build/tmp-eglibc/work/x86_64-linux/quilt-na
> tive/0.60-r0/temp/run.sysroot_stage_all.21827:1 exit 2 from
>   tar -xf - -C "$dest"
> DEBUG: Python function do_populate_sysroot finished
> ERROR: Function failed: sysroot_stage_all (log file is located at
> /home/jack/Work/oe-core.git/test-build/tmp-eglibc/work/x86_64-linux/quilt-na
> tive/0.60-r0/temp/log.do_populate_sysroot.21827)
> 
> [1] https://lists.gnu.org/archive/html/info-gnu/2013-10/msg00004.html

Could you please file a bug for this so we can track the issue?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

