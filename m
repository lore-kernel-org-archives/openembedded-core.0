Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 40E94731C6
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Aug 2016 01:33:58 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 01 Aug 2016 18:33:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,458,1464678000"; d="scan'208";a="1027999597"
Received: from mpham2-mobl2.ccr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.178.20])
	by orsmga002.jf.intel.com with ESMTP; 01 Aug 2016 18:33:55 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Nathan Lynch <nathan_lynch@mentor.com>
Date: Tue, 02 Aug 2016 13:33:53 +1200
Message-ID: <1934077.UNhmxL79FM@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.6.4-201.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
In-Reply-To: <1469220826-8991-1-git-send-email-nathan_lynch@mentor.com>
References: <1469220826-8991-1-git-send-email-nathan_lynch@mentor.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Revert "lttng-tools: filter random filename of ptest output"
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
X-List-Received-Date: Tue, 02 Aug 2016 01:34:01 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Nathan,

On Fri, 22 Jul 2016 15:53:46 Nathan Lynch wrote:
> This reverts commit 29a8c45be2862be02afe2ebbc5c026a42f351990.
> 
> A few things wrong with this change:
> 
> 1. It patches a patch (runtest-2.4.0.patch).
> 2. It introduces deviations from the desired ptest output format.
> 3. It discards PASS: lines from the test output; I *want* to see those.
> 4. The upstream status of "pending" is incorrect; I do not see this
>    patch on the lttng-dev mailing list (not that it would apply anyway).

FYI, "pending" doesn't mean "pending acceptance", it means "pending 
determination" so it was probably correct here - not that that makes any 
difference to the other reasons for reverting. "Pending" is perhaps a bit of a 
poor term though. In any event the reference is here in case you need it:

  http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Patch_Header_Recommendations

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

