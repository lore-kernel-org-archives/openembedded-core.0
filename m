Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5B0576D014
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2013 12:08:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rAPC8dMV027398
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 25 Nov 2013 04:08:39 -0800 (PST)
Received: from [128.224.162.213] (128.224.162.213) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.347.0;
	Mon, 25 Nov 2013 04:08:39 -0800
Message-ID: <52933DE1.3050202@windriver.com>
Date: Mon, 25 Nov 2013 20:09:05 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130804 Thunderbird/17.0.8
MIME-Version: 1.0
To: Andrea Adami <andrea.adami@gmail.com>
References: <cover.1385098685.git.Qi.Chen@windriver.com>
	<8403fc751bcf1e0b62b600ed40e00256963f357d.1385098685.git.Qi.Chen@windriver.com>
	<CAP9ODKovi8aHpfM7Tyt+rCxyYC8=YPcxaQGCA6G3=6hhau5W+w@mail.gmail.com>
	<CAAQYJAsmtSLkxnukhv=Guj5cJPhy23UixnZ-aaWB8CjsgbAaQQ@mail.gmail.com>
In-Reply-To: <CAAQYJAsmtSLkxnukhv=Guj5cJPhy23UixnZ-aaWB8CjsgbAaQQ@mail.gmail.com>
X-Originating-IP: [128.224.162.213]
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] image.bbclass: depends on virtual/kernel
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
X-List-Received-Date: Mon, 25 Nov 2013 12:08:42 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/23/2013 06:32 AM, Andrea Adami wrote:
> On Fri, Nov 22, 2013 at 8:58 PM, Otavio Salvador
> <otavio@ossystems.com.br> wrote:
>> On Fri, Nov 22, 2013 at 3:39 AM,  <Qi.Chen@windriver.com> wrote:
>>> From: Chen Qi <Qi.Chen@windriver.com>
>>>
>>> Add 'virtual/kernel' to DEPENDS in image.bbclass so that the kernel
>>> can get built by default. Otherwise, the kernel will not get built
>>> unless it's required by other packages like v86d. As a result, if
>>> we build 'core-image-minimal' for qemumips, the kernel is not built,
>>> and we have 'bitbake linux-yocto' before we can use runqemu to start
>>> the target.
>>>
>>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> If I have a board without modules there's no need to have the depends.
>> Why you need this?
>>
> The first quenstion in my mind when I read the post:
>
> Odd...wasn't core-image-minimal purposedly lean, mutilated and without
> kernel modules ?
> (Not that really 'used' it, just booted 'cause was small and could
> always fit on nand/nor)

What I want to do here is to trigger building of kernel when building 
out an image. I'm not proposing to make all images have kernel -modules 
installed.

> It has always been like this: if one needs the kernel and the modules
> can add that in his machine.conf.

Previously, the kernel is built out by default because 
packagegroup-core-boot has a dependency on it. Now the dependency is gone.

I'm not talking about installing kernel modules onto images.

Best Regards,
Chen Qi

> For more demanding tasks, the next logical step is core-image-base.
>
>
> My 2 cents
>
> Andrea
>
>
>
>> --
>> Otavio Salvador                             O.S. Systems
>> http://www.ossystems.com.br        http://code.ossystems.com.br
>> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


