Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 76B4B60684;
	Wed, 18 Jan 2017 19:50:06 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 18 Jan 2017 11:50:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,250,1477983600"; d="scan'208";a="810498519"
Received: from mbadrulh-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.134.14])
	by FMSMGA003.fm.intel.com with ESMTP; 18 Jan 2017 11:50:05 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-architecture@lists.openembedded.org
Date: Thu, 19 Jan 2017 08:50:03 +1300
Message-ID: <9459934.WN0IuyjPMC@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.8.13-100.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
In-Reply-To: <8251941.rtFFyTMRIg@peggleto-mobl.ger.corp.intel.com>
References: <8251941.rtFFyTMRIg@peggleto-mobl.ger.corp.intel.com>
MIME-Version: 1.0
Cc: yocto@yoctoproject.org, openembedded-core@lists.openembedded.org
Subject: Re: [Openembedded-architecture] Layer index enhancements
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
X-List-Received-Date: Wed, 18 Jan 2017 19:50:07 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wed, 18 Jan 2017 23:02:00 Paul Eggleton wrote:
> * We now pick up layer dependencies (and recommends) specified in the
> layer.conf, but only if they match the layer name - we don't handle
> collection names yet, so this won't currently work where the collection
> name doesn't match the layer name (e.g. oe-core, meta-oe...).

I was wrong about this - the collection name is collected and used in the 
dependency resolution. New layers / branches should have this information 
populated, however we haven't collected collection names for all of the 
existing layers. I have just gone in and checked meta-oe and oe-core are set 
up for master, morty, krogoth & jethro.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

