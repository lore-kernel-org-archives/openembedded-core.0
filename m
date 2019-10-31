Return-Path: <ross.burton@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 01E237F938
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2019 11:28:46 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	31 Oct 2019 04:28:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,250,1569308400"; d="scan'208";a="230829517"
Received: from koernerm-mobl.ger.corp.intel.com (HELO blackadder.local)
	([10.249.41.216])
	by fmsmga002.fm.intel.com with ESMTP; 31 Oct 2019 04:28:46 -0700
To: openembedded-core@lists.openembedded.org
References: <1572517396-312-1-git-send-email-vinay.m.engg@gmail.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <1539fa0e-b638-8c93-598c-4bcf38be91bb@intel.com>
Date: Thu, 31 Oct 2019 11:28:45 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1572517396-312-1-git-send-email-vinay.m.engg@gmail.com>
Subject: Re: [PATCH] gdb: Fix CVE-2019-1010180
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
X-List-Received-Date: Thu, 31 Oct 2019 11:28:47 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 31/10/2019 10:23, Vinay Kumar wrote:
> Backport the upstream fix. that was not present in master.
> 
> Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
> 
> Upstream-Status: Pending

As per patchtest:

- the commit message shoud have your S-o-b
- the patch you're adding (CVE-2019-1010180.patch) should have an 
explanation of the changes, a CVE tag (CVE: CVE-2019-1010180), an 
Upstream-Status tag (you said its a backport, so set it to Backport), 
and your S-o-b.

Note that for sanity its probably best to remove the Changelog chunk 
from the patch, as other backported patches which also touch the 
changelog will conflict.

Ross

