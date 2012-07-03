Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Sm7Bv-0002Mq-2Y
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jul 2012 19:47:11 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 03 Jul 2012 10:36:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="188050191"
Received: from unknown (HELO [10.255.12.182]) ([10.255.12.182])
	by fmsmga002.fm.intel.com with ESMTP; 03 Jul 2012 10:36:08 -0700
Message-ID: <4FF32D86.7000401@linux.intel.com>
Date: Tue, 03 Jul 2012 10:36:06 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1341262598.git.mark.hatle@windriver.com>
In-Reply-To: <cover.1341262598.git.mark.hatle@windriver.com>
Subject: Re: [PATCH 0/2 v2] SDK related misc changes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 03 Jul 2012 17:47:11 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/02/2012 01:58 PM, Mark Hatle wrote:
> Commit contents are the same, patch 1/2's commit message was rewritten to
> avoid confusion.
>
> ----
>
> Two minor changes related to SDK generations.  One is a bug fix, the other
> allows for better control over the per-file dependency generation.
>
> The following changes since commit 64422f7c5da160050a5454817c8fa9d070104b34:
>
>    package.bbclass: Add missing PKGR, PKGV, PKGE and ALTERNATIVE variables from PACKAGEVARS (2012-07-02 16:44:57 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib mhatle/misc
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=mhatle/misc
>
> Mark Hatle (2):
>    libc-common: Allow -dbg package to append, and not just set package
>      variables
>    package.bbclass: Allow a package to skip per file dependency
>      generation
>
>   meta/classes/libc-common.bbclass |    6 +++---
>   meta/classes/package.bbclass     |    3 +++
>   2 files changed, 6 insertions(+), 3 deletions(-)
>

Merged into OE-Core

Thanks
	Sau!


