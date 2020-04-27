Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
 by mx.groups.io with SMTP id smtpd.web11.1006.1588030068060083930
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Apr 2020 16:27:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tkoJ2LcQ;
 spf=pass (domain: gmail.com, ip: 209.85.210.195, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f195.google.com with SMTP id w65so9745062pfc.12
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2020 16:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=lPCTl4UZtUaYvPywP/TUJi9jy2VYXm1QxtVoIc/xzJo=;
        b=tkoJ2LcQETXmehffbgfhMQbnh9r6iX40q8IWlhIP2SK3Dyb18zzfh0rJIGRJDf+98I
         RgRepP7sU9R9xYSe6eFwos+zhlCRJsN1hysVEgDiBDUvq1uvJozqq7LkqLfaVntiJZng
         0DAOlKpOfUyCW1IUOQg/XNl6R2rmAM7Q+cQPWA6DeaSRxe9lt4cU3kghxTMC5unkepX7
         rBDS+SuetaOiW82oTYPA5ZkrKFYl7MMtMtwZtyU6YEBk8mEm+jakxBKmR1IvrsYNdztI
         6K1c/EdzFvO6b3B0fto1IH5209iaKxoIWGEFY22weTXJzq/JAlsZmsrG1rehNTwS7swK
         3esQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=lPCTl4UZtUaYvPywP/TUJi9jy2VYXm1QxtVoIc/xzJo=;
        b=WTih7UOBhX4+5t5Mn/SFBugJsLFzgxVdR4Vj+iI5nFtykSeGqDDAX0q0esRgNV+QJv
         Uy5lVaM3tbb2Pw5Ggv9GuZgAbeP3kLQNpxTh+8DS+UGtYBR6jknOQ1y2MtEkVHkYnDrD
         TQ9pVE9FZCcJihvG5wLE3M87yve55KhfqfTKgeEjRYg6Dbe7lbNNeQEJ62EjrK48Jf48
         A3elUQFqIVTuhAVn523GRZZYEjj6M7omkwDRTDao2STGObikyg4EMzd7rpvoWALAaXHR
         UFxj5Q2DeBY0cYV2El9SdkbBrylZ3WFD2jt8ABVW2wgPuo5EVkFqpd9DJC4Ev/767+et
         sasA==
X-Gm-Message-State: AGi0PuY1utw7wJOEiMorv8W6iC7En0Nyw/DCIQaIANuzk4kM6bOzogtU
	Sx2g5DG12AqzINz9OwmoKFJsgmAkZpc=
X-Google-Smtp-Source: APiQypJrudx3HywJj+LqdjA1m6M1UOentahakqyhmGQvAn3anyRUPgLgYlGd0bn7shg9ugA/VBJ/CQ==
X-Received: by 2002:aa7:985e:: with SMTP id n30mr25352065pfq.163.1588030067086;
        Mon, 27 Apr 2020 16:27:47 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0:d74:fde6:c674:10ce? ([2601:646:9200:4e0:d74:fde6:c674:10ce])
        by smtp.gmail.com with ESMTPSA id u5sm11856382pfu.198.2020.04.27.16.27.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2020 16:27:46 -0700 (PDT)
Subject: Re: [OE-core] [PATCH 1/3] gcc: Configure all gccs with --disable-install-libiberty
To: Steve Sakoman <sakoman@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <20200415231829.4090244-1-raj.khem@gmail.com>
 <CAGDS+n=FfuBzJcrvbb8i=32+9JXd-0C+MskoxLuUDiz0p_RZyg@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <0f7cef3c-f0f0-30b9-7107-02450738622c@gmail.com>
Date: Mon, 27 Apr 2020 16:27:45 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAGDS+n=FfuBzJcrvbb8i=32+9JXd-0C+MskoxLuUDiz0p_RZyg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Yes Steve, there are good for Dunfell. We should consider them

On 4/27/20 4:20 PM, Steve Sakoman wrote:
> Hi Khem,
> 
> Is this series something I should consider for dunfell LTS?
> 
> Steve
> 
> On Wed, Apr 15, 2020 at 1:19 PM Khem Raj <raj.khem@gmail.com> wrote:
>>
>> OE uses libiberty from binutils, since its properly compiled as pic
>> archive and applications and other libraries needing libiberty can
>> properly link with it.
>>
>> With this option applied, explicit delete of libiberty headers and
>> libraries is not required in install step, since they wont get installed
>> in first place.
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>   meta/recipes-devtools/gcc/gcc-configure-common.inc | 1 +
>>   meta/recipes-devtools/gcc/gcc-cross-canadian.inc   | 6 ------
>>   meta/recipes-devtools/gcc/gcc-cross.inc            | 4 ----
>>   meta/recipes-devtools/gcc/gcc-target.inc           | 4 ----
>>   4 files changed, 1 insertion(+), 14 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/recipes-devtools/gcc/gcc-configure-common.inc
>> index bb4f6923f2..a64c4caf00 100644
>> --- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
>> +++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
>> @@ -33,6 +33,7 @@ EXTRA_OECONF = "\
>>       --enable-libstdcxx-pch \
>>       --program-prefix=${TARGET_PREFIX} \
>>       --without-local-prefix \
>> +    --disable-install-libiberty \
>>       ${EXTRA_OECONF_BASE} \
>>       ${EXTRA_OECONF_GCC_FLOAT} \
>>       ${EXTRA_OECONF_PATHS} \
>> diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
>> index 4aac345bec..553ef7fe62 100644
>> --- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
>> +++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
>> @@ -108,12 +108,6 @@ do_install () {
>>          # We don't care about the gcc-<version> copies
>>          rm -f ${D}${bindir}/*gcc-?.?*
>>
>> -       # We use libiberty from binutils
>> -       rm -f ${D}${prefix}/${TARGET_SYS}/lib/libiberty.a
>> -       # Not sure where the strange paths come from
>> -       rm -f ${D}${libdir}/../lib/libiberty.a
>> -       rm -f ${D}${libdir}/libiberty.a
>> -
>>          # Cleanup empty directories which are not shipped
>>          # we use rmdir instead of 'rm -f' to ensure the non empty directories are not deleted
>>          # ${D}${libdir}/../lib only seems to appear with SDKMACHINE=i686
>> diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc b/meta/recipes-devtools/gcc/gcc-cross.inc
>> index c68cdd5dc4..6fa8c274cd 100644
>> --- a/meta/recipes-devtools/gcc/gcc-cross.inc
>> +++ b/meta/recipes-devtools/gcc/gcc-cross.inc
>> @@ -117,10 +117,6 @@ do_install () {
>>          cp ${S}/libquadmath/quadmath.h ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include/
>>          cp ${S}/libquadmath/quadmath_weak.h ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include/
>>
>> -       # We use libiberty from binutils
>> -       find ${D}${exec_prefix}/lib -name libiberty.a | xargs rm -f
>> -       find ${D}${exec_prefix}/lib -name libiberty.h | xargs rm -f
>> -
>>          find ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include-fixed -type f -not -name "README" -not -name limits.h -not -name syslimits.h | xargs rm -f
>>   }
>>
>> diff --git a/meta/recipes-devtools/gcc/gcc-target.inc b/meta/recipes-devtools/gcc/gcc-target.inc
>> index 34c1b2263b..8cb432780f 100644
>> --- a/meta/recipes-devtools/gcc/gcc-target.inc
>> +++ b/meta/recipes-devtools/gcc/gcc-target.inc
>> @@ -192,10 +192,6 @@ do_install () {
>>          # We don't care about the gcc-<version> ones for this
>>          rm -f *gcc-?.?*
>>
>> -       # We use libiberty from binutils
>> -       find ${D}${libdir} -name libiberty.a | xargs rm -f
>> -       find ${D}${libdir} -name libiberty.h | xargs rm -f
>> -
>>          # Not sure why we end up with these but we don't want them...
>>          rm -f ${TARGET_PREFIX}${TARGET_PREFIX}*
>>
>> --
>> 2.26.1
>>
>> 
