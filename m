Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 1B714731E5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Dec 2015 04:48:29 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 21 Dec 2015 20:48:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,462,1444719600"; d="scan'208";a="876479494"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.148.44])
	by orsmga002.jf.intel.com with ESMTP; 21 Dec 2015 20:48:29 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Dec 2015 17:48:26 +1300
Message-ID: <8902667.dRqJiN5CyU@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.2.7-300.fc23.x86_64; KDE/4.14.14; x86_64; ;
	)
In-Reply-To: <bf656aa4c94050e325b5070d7bf9a9ccf7858243.1450751834.git.paul.eggleton@linux.intel.com>
References: <cover.1450751834.git.paul.eggleton@linux.intel.com>
	<bf656aa4c94050e325b5070d7bf9a9ccf7858243.1450751834.git.paul.eggleton@linux.intel.com>
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] buildhistory: fix not recording SDK information
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
X-List-Received-Date: Tue, 22 Dec 2015 04:48:31 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tue, 22 Dec 2015 15:41:27 Paul Eggleton wrote:
> After OE-Core revision baa4e43a29e45df17eaa3456acc179b08d571db6 we lost
> recording SDK the contents in buildhistory. This was due to the
> SDK_POSTPROCESS_COMMAND variable being set with = in
> populate_sdk_base.bbclass which overwrote any value set with += in
> buildhistory.bbclass; to fix it, use _append in buildhistory.bbclass
> instead.
> 
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>

I neglected to note this fixes bug 8839 - I've re-pushed the branch with the 
commit message updated.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

