Return-Path: <Zhe.He@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 26D0C7BFB6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 02:56:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x0U2uJZQ013639
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 29 Jan 2019 18:56:20 -0800 (PST)
Received: from [128.224.162.180] (128.224.162.180) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.435.0;
	Tue, 29 Jan 2019 18:56:19 -0800
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <20190115024758.29054-1-zhe.he@windriver.com>
	<dc8e1f400fb4d66b30a84a1268ad7b60b342eec1.camel@linuxfoundation.org>
From: He Zhe <zhe.he@windriver.com>
Message-ID: <e7ebb386-2909-30ce-afa9-33fc19dd0e09@windriver.com>
Date: Wed, 30 Jan 2019 10:56:16 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <dc8e1f400fb4d66b30a84a1268ad7b60b342eec1.camel@linuxfoundation.org>
X-Originating-IP: [128.224.162.180]
Subject: Re: [PATCH v2] ltp: Remove admin_tools test
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
X-List-Received-Date: Wed, 30 Jan 2019 02:56:22 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 1/28/19 10:09 PM, Richard Purdie wrote:
> On Mon, 2019-01-14 at 18:47 -0800, He Zhe wrote:
>> admin_tools test group has been removed from upstream. Backport to
>> fix the
>> following failures.
>>
>> at_deny01 1 TFAIL : ltpapicmd.c:188: At denyed user to execute test
>> job
>> at_allow01 1 TFAIL : ltpapicmd.c:188: At did not allow user to
>> execute job
>>
>> Signed-off-by: He Zhe <zhe.he@windriver.com>
>> ---
>> v2: Add missing SOB and upstream status.
> Rather than add the huge patch could we upgrade please?
>
> I believe Petr sent a patch but it had some issues so perhaps you could
> help fix those?

OK. I'll go check what I can help.

Zhe

>
> Cheers,
>
> Richard
>
>


