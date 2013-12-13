Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 85E7360FD3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Dec 2013 16:51:53 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 13 Dec 2013 08:48:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,480,1384329600"; d="scan'208";a="424305460"
Received: from junemccl-mobl.ger.corp.intel.com (HELO helios.localnet)
	([10.252.122.17])
	by orsmga001.jf.intel.com with ESMTP; 13 Dec 2013 08:51:52 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Qi.Chen@windriver.com
Date: Fri, 13 Dec 2013 16:51:51 +0000
Message-ID: <2024453.Je7eP6C3oy@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-34-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <cover.1386903269.git.Qi.Chen@windriver.com>
References: <cover.1386903269.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/2] Change the way of handling CONFFILES
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
X-List-Received-Date: Fri, 13 Dec 2013 16:51:53 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Qi,

On Friday 13 December 2013 11:09:01 Qi.Chen@windriver.com wrote:
> It's a very common situation in OE/Yocto that the recipe authors/maintainers
> either forget to set the CONFFILES variable or set it wrong.
> 
> For example, we don't have CONFFILES set in the shadow recipe. As a result,
> /etc/login.defs from the shadow package is not treated as a config file.
> Another example is the base-files recipe. We set the CONFFILES variable, but
> it's not a complete list. Basically, all files under /etc should be treated
> as config files for this recipe.
> 
> Such mistakes are not easy to find, because when we add or upgrade a recipe,
> we usually only test whether it functions well, we don't take into
> consideration the on-target upgrade process.
> 
> So we need to improve the situation here.
> 
> This patchset consists of two patches. The first one is the main patch which
> changes the way CONFFILES is handled in our project. The second one serves
> as an example how to fix individual recipes.
> 
> As almost all files under /etc should be considerred as config files, we
> don't need to modify a lot of recipes after the first patch. Take shadow as
> an example. We don't need to modify that recipe after this change. The ones
> that need to be paid attention to are those that set CONFFILES in their
> recipes. The second patch serves as an exmple how to fix this.

This definitely sounds like a good idea, but do we need to give special 
consideration to /etc/init.d/ since files under there aren't really 
configuration files?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

