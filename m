Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id D3B7977E1E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 May 2017 14:19:54 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 May 2017 07:19:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,354,1491289200"; d="scan'208";a="1170362637"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 17 May 2017 07:19:54 -0700
To: Patrick Ohly <patrick.ohly@intel.com>
References: <cover.eea09064b94ca036ef2177896c19070d316ee965.1495007905.git-series.patrick.ohly@intel.com>
	<8810a4bbb1c67b438a7320df810db02099fcb5a0.1495007905.git-series.patrick.ohly@intel.com>
	<6d634eb4-a0e6-7f56-0d6e-b1324eece035@linux.intel.com>
	<1495018023.28624.38.camel@intel.com>
	<b06241d4-97c2-a272-7d38-95091bdb66e7@linux.intel.com>
	<1495028379.28624.46.camel@intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <c17220fa-b0a0-32bb-9cce-271ddd81da6e@linux.intel.com>
Date: Wed, 17 May 2017 17:17:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1495028379.28624.46.camel@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 1/1] image-mode.bbclass: common infrastructure for choosing image defaults
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
X-List-Received-Date: Wed, 17 May 2017 14:19:56 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/17/2017 04:39 PM, Patrick Ohly wrote:
> [...]
>
> Now add one more mode and you end up with six instead of two image
> recipes. That's what I consider not scalable.

Wait a moment. The contents of recipe files is short, regular and can be 
easily produced (or re-produced) by a script from the two lists of 
products and modes. You never even need to look at them, let alone edit 
them. The total amount of these recipe files is products*modes - there 
is no combinatorial explosion. What does not scale here?

Alex


