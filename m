Return-Path: <dmitry.rozhkov@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 249A9719FA
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Apr 2017 05:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1491457697; x=1522993697;
	h=message-id:subject:from:to:date:in-reply-to:references:
	mime-version:content-transfer-encoding;
	bh=PWvp0lx2rczWbctSZ3lz2LqgYxIK7dord3k8dyK3kfw=;
	b=dgR5PY6iRoiH9WiOElN0eVeDXvf/zYaDLE2gvVHj7vEm2aKFTxbJF0aS
	YlWVo0A0iDdHTAIQPC8s+uQOLs1q+g==;
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Apr 2017 22:48:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,282,1488873600"; d="scan'208";a="85051783"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga005.fm.intel.com with ESMTP; 05 Apr 2017 22:48:15 -0700
Received: from drozhkov-desk.fi.intel.com (drozhkov-desk.fi.intel.com
	[10.237.72.60])
	by linux.intel.com (Postfix) with ESMTP id CA7706A4006
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Apr 2017 22:48:06 -0700 (PDT)
Message-ID: <1491457693.3938.15.camel@linux.intel.com>
From: Dmitry Rozhkov <dmitry.rozhkov@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 06 Apr 2017 08:48:13 +0300
In-Reply-To: <20170406053203.6646.56257@do.openembedded.org>
References: <20170406050744.26573-1-dmitry.rozhkov@linux.intel.com>
	<20170406053203.6646.56257@do.openembedded.org>
X-Mailer: Evolution 3.22.6 (3.22.6-1.fc25) 
Mime-Version: 1.0
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIHB5dGhvbjM6IGZpeCBydW4tdGltZSBkZXBzIGZvciBjb3JlIHB5dGhvbjMgbGlicmFyaWVzIChyZXYyKQ==?=
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
X-List-Received-Date: Thu, 06 Apr 2017 05:48:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2017-04-06 at 05:32 +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: python3: fix run-time deps for core python3 libraries (rev2)
> Revision: 2
> URL   : https://patchwork.openembedded.org/series/6164/
> State : failure
> 
> == Summary ==
> 
> 
> Thank you for submitting this patch series to OpenEmbedded Core. This
> is
> an automated response. Several tests have been executed on the
> proposed
> series by patchtest resulting in the following failures:
> 
> 
> 
> * Issue             Series does not apply on top of target branch
> [test_series_merge_on_head] 
>   Suggested fix    Rebase your series on top of targeted branch
>   Targeted branch  master (currently at 3a1cce6591)

So was my master at 3a1cce6591 when I submitted the patch (and still
is). And I believe the first version had no problems with applying it
too.

BR,
Dmitry

> 
> If you believe any of these test results are incorrect, please reply
> to the
> mailing list (openembedded-core@lists.openembedded.org) raising your
> concerns.
> Otherwise we would appreciate you correcting the issues and
> submitting a new
> version of the patchset if applicable. Please ensure you
> add/increment the
> version number when sending the new version (i.e. [PATCH] -> [PATCH
> v2] ->
> [PATCH v3] -> ...).
> 
> ---
> Test framework: http://git.yoctoproject.org/cgit/cgit.cgi/patchtest
> Test suite:     http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-o
> e
> 

