Return-Path: <stephano.cetola@linux.intel.com>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by mail.openembedded.org (Postfix) with ESMTP id D0CF174702
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Apr 2018 22:19:37 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Apr 2018 15:19:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,397,1517904000"; d="scan'208";a="30506424"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga008.jf.intel.com with ESMTP; 02 Apr 2018 15:19:38 -0700
Received: from kvwoan-mobl2.amr.corp.intel.com (unknown [10.254.105.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id 56B1F5801C0;
	Mon,  2 Apr 2018 15:19:38 -0700 (PDT)
To: Richard Purdie <richard.purdie@intel.com>,
	Ross Burton <ross.burton@intel.com>
References: <cover.1521142023.git.amanda.r.brindle@intel.com>
From: Stephano Cetola <stephano.cetola@linux.intel.com>
Message-ID: <ba2651db-435b-2c35-61a9-3c1bc08e826f@linux.intel.com>
Date: Mon, 2 Apr 2018 15:19:37 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:52.0)
	Gecko/20100101 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <cover.1521142023.git.amanda.r.brindle@intel.com>
Cc: Amanda Brindle <amanda.r.brindle@intel.com>, stephano.cetola@intel.com,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/1] buildhistory_analysis.py: Check if RPROVIDES changed order
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
X-List-Received-Date: Mon, 02 Apr 2018 22:19:37 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 3/15/18 2:04 PM, Amanda Brindle wrote:
> The following changes since commit 0fd6d0dd0041929d60111868ca3575d9d9bf9ac3:
> 
>   linux-yocto/4.12: backport bugfixes for x86 (2018-03-15 06:27:20 -0700)
> 
> are available in the git repository at:
> 
>   git://git.yoctoproject.org/poky-contrib abrindle/buildhistory-diff4
>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=abrindle/buildhistory-diff4
> 
> Amanda Brindle (1):
>   buildhistory_analysis.py: Check if RPROVIDES changed order
> 
>  meta/lib/oe/buildhistory_analysis.py | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
Ack'd.

Sorry I lost track of this. Any chance this can make M4?

--S

