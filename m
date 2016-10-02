Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 7D6D8606D0
	for <openembedded-core@lists.openembedded.org>;
	Sun,  2 Oct 2016 22:46:38 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga105.fm.intel.com with ESMTP; 02 Oct 2016 15:46:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,434,1473145200"; d="scan'208";a="1048658960"
Received: from thiyagax-mobl2.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.185.151])
	by fmsmga001.fm.intel.com with ESMTP; 02 Oct 2016 15:46:38 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Stephano Cetola <stephano.cetola@linux.intel.com>
Date: Mon, 03 Oct 2016 11:46:35 +1300
Message-ID: <5126012.X5IYrXadHm@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.7.5-100.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
In-Reply-To: <20161002221731.4681-1-stephano.cetola@linux.intel.com>
References: <20161002221731.4681-1-stephano.cetola@linux.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] sanity: add function to check for git config user
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
X-List-Received-Date: Sun, 02 Oct 2016 22:46:39 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Stephano,

On Sun, 02 Oct 2016 15:17:31 Stephano Cetola wrote:
> If attempting to patch a git repo without a proper git config setup,
> an error will occur saying user.name/user.email are needed by git
> am/apply. After 0f698dfd1c8bbc0d53ae7977e26685a7a3df52a3, it was
> simple enough to reproduce this error by creating a kernel patch and
> using a container to build.
> 
> This patch abstracts out functionality that existed in buildhistory
> for use in other classes. It also adds a call to this functionality
> to the kernel-yocto class.

For the logic implemented by patch.bbclass, we already fixed this by forcing a 
dummy value for the commit name and email (since it's not actually the user 
doing the commit, it's the build system). If we're adding this to cover 
similar automated scenarios where the user isn't the one making the commit, 
then I think we should be fixing those to do the same instead.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

