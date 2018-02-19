Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 3584A6067D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Feb 2018 09:33:57 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Feb 2018 01:33:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,534,1511856000"; d="scan'208";a="202163718"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga005.jf.intel.com with ESMTP; 19 Feb 2018 01:33:57 -0800
To: Seebs <seebs@seebs.net>
References: <20180216095628.15414-1-alexander.kanavin@linux.intel.com>
	<CA+chaQeEdY8tjp4PMsMCfZNoi2NwGqZoOcOqme9Ju-Ext6FkaQ@mail.gmail.com>
	<20180216115147.2869fdf2@seebsdell>
	<CA+chaQf=OMV60V7S=C6zaJ3sd_FwQkiojKY5EqAb6gTxXAQmXw@mail.gmail.com>
	<20180216132531.3a1c2398@seebsdell>
	<60cc88e3-577e-de47-e5da-b3cf93c74a2c@linux.intel.com>
	<CA+chaQdGobLWVzZ_YSpdWozrF3ZrYzBNAVusUMFgGFbAX+w90w@mail.gmail.com>
	<CA+chaQeNhb=nPaYz3XZdh_ceQopFKJvEq5Ximu83PykTjoHJWA@mail.gmail.com>
	<bb8be581-a074-b05b-86c6-71e1ee19fdfa@linux.intel.com>
	<20180217141701.229759cf@seebsdell>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <bb1b003e-9bd3-f438-8ae1-637500d970b5@linux.intel.com>
Date: Mon, 19 Feb 2018 11:27:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180217141701.229759cf@seebsdell>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] pseudo: update to latest master
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
X-List-Received-Date: Mon, 19 Feb 2018 09:33:58 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 02/17/2018 10:17 PM, Seebs wrote:
>> For me, with epoll enabled:
>>
>> b6a015a works
>> 23f089f and 26e30fa both lock up
> 
> Huh. It's possible that the initial "don't try to close fd 0" was
> correct, and the real problem is that the attempt is getting made
> mistakenly. I'll study that more; the epoll code was a contribution and
> I may not have fully understood it.

To be honest, it would have been better to apply my epoll patch as it 
is, and then do additional modifications as separate commits. That would 
make it simpler to isolate the issue. We've used my epoll patch for many 
months without problems on the autobuilder and elsewhere.

Alex

