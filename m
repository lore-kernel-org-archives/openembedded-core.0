Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 955646C3DA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Nov 2018 09:45:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wAE9im5L015432
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 14 Nov 2018 01:45:14 -0800
Received: from [128.224.162.228] (128.224.162.228) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Wed, 14 Nov 2018 01:44:46 -0800
To: "Burton, Ross" <ross.burton@intel.com>, "Purdie, Richard"
	<richard.purdie@linuxfoundation.org>
References: <1542099878-266444-1-git-send-email-changqing.li@windriver.com>
	<54ebce2e5465961129b4740cba726f52c9e7d726.camel@linuxfoundation.org>
	<CAJTo0LbGi3k7ASx1SzGkagJABKVUz182S2_G_d1paLhPgNab9A@mail.gmail.com>
From: Changqing Li <changqing.li@windriver.com>
Message-ID: <cb9bda02-6b66-3e0a-4db2-45a20ff835ef@windriver.com>
Date: Wed, 14 Nov 2018 17:44:43 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbGi3k7ASx1SzGkagJABKVUz182S2_G_d1paLhPgNab9A@mail.gmail.com>
X-Originating-IP: [128.224.162.228]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] oepydevshell-internal.py: decode only when readdata is valid
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
X-List-Received-Date: Wed, 14 Nov 2018 09:45:55 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 11/13/18 7:10 PM, Burton, Ross wrote:
> On Tue, 13 Nov 2018 at 10:03, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>
>> Usually you'd write this as:
>>
>> if readdata:
>>      i = i + readdata.decode('utf-8')
>>
>> Is there a reason not to do that here?
> Whilst this code is being changed, is there a chance of getting a
> partial read that has half of a utf-8 byte sequence?
>
> Ross

Seems "continue"  will delay  the deal of  "i"  to next loop, but will 
not lost data.

but I still change to let it continue to deal with "i" , in case there 
is still "i" not

outputed in last loop. it should be better.


changqing

-- 
BRs

Sandy(Li Changqing)


