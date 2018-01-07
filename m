Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 78FAB7016E
	for <openembedded-core@lists.openembedded.org>;
	Sun,  7 Jan 2018 17:17:02 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	07 Jan 2018 09:17:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,326,1511856000"; 
   d="scan'208";a="8813044"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga008.jf.intel.com with ESMTP; 07 Jan 2018 09:17:03 -0800
To: Marek Vasut <marex@denx.de>, openembedded-core@lists.openembedded.org
References: <20180107161920.30937-1-marex@denx.de>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <3cdba2e1-94df-32fd-0138-a6fa533ec165@linux.intel.com>
Date: Sun, 7 Jan 2018 19:17:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20180107161920.30937-1-marex@denx.de>
Subject: Re: [PATCH 1/2] xenomai: Add xenomai recipe
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
X-List-Received-Date: Sun, 07 Jan 2018 17:17:03 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 01/07/2018 06:19 PM, Marek Vasut wrote:
> Add recipe for the xenomai. This recipe is used twice, once to build
> the xenomai userspace components and again to patch the kernel with
> the cobalt core. Therefore, the xenomai sources are installed into
> work-shared rather then work to make them accessible to the kernel
> recipe, which triggers the patching.

What is xenomai? What is a 'cobalt core'? What do they do and who would 
want to use them? Please do explain that in the commit message.

> +SUMMARY = "Xenomai 3 userspace libraries"
> +DESCRIPTION = "Xenomai 3 userspace libraries"

... and here - description cannot be the same as the summary.

Alex

