Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id E4B2972F4D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Apr 2017 22:46:59 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga105.jf.intel.com with ESMTP; 04 Apr 2017 15:46:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,276,1486454400"; d="scan'208";a="1151075907"
Received: from afzalahm-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.140.221])
	by fmsmga002.fm.intel.com with ESMTP; 04 Apr 2017 15:46:56 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@intel.com>
Date: Wed, 05 Apr 2017 10:46:52 +1200
Message-ID: <1604678.KSh5FdkEZr@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
In-Reply-To: <20170404170205.6649.78705@do.openembedded.org>
References: <1491322446-18058-1-git-send-email-ross.burton@intel.com>
	<20170404170205.6649.78705@do.openembedded.org>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIHNhbml0eTogZXhwbGFpbiB3aGVyZSBUTVBESVIgaXMgaWYgd2UncmUgdGVsbGluZyB0aGUgdXNlciB0byBkZWxldGUgaXQgKHJldjIp?=
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
X-List-Received-Date: Tue, 04 Apr 2017 22:47:00 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday, 5 April 2017 5:02:05 AM NZST Patchwork wrote:
> * Issue             Patch line too long (current length 214)
> [test_max_line_length] Suggested fix    Shorten the corresponding patch
> line (max length supported 180) Patch           
> meta/classes/sanity.bbclass
>   Line             +            status.addresult("The layout of TMPDIR
> changed for Recipe Specific  ...

I'm not sure we need to be checking for this. If our code strictly adhered to 
a maximum line length already then maybe, but the vast majority of it doesn't 
at the moment.

Cheers,
Paul


-- 

Paul Eggleton
Intel Open Source Technology Centre

