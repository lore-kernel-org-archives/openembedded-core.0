Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 by mx.groups.io with SMTP id smtpd.web10.36386.1585514515932768838
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Mar 2020 13:41:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denx.de, ip: 212.18.0.9, mailfrom: marex@denx.de)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 48r6vj2lBFz1qqkj;
	Sun, 29 Mar 2020 22:41:53 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 48r6vj2QJGz1r0bc;
	Sun, 29 Mar 2020 22:41:53 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
	with ESMTP id glVRfqhpqNZD; Sun, 29 Mar 2020 22:41:52 +0200 (CEST)
X-Auth-Info: 8WKG3cea5P+QH1RACB0S1SfdAGHdYGtJ5AlEp1h8r30=
Received: from [IPv6:::1] (unknown [195.140.253.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Sun, 29 Mar 2020 22:41:52 +0200 (CEST)
Subject: Re: [PATCH] lttng-modules: update to 2.10.14
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
Cc: Armin Kuster <akuster808@gmail.com>,
 Daniel Dragomir <Daniel.Dragomir@windriver.com>
References: <20200329172752.285451-1-marex@denx.de>
 <e1863defc13c09b072ffbca84ff5c23274d0057a.camel@linuxfoundation.org>
From: "Marek Vasut" <marex@denx.de>
Message-ID: <487a31ba-dfab-d09b-5414-f3acdb1e75a4@denx.de>
Date: Sun, 29 Mar 2020 22:41:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <e1863defc13c09b072ffbca84ff5c23274d0057a.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 3/29/20 10:37 PM, Richard Purdie wrote:
> On Sun, 2020-03-29 at 19:27 +0200, Marek Vasut wrote:
>> Upgrade to version 2.10.14 in order to fix some build errors
>> with latest 5.4 kernel.
>>
>> - conflicting types for 'trace_rcu_dyntick'
>>   Reproductible on kernel greater than v5.4.22, starting with commit
>>   6cf539a87a ("rcu: Fix data-race due to atomic_t copy-by-value")
>>
>> Also drop patches which are no longer required.
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> Cc: Armin Kuster <akuster808@gmail.com>
>> Cc: Daniel Dragomir <Daniel.Dragomir@windriver.com>
>> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
>> ---
>> NOTE: Roughly matches OE-Core rev: 8fcc33aea08fc1e82818893feb7b01c7cc1e6416
>> ---
>>  ...ops-when-trace-sunrpc_task-events-in.patch |  94 -------------
>>  ...rpc_clnt-dereference-in-rpc_task_que.patch |  44 ------
>>  ...rpc-use-signed-integer-for-client-id.patch | 105 --------------
>>  ...nrpc-introduce-lttng_get_clid-helper.patch | 130 ------------------
>>  ...es_2.10.11.bb => lttng-modules_2.10.14.bb} |  12 +-
>>  5 files changed, 4 insertions(+), 381 deletions(-)
>>  delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-Fix-SUNRPC-Fix-oops-when-trace-sunrpc_task-events-in.patch
>>  delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0002-Fix-sunrpc-null-rpc_clnt-dereference-in-rpc_task_que.patch
>>  delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0003-Fix-sunrpc-use-signed-integer-for-client-id.patch
>>  delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0004-sunrpc-introduce-lttng_get_clid-helper.patch
>>  rename meta/recipes-kernel/lttng/{lttng-modules_2.10.11.bb => lttng-modules_2.10.14.bb} (75%)
> 
> This patch doesn't apply to master as lttng-modules is 2.11.2 there?

It's for zeus, sorry for the confusion.

(how do I indicate that in the patch right away?)
