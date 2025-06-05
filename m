Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE17AC5AE59
	for <webhook@archiver.kernel.org>; Thu,  5 Jun 2025 16:36:32 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.12426.1749141385713590333
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jun 2025 09:36:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XLaRcy1b;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-22e09f57ed4so21972765ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 09:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749141385; x=1749746185; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s85RJ1RKFHJmFRBjdQSdG9QPa2I9l/XgEW8R+4/m/JQ=;
        b=XLaRcy1bu1VrR15Il8muRK9oxKmirTwnrfD/GDX0L9LAs4DIMrR4lgFN3DaASYXLaU
         pRUWNcRMkamWiQBdsgPKV1yW1o3a4/3cGyLj0CacJJY2bJRvo0fKYlcQHcns+atx9ufa
         iv6IJ9rqoHx0WntpFgmJHPOCHzGNbd6JvxDVtUJsTRdWxwBZXSrt4QqcToYPmUHCw6/3
         5qvVrJzD0pyy+Z26moUjfhRFnFbcYCOC9QYZPM1k4pCT2MkQl9xcih27MsN+t7mprh7J
         Hewc4UYV9S6CwPQov75d9aEncO5GlxhRwriDaGroPKKcRgxKT0d3qaYRRIcJg+pefVZk
         20WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749141385; x=1749746185;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s85RJ1RKFHJmFRBjdQSdG9QPa2I9l/XgEW8R+4/m/JQ=;
        b=FlRn0ubDkPJbahUji1aYhGUv18BvlG3KO5M44iRtNboj0PDtjbjqQgNAT5xlOxckMD
         TgXQ1UB7eXJ9p3u3FQK8Iw1zaK/MYry0h7dek/QQN5Usjfx+VfvNPd34deT5rDhNBESa
         lLkkmIvBVhV279Bgxw3sdOVFrk0Zi/5pgka9i0a01WFm0l/yv0rEjkYxRtVoSB57ApjF
         cQxL+sUb3jUnZ0wXFFVLLJktNi13d4+kyz0rbF17AQseN2+E8FFUneBlfbjPdv0sntXu
         QIUjaz3Ue4KJwEOIDfxf1HmpV8EtrJMbio88a2FHg7KLtZUSiojyxUWvPY9SM5Xp5Nza
         Gjdg==
X-Forwarded-Encrypted: i=1; AJvYcCV4/nsIaZFllClRq9lGf6otRGRcGD9OD4+bXWGdJPbWOQLQk+tQ3GmTR4ADX3EFutLL0ghbmPJ7ZVRRQk1mPEfxOw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwSjrvPIwYO8PH/UYQFFYeHsWCQb4L2lQdWTgEL3pUxhmVLWLIQ
	hCg19Pf7GIpqk43TnTlBFf9W8P5VKHw93+42RjUqb/REDCIOl1o1GnUp
X-Gm-Gg: ASbGncug/RlohXg91pu7hQdM0WFgDd7OzuWmaFTpp8JhcloBPfIunosNbHg1hgJeyl0
	B0/4vNdop4NDwQHDdz881PQBGAW7Okx7dLA/nGsrMtamDVuQBERA2HwOSZ4W1WSKGStwf65IdfD
	60fdJkkef/L7moLULy6ge/RtGm6BBnjR2SgqO0FiFjapypll7mlxfWsbIktAdsKlsVeyV7chW5O
	qo26JEm57T0NV6U7B+K79Ycj1kIqb2tLd9A3//FdKNjXiLLFbgKOqQi0wwm8pX4y5z2N79dvVMw
	//xf37uF1YpvFISTTDfYxTQrUiFvTrM5mbrIlk1tO8iMrcEMMwJ6O6EVi471Q0JA36CblmLftqg
	BRMFNtLrg/f5zF/Pw92dsATut/mwbuUDpX5iLvXk=
X-Google-Smtp-Source: AGHT+IEuYt+DuKu86eTG9m21Tg79yMuHpEzqXtCW367jOnsaNE46xMSq2MA6C624w7zOLFg8YA1vZA==
X-Received: by 2002:a17:902:c94f:b0:231:9817:6ec1 with SMTP id d9443c01a7336-235f166aa57mr60258435ad.17.1749141384941;
        Thu, 05 Jun 2025 09:36:24 -0700 (PDT)
Received: from ?IPV6:2601:646:8201:fd20:6842:935a:ea78:e087? ([2601:646:8201:fd20:6842:935a:ea78:e087])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506bd938esm121898655ad.71.2025.06.05.09.36.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jun 2025 09:36:23 -0700 (PDT)
Message-ID: <d8c0ccd4-b407-4fa2-87bf-4993a4e6f636@gmail.com>
Date: Thu, 5 Jun 2025 09:36:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 22/45] libarchive: upgrade 3.7.9 -> 3.8.0
To: mathieu.dubois-briand@bootlin.com, wangmy@fujitsu.com,
 openembedded-core@lists.openembedded.org, Joshua Watt <jpewhacker@gmail.com>
