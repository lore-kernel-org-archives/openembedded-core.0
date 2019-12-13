Return-Path: <ross.burton@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 1E2C17F836
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Dec 2019 17:32:38 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Dec 2019 09:32:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,309,1571727600"; d="scan'208";a="216498358"
Received: from roenschv-mobl1.ger.corp.intel.com (HELO blackadder.local)
	([10.252.50.17])
	by orsmga006.jf.intel.com with ESMTP; 13 Dec 2019 09:32:38 -0800
To: Hongxu Jia <hongxu.jia@windriver.com>
References: <1576218538-14217-1-git-send-email-hongxu.jia@windriver.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <98f8bc6a-6745-060d-82be-a3f999026915@intel.com>
Date: Fri, 13 Dec 2019 17:32:37 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <1576218538-14217-1-git-send-email-hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] assimp: fix search library failed on multilib
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
X-List-Received-Date: Fri, 13 Dec 2019 17:32:39 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 13/12/2019 06:28, Hongxu Jia wrote:
> +Use ASSIMP_LIB_INSTALL_DIR rather than hardcoded /lib to search library
> +
> +Upstream-Status: Inappropriate [oe specific]

That's not inappropriate, it's a proper fix.  Please push it upstream.

Ross

