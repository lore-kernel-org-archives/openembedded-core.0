Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 45E466AB67
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2013 14:50:39 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rAIEocRd019394
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 18 Nov 2013 06:50:38 -0800 (PST)
Received: from [128.224.162.242] (128.224.162.242) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.347.0;
	Mon, 18 Nov 2013 06:50:38 -0800
Message-ID: <528A2927.7070009@windriver.com>
Date: Mon, 18 Nov 2013 22:50:15 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>
References: <1383312696-421-1-git-send-email-otavio@ossystems.com.br>	<5283F507.7050607@linux.intel.com>	<CAP9ODKotnjmFwd3SqG_=HDpDWXBDkuaJsqUerM_8BnT9mPU0GQ@mail.gmail.com>	<CADkTA4M8GkRVnHr5bW-1=Ff2PSdsYaOo6ROisjZDybnNpom2OA@mail.gmail.com>	<5284F5D1.4010004@linux.intel.com>	<CADkTA4ObDkKgm+_-RG650m2TtugDh4tZ+OHyOateGSUvv9hmhQ@mail.gmail.com>	<CADkTA4MCL8pe8jACx8T9o7S17XvjUiBj5GwSp9nW2snWjpCQxQ@mail.gmail.com>	<CAP9ODKo+dR_FSj4djpGKcbQFWRiWqSK6XApGtjS6NM1r5scJDg@mail.gmail.com>	<528A0755.2060100@windriver.com>
	<CAP9ODKqfdgCe_wpzyzGqgbfvOoT1HrgM_7PoSvuNDBtueBi1tA@mail.gmail.com>
In-Reply-To: <CAP9ODKqfdgCe_wpzyzGqgbfvOoT1HrgM_7PoSvuNDBtueBi1tA@mail.gmail.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>,
	"Wold, Saul" <saul.wold@intel.com>
Subject: Re: [PATCH 1/2] lttng-modules: Update revision to grab last bugfix releases
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
X-List-Received-Date: Mon, 18 Nov 2013 14:50:39 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


On 11/18/2013 10:18 PM, Otavio Salvador wrote:
> On Mon, Nov 18, 2013 at 10:25 AM, Robert Yang <liezhi.yang@windriver.com> wrote:
>>>
>>> This should be considered for Dora as well as it fixes the deadlock
>>> and building with 3.12 kernels.
>>>
>>
>> Hi Otavio, thanks for suggesting this for dora, but dora's kernel is
>> 3.10.11,
>> and this is an update for lttng-modules, I'm not sure whether dora needs
>> this.
>>
>> Add Saul in the CC list.
>
> I think Dora ought to get the new 3.10 kernel updates; this can go
> along side with it.
>

Hi Otavio,

I'm sorry, but I'm not sure whether we need update dora's kernel from 3.10.11
to 3.10.17, since we seldom do the package update for a stable branch,
let's wait for others' comments:-).

// Robert

