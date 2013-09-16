Return-Path: <dvhart@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id BFD5D60648
	for <Openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2013 17:50:08 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 16 Sep 2013 10:50:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,917,1371106800"; d="scan'208";a="404165794"
Received: from dvhart-mobl4.jf.intel.com (HELO [10.7.201.128]) ([10.7.201.128])
	by orsmga002.jf.intel.com with ESMTP; 16 Sep 2013 10:50:10 -0700
Message-ID: <1379353809.1285.164.camel@dvhart-mobl4.amr.corp.intel.com>
From: Darren Hart <dvhart@linux.intel.com>
To: Jason Wessel <jason.wessel@windriver.com>
Date: Mon, 16 Sep 2013 10:50:09 -0700
In-Reply-To: <1379117343-29877-7-git-send-email-jason.wessel@windriver.com>
References: <1379117343-29877-1-git-send-email-jason.wessel@windriver.com>
	<1379117343-29877-7-git-send-email-jason.wessel@windriver.com>
Organization: Intel
X-Mailer: Evolution 3.8.5 (3.8.5-2.fc19) 
Mime-Version: 1.0
Cc: Openembedded-core@lists.openembedded.org
Subject: Re: [v2 PATCH 6/7] grub-efi.bbclass: Add serial and graphics menu options
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
X-List-Received-Date: Mon, 16 Sep 2013 17:50:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-09-13 at 19:09 -0500, Jason Wessel wrote:
> The syslinux.bbclass already has support for automatically generated
> serial and graphics menu choices.  This patch adds the same concept to
> the grub-efi menu.  That makes it possible to generate a single image
> which can boot on a PCBIOS or EFI firmware with consistent looking
> boot options.
> 
> [YOCTO #4100]
> 
> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>

Ongoing discussion in previous series on the use of GRUB_SERIAL. I think
I'm missing something, but I want to be sure... see V1 thread...

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel



