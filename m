Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id B575B77D52
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Jun 2017 16:01:16 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga105.jf.intel.com with ESMTP; 06 Jun 2017 09:01:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,306,1493708400"; d="scan'208";a="96206191"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.119])
	by orsmga002.jf.intel.com with ESMTP; 06 Jun 2017 09:01:14 -0700
Message-ID: <1496765400.26945.129.camel@linux.intel.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 06 Jun 2017 11:10:00 -0500
In-Reply-To: <CAJTo0Lb0M3QLAd-iJY-j2GKXqSLTEetRbq3qQr_SWa379tKJdw@mail.gmail.com>
References: <1496761395-4499-1-git-send-email-ross.burton@intel.com>
	<821c29ed-09a2-8cb9-e0bf-26977f67dcca@linux.intel.com>
	<CAJTo0Lb0M3QLAd-iJY-j2GKXqSLTEetRbq3qQr_SWa379tKJdw@mail.gmail.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] archiver: preserve sysroot paths in configured mode
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
X-List-Received-Date: Tue, 06 Jun 2017 16:01:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2017-06-06 at 16:58 +0100, Burton, Ross wrote:
> 
> On 6 June 2017 at 16:42, Mikko Ylinen <mikko.ylinen@linux.intel.com>
> wrote:
>         This patch is not enough because the problem is in
>         do_unpack_and_patch which
>         is shared by most archiver modes. This patch fails, e.g., with
>         "original + diff"
>         
>         https://patchwork.openembedded.org/series/7068/
>         
> 
> Yes, I have yours in my branch too.  There's many ways that the
> archiver can fail right now, clearly we need to exercise it a bit more
> in selftest.
> 
Right, and this bug tracks the progress

https://bugzilla.yoctoproject.org/show_bug.cgi?id=11422

> 
> Ross
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



