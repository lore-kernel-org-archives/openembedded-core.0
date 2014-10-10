Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 5C3DD6FBB9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Oct 2014 17:49:19 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 10 Oct 2014 10:39:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,693,1406617200"; d="scan'208";a="603497908"
Received: from unknown (HELO [10.255.13.70]) ([10.255.13.70])
	by fmsmga001.fm.intel.com with ESMTP; 10 Oct 2014 10:49:20 -0700
Message-ID: <54381C20.2060602@linux.intel.com>
Date: Fri, 10 Oct 2014 10:49:20 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.7.0
MIME-Version: 1.0
To: Peter Urbanec <openembedded-devel@urbanec.net>, 
	openembedded-core@lists.openembedded.org
References: <54380BF4.6010205@urbanec.net>
In-Reply-To: <54380BF4.6010205@urbanec.net>
Subject: Re: [PATCH] Fix for gcc bug 61144
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
X-List-Received-Date: Fri, 10 Oct 2014 17:49:21 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/10/2014 09:40 AM, Peter Urbanec wrote:
> See https://gcc.gnu.org/bugzilla/show_bug.cgi?id=61144 for details.
>
> This patch is taken from the gcc repository and should be obsoleted by a
> gcc release after 4.9.1
>
> The problem is severe enough (at least from my point of view) to need
> this patch until the next gcc release is available.
>
>
>
>

Hi Peter

Thank you for the patches.

Both the patch and the 0056-top-level-reorder_gcc-bug-61144.patch patch 
file need to have Signed-off-by tags and the gcc patch itself needs an 
Upstream-Status: Backport tag so we know it was a backport.

Please review the 
http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines

I also note the second patch you sent does not have a Signed-off-by in 
the commit message or the .patch files (which also needs an 
Upstream-Status tag).

Can you please send a V2 updates commit for both of these.

Thanks
    Sau!



