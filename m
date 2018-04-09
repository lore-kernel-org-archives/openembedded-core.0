Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id 6446772EBA
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Apr 2018 06:21:18 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Apr 2018 23:21:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,426,1517904000"; d="scan'208";a="41802717"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 08 Apr 2018 23:21:18 -0700
To: "Maxin B. John" <maxin.john@intel.com>, Richard Purdie <rpurdie@rpsys.net>
References: <1522855946-8702-1-git-send-email-maxin.john@intel.com>
	<1522855946-8702-4-git-send-email-maxin.john@intel.com>
	<1523027136.2942.9.camel@rpsys.net>
	<20180406151409.GA4329@mbabyjoh-desk.ger.corp.intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <da0ba542-6c60-d7f8-5bb1-7dd9e645aeb7@linux.intel.com>
Date: Mon, 9 Apr 2018 09:14:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180406151409.GA4329@mbabyjoh-desk.ger.corp.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 04/10] at-spi2-atk: upgrade to version 2.26.2
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
X-List-Received-Date: Mon, 09 Apr 2018 06:21:18 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 04/06/2018 06:14 PM, Maxin B. John wrote:
>>> 1. convert to meson build
>>> 2. inherit gnomebase and associated cleanup
>>> 3. add libxml2 to DEPENDS list
>>>
>>> Signed-off-by: Maxin B. John <maxin.john@intel.com>
>>
>> This and atk seem to fail in gir on x32:
>>
>> https://autobuilder.yocto.io/builders/nightly-x32/builds/916/steps/BuildImages/logs/stdio
>>
> Will fix it and send the v2.

We disable gobject introspection on x32 (as there is no qemu support). 
For autotools it works automatically (because the class can rely on a 
common configure switch to enable/disable g-i), but here you need to add 
a tweak similar to the one added to json-glib recipe when it was 
converted to meson.

Alex

