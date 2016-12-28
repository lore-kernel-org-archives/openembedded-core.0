Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 14CEF60685
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Dec 2016 12:15:44 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 28 Dec 2016 04:15:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,422,1477983600"; d="scan'208";a="916825348"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 28 Dec 2016 04:15:44 -0800
To: zhe.he@windriver.com, openembedded-core@lists.openembedded.org
References: <cover.1482820791.git.zhe.he@windriver.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <1fad67ac-8ae2-e242-9830-e89311f14b12@linux.intel.com>
Date: Wed, 28 Dec 2016 14:15:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <cover.1482820791.git.zhe.he@windriver.com>
Cc: "Purdie, Richard" <richard.purdie@intel.com>
Subject: Re: [PATCH v2 0/1] kexec-tools: Upgrade to 2.0.14
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
X-List-Received-Date: Wed, 28 Dec 2016 12:15:45 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 12/27/2016 08:43 AM, zhe.he@windriver.com wrote:
> From: He Zhe <zhe.he@windriver.com>
>
> Remove kexec-aarch64.patch since it has been merged upstream
> Remove kexec-x32.patch since it has been reverted upstream
> Backport patches for kdump arm64 from:
> https://git.linaro.org/people/takahiro.akashi/kexec-tools.git
>
> v1 to v2: Remove redundant tarball link in SRC_URI

None of my comments are addressed in this new version of the patch. 
Specifically:

 > Remove kexec-aarch64.patch since it has been merged upstream
 > Remove kexec-x32.patch since it has been reverted upstream

You should also remove the actual files, not just drop them from the recipe.

 > Backport patches for kdump arm64 from:
 > https://git.linaro.org/people/takahiro.akashi/kexec-tools.git

If the patches are coming from a different repository, they are not a 
backport. Change the upstream-status to 'pending' please, or 'submitted 
(link)' if they have been submitted upstream.

 >  meta/recipes-kernel/kexec/kexec-tools_2.0.12.bb    |  37 ----
 >  meta/recipes-kernel/kexec/kexec-tools_2.0.14.bb    |  44 +++++

Please use git's rename detection when submitting patches, so we can see 
what is the difference between the two files.


Alex


