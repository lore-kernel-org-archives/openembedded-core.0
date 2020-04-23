Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com [209.85.160.196])
 by mx.groups.io with SMTP id smtpd.web11.6641.1587602457874593414
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Apr 2020 17:40:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MlIBFCFp;
 spf=pass (domain: gmail.com, ip: 209.85.160.196, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f196.google.com with SMTP id o10so3488435qtr.6
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Apr 2020 17:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=d+R0CwBSGUsJ3Ixvb5UhNWkBlOyJ5RdmA9s/ldV8Mrs=;
        b=MlIBFCFpSsdHBmKf9BMq1q8A3N8YxG3R4UUnAgNC2uVZ65wNRuZ3KAWRSdKbRDSp7a
         YKvXMc7k7XMGxq47wssyVYpFzNA9vK00T+NkeitmS3me2JZg/8Em6IEmNrshRGYSfDiv
         fljBZM0eP/f6Dc90dDs0Da2o1ebs0ZzKH7UR0GBDOqod0pA0Ngq36cMFLgqnALBobsRm
         N/YbzPvLjpJZqt4O4kaoABgaF+EwWzHqPwZwwdW6d1iRR1hB7GWt0kPi4IdNSkduZLQV
         XYQsXb9A8tD3HZNZvq6cVWJVDfZzQlcyBmpi51hgi3oW5heWM2z1JxVENFpNZXK87Q3s
         1ICQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=d+R0CwBSGUsJ3Ixvb5UhNWkBlOyJ5RdmA9s/ldV8Mrs=;
        b=mF8qqAnS7rYslc22aNJYh1lQtGt7bWQXKHI1bhr3DB08xG/SmEZELVTCOyuzphdvyg
         NhNkTOVy1ufxl4yLtWsFE0a6PsPT1gb25LU/jNLrAZrPWs0JRl+PduvQo1QSzr3wsG4H
         84f+81rJgSZbKZ2DCkJA2tyL/EmhWbCxO07hydijWQlaaUbpGG6EpgKAZBidGh6QONUj
         BQSgPEssuMInYNU/phbkrQU7YXsgHnM5RJPYGUvDZiyycRPqOOeNuEx7+iJQ3qFiIpHi
         FwTrOYWBkTAyHpTug8C0IT5WPo/apzNDYzkmlvXQ54aKrPAoEVmqHiDf4llkabhOnkeT
         GE+Q==
X-Gm-Message-State: AGi0Pua3+HqDD/B61XmtwsnGAPJiaFYTbXo0dLv2oW8ShtVI1/u/BwvO
	Dzqcw60DYx8x61FKcmLZJGTAHRsD/h3pF/s5Qic=
X-Google-Smtp-Source: APiQypLBoX/dXxQXYBe1zlkL1mcbRB29hxmtdcTtiVWTWPCG3pBdC7dJFtimH2kkpK2sW0Tr8YLioWvGZ1lp7nV6hdo=
X-Received: by 2002:ac8:24b7:: with SMTP id s52mr1420672qts.316.1587602456693;
 Wed, 22 Apr 2020 17:40:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200414133703.565115-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20200414133703.565115-1-richard.purdie@linuxfoundation.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 22 Apr 2020 17:40:30 -0700
Message-ID: <CAMKF1speYDnd7i5qmEysmRj-T2McR+Cp7nKh09mRXc_ckiWVZw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] bzip2/pbzip2: Correct license information
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	licensing@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

on master-next I am seeing

WARNING: pbzip2-native-1.1.13-r0 do_populate_lic: pbzip2-native: No
generic license file exists for: bzip-1.0.6 in any provider

I guess it is related to this patch

On Tue, Apr 14, 2020 at 6:37 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> The license of pbzip2 looks slightly BSD like but is in fact the bzip2
> license. The SPDX identifier for this is "bzip-1.0.6" since there is
> another version of the bzip license out there.
>
> To clear up all the confusion, use the SPDX license name and update
> both recipes to refer to it. The copyright information is slightly
> different between the codebases but the license looks the same.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/files/common-licenses/{bzip2 => bzip2-1.0.6} | 0
>  meta/recipes-extended/bzip2/bzip2_1.0.8.bb        | 2 +-
>  meta/recipes-extended/pbzip2/pbzip2_1.1.13.bb     | 2 +-
>  3 files changed, 2 insertions(+), 2 deletions(-)
>  rename meta/files/common-licenses/{bzip2 => bzip2-1.0.6} (100%)
>
> diff --git a/meta/files/common-licenses/bzip2 b/meta/files/common-licenses/bzip2-1.0.6
> similarity index 100%
> rename from meta/files/common-licenses/bzip2
> rename to meta/files/common-licenses/bzip2-1.0.6
> diff --git a/meta/recipes-extended/bzip2/bzip2_1.0.8.bb b/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
> index 8e9b779e672..d58f553a49a 100644
> --- a/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
> +++ b/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
> @@ -4,7 +4,7 @@ Huffman coding. Compression is generally considerably better than that achieved
>  LZ77/LZ78-based compressors, and approaches the performance of the PPM family of statistical compressors."
>  HOMEPAGE = "https://sourceware.org/bzip2/"
>  SECTION = "console/utils"
> -LICENSE = "bzip2"
> +LICENSE = "bzip2-1.0.6"
>  LIC_FILES_CHKSUM = "file://LICENSE;beginline=4;endline=37;md5=600af43c50f1fcb82e32f19b32df4664"
>
>  SRC_URI = "https://sourceware.org/pub/${BPN}/${BPN}-${PV}.tar.gz \
> diff --git a/meta/recipes-extended/pbzip2/pbzip2_1.1.13.bb b/meta/recipes-extended/pbzip2/pbzip2_1.1.13.bb
> index 1275cc00972..d7450c73c11 100644
> --- a/meta/recipes-extended/pbzip2/pbzip2_1.1.13.bb
> +++ b/meta/recipes-extended/pbzip2/pbzip2_1.1.13.bb
> @@ -5,7 +5,7 @@ machines. The output of this version is fully compatible with bzip2 v1.0.2 or \
>  newer (ie: anything compressed with pbzip2 can be decompressed with bzip2)."
>  HOMEPAGE = "http://compression.ca/pbzip2/"
>  SECTION = "console/utils"
> -LICENSE = "BSD-4-Clause"
> +LICENSE = "bzip-1.0.6"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=398b8832c6f840cfebd20ab2be6a3743"
>
>  DEPENDS = "bzip2"
> --
> 2.25.1
>
> 
