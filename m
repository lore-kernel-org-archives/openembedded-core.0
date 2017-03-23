Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id A1AC371A54
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Mar 2017 16:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1490286437; x=1521822437;
	h=message-id:subject:from:to:cc:date:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=kikhNucjTk5wLluhf2AthrToVsAoHdeKPCWrJBjzp5k=;
	b=jj8Kdxgcz06uGgOyAYZRYP2MUWZcSL7PqkediIvcDA8dxuJ6sAE9ODjL
	6WLrjEIGJI1mwDa/Eq7SQd/dpyAR3Q==;
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Mar 2017 09:27:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,210,1486454400"; d="scan'208";a="64171812"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.141])
	by orsmga002.jf.intel.com with ESMTP; 23 Mar 2017 09:27:15 -0700
Message-ID: <1490286911.28281.84.camel@linux.intel.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Thu, 23 Mar 2017 10:35:11 -0600
In-Reply-To: <6135390.NMCEsh2eSl@peggleto-mobl.ger.corp.intel.com>
References: <cover.1490188583.git.ed.bartosh@linux.intel.com>
	<20170322205331.6648.75789@do.openembedded.org>
	<6135390.NMCEsh2eSl@peggleto-mobl.ger.corp.intel.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yICMxMDYxODogSW5jcmVhc2Ugb2Utc2VsZnRlc3QgY292ZXJhZ2Ugb2Ygd2ljIGNvZGViYXNlIChmaXJzdCBwYXJ0KQ==?=
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
X-List-Received-Date: Thu, 23 Mar 2017 16:27:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2017-03-23 at 15:57 +1300, Paul Eggleton wrote:
> Hi Leo,
> 
> On Thursday, 23 March 2017 9:53:31 AM NZDT Patchwork wrote:
> > == Series Details ==
> > 
> > Series: #10618: Increase oe-selftest coverage of wic codebase (first part)
> > Revision: 1
> > URL   : https://patchwork.openembedded.org/series/5923/
> > State : failure
> > 
> > == Summary ==
> > 
> > 
> > Thank you for submitting this patch series to OpenEmbedded Core. This is
> > an automated response. Several tests have been executed on the proposed
> > series by patchtest resulting in the following results:
> > 
> > 
> > 
> > * Issue             [pretest_src_uri_checksums_not_changed]
> > 
> > * Issue             No modified recipes, skipping pretest
> > [pretest_src_uri_left_files]
> > 
> > * Issue             No added or modified recipes, skipping pretest
> > [pretest_lic_files_chksum_modified_not_mentioned]
> > 
> > * Issue             [pretest_pylint]
> > 
> > * Issue             [test_max_line_length]
> > 
> > * Issue             [test_cve_presence_in_commit_message]
> > 
> > * Issue             [test_cve_tag_format]
> > 
> > * Issue             [test_shortlog_format]
> > 
> > * Issue             [test_shortlog_length]
> > 
> > * Issue             [test_summary_presence]
> > 
> > * Issue             [test_upstream_status_format]
> > 
> > * Issue             There are no new software patches, no reason to test
> > Upstream-Status presence [test_upstream_status_presence]
> > 
> > * Issue             Until general agreement with the community, disabling it
> > [test_commit_message_presence]
> > 
> > * Issue             [test_mbox_format]
> > 
> > * Issue             [test_series_merge_on_head]
> > 
> > * Issue             [test_src_uri_checksums_not_changed]
> > 
> > * Issue             No modified recipes, skipping pretest
> > [test_src_uri_left_files]
> > 
> > * Issue             [test_bugzilla_entry_format]
> > 
> > * Issue             [test_signed_off_by_presence]
> > 
> > * Issue             There are no new software patches, no reason to test
> > Signed-off-by presence [test_signed_off_by_presence]
> > 
> > * Issue             Series merged, no reason to check other mailing lists
> > [test_target_mailing_list]
> > 
> > * Issue             No modified or added recipes, skipping test
> > [test_lic_files_chksum_modified_not_mentioned]
> > 
> > * Issue             No added recipes, skipping test
> > [test_lic_files_chksum_presence]
> > 
> > * Issue             [test_pylint]
> > 
> > * Issue             [test_author_valid]
> 
> These results look a bit broken - some are skipped and really shouldn't be 
> showing at all. Was the script invoked in a different way to normal?
> 

Yes, it was invoked in a different way so there was not filtering on
failures. From now on, we should be getting emails just with test
failures.

Leo
> Cheers,
> Paul
> 
> -- 
> 
> Paul Eggleton
> Intel Open Source Technology Centre