References: <20250604084524.864-1-wangmy@fujitsu.com>
 <20250604084524.864-22-wangmy@fujitsu.com>
 <DAEEGF2HWXRM.3SE5SAYKVFP61@bootlin.com>
Content-Language: en-US
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <DAEEGF2HWXRM.3SE5SAYKVFP61@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 16:36:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218075



On 6/4/25 11:52 PM, Mathieu Dubois-Briand via lists.openembedded.org wrote:
> On Wed Jun 4, 2025 at 10:45 AM CEST, wangmy via lists.openembedded.org wrote:
>> From: Wang Mingyu <wangmy@fujitsu.com>
>>
>> License-Update:
>>     file in public domain changed from
>>     libarchive/archive_getdate.c to libarchive/archive_parse_date.c
>>
>> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
>> ---
>>   .../libarchive/{libarchive_3.7.9.bb => libarchive_3.8.0.bb}   | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>   rename meta/recipes-extended/libarchive/{libarchive_3.7.9.bb => libarchive_3.8.0.bb} (93%)
>>
>> diff --git a/meta/recipes-extended/libarchive/libarchive_3.7.9.bb b/meta/recipes-extended/libarchive/libarchive_3.8.0.bb
>> similarity index 93%
>> rename from meta/recipes-extended/libarchive/libarchive_3.7.9.bb
>> rename to meta/recipes-extended/libarchive/libarchive_3.8.0.bb
>> index d70cdb3d83..0722f26f9f 100644
>> --- a/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
>> +++ b/meta/recipes-extended/libarchive/libarchive_3.8.0.bb
>> @@ -3,7 +3,7 @@ DESCRIPTION = "C library and command-line tools for reading and writing tar, cpi
>>   HOMEPAGE = "http://www.libarchive.org/"
>>   SECTION = "devel"
>>   LICENSE = "BSD-2-Clause"
>> -LIC_FILES_CHKSUM = "file://COPYING;md5=d499814247adaee08d88080841cb5665"
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=7ce08437ff7f5e24d72e666313ae4084"
>>   
>>   DEPENDS = "e2fsprogs-native"
>>   
>> @@ -31,7 +31,7 @@ EXTRA_OECONF += "--enable-largefile --without-iconv"
>>   
>>   SRC_URI = "https://libarchive.org/downloads/libarchive-${PV}.tar.gz"
>>   
>> -SRC_URI[sha256sum] = "aa90732c5a6bdda52fda2ad468ac98d75be981c15dde263d7b5cf6af66fd009f"
>> +SRC_URI[sha256sum] = "191b5b24811499d5c2e5efa3248975fa6daa5e6a227700cc7b8e54d6d7c06eef"
>>   
>>   inherit autotools update-alternatives pkgconfig
>>   
> 
> Hi Joshua,
> 
> Adding you to the discussion. I believe this patch will require a fix on
> meta-mingw side, as the build appears broken on the autobuilder.
> 
> ERROR: nativesdk-libarchive-3.8.0-r0 do_compile: oe_runmake failed
> ERROR: nativesdk-libarchive-3.8.0-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/i686-nativesdk-mingw32-w64-mingw32/nativesdk-libarchive/3.8.0/temp/run.do_compile.581979' failed with exit code 1
> ...
> | ../libarchive-3.8.0/libarchive/archive_version_details.c: In function 'archive_wincrypt_version':
> | ../libarchive-3.8.0/libarchive/archive_version_details.c:443:50: error: passing argument 3 of 'CryptGetProvParam' from incompatible pointer type [-Wincompatible-pointer-types]
> |   443 |         if (!CryptGetProvParam(prov, PP_VERSION, &version, &length, 0)) {
> |       |                                                  ^~~~~~~~
> |       |                                                  |
> |       |                                                  DWORD * {aka long unsigned int *}
> | In file included from ../libarchive-3.8.0/libarchive/archive_digest_private.h:179,
> |                  from ../libarchive-3.8.0/libarchive/archive_version_details.c:86:
> | /srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/i686-nativesdk-mingw32-w64-mingw32/nativesdk-libarchive/3.8.0/recipe-sysroot/usr/local/oe-sdk-hardcoded-buildpath/sysroots/i686-w64-mingw32/usr/include/wincrypt.h:826:84: note: expected 'BYTE *' {aka 'unsigned char *'} but argument is of type 'DWORD *' {aka 'long unsigned int *'}
> |   826 |   WINIMPM WINBOOL WINAPI CryptGetProvParam (HCRYPTPROV hProv, DWORD dwParam, BYTE *pbData, DWORD *pdwDataLen, DWORD dwFlags);
> |       |
> 
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/7/builds/1815

I think it could be due to  32-bit systems to have 64bit time

Does this help ?
CFLAGS += " -D__MINGW_USE_VC2005_COMPAT"

> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#217988): https://lists.openembedded.org/g/openembedded-core/message/217988
> Mute This Topic: https://lists.openembedded.org/mt/113462781/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


