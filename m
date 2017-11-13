Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 824FE78659
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Nov 2017 12:04:45 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Nov 2017 04:04:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,389,1505804400"; 
   d="scan'208";a="7025505"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 13 Nov 2017 04:04:46 -0800
To: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>,
	openembedded-core@lists.openembedded.org
References: <1510574454-26784-1-git-send-email-oleksandr.kravchuk@pelagicore.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <c47da4ce-1bed-5f09-b1d1-dd91b8767cc1@linux.intel.com>
Date: Mon, 13 Nov 2017 14:04:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <1510574454-26784-1-git-send-email-oleksandr.kravchuk@pelagicore.com>
Subject: Re: [PATCH] curl: upgrade to 7.56.1
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
X-List-Received-Date: Mon, 13 Nov 2017 12:04:46 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/13/2017 02:00 PM, Oleksandr Kravchuk wrote:
> Upgarded curl to version 7.56.1. Removed few patches fixing CVEs, since
> those fixes are included in the this release. Also removed installation
> of 'curl/curlbuild.h', which has been removed in v7.55.0.

In this case you should investigate further, and summarize your findings 
in the commit message. Why did the upstream remove the header? Did they 
replace it with something else? Most importantly, does the replacement 
need processing or patching too?


Alex

