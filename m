Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f43.google.com (mail-qg0-f43.google.com
	[209.85.192.43])
	by mail.openembedded.org (Postfix) with ESMTP id 9E14F73197
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Feb 2016 19:59:23 +0000 (UTC)
Received: by mail-qg0-f43.google.com with SMTP id y89so51612163qge.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Feb 2016 11:59:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=tuILQzJ35yzJkNVBNtW1hUGBdmwL/V2eCyVwJ1VsUx0=;
	b=NRwGH2r/K/IRvMH/Of43bcU6q8lLKTsF0wnmIWdCwvDvoa9lbsr2SLawLwHzV5eTnK
	f3eA9tXRqn+7enLCDN0gesQd4/n+AKq3L/digNpBQVLNWj4hYX+IeGbBM7vCs5ZiaBAJ
	0K+SYTJrChDAeWW+uuldtW1yWG6Z215U0XE5ZIJ/dF4hemFTRDT5Mb2A0FjEgMbV9mLe
	eV2Qsz1N/ZqC4zghsGoCB3eNPQJtBBz1qVNuLZ2SpmdBVC38I+DtDOvlvoVlK3VN5vta
	TLRAqwC38MrJsQ3ryCZfE8akwB4onoiLu1BEtAwKOdO2kjMgUWvwPjhgQA6IIQWquXAC
	zW5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=tuILQzJ35yzJkNVBNtW1hUGBdmwL/V2eCyVwJ1VsUx0=;
	b=JLWAVbTSvM+vl1Id7LW/sHAdiM0xk3vyQOHzV76j19mmRhOqk6ThRdPo4R8cUV0f/H
	flUNfJLa7pJ4EhhZTD3y56fXnML+ar9Mb/YZXnfyx1o45buWbwypziNEE/lrdeoxrWDB
	HcialWEGR6JzAPgzm11lIxzE+kDzV0zZ9NoITjwZjkCGUxzEsBQS5x8sW1cw4jw7x3Pr
	6mc1qk2ffc3jtQ+SP8VQnz8OOsbGeIyrEGZhG1Wx7hMdAm2vKBwu0vu8D7K+XkRGaqNg
	a1vjT60UQd2SJUzFNBaF6+sS2uw72p3qvqPFWRsLPpWMlo4UPEFMWIyNjBBtaRAy7GwY
	goJg==
X-Gm-Message-State: AG10YOS2vVeUuj4lDlp84pqmdqD61drCM5Wupsm95LMtuNTbvtKlfjjIsZbok+N8UZY5VTO8KjzT0UFnmbMFjA==
X-Received: by 10.140.100.141 with SMTP id s13mr35864581qge.25.1454961563816; 
	Mon, 08 Feb 2016 11:59:23 -0800 (PST)
MIME-Version: 1.0
Received: by 10.55.130.196 with HTTP; Mon, 8 Feb 2016 11:58:54 -0800 (PST)
In-Reply-To: <CAJ86T=Vk_Y6o1f3VMm++ifkz1XCHZSM0ELa6myhJymaFG3TQbQ@mail.gmail.com>
References: <1454960141-18350-1-git-send-email-armccurdy@gmail.com>
	<1454960141-18350-3-git-send-email-armccurdy@gmail.com>
	<CAMKF1spGGbVK9KM+9=eRd5-wyND94W+VXG6Kubf4VqSsqomDZw@mail.gmail.com>
	<CAJ86T=Vk_Y6o1f3VMm++ifkz1XCHZSM0ELa6myhJymaFG3TQbQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 8 Feb 2016 11:58:54 -0800
Message-ID: <CAMKF1srjMm1W=9ttQZMg1iNp2hJO0c_La6De0w4ncQssi1iy2g@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] gdb: drop unnecessary CC_FOR_BUILD etc exports
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
X-List-Received-Date: Mon, 08 Feb 2016 19:59:24 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Feb 8, 2016 at 11:55 AM, Andre McCurdy <armccurdy@gmail.com> wrote:
> On Mon, Feb 8, 2016 at 11:48 AM, Khem Raj <raj.khem@gmail.com> wrote:
>> On Mon, Feb 8, 2016 at 11:35 AM, Andre McCurdy <armccurdy@gmail.com> wrote:
>>> These exports are all provided by autotool.bbclass
>>>
>>>   http://git.openembedded.org/openembedded-core/commit/?id=edf30561184ec42e5692a55fdf93304fac0fdb1b
>>>
>>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>>> ---
>>>  meta/recipes-devtools/gdb/gdb-common.inc | 7 +------
>>>  1 file changed, 1 insertion(+), 6 deletions(-)
>>>
>>> diff --git a/meta/recipes-devtools/gdb/gdb-common.inc b/meta/recipes-devtools/gdb/gdb-common.inc
>>> index 6baeb0b..06272a9 100644
>>> --- a/meta/recipes-devtools/gdb/gdb-common.inc
>>> +++ b/meta/recipes-devtools/gdb/gdb-common.inc
>>> @@ -22,16 +22,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
>>>                 file://COPYING.LIB;md5=9f604d8a4f8e74f4f5140845a21b6674 \
>>>                 file://COPYING3;md5=d32239bcb673463ab874e80d47fae504 \
>>>                 file://COPYING3.LIB;md5=6a6a8e020838b23406c81b19c1d46df6"
>>> +
>>>  inherit autotools texinfo
>>>
>>>  SRC_URI = "${GNU_MIRROR}/gdb/gdb-${PV}.tar.gz \
>>>            "
>>> -export CC_FOR_BUILD = "${BUILD_CC}"
>>> -export CXX_FOR_BUILD = "${BUILD_CXX}"
>>> -export CPP_FOR_BUILD = "${BUILD_CPP}"
>>> -export CFLAGS_FOR_BUILD = "${BUILD_CFLAGS}"
>>> -export CXXFLAGS_FOR_BUILD = "${BUILD_CXXFLAGS}"
>>> -export CPPFLAGS_FOR_BUILD = "${BUILD_CPPFLAGS}"
>>>
>>
>> you should build all flavours of gdb recipes for one architectures
>> including mutlilib combination to test this out.
>
> I checked that these exports all exactly match the ones in
> autotools.bbclass so it's not clear what could go wrong.

These flags get overridden when morphing into native/cross/crosssdk and ilk.

>
> Is there a combination which you suspect will have trouble with this patch?
>
build crosssdk or cross-canadian recipes e.g.


>
>>>  B = "${WORKDIR}/build-${TARGET_SYS}"
>>>
>>> --
>>> 1.9.1
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

