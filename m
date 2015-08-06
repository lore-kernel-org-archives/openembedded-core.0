Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 1855875BC6
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Aug 2015 09:25:29 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 06 Aug 2015 02:25:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,622,1432623600"; d="scan'208";a="763140000"
Received: from ekalugin-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.17.192])
	by fmsmga001.fm.intel.com with ESMTP; 06 Aug 2015 02:25:28 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	Amarnath Valluri <amarnath.valluri@intel.com>
Date: Thu, 06 Aug 2015 10:25:27 +0100
Message-ID: <13325469.N9zhAzKaIU@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.0.8-200.fc21.x86_64; KDE/4.14.9; x86_64; ; )
In-Reply-To: <55C32503.3050800@linux.intel.com>
References: <1438851969-4340-1-git-send-email-amarnath.valluri@intel.com>
	<55C32503.3050800@linux.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] dosfstools-2.11: Fix memory leak in mkdosfs
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
X-List-Received-Date: Thu, 06 Aug 2015 09:25:30 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 06 August 2015 12:12:35 Alexander Kanavin wrote:
> On 08/06/2015 12:06 PM, Amarnath Valluri wrote:
> > Added new patch that fixes the memory leak that was introduced in
> > mkdosfs-dir.patch.
> 
> You should update the original patch then, not pile additional patches
> on top. The least painful way is:
> 
> 1) unpack the sources (manually from tarball, or using bitbake -c unpack)
> 2) 'git init; git add *; git commit' to create an git repository from
> the sources
> 3) apply the patch that needs fixing, then do the fix
> 4) make a git commit, then produce a patch using git format-patch, then
> move the new patch back to the recipe directory and update the recipe
> 5) build the recipe to make sure it still builds
> 6) make a git commit with the recipe update, and submit it here :)

On the contrary - the much less painful way (as of fido) is to use devtool:

1) Extract source and set the build system up to use it: 
   devtool modify dosfstools -x ~/projects/dosfstools

2) Make whatever changes you want to in the git tree that has been set up in 
the specified path

3) Build the recipe (as you would normally) to make sure it still builds

4) Write the modified/added commits as patches back to the recipe:
    devtool update-recipe dosfstools

5) Make a git commit with the recipe update, and submit it here :)

I'd really like people to start using devtool for this kind of thing. If it's 
not working for some reason please do let me know.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

