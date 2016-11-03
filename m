Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id DF75A71A2D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Nov 2016 16:37:30 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 03 Nov 2016 09:37:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,587,1473145200"; d="scan'208";a="897365619"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 03 Nov 2016 09:37:30 -0700
To: Christopher Larson <clarson@kergoth.com>
References: <6511599a-ddb1-77b0-f42e-69afeaa60cae@linux.intel.com>
	<CABcZANnYeGT9VVFBH3cNGUKnE_jPw8CDGv2YC_10-w5pe=WmKQ@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <86a0da96-542d-685b-cdd3-588df6fe7024@linux.intel.com>
Date: Thu, 3 Nov 2016 18:35:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <CABcZANnYeGT9VVFBH3cNGUKnE_jPw8CDGv2YC_10-w5pe=WmKQ@mail.gmail.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: using devtool for rebasing patches
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
X-List-Received-Date: Thu, 03 Nov 2016 16:37:31 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/03/2016 06:29 PM, Christopher Larson wrote:
> git already provides such a UI, afaik devtool just needs to use git-am
> to apply the patches, ideally passing -3 to it, and let the user use git
> am to resolve and continue applying patches.

I don't think git am has any UI that helps with rebasing the rejects, 
and -3 is often not useful here, as we don't have the commit history, if 
the source is coming from tarball.

What you need to do here is to use git am --reject, which would 
partially apply the patch, then find all the *.rej files and let the 
user manually edit them in, then complete the patch application with git 
am --continue.


Alex


