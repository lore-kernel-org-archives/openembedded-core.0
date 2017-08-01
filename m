Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8A6B078416
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Aug 2017 02:04:20 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v7124JXC001137
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 31 Jul 2017 19:04:19 -0700 (PDT)
Received: from [128.224.162.246] (128.224.162.246) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 31 Jul 2017 19:04:18 -0700
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <cover.1501494496.git.liezhi.yang@windriver.com>
	<34ee7b412201716e3c01083c9bc44e4ce8190b39.1501494496.git.liezhi.yang@windriver.com>
	<1643563.0UUDIuiVgE@peggleto-mobl.ger.corp.intel.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <9ab8c2fb-ebaf-053c-5879-0497300886ff@windriver.com>
Date: Tue, 1 Aug 2017 10:03:46 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1643563.0UUDIuiVgE@peggleto-mobl.ger.corp.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 02/10] runtime/cases/_ptest.py: revive it
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
X-List-Received-Date: Tue, 01 Aug 2017 02:04:20 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 07/31/2017 09:38 PM, Paul Eggleton wrote:
> On Monday, 31 July 2017 11:50:02 AM CEST Robert Yang wrote:
>> * Will write a tool to make regression check
>
> This commit doesn't do this and it's not completely covered by the rest of the
> series. I think you could say perhaps more appropriately "This provides data
> that could be used to detect regressions in ptest results" or similar assuming
> you need to mention it at all.

Sorry, I will update it, it was written when I didn't plan to use buildhistory,
now I save the data into buildhistory, so the tool is not needed any more.

// Robert

>
> Cheers,
> Paul
>

