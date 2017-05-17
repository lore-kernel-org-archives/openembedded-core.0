Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 344CD71D9D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 May 2017 09:52:02 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga104.jf.intel.com with ESMTP; 17 May 2017 02:51:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,353,1491289200"; d="scan'208";a="88322016"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga004.jf.intel.com with ESMTP; 17 May 2017 02:51:56 -0700
To: Patrick Ohly <patrick.ohly@intel.com>,
	openembedded-core@lists.openembedded.org
References: <cover.eea09064b94ca036ef2177896c19070d316ee965.1495007905.git-series.patrick.ohly@intel.com>
	<8810a4bbb1c67b438a7320df810db02099fcb5a0.1495007905.git-series.patrick.ohly@intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <6d634eb4-a0e6-7f56-0d6e-b1324eece035@linux.intel.com>
Date: Wed, 17 May 2017 12:49:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <8810a4bbb1c67b438a7320df810db02099fcb5a0.1495007905.git-series.patrick.ohly@intel.com>
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
X-List-Received-Date: Wed, 17 May 2017 09:52:09 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 05/17/2017 10:58 AM, Patrick Ohly wrote:
> A distro might want to offer developers different, pre-defined ways of
> building an image, for example a "development" mode with easy (but
> insecure) login methods and a "production" mode with hardened
> settings.

Apologies Patrick, I still think this brings more complication than 
benefits. And it's not even showcased anywhere in poky: you add the 
variable, but don't take it into use anywhere. Which means it also won't 
get tested.

You can do this thing by creating separate image recipes, each with 
their hand picked IMAGE_FEATURES. And that includes showing appropriate 
motd as well - but that perhaps would not be necessary because the image 
mode would be encoded in its file name.


Alex

