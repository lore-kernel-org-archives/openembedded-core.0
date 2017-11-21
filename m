Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 4CFAC787CC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Nov 2017 19:32:35 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Nov 2017 11:32:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,432,1505804400"; d="scan'208";a="1246956874"
Received: from unknown (HELO lsandov1-mobl2.zpn.intel.com) ([10.219.128.134])
	by fmsmga002.fm.intel.com with ESMTP; 21 Nov 2017 11:32:36 -0800
Date: Tue, 21 Nov 2017 13:41:54 -0600
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <20171121134154.70d49a9d@lsandov1-mobl2.zpn.intel.com>
In-Reply-To: <f16bda46-922c-acaa-fceb-52c25a3e0e3f@linux.intel.com>
References: <20171118085357.47305-1-stefan@agner.ch>
	<20171118090301.2783.15393@do.openembedded.org>
	<789b135f8ab78e296dd336ac9a21f68f@agner.ch>
	<f16bda46-922c-acaa-fceb-52c25a3e0e3f@linux.intel.com>
X-Mailer: Claws Mail 3.14.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yICJbdjJdIG9wZW5zc2wxMDogVXBncmFkZSAxLjAuMmwuLi4iIGFuZCAzIG1vcmU=?=
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
X-List-Received-Date: Tue, 21 Nov 2017 19:32:36 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 20 Nov 2017 14:36:16 +0200
Alexander Kanavin <alexander.kanavin@linux.intel.com> wrote:

> On 11/18/2017 11:03 AM, Stefan Agner wrote:
> 
> >> * Patch            [v2,1/4] openssl10: Upgrade 1.0.2l -> 1.0.2m
> >>   Issue             Missing or incorrectly formatted CVE tag in
> >> included patch file [test_cve_tag_format]
> >>    Suggested fix    Correct or include the CVE tag on cve patch with
> >> format: "CVE: CVE-YYYY-XXXX"  
> > 
> > I did not add any new patches which address CVE, hence I think this is a
> > false positive/not applicable.  
> 
> You mentioned CVEs in the commit message, I think it wants you to format 
> them in a standard way there.

Right. Currently test is kind of simple, in the sense that it parse the subject/description for a CVE and if found it, it then looks for the standard tag (CVE: ...). CC Daniela who is working on making this test a bit smarter.


> 
> Alex
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

