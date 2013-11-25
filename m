Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id D67AD6DBFA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2013 14:18:39 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 25 Nov 2013 06:18:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,768,1378882800"; d="scan'208";a="439358124"
Received: from akagikob-mobl.ger.corp.intel.com (HELO helios.localnet)
	([10.252.121.166])
	by fmsmga002.fm.intel.com with ESMTP; 25 Nov 2013 06:18:20 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Stefan Stanacar <stefanx.stanacar@intel.com>
Date: Mon, 25 Nov 2013 14:18:19 +0000
Message-ID: <2366974.tmk6USV2ij@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-31-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <0eb35797e7734f1cb3cff73d726ef2dd3d98ed5f.1384874570.git.stefanx.stanacar@intel.com>
References: <cover.1384874570.git.stefanx.stanacar@intel.com>
	<0eb35797e7734f1cb3cff73d726ef2dd3d98ed5f.1384874570.git.stefanx.stanacar@intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC PATCH 2/4] meta-selftest: create a new test layer to be used by oe-selftest script
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
X-List-Received-Date: Mon, 25 Nov 2013 14:18:40 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Stefan,

On Tuesday 19 November 2013 17:43:35 Stefan Stanacar wrote:
> +++ b/meta-selftest/recipes-test/aspell/aspell_0.0.0.1.bb
> @@ -0,0 +1,28 @@
> +# This recipe is a copy from the oe-core one.
> +# It has a lower and invalid version number in order not to be accidentally
> used by bitbake. 
> +# It is used for tests that require duplicate recipe files.

FYI the term we use for this is "overlayed" rather than "duplicate" (where the 
two or more recipes exist in the same configuration).

Cheers,
Paul


-- 

Paul Eggleton
Intel Open Source Technology Centre

