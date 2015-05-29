Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CF7CA755FA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 May 2015 01:31:47 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t4T1VlQh023450
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 28 May 2015 18:31:47 -0700 (PDT)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 28 May 2015 18:31:47 -0700
Message-ID: <5567C181.8010001@windriver.com>
Date: Fri, 29 May 2015 09:31:45 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <cover.1432805258.git.liezhi.yang@windriver.com>
	<c2fa9a1b232082e573a4b5e4bb622af5bfe05b62.1432805258.git.liezhi.yang@windriver.com>
	<20150528100324.GE2383@jama>
In-Reply-To: <20150528100324.GE2383@jama>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 9/9] lttng-ust: 2.6.0 -> 2.6.1
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
X-List-Received-Date: Fri, 29 May 2015 01:31:48 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 05/28/2015 06:03 PM, Martin Jansa wrote:
> On Thu, May 28, 2015 at 02:57:27AM -0700, Robert Yang wrote:
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>   .../{lttng-ust_2.6.0.bb => lttng-ust_2.6.1.bb}     |    0
>>   1 file changed, 0 insertions(+), 0 deletions(-)
>>   rename meta/recipes-kernel/lttng/{lttng-ust_2.6.0.bb => lttng-ust_2.6.1.bb} (100%)
>>
>> diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.6.0.bb b/meta/recipes-kernel/lttng/lttng-ust_2.6.1.bb
>> similarity index 100%
>> rename from meta/recipes-kernel/lttng/lttng-ust_2.6.0.bb
>> rename to meta/recipes-kernel/lttng/lttng-ust_2.6.1.bb
>
> No change in SRCREV? This looks like no-op rename. Please test your
> changes.
>

Sorry, changed SRCREV from 5748584c5ae8ca5c4da26f41b6c61bb816e6d50b to
369ee1a1b12338e5158d24f9c879f5dd52f1aba2, and updated in the repo:

   git://git.openembedded.org/openembedded-core-contrib rbt/PU

// Robert

