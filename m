Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 9DAD86D840
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Dec 2013 18:57:27 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 04 Dec 2013 10:57:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,826,1378882800"; d="scan'208";a="446924497"
Received: from akagikob-mobl1.ger.corp.intel.com (HELO helios.localnet)
	([10.252.121.234])
	by orsmga002.jf.intel.com with ESMTP; 04 Dec 2013 10:57:22 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 04 Dec 2013 18:57:20 +0000
Message-ID: <2780723.Eg1JlMHale@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-31-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <1386182811-3588-1-git-send-email-andrei@gherzan.ro>
References: <1386182811-3588-1-git-send-email-andrei@gherzan.ro>
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] libav: Add v9.10
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
X-List-Received-Date: Wed, 04 Dec 2013 18:57:27 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 04 December 2013 20:46:50 Andrei Gherzan wrote:
> This version includes libavresample needed for packages like xbmc.
> To use this version add:
> PREFERRED_VERSION_libav = "9.10".

We really want to avoid having too many versions of the same recipe hanging 
around. However, it seems premature to drop 0.8.x at this point. Perhaps we 
should drop the libav_git recipe that we currently have, since that is just 
pointing at an old 0.9.x version?

Anyone have any thoughts on this?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

