Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 33A107391A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2016 12:21:27 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 21 Dec 2016 04:21:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,383,1477983600"; d="scan'208";a="1074806956"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 21 Dec 2016 04:21:27 -0800
To: openembedded-core@lists.openembedded.org
References: <1482314183-15786-1-git-send-email-zhe.he@windriver.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <55a581fd-5a9b-0b97-cd2e-630798e44ab8@linux.intel.com>
Date: Wed, 21 Dec 2016 14:21:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <1482314183-15786-1-git-send-email-zhe.he@windriver.com>
Subject: Re: [PATCH] kexec-tools: Update to 2.0.14
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
X-List-Received-Date: Wed, 21 Dec 2016 12:21:28 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 12/21/2016 11:56 AM, zhe.he@windriver.com wrote:
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

