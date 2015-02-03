Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id DDCEE605F1
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Feb 2015 21:33:34 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 03 Feb 2015 13:27:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,515,1418112000"; d="scan'208";a="680425470"
Received: from lzavalam-mobl.amr.corp.intel.com (HELO
	swold-mobl5.amr.corp.intel.com) ([10.252.252.168])
	by orsmga002.jf.intel.com with ESMTP; 03 Feb 2015 13:33:34 -0800
Message-ID: <54D13EAD.3030603@linux.intel.com>
Date: Tue, 03 Feb 2015 13:33:33 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: Christopher Larson <clarson@kergoth.com>
References: <cover.1422988163.git.sgw@linux.intel.com>
	<f305b44fc206694e8f0b1bde4ccb8481489bca15.1422988163.git.sgw@linux.intel.com>
	<CABcZANnJCQjLO5Y1XKctOoBcdHQypbxPwbabK8sBH0XWv_Vxwg@mail.gmail.com>
In-Reply-To: <CABcZANnJCQjLO5Y1XKctOoBcdHQypbxPwbabK8sBH0XWv_Vxwg@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/6] core-image: split debug-tweaks into individual features
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
X-List-Received-Date: Tue, 03 Feb 2015 21:33:39 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/03/2015 12:26 PM, Christopher Larson wrote:
> On Tue, Feb 3, 2015 at 11:34 AM, Saul Wold <sgw@linux.intel.com> wrote:
>
>>   IMAGE_POSTPROCESS_COMMAND ?= ""
>> +MACHINE_POSTPROCESS_COMMAND ?= ""
>> +
>>
>
> Was this intended? It's not mentioned in the message.
>
Definitely unintended, not even sure where it came from.

Fixed in my oe-contrib branch

Sau!


