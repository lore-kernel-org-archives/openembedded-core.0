Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id 4653F79631
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Sep 2018 10:38:28 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 42Dzx04Sb2z1qtNm;
	Tue, 18 Sep 2018 12:38:28 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 42Dzx04CW5z1qr2b;
	Tue, 18 Sep 2018 12:38:28 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id JMcNqMF0ihj0; Tue, 18 Sep 2018 12:38:27 +0200 (CEST)
X-Auth-Info: z31M5HbJrSh/fPEIvHqhZGJ4kYzc6Th2vVKIx8ib+zM=
Received: from [IPv6:::1] (unknown [195.140.253.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Tue, 18 Sep 2018 12:38:27 +0200 (CEST)
To: Leon Woestenberg <leon@sidebranch.com>
References: <1536616603-9502-1-git-send-email-leon@sidebranch.com>
	<CAO5Uq5S43E3cXUSEVJP8-dKtuqR-XaqrN+6fhHfy6QESLRh7_w@mail.gmail.com>
	<AB33E724-81C2-43BC-8169-6100CABAA375@sidebranch.com>
	<CAO5Uq5ToXbUR2Pv9PwQOPp-F+5CbwvuPwy84Kfz7HWUzx2ohFA@mail.gmail.com>
	<CAO5Uq5Rws0YP5_y-CSXhKKSrHe1BZiSQsYFQHH9AABFgjKWv=g@mail.gmail.com>
	<4F5C8364-78D3-41EF-B239-B641651A2F64@sidebranch.com>
	<CAO5Uq5TMF-dTZA=dS4QqioRGvycNWeZHC_QWh6FViohLrAy76w@mail.gmail.com>
	<CAMjhiJi9awJ-WVs+Y4V=cqy8JT+qbb=5txQzFVM741inkmzFuQ@mail.gmail.com>
	<d36ea830-9aa0-5e3e-140d-d0e2788175aa@denx.de>
	<CAMjhiJgR1xe_uikpD+07pKDjeBw7er6efV04P3ygMAPfnTUu6w@mail.gmail.com>
	<CAMjhiJho48VP8eySMUg27Y2RDvCesB+W=hSf0i1=VbazdDLBcQ@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <4c0672a4-dae3-ace3-3893-c2ad0f9caff1@denx.de>
Date: Tue, 18 Sep 2018 12:33:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CAMjhiJho48VP8eySMUg27Y2RDvCesB+W=hSf0i1=VbazdDLBcQ@mail.gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] kernel.bbclass: do not deploy fitImage; kernel-fitimage.bbclass does that.
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
X-List-Received-Date: Tue, 18 Sep 2018 10:38:28 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 09/18/2018 12:21 PM, Leon Woestenberg wrote:
> Hello Marek,

Hi,

> On Tue, Sep 18, 2018 at 12:01 PM Leon Woestenberg <leon@sidebranch.com> wrote:
>> On Tue, Sep 18, 2018 at 11:44 AM Marek Vasut <marex@denx.de> wrote:
>>> On 09/18/2018 11:40 AM, Leon Woestenberg wrote:
>>> What bug is it that you're seeing ?
>>>
>>>> Whilst cleaning things up, my understanding was that
>>>> kernel_do_deploy_append() in kernel-fitimage.bbclass deploys the
>>>> fitImages, along with the .its file etc.
>>>> Maybe I was mistaken.
>>>
>>> That's the case, yes.
> 
> Am I mistaken or is my assumption correct that kernel-fitimage.bbclass
> should deploy the fitImages?

Nope, the fitImages should be deployed by the generic mechanism. The
fitImage bbclass only deploys the artifacts from which the fitImage is
constructed (its, initrd, linux.bin, dtb etc)

-- 
Best regards,
Marek Vasut

