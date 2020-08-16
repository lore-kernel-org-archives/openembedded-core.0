Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.web12.32893.1597619754658326066
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Aug 2020 16:15:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Mmvxkjmt;
 spf=pass (domain: gmail.com, ip: 209.85.222.193, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f193.google.com with SMTP id j187so13464877qke.11
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2020 16:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ujKeX+2QOerjqNOHSYZT9GOLxomylS3hNaHcyVYOKwE=;
        b=MmvxkjmtOvU/I4wP8LoFUTzRaLPvYBuUwxkOsuY1tvjsNZOle4en28p0iHcG0feMUS
         gEy+NJmQ26kLKQiuJgU3jV1m96Q7noD4EekBNixYkxcBSelO18KI9Arzdqmcpy17YNFR
         BLHqggUt8R8Wi6pnl0X9+rpDcCtjR0pLcbl8PshJduH1BjXi1+AYFadRfo7lcyGpf3wd
         6HAW9kBfYa6E4hSclAI3J4j6jsv3pCBxVxx1OCu/izJ3eXd8ZbbeDQKZ+CB4WJ4NvhHG
         TmvWgIOwKjInb+tyW7LgkFg/32XBwZZf7GDMlSLf2eTSwh828g60MgFW6QVamQm1bfcU
         mO3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ujKeX+2QOerjqNOHSYZT9GOLxomylS3hNaHcyVYOKwE=;
        b=oqs65iD+JahfOwbsvUB1zJQOEh6WOHPYDZIHmAlTxRvBxPuwa7bUaXXZMvLj/dgM0e
         +RhsRYadt2nR6bGyvL68EbYO89wHaVMsCq+g0WQyyU9T73Fw/bJgxPgZXYi6gcX/vC7y
         S0LoaVB6birWNR0lr2dFecLGlbg6AMyj1gROZFZ+b4Qa/xp/4Uqzw5c8RJzMaVHPhx7l
         0/V4r972olZRenYnmuRYEDZU6aZ7j9CoCrBJT5KT4K1fP1+A/N9ZTVMjiYeNLe6Uzjyk
         XRLvrhHdGr/eBlu5i0i90ALvHeDNKVIu4GfdZxapb0B9b3mJ/avmDxbF3rokm1fa43o4
         Exuw==
X-Gm-Message-State: AOAM53031qScXRZxYc4HCF2F/Y3iBqLokhjS4ZIeJJ8b1PhK/GFpHZ2T
	yJMNJtJQte13Lw/5XLl12yRNoJgcth19W81zsLQ=
X-Google-Smtp-Source: ABdhPJwf10NJPm+0O/Oa4g6g9vZ7egLB/qzaF2qOHQMPBE6IaWgBPx1ybd1Y/xWe0QFKR96AwEEAxmVkD2xuisH4JWg=
X-Received: by 2002:a05:620a:209b:: with SMTP id e27mr10334568qka.431.1597619753690;
 Sun, 16 Aug 2020 16:15:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200816070814.1303004-1-raj.khem@gmail.com> <20200816070814.1303004-3-raj.khem@gmail.com>
 <CADkTA4MAmRH9g7EHyhKbgBgBUD0LFwDORL6TL_Z-+L_kg5ig-A@mail.gmail.com>
In-Reply-To: <CADkTA4MAmRH9g7EHyhKbgBgBUD0LFwDORL6TL_Z-+L_kg5ig-A@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sun, 16 Aug 2020 16:15:26 -0700
Message-ID: <CAMKF1soL0agojKVxZ34LfrLKdWDtU5vtcyN5DL8F=ZL=o4NL4g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/3] linux-yocto: Backport a patch to fix perf with -fno-common
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 16, 2020 at 3:30 PM Bruce Ashfield <bruce.ashfield@gmail.com> w=
rote:
>
>
>
> On Sun, Aug 16, 2020 at 3:08 AM Khem Raj <raj.khem@gmail.com> wrote:
>>
>> Temp fix until linux-yocto picks it up
>>
>
> These really need to be submitted to the linux-yocto mailing list as pro=
per patches.
>
> When they are submitted like this, it requires me to extract the patch, =
or hunt up the original commit, see if it has already been submitted to lin=
ux-stable (and if not, it should be), apply it to the kernel, revert this c=
ommit if it happens to have merged and then finally do my update.
>

I know, it was a ad-hoc fix for autobuilders if RP wanted to try

