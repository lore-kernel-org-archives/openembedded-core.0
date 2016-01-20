Return-Path: <Jian.Liu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 434DD6612D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 08:21:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u0K8LcV8017553
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 20 Jan 2016 00:21:39 -0800 (PST)
Received: from [128.224.162.169] (128.224.162.169) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Wed, 20 Jan 2016 00:21:38 -0800
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <1453267659-18756-1-git-send-email-jian.liu@windriver.com>
	<1453276340.27999.141.camel@linuxfoundation.org>
From: Jian Liu <jian.liu@windriver.com>
Message-ID: <569F43C8.3090800@windriver.com>
Date: Wed, 20 Jan 2016 16:22:32 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <1453276340.27999.141.camel@linuxfoundation.org>
X-Originating-IP: [128.224.162.169]
Subject: Re: [PATCH] kernel-devsrc: Fix backward compaibilty
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
X-List-Received-Date: Wed, 20 Jan 2016 08:21:39 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2016年01月20日 15:52, Richard Purdie wrote:
> On Wed, 2016-01-20 at 13:27 +0800, Jian Liu wrote:
>> kernel-dev is replaced by kernel-devsrc
> No, its not.
>
>> , which breaks
>> backward compaibilty.
>>   -- add alias for kernel-devsrc
>>   -- kernel-devsrc provides the kernel-dev.
>>   -- remove kernel-dev from the sub-packages of linux-windriver
> kernel-dev is useful for things like profiling tools where you need
> things like system.Map or the kernel configuration without source code.
>
> If you need the "full" source, you can use kernel-devsrc.
>
> I'm not sure we want to remove kernel-dev given it does have a use?
Ok.  I see.

Thanks Richard.

>
> Cheers,
>
> Richard
>


