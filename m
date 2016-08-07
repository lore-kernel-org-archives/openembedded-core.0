Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id C60F5770E3
	for <openembedded-core@lists.openembedded.org>;
	Sun,  7 Aug 2016 22:21:07 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga104.fm.intel.com with ESMTP; 07 Aug 2016 15:21:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,486,1464678000"; d="scan'208";a="1036802736"
Received: from mlim14-mobl5.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.150.9])
	by fmsmga002.fm.intel.com with ESMTP; 07 Aug 2016 15:21:06 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Terry Boese <terry.boese@vecima.com>
Date: Mon, 08 Aug 2016 10:21:03 +1200
Message-ID: <2637866.kmUA3NXBsc@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.6.4-201.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
In-Reply-To: <1470350420-19935-1-git-send-email-terry.boese@vecima.com>
References: <1470350420-19935-1-git-send-email-terry.boese@vecima.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Update dnsmasq to version 2.76
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
X-List-Received-Date: Sun, 07 Aug 2016 22:21:09 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Terry,

Some feedback on your patch:

* The dnsmasq recipe is in meta-networking, not OE-Core. Accordingly this 
patch should be sent to the openembedded-devel@lists.openembedded.org mailing 
list rather than this one.

* Please include "Signed-off-by" in your commit message.

* Please use -M with git-format-patch or git-send-email in order to have 
renames detected and reflected in the patch.

* The shortlog (first line of the commit message) should start with whichever 
recipe, module or area is being changed. Thus for this patch it should be 
"dnsmasq: update to version 2.76".

* If you make other changes in the patch that are not directly related to the 
upgrade (such as base_contains -> bb.utils.contains), please explicitly 
mention them in the commit message.

If you could please send a v2 of this patch with the above corrected to the 
openembedded-devel list that would be much appreciated.

Thanks,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

