Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id CB44B71989
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2016 21:42:25 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga105.fm.intel.com with ESMTP; 17 Oct 2016 14:42:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,358,1473145200"; d="scan'208";a="1071750634"
Received: from ssethurx-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.157.103])
	by fmsmga002.fm.intel.com with ESMTP; 17 Oct 2016 14:42:24 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Ulf Magnusson <ulfalizer@gmail.com>
Date: Tue, 18 Oct 2016 10:42:22 +1300
Message-ID: <23442997.E5G5x9UaiI@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.7.7-100.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
In-Reply-To: <1476729027-5072-2-git-send-email-ulfalizer@gmail.com>
References: <1476729027-5072-1-git-send-email-ulfalizer@gmail.com>
	<1476729027-5072-2-git-send-email-ulfalizer@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] bitbake: bitbake-layers: Make show-recipes show PR
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
X-List-Received-Date: Mon, 17 Oct 2016 21:42:26 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Ulf,

On Mon, 17 Oct 2016 20:30:27 Ulf Magnusson wrote:
> Only PE and PV were shown, which might have been an oversight. The
> tuples passed to version_str() contain three elements (PE, PV, and PR),
> not two.

I have to say I don't recall exactly but I think it was deliberate. We're 
talking about the recipe side here - is knowing the PR value actually useful? 
It's not like you can identify the recipe in any meaningful way by the PR 
value.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

