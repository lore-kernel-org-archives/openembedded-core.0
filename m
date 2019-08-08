Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id ECA767F33A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2019 05:36:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x785adQl000032
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 7 Aug 2019 22:36:40 -0700 (PDT)
Received: from [128.224.162.186] (128.224.162.186) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Wed, 7 Aug 2019 22:36:39 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>, <matt@madison.systems>
References: <1565074499-317606-1-git-send-email-changqing.li@windriver.com>
	<0fb7aa39fdcdc39f8a12149005f9b09d04074778.camel@linuxfoundation.org>
	<36918de5-75f3-b520-2c3d-72c3b9c1ca71@windriver.com>
	<8c974f0c0f5d98ae66c7add9646c1c840ead7951.camel@linuxfoundation.org>
From: Changqing Li <changqing.li@windriver.com>
Message-ID: <ce3c8502-3abc-bb58-0972-513ad85ac2c3@windriver.com>
Date: Thu, 8 Aug 2019 13:36:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <8c974f0c0f5d98ae66c7add9646c1c840ead7951.camel@linuxfoundation.org>
X-Originating-IP: [128.224.162.186]
Subject: Re: [PATCH] go/go-runtime: use update-alternative for zdefaultcc.go
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
X-List-Received-Date: Thu, 08 Aug 2019 05:36:40 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 8/7/19 10:16 PM, Richard Purdie wrote:
> On Wed, 2019-08-07 at 10:35 +0800, Changqing Li wrote:
>> On 8/6/19 6:47 PM, Richard Purdie wrote:
>>> On Tue, 2019-08-06 at 14:54 +0800, changqing.li@windriver.com
>>> wrote:
>>>> From: Changqing Li <changqing.li@windriver.com>
>>>>
>>>> fix below error:
>>>> file /usr/lib64/go/src/cmd/cgo/zdefaultcc.go conflicts between
>>>> attempted installs of go-dev-1.12.6-r0.core2_64 and go-runtime-
>>>> dev-
>>>> 1.12.6-r0.core2_64
>>>> file /usr/lib64/go/src/cmd/go/internal/cfg/zdefaultcc.go
>>>> conflicts
>>>> between attempted installs of go-dev-1.12.6-r0.core2_64 and go-
>>>> runtime-dev-1.12.6-r0.core2_64
>>>>
>>>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>>>> ---
>>>>    meta/recipes-devtools/go/go-runtime_1.12.bb | 6 ++++++
>>>>    meta/recipes-devtools/go/go_1.12.bb         | 7 +++++++
>>>>    2 files changed, 13 insertions(+)
>>> It seems odd that both of these packages should provide this,
>>> perhaps
>>> one version should just be deleted?
>>>
>>> Cheers,
>>>
>>> Richard
>> These 2 recipes don't have any DEPEND or RDEPEND relationship, so
>> they
>> are independent from the point of recipe.
>>
>> Make one of dev packages empty seems not proper ?
> Let me put this another way. What is the difference between these two
> binaries? When should you use one, when should you use the other? Or
> are they the same thing?
>
> Cheers,
>
> Richard

go is for building go compiler,  and go-runtime only contains go 
standard  runtime library

There are 2 use caes:

1.  on target, user only install go-runtime to provide libstd.so for 
other go apps.

2.  on target, user install both go and go-runtime

in my opinion,  only in case2,  install dev pkg is meaningful, so maybe 
we can remove the conflict

part of files from go-runtime.


@Matt,  you have do lots of work related these recipes, could you also 
give your opinion? Thanks.

>
>
>
-- 
BRs

Sandy(Li Changqing)


