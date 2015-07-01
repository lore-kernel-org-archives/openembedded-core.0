Return-Path: <dvhart@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 473F7738FB
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Jul 2015 15:42:39 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 01 Jul 2015 08:42:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,386,1432623600"; d="scan'208";a="754112445"
Received: from npeddire-mobl.amr.corp.intel.com (HELO dvhart-mac02.local)
	([10.254.76.50])
	by fmsmga002.fm.intel.com with ESMTP; 01 Jul 2015 08:42:39 -0700
Message-ID: <55940A73.6080706@linux.intel.com>
Date: Wed, 01 Jul 2015 08:42:43 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>, 
	openembedded-core@lists.openembedded.org, 
	richard.purdie@linuxfoundation.org
References: <1435704482-14423-1-git-send-email-sgw@linux.intel.com>
In-Reply-To: <1435704482-14423-1-git-send-email-sgw@linux.intel.com>
Subject: Re: [PATCH] core-image-kernel-dev: Define a correct subset of TEST_SUITES to run for this image
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
X-List-Received-Date: Wed, 01 Jul 2015 15:42:46 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit



On 6/30/15 3:48 PM, Saul Wold wrote:
> Since this is image can be built with both poky and poky-lsb, ensure the correct

s/is//

> tests are run in both cases, the auto detection does not quite work right in the
> poky-lsb case since not all the Posix cmdline utilites are added. Add connman and
> connman test for network sanity
> 
> Signed-off-by: Saul Wold <sgw@linux.intel.com>

Acked-by: Darren Hart <dvhart@linux.intel.com>


-- 
Darren Hart
Intel Open Source Technology Center

