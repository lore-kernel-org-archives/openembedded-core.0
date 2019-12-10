Return-Path: <ross.burton@intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id 34CBD7CD42
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Dec 2019 10:58:50 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Dec 2019 02:58:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,299,1571727600"; d="scan'208";a="207244281"
Received: from pozo-mobl.ger.corp.intel.com (HELO blackadder.local)
	([10.252.33.212])
	by orsmga008.jf.intel.com with ESMTP; 10 Dec 2019 02:58:49 -0800
To: Hongxu Jia <hongxu.jia@windriver.com>,
	oe-core <openembedded-core@lists.openembedded.org>
References: <20191210030833.122689-1-hongxu.jia@windriver.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <1c18bf98-17c2-dde6-bf9a-263742a2e465@intel.com>
Date: Tue, 10 Dec 2019 10:58:47 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191210030833.122689-1-hongxu.jia@windriver.com>
Subject: Re: [PATCH] libpam: drop yylex to static force
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
X-List-Received-Date: Tue, 10 Dec 2019 10:58:50 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

> +diff --git a/modules/pam_console/sed-static b/modules/pam_console/sed-static
> +index b9a6fa2..c7a850e 100644
> +--- a/modules/pam_console/sed-static
> ++++ b/modules/pam_console/sed-static

do_patch fails with:

can't find file to patch at input line 40

I guess your WRL layers are patching pam-console in?

Ross

