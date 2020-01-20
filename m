Return-Path: <paul.eggleton@linux.intel.com>
X-Greylist: delayed 427 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 20 Jan 2020 01:36:24 UTC
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 861C07F8A9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 01:36:24 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Jan 2020 17:29:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,340,1574150400"; d="scan'208";a="249809317"
Received: from chyeap-mobl.gar.corp.intel.com (HELO shodan.localnet)
	([10.255.180.50])
	by fmsmga004.fm.intel.com with ESMTP; 19 Jan 2020 17:29:16 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Yu, Mingli" <mingli.yu@windriver.com>
Date: Mon, 20 Jan 2020 14:29:14 +1300
Message-ID: <2583767.pvHsQr8YWX@shodan>
Organization: Intel Corporation
In-Reply-To: <5E23EC1D.2080407@windriver.com>
References: <1579405812-336202-1-git-send-email-mingli.yu@windriver.com>
	<20200119053240.2276.68036@do> <5E23EC1D.2080407@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIE9wZW4gZmlsZSB3aXRoIE9fQ0xPRVhFQyB0byBhdm9pZCBmZCBsZWFrIChyZXYzKQ==?=
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
X-List-Received-Date: Mon, 20 Jan 2020 01:36:24 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Mingli

On Sunday, 19 January 2020 6:41:49 PM NZDT Yu, Mingli wrote:
> On 01/19/20 13:32, Patchwork wrote:
> > == Series Details ==
> >
> > Series: Open file with O_CLOEXEC to avoid fd leak (rev3)
> > Revision: 3
> > URL   : https://patchwork.openembedded.org/series/22123/
> > State : failure
> >
> > == Summary ==
> >
> >
> > Thank you for submitting this patch series to OpenEmbedded Core. This is
> > an automated response. Several tests have been executed on the proposed
> > series by patchtest resulting in the following failures:
> >
> >
> >
> > * Issue             Series does not apply on top of target branch [test_series_merge_on_head]
> >    Suggested fix    Rebase your series on top of targeted branch
> >    Targeted branch  master (currently at 9d7a521971)
> 
> Have already rebased on the master branch of 
> http://git.yoctoproject.org/cgit/cgit.cgi/pseudo/, why still issue out 
> the above issue? Any hint?

It's assuming that patches sent to this list are for OE-Core (which they
generally are). I wasn't aware but apparently the documented place to
send pseudo patches is this list, so I think in this case you can just ignore
patchtest.

Cheers,
Paul

-- 

Paul Eggleton
Intel System Software Products



