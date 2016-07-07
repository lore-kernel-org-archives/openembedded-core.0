Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3AB6A6013D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jul 2016 02:21:02 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 06 Jul 2016 19:21:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,322,1464678000"; d="scan'208";a="990453120"
Received: from lynhueyo-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.176.219])
	by orsmga001.jf.intel.com with ESMTP; 06 Jul 2016 19:20:59 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Thu, 07 Jul 2016 14:20:57 +1200
Message-ID: <1587491.zLnaHlMPYp@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.5.7-202.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
In-Reply-To: <CAMKF1srwZapMVvohESS8L8+CT0YCQmtVUbH32X_KvLwRZnokpQ@mail.gmail.com>
References: <cover.1467849364.git.paul.eggleton@linux.intel.com>
	<2740868.VrTjpvQuVY@peggleto-mobl.ger.corp.intel.com>
	<CAMKF1srwZapMVvohESS8L8+CT0YCQmtVUbH32X_KvLwRZnokpQ@mail.gmail.com>
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/6] scripts/contrib/devtool-stress: exclude more recipes by default
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
X-List-Received-Date: Thu, 07 Jul 2016 02:21:05 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wed, 06 Jul 2016 18:54:37 Khem Raj wrote:
> On Wed, Jul 6, 2016 at 6:39 PM, Paul Eggleton
> <paul.eggleton@linux.intel.com> wrote:
> > devtool itself already understands not to try to deal with these recipes -
> > it will print out a reasonable error for the user. The exception list is
> > just for the devtool-stress script so that it produces clean output.
> 
> OK understood the case, I was just thinking of cases where recipes are
> external and for some reason dont yet work with devtool, may be can be
> blacklisted in recipes
> instead of having a central list.

Let's break this down a bit:

devtool itself looks at various things to determine whether the recipe can be 
used with "devtool modify" - the implementation is in 
_check_compatible_recipe() in scripts/lib/devtool/standard.py. I don't think 
it would make sense to break this up.

The devtool-stress.py script is just for testing. I'm not even sure if anyone 
else but me actually runs it. To go and put things in a bunch of recipes 
solely for the purpose of this script seems a bit excessive.

Thinking about it, I guess we could have devtool modify return a particular 
exit code for incompatible recipes and have the stress script consider those 
"skipped" rather than "failed". That to me would be a better alternative.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

