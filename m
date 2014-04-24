Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id BA7F665D2D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Apr 2014 02:38:22 +0000 (UTC)
Received: by mail-ig0-f174.google.com with SMTP id h18so371640igc.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Apr 2014 19:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=iXuBvkiSYfgKTJH2DnPX0Uq8njEtJlxuebpib9bIwGQ=;
	b=0cGidfjC8gpuFaE7TxfG0hsYYFBRw0rW5nONIBnqWD9HWbvlkk4F2R3II1JS2iLEW3
	mXuH1cdBLyTk0sEhMWIBNsbp14ZEqLdHW6UZQ/lePdSa9kI2lnBIUzalOtmOIWYqsIco
	v3ii4/VngKPvk8sKfKbqsecOx419hyyU+6BOt4Hxjd5NgO3HNsjFcP6vrXNeLA3vcVFX
	jeR+GCuLrJr47NhgRcgQVKs3IC54OT/C+dWmuiJW8CLQJeQczE/WbE59/R/zo/45LDaE
	rO/Qs7wtSSrjs7eSZw3XC215GqEIl75pWYvIbc2FFpQMY3jVIhWvhYFinTR/oq+T3Vqx
	a3Ag==
X-Received: by 10.42.21.133 with SMTP id k5mr45601365icb.1.1398307103855; Wed,
	23 Apr 2014 19:38:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.229.14 with HTTP; Wed, 23 Apr 2014 19:37:53 -0700 (PDT)
In-Reply-To: <CACS+7ZQOx4JqsRERztKBgFrNZTkQmdG0CoGN0DbdxZxWy75NDg@mail.gmail.com>
References: <CACS+7ZR=mA9+=NzxF=XLXvxxgypsjzcftZQ0UVWG-0rBLk202A@mail.gmail.com>
	<5357EBAE.6040408@linux.intel.com>
	<CACS+7ZQOx4JqsRERztKBgFrNZTkQmdG0CoGN0DbdxZxWy75NDg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 23 Apr 2014 19:37:53 -0700
Message-ID: <CAMKF1soB12wsTJ_V0+9Fq8FWX8=HWEv9iANmBvBOb4=kiKv4mQ@mail.gmail.com>
To: Dan McGregor <danismostlikely@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] systemd: fix tests when not using gold
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
X-List-Received-Date: Thu, 24 Apr 2014 02:38:26 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Apr 23, 2014 at 9:43 AM, Dan McGregor <danismostlikely@gmail.com> wrote:
> On 23 April 2014 10:34, Saul Wold <sgw@linux.intel.com> wrote:
>>
>> On 04/23/2014 08:01 AM, Dan McGregor wrote:
>>>
>>> From: Dan McGregor <dan.mcgregor@usask.ca>
>>>
>>> Explicitly mark the dummy function as externally visible
>>> so that ld can find the symbol at link time. This is needed
>>> when the DISTRO_FEATURE ld-is-gold is not enabled; systemd
>>> uses -flto anyway.
>>>
>>> Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
>>> ---
>>>   meta/recipes-core/systemd/systemd/systemd-lto-fix.patch | 14
>>> ++++++++++++++
>>>   meta/recipes-core/systemd/systemd_211.bb                |  1 +
>>>   2 files changed, 15 insertions(+)
>>>   create mode 100644
>>> meta/recipes-core/systemd/systemd/systemd-lto-fix.patch
>>>
>>> diff --git a/meta/recipes-core/systemd/systemd/systemd-lto-fix.patch
>>> b/meta/recipes-core/systemd/systemd/systemd-lto-fix.patch
>>> new file mode 100644
>>> index 0000000..90875e4
>>> --- /dev/null
>>> +++ b/meta/recipes-core/systemd/systemd/systemd-lto-fix.patch
>>
>>
>> The patch also needs an appropriate Upstream-Status and Signed-off-by tags
>> here.
>>
>> Thanks
>>         Sau!
>>
>
> As I said to Ross off-list (accidentally), this patch was for Linaro GCC as
> of 2014-03-20. I'm going to check that it's still vald, and if so I'll send
> it upstream too.

FWIW, I have updated the systemd recipe to 212+ its here
http://git.openembedded.org/openembedded-core-contrib/commit/?h=kraj/musl&id=f4283b924c13ea4d98b4251e11dd6a3388f195d5

can you check if this patch is still needed there ? I use gold/arm and
did not run into this issue.

>
> Thanks,
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

