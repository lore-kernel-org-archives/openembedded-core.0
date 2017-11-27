Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 7CF256069C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Nov 2017 15:23:35 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Nov 2017 07:23:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,465,1505804400"; d="scan'208";a="12489377"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.134])
	by orsmga002.jf.intel.com with ESMTP; 27 Nov 2017 07:23:36 -0800
Date: Mon, 27 Nov 2017 09:33:05 -0600
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: Patchwork <patchwork@patchwork.openembedded.org>
Message-ID: <20171127093305.0429ecb5@lsandov1-mobl2.zpn.intel.com>
In-Reply-To: <20171127130305.2785.80912@do.openembedded.org>
References: <1511787260-2490-1-git-send-email-liu.ming50@gmail.com>
	<20171127130305.2785.80912@do.openembedded.org>
X-Mailer: Claws Mail 3.14.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Ming Liu <liu.ming50@gmail.com>, openembedded-core@lists.openembedded.org
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIGxpbnV4LXlvY3RvOiBkcm9wIEtDT05GX0JTUF9BVURJVF9MRVZFTA==?=
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
X-List-Received-Date: Mon, 27 Nov 2017 15:23:36 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 27 Nov 2017 13:03:05 -0000
Patchwork <patchwork@patchwork.openembedded.org> wrote:

> == Series Details ==
> 
> Series: linux-yocto: drop KCONF_BSP_AUDIT_LEVEL
> Revision: 1
> URL   : https://patchwork.openembedded.org/series/9957/
> State : failure
> 
> == Summary ==
> 
> 
> Thank you for submitting this patch series to OpenEmbedded Core. This is
> an automated response. Several tests have been executed on the proposed
> series by patchtest resulting in the following failures:
> 
> 
> 
> * Patch            linux-yocto: drop KCONF_BSP_AUDIT_LEVEL
>  Issue             Yocto Project bugzilla tag is not correctly formatted [test_bugzilla_entry_format] 
>   Suggested fix    Specify bugzilla ID in commit description with format: "[YOCTO #<bugzilla ID>]"

Ignore the above. This test is trying to identify a bad formatted bugzilla tag, but the current regex is too open that match the [ kernel-yocto: ... ] line.


> 
> 
> 
> If you believe any of these test results are incorrect, please reply to the
> mailing list (openembedded-core@lists.openembedded.org) raising your concerns.
> Otherwise we would appreciate you correcting the issues and submitting a new
> version of the patchset if applicable. Please ensure you add/increment the
> version number when sending the new version (i.e. [PATCH] -> [PATCH v2] ->
> [PATCH v3] -> ...).
> 
> ---
> Guidelines:     https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
> Test framework: http://git.yoctoproject.org/cgit/cgit.cgi/patchtest
> Test suite:     http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

