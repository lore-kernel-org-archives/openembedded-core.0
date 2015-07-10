Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9B9C56017E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jul 2015 11:30:50 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 10 Jul 2015 04:30:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,446,1432623600"; d="scan'208";a="759764498"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.143])
	([10.237.68.143])
	by fmsmga002.fm.intel.com with ESMTP; 10 Jul 2015 04:30:50 -0700
Message-ID: <559FAD0F.4040201@linux.intel.com>
Date: Fri, 10 Jul 2015 14:31:27 +0300
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <1433765628-15931-1-git-send-email-Martin.Jansa@gmail.com>
	<20150701132300.GI2409@jama> <559F92B3.8040407@linux.intel.com>
	<20150710110622.GC2397@jama>
In-Reply-To: <20150710110622.GC2397@jama>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] squashfs-tools: upgrade to newer revision from git
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
X-List-Received-Date: Fri, 10 Jul 2015 11:30:55 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 07/10/2015 02:06 PM, Martin Jansa wrote:

>> When a new version with this fix is released we should revert back to
>> tarballs. If the patch didn't already appear in poky, I would suggest
>> you cherry-pick those fixes instead.
>
> He said that there won't be any new release in near future if ever.

That's ok too, upstream version check should let us know whenever he 
pushes new commits to git repo. It's rather odd that such a critical fix 
is only available from git though.

Alex


