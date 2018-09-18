Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id 6BCDF793D9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Sep 2018 11:19:00 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 42F0qn0yg2z1qw01;
	Tue, 18 Sep 2018 13:19:01 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 42F0qn0cXlz1qr2W;
	Tue, 18 Sep 2018 13:19:01 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id nCMuCGiltsEO; Tue, 18 Sep 2018 13:19:00 +0200 (CEST)
X-Auth-Info: KszqjvcwDuPTEoQ4T7qf8o0x/6Ts5rqA6XvOqV+7l4k=
Received: from [IPv6:::1] (unknown [195.140.253.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Tue, 18 Sep 2018 13:19:00 +0200 (CEST)
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
	<c2748bb0-22b3-0f25-72e7-519c940e2430@denx.de>
	<CAMjhiJgRa6_z3AGZWKpA7sgtLaa4mYK_-b05-t0aimsDKyo7dg@mail.gmail.com>
	<da056905-c114-097d-8dbc-f4a398872933@denx.de>
	<CAMjhiJjimOmzdcYa7kgh9Ff0WdTh=TXD0tROTF08o1pDRC_QVw@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <37465946-772d-7f4e-d5e0-a98e69d15f1a@denx.de>
Date: Tue, 18 Sep 2018 13:12:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CAMjhiJjimOmzdcYa7kgh9Ff0WdTh=TXD0tROTF08o1pDRC_QVw@mail.gmail.com>
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
X-List-Received-Date: Tue, 18 Sep 2018 11:19:00 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 09/18/2018 12:59 PM, Leon Woestenberg wrote:
> Hi Marek,

Hi,

> On Tue, Sep 18, 2018 at 12:38 PM Marek Vasut <marex@denx.de> wrote:
>> On 09/18/2018 12:22 PM, Leon Woestenberg wrote:
>>>
>>> There is no exception for INITRAMFS_IMAGE_BUNDLE in
>>> kernel-fitimage.bbclass. The initramfs will be packed inside the FIT,
>>> in addition of also being packed inside the kernel.
>>
>> So why would you use initramfs_image_bundle with fitImage when you can
>> pack the initrd into the fitImage instead ?
>>
> To be honest, I do not know that use-case anymore but it's a valid
> configuration that shouldn't give an unexpected outcome.

True

> We also found a use-case for non-compressed kernels in the FIT image;
> that was for very small delta-upgrades even when kernels are FIT
> packed. Currently kernel-fitimage.bbclass hard-selects a compressed
> kernel (such as zImage).

Patches are welcome

-- 
Best regards,
Marek Vasut