> or, it could be submitted to linux-yocto like any patch, and it will be =
applied and show up with the next update.
>
> I'll take care of getting this into linux-yocto with my update that is c=
oming later today.
>
> Cheers,
>
> Bruce
>
>
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  ...-definition-of-traceid_list-global-v.patch | 66 +++++++++++++++++++
>>  meta/recipes-kernel/linux/linux-yocto_5.4.bb  |  2 +
>>  2 files changed, 68 insertions(+)
>>  create mode 100644 meta/recipes-kernel/linux/files/0001-perf-cs-etm-Mo=
ve-definition-of-traceid_list-global-v.patch
>>
>> diff --git a/meta/recipes-kernel/linux/files/0001-perf-cs-etm-Move-defi=
nition-of-traceid_list-global-v.patch b/meta/recipes-kernel/linux/files/000=
1-perf-cs-etm-Move-definition-of-traceid_list-global-v.patch
>> new file mode 100644
>> index 0000000000..0fc9876501
>> --- /dev/null
>> +++ b/meta/recipes-kernel/linux/files/0001-perf-cs-etm-Move-definition-=
of-traceid_list-global-v.patch
>> @@ -0,0 +1,66 @@
>> +From 168200b6d6ea0cb5765943ec5da5b8149701f36a Mon Sep 17 00:00:00 2001
>> +From: Leo Yan <leo.yan@linaro.org>
>> +Date: Tue, 5 May 2020 21:36:42 +0800
>> +Subject: [PATCH] perf cs-etm: Move definition of 'traceid_list' global
>> + variable from header file
>> +
>> +The variable 'traceid_list' is defined in the header file cs-etm.h,
>> +if multiple C files include cs-etm.h the compiler might complaint for
>> +multiple definition of 'traceid_list'.
>> +
>> +To fix multiple definition error, move the definition of 'traceid_list=
'
>> +into cs-etm.c.
>> +
>> +Fixes: cd8bfd8c973e ("perf tools: Add processing of coresight metadata=
")
>> +Reported-by: Thomas Backlund <tmb@mageia.org>
>> +Signed-off-by: Leo Yan <leo.yan@linaro.org>
>> +Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
>> +Reviewed-by: Mike Leach <mike.leach@linaro.org>
>> +Tested-by: Mike Leach <mike.leach@linaro.org>
>> +Tested-by: Thomas Backlund <tmb@mageia.org>
>> +Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>
>> +Cc: Jiri Olsa <jolsa@redhat.com>
>> +Cc: Mark Rutland <mark.rutland@arm.com>
>> +Cc: Namhyung Kim <namhyung@kernel.org>
>> +Cc: Peter Zijlstra <peterz@infradead.org>
>> +Cc: Suzuki Poulouse <suzuki.poulose@arm.com>
>> +Cc: Tor Jeremiassen <tor@ti.com>
>> +Cc: linux-arm-kernel@lists.infradead.org
>> +Link: http://lore.kernel.org/lkml/20200505133642.4756-1-leo.yan@linaro=
.org
>> +Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
>> +---
>> + tools/perf/util/cs-etm.c | 3 +++
>> + tools/perf/util/cs-etm.h | 3 ---
>> + 2 files changed, 3 insertions(+), 3 deletions(-)
>> +
>> +diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
>> +index 3c802fde4954..c283223fb31f 100644
>> +--- a/tools/perf/util/cs-etm.c
>> ++++ b/tools/perf/util/cs-etm.c
>> +@@ -94,6 +94,9 @@ struct cs_etm_queue {
>> +       struct cs_etm_traceid_queue **traceid_queues;
>> + };
>> +
>> ++/* RB tree for quick conversion between traceID and metadata pointers=
 */
>> ++static struct intlist *traceid_list;
>> ++
>> + static int cs_etm__update_queues(struct cs_etm_auxtrace *etm);
>> + static int cs_etm__process_queues(struct cs_etm_auxtrace *etm);
>> + static int cs_etm__process_timeless_queues(struct cs_etm_auxtrace *et=
m,
>> +diff --git a/tools/perf/util/cs-etm.h b/tools/perf/util/cs-etm.h
>> +index 650ecc2a6349..4ad925d6d799 100644
>> +--- a/tools/perf/util/cs-etm.h
>> ++++ b/tools/perf/util/cs-etm.h
>> +@@ -114,9 +114,6 @@ enum cs_etm_isa {
>> +       CS_ETM_ISA_T32,
>> + };
>> +
>> +-/* RB tree for quick conversion between traceID and metadata pointers=
 */
>> +-struct intlist *traceid_list;
>> +-
>> + struct cs_etm_queue;
>> +
>> + struct cs_etm_packet {
>> +--
>> +2.28.0
>> +
>> diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipe=
s-kernel/linux/linux-yocto_5.4.bb
>> index f85c54e7f7..5a3180f36d 100644
>> --- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
>> +++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
>> @@ -32,6 +32,8 @@ SRC_URI =3D "git://git.yoctoproject.org/linux-yocto.g=
it;name=3Dmachine;branch=3D${KBRA
>>  SRC_URI_append_qemuppc64 =3D " file://defconfig"
>>  CFLAGS +=3D "-Wno-error"
>>
>> +SRC_URI_append =3D " file://0001-perf-cs-etm-Move-definition-of-tracei=
d_list-global-v.patch"
>> +
>>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dbbea815ee2795b2f4230826c0c6=
b8814"
>>  LINUX_VERSION ?=3D "5.4.57"
>>
>> --
>> 2.28.0
>>
>>=20
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await th=
ee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
