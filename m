Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 4330C77BE4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jul 2017 14:40:00 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Jul 2017 07:40:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,354,1496127600"; d="scan'208";a="126286338"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.119])
	by fmsmga005.fm.intel.com with ESMTP; 13 Jul 2017 07:40:01 -0700
Message-ID: <1499957384.5349.67.camel@linux.intel.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: "Ng, Wei Tee" <wei.tee.ng@intel.com>
Date: Thu, 13 Jul 2017 09:49:44 -0500
In-Reply-To: <CBAEED2EB06BF94889E80B47A33FE329EDA5E3@PGSMSX105.gar.corp.intel.com>
References: <cover.1499890236.git.wei.tee.ng@intel.com>
	<20170713063118.2380.58054@do.openembedded.org>
	<CBAEED2EB06BF94889E80B47A33FE329EDA5E3@PGSMSX105.gar.corp.intel.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIGluaXRyYW1mcy1mcmFtZXdvcms6IGluY2x1ZGUgaW5zdGFsbCBtb2R1bGUgaW4gcmVjaXBlIGZvciBpbnN0YWxsYXRpb24=?=
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
X-List-Received-Date: Thu, 13 Jul 2017 14:40:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2017-07-13 at 06:36 +0000, Ng, Wei Tee wrote:
> The reason for this patchtest failure is because of this patch have a dependency on another patch which is:
> 	initramfs-framework: module to support boot live image
> Here you go for the link of this patch: http://lists.openembedded.org/pipermail/openembedded-core/2017-July/139570.html 
> 

Any reason for not having that missing patch in this series? patchtest
just tries to patch in latest master without taking into account any
pending patch pending on the ML.

Leo


> Regards,
> Wei Tee
> 
> -----Original Message-----
> From: Patchwork [mailto:patchwork@patchwork.openembedded.org] 
> Sent: Thursday, July 13, 2017 2:31 PM
> To: Ng, Wei Tee <wei.tee.ng@intel.com>
> Cc: openembedded-core@lists.openembedded.org
> Subject: ✗ patchtest: failure for initramfs-framework: include install module in recipe for installation
> 
> == Series Details ==
> 
> Series: initramfs-framework: include install module in recipe for installation
> Revision: 1
> URL   : https://patchwork.openembedded.org/series/7726/
> State : failure
> 
> == Summary ==
> 
> 
> Thank you for submitting this patch series to OpenEmbedded Core. This is an automated response. Several tests have been executed on the proposed series by patchtest resulting in the following failures:
> 
> 
> 
> * Issue             Series does not apply on top of target branch [test_series_merge_on_head] 
>   Suggested fix    Rebase your series on top of targeted branch
>   Targeted branch  master (currently at b1c4661742)
> 
> 
> 
> If you believe any of these test results are incorrect, please reply to the mailing list (openembedded-core@lists.openembedded.org) raising your concerns.
> Otherwise we would appreciate you correcting the issues and submitting a new version of the patchset if applicable. Please ensure you add/increment the version number when sending the new version (i.e. [PATCH] -> [PATCH v2] -> [PATCH v3] -> ...).
> 
> ---
> Test framework: http://git.yoctoproject.org/cgit/cgit.cgi/patchtest
> Test suite:     http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe
> 



