Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 7DA4978234
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Aug 2017 10:52:28 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 Aug 2017 03:52:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,444,1498546800"; d="scan'208";a="145756500"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga006.fm.intel.com with ESMTP; 29 Aug 2017 03:52:29 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <20170829095532.7446-1-alexander.kanavin@linux.intel.com>
	<1504002777.32591.325.camel@linuxfoundation.org>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <f73e1f08-4698-adba-0696-b0bb5f61a525@linux.intel.com>
Date: Tue, 29 Aug 2017 13:49:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1504002777.32591.325.camel@linuxfoundation.org>
Subject: Re: [PATCH] gettext.bbclass: do not add virtual/gettext to DEPENDS
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
X-List-Received-Date: Tue, 29 Aug 2017 10:52:28 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 08/29/2017 01:32 PM, Richard Purdie wrote:
> 
>> diff --git a/meta/classes/insane.bbclass
>> b/meta/classes/insane.bbclass
>> index b7177c9b329..a2ec466775f 100644
>> --- a/meta/classes/insane.bbclass
>> +++ b/meta/classes/insane.bbclass
>> @@ -1183,9 +1183,9 @@ Rerun configure task after fixing this.""")
>>           elif bb.data.inherits_class('cross-canadian', d):
>>               gt = "nativesdk-gettext"
>>           else:
>> -            gt = "virtual/" + ml + "gettext"
>> +            gt = None
> 
> Should this be gettext-native?

Yes; then this can be also merged with the first branch of the if-else 
statement:

         if bb.data.inherits_class('native', d) or 
bb.data.inherits_class('cross', d) or bb.data.inherits_class('crosssdk', 
d) or bb.data.inherits_class('nativesdk', d):
             gt = "gettext-native"


I'll resend the patch.

Alex

