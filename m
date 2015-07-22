Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id A742073CB9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jul 2015 11:02:06 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 22 Jul 2015 04:02:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,523,1432623600"; d="scan'208";a="768952363"
Received: from gwhaley-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.19.55])
	by orsmga002.jf.intel.com with ESMTP; 22 Jul 2015 04:02:05 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Jul 2015 12:02:04 +0100
Message-ID: <2606699.EhWc0CorW2@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.0.7-200.fc21.x86_64; KDE/4.14.9; x86_64; ; )
In-Reply-To: <cover.1437430369.git.chris_larson@mentor.com>
References: <cover.1437430369.git.chris_larson@mentor.com>
MIME-Version: 1.0
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: Re: [PATCHv2 0/6] recipetool/devtool/oe-selftest: pull from BBPATH
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
X-List-Received-Date: Wed, 22 Jul 2015 11:02:12 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 20 July 2015 15:15:38 Christopher Larson wrote:
> From: Christopher Larson <chris_larson@mentor.com>
> 
> Ensures that recipetool and devtool pull plugins from layers, and
> oe-selftest will pull tests from layers.
> 
> Unrelated to that, also prevents a traceback on parsing failure, and adds
> a tiny feature to appendsrc to facilitate reuse by other sub-commands.
> 
> [v2 Update] `devtool: also load plugins from BBPATH` was fixed, so it no
> longer breaks the devtool selftests.
> 
> 
> The following changes since commit b283b82ec59a2137cf717811172765848fa813fa:
> 
>   core-image-lsb-sdk: use kernel-devsrc to ensure kernel module builds work
> (2015-07-20 10:39:02 +0100)
> 
> are available in the git repository at:
> 
>   git@github.com:kergoth/openembedded-core yocto-bug-7625
> 
> for you to fetch changes up to 35a9ce57747248192dc5c0dd7916e15e58a5835e:
> 
>   oe-selftest: add libdirs from BBPATH to sys.path (2015-07-20 15:11:59
> -0700)
> 
> ----------------------------------------------------------------
> Christopher Larson (6):
>       recipetool: catch BBHandledException from parsing
>       recipetool.append: add extralines arg to appendsrc
>       recipetool: also load plugins from BBPATH
>       devtool: also load plugins from BBPATH
>       oe-selftest: obey oeqa.selftest.__path__
>       oe-selftest: add libdirs from BBPATH to sys.path
> 
>  scripts/devtool                  | 57
> +++++++++++++++++++++++++--------------- scripts/lib/devtool/__init__.py  |
>  4 +--
>  scripts/lib/recipetool/append.py |  4 +--
>  scripts/oe-selftest              | 18 +++++++++----
>  scripts/recipetool               | 56
> ++++++++++++++++++++++++--------------- 5 files changed, 88 insertions(+),
> 51 deletions(-)

Overall I'm happy with this set of changes apart from the commit messages for 
the devtool and recipetool plugin loading commits as separately noted. (The 
other changes could conceivably go in ahead).

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

