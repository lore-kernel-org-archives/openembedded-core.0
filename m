Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 3EB4578657
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Nov 2017 20:57:54 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Nov 2017 12:57:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,429,1505804400"; d="scan'208";a="151566304"
Received: from bplee1-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.64.234])
	by orsmga004.jf.intel.com with ESMTP; 20 Nov 2017 12:57:52 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Amanda Brindle <amanda.r.brindle@intel.com>
Date: Tue, 21 Nov 2017 09:57:48 +1300
Message-ID: <2268329.Vkdv2lqJj1@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
In-Reply-To: <ca3937bd8e776363d8dd58348b8f220c230222f8.1510791278.git.amanda.r.brindle@intel.com>
References: <cover.1510791278.git.amanda.r.brindle@intel.com>
	<ca3937bd8e776363d8dd58348b8f220c230222f8.1510791278.git.amanda.r.brindle@intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 1/1] scripts/contrib/bbvars.py: Rewrite to use tinfoil
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
X-List-Received-Date: Mon, 20 Nov 2017 20:57:55 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday, 16 November 2017 1:21:04 PM NZDT Amanda Brindle wrote:
> Use tinfoil to collect all variable names globally and in each recipe.
> This will capture more variable references than parsing manually.
> 
> With the use of tinfoil, this script can no longer distinguish unique
> references to each variable, so it's no longer showing the count of
> undocumented variables.
> 
> Removed the -m option since this script now searches through all recipes
> in the configuration.
> 
> Fixes [YOCTO #2086]
> 
> Signed-off-by: Amanda Brindle <amanda.r.brindle@intel.com>

Acked-by: Paul Eggleton <paul.eggleton@linux.intel.com>

Thanks,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

