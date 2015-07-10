Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9C2666017E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jul 2015 09:38:22 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP; 10 Jul 2015 02:38:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,446,1432623600"; d="scan'208";a="603608044"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.143])
	([10.237.68.143])
	by orsmga003.jf.intel.com with ESMTP; 10 Jul 2015 02:38:21 -0700
Message-ID: <559F92B3.8040407@linux.intel.com>
Date: Fri, 10 Jul 2015 12:38:59 +0300
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1433765628-15931-1-git-send-email-Martin.Jansa@gmail.com>
	<20150701132300.GI2409@jama>
In-Reply-To: <20150701132300.GI2409@jama>
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
X-List-Received-Date: Fri, 10 Jul 2015 09:38:24 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 07/01/2015 04:23 PM, Martin Jansa wrote:
> On Mon, Jun 08, 2015 at 02:13:48PM +0200, Martin Jansa wrote:
>> * 4.3 release has nasty hard to reproduce bug in LZO compression
>>    which in few cases results in one of these 2 errors:
 >> ....
>>    the official repo is:
>>    https://git.kernel.org/cgit/fs/squashfs/squashfs-tools.git
>>    but author's github is kept in sync so we can use just that
>
> Ping

The author doesn't provide version tags in either of his repositories, 
which make upstream version check impossible.

When a new version with this fix is released we should revert back to 
tarballs. If the patch didn't already appear in poky, I would suggest 
you cherry-pick those fixes instead.


Alex


