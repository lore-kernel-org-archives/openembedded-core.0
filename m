Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id DA545763F8
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Aug 2015 09:11:26 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 06 Aug 2015 02:11:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,622,1432623600"; d="scan'208";a="763133041"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.143])
	([10.237.68.143])
	by fmsmga001.fm.intel.com with ESMTP; 06 Aug 2015 02:11:25 -0700
Message-ID: <55C32503.3050800@linux.intel.com>
Date: Thu, 06 Aug 2015 12:12:35 +0300
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1438851969-4340-1-git-send-email-amarnath.valluri@intel.com>
In-Reply-To: <1438851969-4340-1-git-send-email-amarnath.valluri@intel.com>
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
X-List-Received-Date: Thu, 06 Aug 2015 09:11:28 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 08/06/2015 12:06 PM, Amarnath Valluri wrote:
> Added new patch that fixes the memory leak that was introduced in
> mkdosfs-dir.patch.

You should update the original patch then, not pile additional patches 
on top. The least painful way is:

1) unpack the sources (manually from tarball, or using bitbake -c unpack)
2) 'git init; git add *; git commit' to create an git repository from 
the sources
3) apply the patch that needs fixing, then do the fix
4) make a git commit, then produce a patch using git format-patch, then 
move the new patch back to the recipe directory and update the recipe
5) build the recipe to make sure it still builds
6) make a git commit with the recipe update, and submit it here :)

Alex


