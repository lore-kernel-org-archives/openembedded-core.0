Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 17718794EA
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Sep 2018 08:59:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w868xrn0006362
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 6 Sep 2018 01:59:53 -0700 (PDT)
Received: from [128.224.162.218] (128.224.162.218) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Thu, 6 Sep 2018 01:59:53 -0700
To: <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <20180905165227.29435-1-richard.purdie@linuxfoundation.org>
	<20180905165227.29435-7-richard.purdie@linuxfoundation.org>
	<a7d35d68-e546-408f-561e-c5a3a8f4aaa5@windriver.com>
	<4f62f20f8d4b9378684b6224ddf7d1bc5cfca814.camel@linuxfoundation.org>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <6a9fa2c4-b21c-38c5-cd4b-f8f4cfdb39ef@windriver.com>
Date: Thu, 6 Sep 2018 17:04:46 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <4f62f20f8d4b9378684b6224ddf7d1bc5cfca814.camel@linuxfoundation.org>
X-Originating-IP: [128.224.162.218]
Subject: Re: [PATCH 7/8] busybox: Put klogd/syslogd alternative links in syslog package
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
X-List-Received-Date: Thu, 06 Sep 2018 08:59:54 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 09/06/2018 04:19 PM, richard.purdie@linuxfoundation.org wrote:
> On Thu, 2018-09-06 at 10:11 +0800, ChenQi wrote:
>> Hi Richard,
>>
>> I think my previous patch has covered this case.
>>
>>     git://git.pokylinux.org/poky-contrib ChenQi/busybox-alternatives
>>     http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/busyb
>> ox-alternatives
>>
>> Chen Qi (1):
>>     busybox: fix the alternatives logic
>>
>>
>> Is there some problem with the patch?
> Sorry, I thought I'd replied about this. There were build failures from
> this patch and I had to drop it from the test branch. I'm afraid with
> all the build failures we're had recently I'm struggling to find which
> failures those were...
>
> I merged my simpler but less complete fix simply to get patches moving
> as I'd assumed this one was being debugged. I guess we need the
> failures for that though...
>
> Cheers,
>
> Richard
>
Got it.
I just looked at some build failures, the ones that might be related are 
those of testimage failures complaining 'No syslog daemon'.
I'll check things locally first.

Best Regards,
Chen Qi

