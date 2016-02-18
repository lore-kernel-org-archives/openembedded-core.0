Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 4A37260112
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Feb 2016 09:15:08 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 18 Feb 2016 01:15:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,464,1449561600"; d="scan'208";a="654895759"
Received: from jlock-mobl1.gar.corp.intel.com ([10.252.17.186])
	by FMSMGA003.fm.intel.com with ESMTP; 18 Feb 2016 01:15:09 -0800
Message-ID: <1455786906.3642.0.camel@linux.intel.com>
From: Joshua G Lock <joshua.g.lock@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Feb 2016 09:15:06 +0000
In-Reply-To: <1455734924-8832-1-git-send-email-akuster808@gmail.com>
References: <1455734924-8832-1-git-send-email-akuster808@gmail.com>
X-Mailer: Evolution 3.18.4 (3.18.4-1.fc23) 
Mime-Version: 1.0
Subject: Re: [jethro][PATCH] glibc CVE-2015-7547
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
X-List-Received-Date: Thu, 18 Feb 2016 09:15:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2016-02-17 at 10:48 -0800, Armin Kuster wrote:
> This is being submitted to comply to Yocto compatability.
> 
> Master is affected but waiting for 2.23 to be merged before sending
> patches.

I plan to backport this to fido as soon as it's on a branch I can
cherry-pick from.

Regards,

Joshua

> 
> Armin Kuster (1):
>   glibc: Security fix CVE-2015-7547
> 
>  meta/recipes-core/glibc/glibc/CVE-2015-7547.patch | 643
> ++++++++++++++++++++++
>  meta/recipes-core/glibc/glibc_2.22.bb             |   1 +
>  2 files changed, 644 insertions(+)
>  create mode 100644 meta/recipes-core/glibc/glibc/CVE-2015-7547.patch
> 
> -- 
> 2.3.5
> 

