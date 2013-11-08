Return-Path: <net147@gmail.com>
Received: from mail-pd0-f170.google.com (mail-pd0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id 06CD86D35C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Nov 2013 09:19:27 +0000 (UTC)
Received: by mail-pd0-f170.google.com with SMTP id v10so1897723pde.29
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Nov 2013 01:19:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=tL7LCcsvwFjAwGJpsE10qd737iwyEFpCbmHEvSnYY+4=;
	b=lIdOaaMuh2G2/GSBBcQr28Vkh7XEjIZkM3HMEcXTS/ix31/HVS4JBlPgjSB8srFazj
	01gaNLy/k3oCgq0O7vvO1WY60du8aPgMWKGKbx2dv/B2JDQ89XlqKJ64G333nirv0b9/
	bhVY3kbuZkVwNZ3uhgfr4txnMfH85KHgbDEkH29BfEuxValV2tQIQDJwuGQGiwNYezcG
	5rMBCHuWBuZb2Qrn5bWBHpS5P3sOFDQ2afG8Idf9i9OL+eHEaCSI1K/RgYMKF673ZVQz
	4vnG7Dp7ygqLJy1s9mDEf5EY7WoYksCZXnigaA6Br8uh8q14nHl5dP+G9A765qjb3Iby
	zMxA==
X-Received: by 10.68.28.5 with SMTP id x5mr13987764pbg.72.1383902368763;
	Fri, 08 Nov 2013 01:19:28 -0800 (PST)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244]) by mx.google.com with ESMTPSA id
	qw8sm10674205pbb.27.2013.11.08.01.19.26 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 08 Nov 2013 01:19:27 -0800 (PST)
Message-ID: <527CAB5B.9080601@gmail.com>
Date: Fri, 08 Nov 2013 20:14:03 +1100
From: Jonathan Liu <net147@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: Robert Yang <liezhi.yang@windriver.com>, 
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <52777AD9.20201@gmail.com> <52778738.5010706@windriver.com>
In-Reply-To: <52778738.5010706@windriver.com>
Subject: Re: [dora] Cherry-pick Qt fixes
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
X-List-Received-Date: Fri, 08 Nov 2013 09:19:28 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi Robert,

Is the queue visible publically?

Regards,
Jonathan

On 4/11/2013 10:38 PM, Robert Yang wrote:
>
> Hi Jonathan,
>
> Thank you very much, these will be included in the queue.
>
> // Robert
>
> On 11/04/2013 06:45 PM, Jonathan Liu wrote:
>> Hi Robert,
>>
>> I propose we cherry-pick the following Qt fixes from master to dora 
>> branch:
>> -qt4: add upstream QTBUG-31579 patch for QPainter regression
>> [OE-Core/a5afc67cbfc32beb3be10392bf9788cfc3610ab1]
>> -nativesdk-qt4-tools: create qt.conf file
>> [OE-Core/23f88695683a8e428375a8ccb6be935347a8768c]
>> -meta-toolchain-qt: put QT_CONF_PATH in environment script
>> [OE-Core/fffa4c37c49b169f663d28612b9251819cef9577]
>> -qt4: add upstream QTBUG-34218/QTBUG-34234 misaligned selection patch
>> [OE-Core/3af8f2e0697a9523d3b505ba4c48eca35f6de3a9]
>>
>> Regards,
>> Jonathan
>>
>>


