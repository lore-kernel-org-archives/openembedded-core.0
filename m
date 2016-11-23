Return-Path: <Yuanjie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 829F5719C7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 03:22:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uAN3MMhX015281
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 22 Nov 2016 19:22:22 -0800 (PST)
Received: from [128.224.162.192] (128.224.162.192) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 22 Nov 2016 19:22:21 -0800
To: Khem Raj <raj.khem@gmail.com>
References: <20161123020049.22482-1-Yuanjie.Huang@windriver.com>
	<7CEAD313-1930-44C6-92A5-29E922A3485A@gmail.com>
From: Yuanjie Huang <yuanjie.huang@windriver.com>
Message-ID: <0bb2fa3a-66ee-4fd7-100c-e990dd507a1d@windriver.com>
Date: Wed, 23 Nov 2016 11:22:20 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <7CEAD313-1930-44C6-92A5-29E922A3485A@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] gdb-cross: depends on flex-native and bison-native
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
X-List-Received-Date: Wed, 23 Nov 2016 03:22:21 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Raj,

We observed gdb/ada-lex.l is processed by flex while gdb/c-exp.y, 
gdb/f-exp.y, gdb/go-exp.y and many others are handled by bison. 
Basically, all language-specific codes in gdb are generated.

Best,
Yuanjie

On 11/23/2016 11:05 AM, Khem Raj wrote:
>> On Nov 22, 2016, at 6:00 PM, Yuanjie Huang <Yuanjie.Huang@windriver.com> wrote:
>>
>> From: Yuanjie Huang <yuanjie.huang@windriver.com>
>>
>> Some source code of gdb is generated with flex or bison. Make both
>> dependencies, to avoid compilation failure on host without them.
>
> can you find out which parts those are ? what is it trying to do to need flex/yacc
>> Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>
>> ---
>> meta/recipes-devtools/gdb/gdb-cross.inc | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-devtools/gdb/gdb-cross.inc b/meta/recipes-devtools/gdb/gdb-cross.inc
>> index 5fa7c33..a34223e 100644
>> --- a/meta/recipes-devtools/gdb/gdb-cross.inc
>> +++ b/meta/recipes-devtools/gdb/gdb-cross.inc
>> @@ -1,6 +1,6 @@
>> require gdb-common.inc
>>
>> -DEPENDS = "expat-native ncurses-native"
>> +DEPENDS = "expat-native ncurses-native flex-native bison-native"
>>
>> inherit python3native
>>
>> -- 
>> 2.7.4
>>
>> -- 
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


