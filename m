Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id EE3817E830
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Aug 2019 02:35:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x772Z5bA013775
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 6 Aug 2019 19:35:06 -0700 (PDT)
Received: from [128.224.162.186] (128.224.162.186) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Tue, 6 Aug 2019 19:35:04 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <1565074499-317606-1-git-send-email-changqing.li@windriver.com>
	<0fb7aa39fdcdc39f8a12149005f9b09d04074778.camel@linuxfoundation.org>
From: Changqing Li <changqing.li@windriver.com>
Message-ID: <36918de5-75f3-b520-2c3d-72c3b9c1ca71@windriver.com>
Date: Wed, 7 Aug 2019 10:35:01 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <0fb7aa39fdcdc39f8a12149005f9b09d04074778.camel@linuxfoundation.org>
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
X-List-Received-Date: Wed, 07 Aug 2019 02:35:07 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 8/6/19 6:47 PM, Richard Purdie wrote:
> On Tue, 2019-08-06 at 14:54 +0800, changqing.li@windriver.com wrote:
>> From: Changqing Li <changqing.li@windriver.com>
>>
>> fix below error:
>> file /usr/lib64/go/src/cmd/cgo/zdefaultcc.go conflicts between
>> attempted installs of go-dev-1.12.6-r0.core2_64 and go-runtime-dev-
>> 1.12.6-r0.core2_64
>> file /usr/lib64/go/src/cmd/go/internal/cfg/zdefaultcc.go conflicts
>> between attempted installs of go-dev-1.12.6-r0.core2_64 and go-
>> runtime-dev-1.12.6-r0.core2_64
>>
>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> ---
>>   meta/recipes-devtools/go/go-runtime_1.12.bb | 6 ++++++
>>   meta/recipes-devtools/go/go_1.12.bb         | 7 +++++++
>>   2 files changed, 13 insertions(+)
> It seems odd that both of these packages should provide this, perhaps
> one version should just be deleted?
>
> Cheers,
>
> Richard

These 2 recipes don't have any DEPEND or RDEPEND relationship, so they 
are independent from the point of recipe.

Make one of dev packages empty seems not proper ?

>
-- 
BRs

Sandy(Li Changqing)


