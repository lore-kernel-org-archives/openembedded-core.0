Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 9041E6AF22
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jul 2013 13:38:15 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 09 Jul 2013 06:39:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,1028,1363158000"; d="scan'208";a="367427343"
Received: from unknown (HELO helios.localnet) ([10.252.121.245])
	by fmsmga002.fm.intel.com with ESMTP; 09 Jul 2013 06:38:15 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Date: Tue, 09 Jul 2013 14:38:14 +0100
Message-ID: <1402577.4PhkADxV84@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.4 (Linux/3.8.0-26-generic; KDE/4.10.4; i686; ; )
In-Reply-To: <51DC1027.9030801@windriver.com>
References: <cover.1373372649.git.hongxu.jia@windriver.com>
	<4535187.OqzhIf4Y4R@helios> <51DC1027.9030801@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/5] nss: add version 3.15.1
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
X-List-Received-Date: Tue, 09 Jul 2013 13:38:15 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 09 July 2013 21:29:11 Hongxu Jia wrote:
> 1, 3.15.1 is the newest version, and file structure has more change than
> previous version.
> 
> 2, 3.13.3 just skip signing, and cheksum file doesn't be generated.
> 
> 3, 3.13.3 doesn't completely fix incorrect shebang of perl (PATCH 5/5)
> 
> 4, 3.13.3's package doesn't contain ${D}${bindir}/  and ${D}${sysconfdir}
> 
> I think 3.15.1 is better.

The reason I ask is that if merged this will effectively replace the one in 
meta-browser, so as long as it handles everything that the meta-browser recipe 
does it should be OK.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

