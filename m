Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id EA04D76224
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jul 2015 15:51:08 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 24 Jul 2015 08:51:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,538,1432623600"; d="scan'208";a="769045371"
Received: from skozielx-mobl.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.3.151])
	by fmsmga002.fm.intel.com with ESMTP; 24 Jul 2015 08:51:07 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Christopher Larson <kergoth@gmail.com>
Date: Fri, 24 Jul 2015 16:51:06 +0100
Message-ID: <1742982.dRbRVMY3XW@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.0.8-200.fc21.x86_64; KDE/4.14.9; x86_64; ; )
In-Reply-To: <cover.1437663603.git.chris_larson@mentor.com>
References: <cover.1437663603.git.chris_larson@mentor.com>
MIME-Version: 1.0
Cc: Christopher Larson <chris_larson@mentor.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv3 0/6] recipetool/devtool/oe-selftest: pull from BBPATH
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
X-List-Received-Date: Fri, 24 Jul 2015 15:51:10 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 23 July 2015 12:57:55 Christopher Larson wrote:
> From: Christopher Larson <chris_larson@mentor.com>
> 
> Ensures that recipetool and devtool pull plugins from layers, and
> oe-selftest will pull tests from layers.
> 
> Unrelated to that, also prevents a traceback on parsing failure, and adds
> a tiny feature to appendsrc to facilitate reuse by other sub-commands.
> 
> [v3 Update] Fixed the commit message for `devtool: also load plugins from
> BBPATH` to match the implementation. Split up `recipetool: also load plugins
> from BBPATH` into two commits with clear commit messages.

Looks good, thanks!

Acked-by: Paul Eggleton <paul.eggleton@linux.intel.com>

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

