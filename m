Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f67.google.com (mail-it0-f67.google.com
	[209.85.214.67])
	by mail.openembedded.org (Postfix) with ESMTP id 7047374DC6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 May 2018 14:36:32 +0000 (UTC)
Received: by mail-it0-f67.google.com with SMTP id n64-v6so21288678itb.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 May 2018 07:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=F1T2GNWwmuprkxIKxZq4n3JTgMWWnllq5HxWXMqRgqs=;
	b=r/N19vABm1vmjEMtrZkcl7b9MMLiwCKVj90TX/DC9Fi7cdGZO+DF8a3SxJaNdsSiZp
	7G4CbQnealDYiOxbM6GlWqbNHc/VP52+OgV3WLVi+3Z6VG3RuGScWOUdBoaoQRkLcrE1
	MDZaIWbyc4/8uwyj7/GMhNB+EDY7XLEDif9QBRmEkQAhlDqaKQo5GyKUJpgQlrIWfJc9
	lW7TxuIoxQGVR+Gi2j9H7N51Vpbgv+MzQgsU+JZwOP9ZXNOmHC0aHdMUjhckR1bH15EI
	Oax8jkPVXLi+nlcw+TNBibLBoE7pfmrQa9XMXpBmm8Da/z8PU/HRn+74dPf63JpTRUIl
	qkNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=F1T2GNWwmuprkxIKxZq4n3JTgMWWnllq5HxWXMqRgqs=;
	b=YAAwwUvDRW/xLzLGgMwXLmoZhTpCSnu3chbKZCQZOntXh0rJnk0jbVBy6EOwimleLj
	4cu9xwCBzEpAck+Kar538Y4AEt9+pA9PI4I0Uq50jIf+YkuaGcyaVXGypTYqD+To+x7h
	e132advHz/RC4VmnJ3hozPE4SILSaR1Tt1WsKgtF5h/CkdaiY4a+RqKU4nqud3/LF4Sc
	F+lIcYbrXQZKzQeCj5cXzejFbda8DAEx9zSufKJhJSFdlK84IOydqdmctPYddQf0c127
	CZSv2IKm+UwNMpRBaDvMuGz92ttgEgv5mYFDUL+riE6DJg6NMO4Qf65/WF8U2MVM3XTV
	ZKoA==
X-Gm-Message-State: ALKqPwd+dQZ6OKyEIiQQs21UZtE+ExF+FPiyEl6TSzzwf4tI9bvDUeYi
	hm7N/d2vp5/caWu4OeS8AdA0hTc6ycPwTHfCkSmhCA==
X-Google-Smtp-Source: AB8JxZrLMMBEG41ZYu61el75xjWAlBnTM5e6wz/dJo+WmKYyHYCOCCOwpUotdGKfNLSNTNUrxDXNQNQ/GuYO+SoVIGE=
X-Received: by 2002:a24:56c3:: with SMTP id
	o186-v6mr17372927itb.127.1526913394116; 
	Mon, 21 May 2018 07:36:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.239.11 with HTTP; Mon, 21 May 2018 07:36:13 -0700 (PDT)
In-Reply-To: <CAMKF1spA_JPf1Zro9Cfk42D4oGATawRzB4vLs=9_cT2cdErYhA@mail.gmail.com>
References: <20180521085306.112262-1-jibin.xu@windriver.com>
	<CAMKF1spA_JPf1Zro9Cfk42D4oGATawRzB4vLs=9_cT2cdErYhA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 21 May 2018 15:36:13 +0100
Message-ID: <CAJTo0LZijCHeT51Lhvz=8qj6b=HZZObGg6TxsKHe08uRvGDiMQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] wget: upgrade 1.19.4 -> 1.19.5
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
X-List-Received-Date: Mon, 21 May 2018 14:36:33 -0000
Content-Type: text/plain; charset="UTF-8"

There's just one security fix which can be backported (in fact, that
fix is already on the list for master so its easy to backport).

Ross

On 21 May 2018 at 14:48, Khem Raj <raj.khem@gmail.com> wrote:
> this has security fixes i wonder if this should be backported to sumo
>
> On Mon, May 21, 2018 at 1:53 AM, Jibin Xu <jibin.xu@windriver.com> wrote:
>> Signed-off-by: Jibin Xu <jibin.xu@windriver.com>
>> ---
>>  meta/recipes-extended/wget/{wget_1.19.4.bb => wget_1.19.5.bb} | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>  rename meta/recipes-extended/wget/{wget_1.19.4.bb => wget_1.19.5.bb} (60%)
>>
>> diff --git a/meta/recipes-extended/wget/wget_1.19.4.bb b/meta/recipes-extended/wget/wget_1.19.5.bb
>> similarity index 60%
>> rename from meta/recipes-extended/wget/wget_1.19.4.bb
>> rename to meta/recipes-extended/wget/wget_1.19.5.bb
>> index fb7cce5a20..e37d8c7847 100644
>> --- a/meta/recipes-extended/wget/wget_1.19.4.bb
>> +++ b/meta/recipes-extended/wget/wget_1.19.5.bb
>> @@ -3,7 +3,7 @@ SRC_URI = "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
>>             file://0002-improve-reproducibility.patch \
>>            "
>>
>> -SRC_URI[md5sum] = "a2a2c1dc4ac5003fc25a8e60b4a9464e"
>> -SRC_URI[sha256sum] = "93fb96b0f48a20ff5be0d9d9d3c4a986b469cb853131f9d5fe4cc9cecbc8b5b5"
>> +SRC_URI[md5sum] = "2db6f03d655041f82eb64b8c8a1fa7da"
>> +SRC_URI[sha256sum] = "b39212abe1a73f2b28f4c6cb223c738559caac91d6e416a6d91d4b9d55c9faee"
>>
>>  require wget.inc
>> --
>> 2.13.0
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

