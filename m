Return-Path: <maxin.john@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 56436788B1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2018 09:42:31 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Mar 2018 02:42:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,334,1517904000"; d="scan'208";a="25468163"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.84])
	by fmsmga007.fm.intel.com with ESMTP; 20 Mar 2018 02:42:07 -0700
Date: Tue, 20 Mar 2018 11:45:48 +0200
From: "Maxin B. John" <maxin.john@intel.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <20180320094547.GA4716@mbabyjoh-desk.ger.corp.intel.com>
References: <1521467995-3521-1-git-send-email-maxin.john@intel.com>
	<b6026187-5b09-a4b7-a39f-4930dfbc62ef@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <b6026187-5b09-a4b7-a39f-4930dfbc62ef@linux.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libsolv: refresh the patches
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
X-List-Received-Date: Tue, 20 Mar 2018 09:42:32 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Alex,

On Mon, Mar 19, 2018 at 04:30:44PM +0200, Alexander Kanavin wrote:
> On 03/19/2018 03:59 PM, Maxin B. John wrote:
> >diff --git a/meta/recipes-extended/libsolv/libsolv/0002-Fixes-to-internal-fopencookie-implementation.patch b/meta/recipes-extended/libsolv/libsolv/0002-Fixes-to-internal-fopencookie-implementation.patch
> >index efb4e3a..93b8cc9 100644
> >--- a/meta/recipes-extended/libsolv/libsolv/0002-Fixes-to-internal-fopencookie-implementation.patch
> >+++ b/meta/recipes-extended/libsolv/libsolv/0002-Fixes-to-internal-fopencookie-implementation.patch
> >@@ -1,4 +1,4 @@
> >-From 99b10cdf6a0f8a24e1670c1813b1d9563ae3f5b5 Mon Sep 17 00:00:00 2001
> >+From 84e12bf7ece49073c559dfd58005132a6099a964 Mon Sep 17 00:00:00 2001
> >  From: =?UTF-8?q?Neal=20Gompa=20=28=E3=83=8B=E3=83=BC=E3=83=AB=E3=83=BB?=
> >   =?UTF-8?q?=E3=82=B3=E3=82=99=E3=83=B3=E3=83=8F=E3=82=9A=29?=
> >   <ngompa13@gmail.com>
> >@@ -11,6 +11,7 @@ the tests all pass.
> >  Upstream-Status: Denied [https://github.com/openSUSE/libsolv/pull/112]
> >  Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> >+
> >  ---
> >   ext/solv_xfopen_fallback_fopencookie.c | 19 ++++++++++---------
> >   ext/solv_xfopen_fallback_fopencookie.h | 10 +++++-----
> >@@ -100,5 +101,5 @@ index 6a7bfee..7223e3f 100644
> >   #ifndef SOLV_XFOPEN_FALLBACK_FOPENCOOKIE_H
> >  --
> >-2.11.0
> >+2.4.0
> 
> This patch doesn't need to be updated, and so you can discard it from the
> commit. Unfortunately devtool can't really be instructed to refresh only
> specific patches.

Thanks for catching it. Will update and send the v2 soon. 

> Alex

Warm Regards,
Maxin

