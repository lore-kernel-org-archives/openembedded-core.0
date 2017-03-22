Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2262C77B3E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Mar 2017 13:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1490189322; x=1521725322;
	h=subject:to:references:from:message-id:date:mime-version:
	in-reply-to:content-transfer-encoding;
	bh=w9Xxd3fn75FHFYPJVn+bTqDZ+ym/MgORqE0NyqsVjjU=;
	b=EUioAyNsVN2nVXcwCbFU7m3hlZlJFhmNRlIluyuAoWlXBDpRdsvlHUt1
	OVJF0XWxJRqUAw90t2YIxZjx5zfs5w==;
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Mar 2017 06:28:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,205,1486454400"; d="scan'208";a="239130301"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 22 Mar 2017 06:28:41 -0700
To: openembedded-core@lists.openembedded.org
References: <alpine.LFD.2.20.1703220907350.17218@uk63952.mitel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <e0ef94e0-661f-8578-cbe2-467b507d3cce@linux.intel.com>
Date: Wed, 22 Mar 2017 15:27:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.6.0
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.20.1703220907350.17218@uk63952.mitel.com>
Subject: Re: another design question -- proper (meaningful) content of recipe patches?
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
X-List-Received-Date: Wed, 22 Mar 2017 13:28:41 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 03/22/2017 03:22 PM, Robert P. J. Day wrote:
>   in any event, i can appreciate the value of sometimes adding
> numbering to patches to enforce a processing order, but when one has a
> numbered series of patches getting up to 20 or 25, that strikes me as
> time to collapse all that into larger and more modular and more
> meaningful patches.
>
>   thoughts?

Why are the patches not in the upstream git repo or tarball release? If 
the upstream is refusing to take it, then someone needs to fork a repo, 
and place all those patches there, and drop them from the recipe.

Otherwise it will be a tremendous maintenance headache each time that 
patch series needs to be rebased to a new upstream release. But whoever 
wrote the recipe that way basically asked for it, no pity for them :)

Alex


