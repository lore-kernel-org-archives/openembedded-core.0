Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 7DDB360DFA
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Apr 2014 11:00:11 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 04 Apr 2014 03:55:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,794,1389772800"; d="scan'208";a="514783936"
Received: from davidllo-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.87])
	by orsmga002.jf.intel.com with ESMTP; 04 Apr 2014 04:00:05 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Koen Kooi <koen.kooi@linaro.org>
Date: Fri, 04 Apr 2014 12:00:04 +0100
Message-ID: <465539862.Xb3zOTJjse@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.3 (Linux/3.13.7-200.fc20.x86_64; KDE/4.12.3; x86_64; ; )
In-Reply-To: <1396602904-14596-1-git-send-email-koen.kooi@linaro.org>
References: <1396602904-14596-1-git-send-email-koen.kooi@linaro.org>
MIME-Version: 1.0
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-core@lists.openembedded.org
Subject: Re: [Dora][PATCH] buildhistory-diff: add ability to report version changes
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
X-List-Received-Date: Fri, 04 Apr 2014 11:00:13 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 04 April 2014 11:15:04 Koen Kooi wrote:
> From: Paul Eggleton <paul.eggleton@linux.intel.com>
> 
> Add a -v/--report-ver option to report changes in PKGE/PKGV/PKGR even
> if the value is the same as the default from PE/PV/PR.
> 
> Also add a -a/--report-all option to report all changes instead of just
> the default significant ones.

Hmm, looking at this I'm not sure that this is the right fix for a stable 
branch - ideally we should just fix the error rather than backporting the 
feature IMO.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

