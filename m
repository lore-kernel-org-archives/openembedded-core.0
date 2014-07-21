Return-Path: <dvhart@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id CDCFF61585
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jul 2014 15:21:59 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 21 Jul 2014 08:21:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,701,1400050800"; d="scan'208";a="576492578"
Received: from pamin1-mobl1.amr.corp.intel.com (HELO [10.254.75.138])
	([10.254.75.138])
	by orsmga002.jf.intel.com with ESMTP; 21 Jul 2014 08:20:57 -0700
User-Agent: Microsoft-MacOutlook/14.4.3.140616
Date: Mon, 21 Jul 2014 08:21:04 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: Darren Hart <dvhart@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>
Message-ID: <CFF27DBC.9D3CA%dvhart@linux.intel.com>
Thread-Topic: [OE-core] [PATCH] kernelshark: Remove trace-cmd from the
	kernelshark package
References: <7ebd83d37f946d8f169e4bec7e00bfeed6cc6408.1405724512.git.dvhart@linux.intel.com>
In-Reply-To: <7ebd83d37f946d8f169e4bec7e00bfeed6cc6408.1405724512.git.dvhart@linux.intel.com>
Mime-version: 1.0
Cc: california.l.sullivan@intel.com
Subject: Re: [PATCH] kernelshark: Remove trace-cmd from the kernelshark package
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
X-List-Received-Date: Mon, 21 Jul 2014 15:22:01 -0000
Content-type: text/plain;
	charset="US-ASCII"
Content-transfer-encoding: 7bit

On 7/18/14, 16:01, "Darren Hart" <dvhart@linux.intel.com> wrote:

>Fixes [YOCTO 6550]
>
>Images installing both trace-cmd and kernelshark would fail with:
>
>error: file /usr/bin/trace-cmd conflicts between attempted installs of
>kernelshark-1.2+git0+7055ffd37b-r3.core2_32 and
>trace-cmd-1.2+git0+7055ffd37b-r3.core2_32
>
>This patch removes ${bindir}/trace-cmd from the install prior to
>packaging, as is already done with the ${datadir}.
>
>Reported-by: California Sullivan <california.l.sullivan@intel.com>
>Signed-off-by: Darren Hart <dvhart@linux.intel.com>
>(cherry picked from commit eb08ae8f729ef77329892d19b23ddfdaa7953de0)

Apologies for the cherry-picked line, that shouldn't have appeared here.
Please remove prior to merge. I can resubmit if that is preferred.

-- 
Darren Hart					Open Source Technology Center
darren.hart@intel.com				            Intel Corporation




