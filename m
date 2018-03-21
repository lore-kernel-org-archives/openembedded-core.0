Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 9E0AB783E4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2018 14:38:19 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Mar 2018 07:38:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,340,1517904000"; d="scan'208";a="44071000"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 21 Mar 2018 07:38:19 -0700
To: Philip Balister <philip@balister.org>,
	"Burton, Ross" <ross.burton@intel.com>
References: <CY4PR11MB17663B664B1ED6ADE96BC48AC7D40@CY4PR11MB1766.namprd11.prod.outlook.com>
	<dd055b01-fe83-d706-bce1-5a2aea3103fe@gmail.com>
	<CAJTo0LbxDGNrJH8tDiCgMKoSHUsK8Q17BUH=UVkY8zDBAm70+g@mail.gmail.com>
	<833712e4-00aa-1e05-8df5-a0f9a18d4e29@linux.intel.com>
	<CAJTo0LadpoW1BCCbfhsEac7PBV2qNxuiWrnRk6MZeV2DVWiDEA@mail.gmail.com>
	<61d1ecb9-e4a6-8d26-9bcc-76c7c42abb7f@linux.intel.com>
	<b65227e0-d37f-6ae6-9f4c-4c535460143e@balister.org>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <ccc3ea2f-f22a-930a-8912-489963dae8f4@linux.intel.com>
Date: Wed, 21 Mar 2018 16:31:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <b65227e0-d37f-6ae6-9f4c-4c535460143e@balister.org>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: =?UTF-8?B?UmU6IFt5b2N0b10gWW9jdG8gUHJvamVjdCBTdGF0dXMgV1cxMuKAmTE4?=
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
X-List-Received-Date: Wed, 21 Mar 2018 14:38:19 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 03/21/2018 04:24 PM, Philip Balister wrote:
>>>      Which brings me to a question: what is a good schedule and cadence
>>>      for AUH runs? Currently it's run on the 15th of every odd-numbered
>>>      month (so January, March, and so on), but I thought of shifting it
>>>      one month forward, so it doesn't land right in the middle of a
>>>      feature freeze. Thoughts?
>>>
>>>
>>> How long does a single run take, and why not run it every month?
>>
>> Just a bit longer than a day, maybe 30 hours, if it needs to update the
>> typical amount of 100-150 packages. I'll shift it to monthly then.
> 
> Maybe bi-weekly? Could that help reduce the number of upgrades needed
> for each run?

Only if the maintainers take those reminders as high priority items, and 
actually send out the patches quickly, and then those patches make it to 
master. All that needs to happen within those two weeks. Otherwise, the 
AUH will just re-run the same set.

Alex

