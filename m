Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 05E2E6093F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Oct 2016 11:32:49 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga104.jf.intel.com with ESMTP; 24 Oct 2016 04:32:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,541,1473145200"; d="scan'208";a="1058241985"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 24 Oct 2016 04:32:50 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <03b5e98b-0724-daa2-8f78-ab4624f52752@linux.intel.com>
	<80B25E1D-5083-4751-BD09-DEB6DBE7FA7F@gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <3eea5778-d0db-3fed-f78a-9a4f67c7cf38@linux.intel.com>
Date: Mon, 24 Oct 2016 14:30:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <80B25E1D-5083-4751-BD09-DEB6DBE7FA7F@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] Attention all: patches for upstream source will be applied with stricter criteria for context
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
X-List-Received-Date: Mon, 24 Oct 2016 11:32:50 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 10/21/2016 08:05 PM, Khem Raj wrote:
>> while updating gnutls to a newer version I came across a rather serious issue: the way we patch source code is very lenient about the context for the lines to be changed. Basically, it's enough for one line before and after the changed line to match, because patch command's default setting for 'fuzz factor' allows it. If these lines happen to be whitespace or braces, then there's nothing to prevent the patch from being applied incorrectly.
>>
>> Here's a particularly nasty example of this happening completely silently (compile step works fine too), with security implications:
>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=10450
>>
>> I think this absolutely needs to be fixed. The downside is that this will break a lot of patches across all layers - after setting the fuzz to zero in oe-core we have 87 recipes that fail to be patched. Maxin and I are currently going through them one by one and getting them fixed.
>
> perhaps a list of the recipes, with steps to configure fuzz factor on wiki would enable other folks to
> fix them especially the recipe maintainers should care.

The bug has the instructions for that. If folks want to help out, that's 
the place to start.

Alex


