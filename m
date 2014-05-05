Return-Path: <Qi.Chen@windriver.com>
X-Greylist: delayed 2343 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 05 May 2014 08:11:06 UTC
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2C02265F0F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 May 2014 08:11:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s458B7JP029120
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 5 May 2014 01:11:07 -0700 (PDT)
Received: from [128.224.162.187] (128.224.162.187) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.169.1;
	Mon, 5 May 2014 01:11:06 -0700
Message-ID: <53674790.7060405@windriver.com>
Date: Mon, 5 May 2014 16:10:56 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <CAPbeDCkQ5+fKDLwmwsRK6y8WcJwoctTrGw1_FbF9JAr3o3bWTA@mail.gmail.com>
	<CAMKF1soHJS21Or1b=hByJrRCV5qL343NjkNXXUx__fgnVaKsfw@mail.gmail.com>
In-Reply-To: <CAMKF1soHJS21Or1b=hByJrRCV5qL343NjkNXXUx__fgnVaKsfw@mail.gmail.com>
X-Originating-IP: [128.224.162.187]
Subject: Re: rm_work not cleaning up when doing "-c populate_sdk"
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
X-List-Received-Date: Mon, 05 May 2014 08:11:07 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

I've sent out a patch to the list, trying to fix this problem.
Please take a look at it if convenient.

Best Regards,
Chen Qi

On 05/05/2014 10:21 AM, Khem Raj wrote:
> On Sun, May 4, 2014 at 1:04 PM, Jacob Kroon <jacob.kroon@gmail.com> wrote:
>> Hello,
>>
>> I'm using the rm_work class in my setup, and I noticed that the work
>> directories for all my nativesdk-* packages we're not being cleaned up.
>>
>> I do "bitbake -c populate_sdk my-image" to create the SDK.
>>
>>  From what I can tell by looking at rm_work.class, the rm_work task is
>> appended at the end, but for some reason rm_work is not executed.
>>
>> If I do "bitbake nativesdk-<somepackage>", rm_work is indeed executed.
>>
>> Would it be possible to hook in rm_work in the populate_sdk case as well ?
>> Or is there another way of executing rm_work for all packages ?
>>
> rm_work is run before BB_DEFAULT_TASK which is set to 'do_build' in bitbake.conf
>
> populate_sdk is added to be executed before do_build as well but there
> is no dependency
> of rm_work on populate_sdk thats the issue here they are independent.
>
>
>
>> -- Jacob
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>


