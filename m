Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 940ED73197
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Feb 2016 19:55:51 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id p63so16944282wmp.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Feb 2016 11:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=QZU/rcN8H1IIj7er+gL1wvughWuuixxPnsaLnFB4NsE=;
	b=e8WcpmYIgcuWNFt63+pfkaW0ioK5VWnWGB7cvgM3/NofgcW7+DUj4OBxETJw35mI62
	ZHMMXWeKANILVMRp+MPHPZwoJ3Ck4ProQRJZpgEpx57gsJ13V5UMRmvNmq2lzf11uv8P
	zQYvM8ORDo4xWyHcwapEJjeHB6SyQD2uzzWOQuTOTklkUfjCWrz/0NhgBLVhtjK1ioBo
	9aBHYVrMsjHRV9bq4soxU8WpL/kXb6dya5bf0OJwswH9Ff4XFoV16+fRHcHL68O2tGfE
	KIfgjgbhidBNoM/UPsA5y8Nj+pA7I0WIiOocjKUi3jKD8RdyFFSWDlg+hk3nDP23YfHB
	v65A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=QZU/rcN8H1IIj7er+gL1wvughWuuixxPnsaLnFB4NsE=;
	b=PNuMP/XxODBUCe+wGAGcJLMrGh2ZpDAXwOnHVrkTGax9NbvlRoqTzbPm/7HKWNLiNW
	UIPPDjBbbR+GtZsbjuX/P+O0MZrOo+uxjp4z/9z/PKlrsg0blcLC2X4Ylxch5F3Idp3Q
	2Dm6rYMYX/LD84aWi8bNZF8baa2WcxegwHedrpQMFM8Z5Co4mQnC+aLM0uR6d0pZzryi
	KHjZKVwCMTcPdSUbMCfueidFIhLM3zJVBKKmEmiKyKJGET0XijgM3XhM8PP7TbEtqUIc
	AgD7A6UCtdhWc7mI+Q6vxIrpkanCkdfDoOwftZ7WwtyAhaSv1E/P62Ir+qwVzE2Ci4z5
	ADxw==
X-Gm-Message-State: AG10YOQaz0D9SRqz5TamQifrLDVf4UosrNwMEeO+4JmfxTkviWIFnkXW8fvl7yvvx84ePQ9nm68GdTIB2jyOug==
MIME-Version: 1.0
X-Received: by 10.194.116.197 with SMTP id jy5mr29022434wjb.43.1454961351648; 
	Mon, 08 Feb 2016 11:55:51 -0800 (PST)
Received: by 10.194.209.131 with HTTP; Mon, 8 Feb 2016 11:55:51 -0800 (PST)
In-Reply-To: <CAMKF1spGGbVK9KM+9=eRd5-wyND94W+VXG6Kubf4VqSsqomDZw@mail.gmail.com>
References: <1454960141-18350-1-git-send-email-armccurdy@gmail.com>
	<1454960141-18350-3-git-send-email-armccurdy@gmail.com>
	<CAMKF1spGGbVK9KM+9=eRd5-wyND94W+VXG6Kubf4VqSsqomDZw@mail.gmail.com>
Date: Mon, 8 Feb 2016 11:55:51 -0800
Message-ID: <CAJ86T=Vk_Y6o1f3VMm++ifkz1XCHZSM0ELa6myhJymaFG3TQbQ@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
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
X-List-Received-Date: Mon, 08 Feb 2016 19:55:51 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Feb 8, 2016 at 11:48 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On Mon, Feb 8, 2016 at 11:35 AM, Andre McCurdy <armccurdy@gmail.com> wrote:
>> These exports are all provided by autotool.bbclass
>>
>>   http://git.openembedded.org/openembedded-core/commit/?id=edf30561184ec42e5692a55fdf93304fac0fdb1b
>>
>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>> ---
>>  meta/recipes-devtools/gdb/gdb-common.inc | 7 +------
>>  1 file changed, 1 insertion(+), 6 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/gdb/gdb-common.inc b/meta/recipes-devtools/gdb/gdb-common.inc
>> index 6baeb0b..06272a9 100644
>> --- a/meta/recipes-devtools/gdb/gdb-common.inc
>> +++ b/meta/recipes-devtools/gdb/gdb-common.inc
>> @@ -22,16 +22,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
>>                 file://COPYING.LIB;md5=9f604d8a4f8e74f4f5140845a21b6674 \
>>                 file://COPYING3;md5=d32239bcb673463ab874e80d47fae504 \
>>                 file://COPYING3.LIB;md5=6a6a8e020838b23406c81b19c1d46df6"
>> +
>>  inherit autotools texinfo
>>
>>  SRC_URI = "${GNU_MIRROR}/gdb/gdb-${PV}.tar.gz \
>>            "
>> -export CC_FOR_BUILD = "${BUILD_CC}"
>> -export CXX_FOR_BUILD = "${BUILD_CXX}"
>> -export CPP_FOR_BUILD = "${BUILD_CPP}"
>> -export CFLAGS_FOR_BUILD = "${BUILD_CFLAGS}"
>> -export CXXFLAGS_FOR_BUILD = "${BUILD_CXXFLAGS}"
>> -export CPPFLAGS_FOR_BUILD = "${BUILD_CPPFLAGS}"
>>
>
> you should build all flavours of gdb recipes for one architectures
> including mutlilib combination to test this out.

I checked that these exports all exactly match the ones in
autotools.bbclass so it's not clear what could go wrong.

Is there a combination which you suspect will have trouble with this patch?


>>  B = "${WORKDIR}/build-${TARGET_SYS}"
>>
>> --
>> 1.9.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

