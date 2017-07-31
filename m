Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id CE3B662134
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Jul 2017 13:41:28 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	31 Jul 2017 06:41:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,442,1496127600"; d="scan'208";a="999141140"
Received: from msanabr1-mobl1.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.51.199])
	by orsmga003.jf.intel.com with ESMTP; 31 Jul 2017 06:41:29 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Mon, 31 Jul 2017 15:41:28 +0200
Message-ID: <10079809.XLRr4MJIOn@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
In-Reply-To: <cover.1501494496.git.liezhi.yang@windriver.com>
References: <cover.1501494496.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/10] Revive ptest and add result to buildhistory
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
X-List-Received-Date: Mon, 31 Jul 2017 13:41:29 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday, 31 July 2017 11:50:00 AM CEST Robert Yang wrote:
> We can get the regression result by:
> $ git show HEAD ptest_log/pass.fail.skip.*
> 
> Can we add ptest to default TEST_SUITES, please ?

Is it possible to get an idea of the time impact if we did so?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

