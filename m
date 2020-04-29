Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
 by mx.groups.io with SMTP id smtpd.web10.333.1588187610628073502
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Apr 2020 12:13:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=aVydPmMI;
 spf=pass (domain: gmail.com, ip: 209.85.217.43, mailfrom: armccurdy@gmail.com)
Received: by mail-vs1-f43.google.com with SMTP id l25so2160795vso.6
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2020 12:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=l2ByEEmsWfTmYJGml/OpPR8Bzj12xXzGEoGbJMq/PGg=;
        b=aVydPmMIznjVJxZI4ssJKU8P2sp2vdG5O1J1zVhF4+J1n+3Tj7S3Es+l2J3hJVTPzl
         /k3GX5WDVM7xABik9LkwAF1Qbmp5eJEDu3nCKYAPyMRmMDLZ0lv6gXu2NOUp4/sZ2YWL
         +GWL321mRZTYm8tquiFJg7gV2m/kwCD+s4pRtZ6nPssctqBQnxmMxxxV+kbg7WlvBhu5
         8rTJK52BS9BLcRmUTKnilWahNpkBRse6g6lC5ZP+i9EXLRrJx64zAfvBdr8p9+ZAm9g5
         Zl9v5030+PHJysywvvTPxoTyNPGBd3QKts0H3YPWkSi6UHRuLuLWKB8IucSXR+u1nUuD
         2vqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=l2ByEEmsWfTmYJGml/OpPR8Bzj12xXzGEoGbJMq/PGg=;
        b=jx6aZ06lyqq5q+D65gQu9GS7ur6FFYG1oOPCh6+Vl7W9UnLbXoqdu0RwlUSwI8v+nG
         IK7MglpnheU0WLd5ioXLCb5NHkk4OKpRDBsDIY7ib2BYvzcsj42+nq8uJnxfqpI2UPDf
         7FRVooanvo5PEr3yscnm+3IsgRijyJEhaFgspJh7rioN5kfkvOGQ1IiBjdGzXhnTuOhf
         e7VEAxRwt+BSHN8xMAhlfhBxQJc9K0y7aVKPemncl2s0Xu9UM8K5TYzVB3wmb0tnkh9u
         DPQK20t3jurCU+ZJzn/YO4M46HB9M1erSXdUoxJoZXDfmViFHqSdUAiTp1UEw6hBTkHW
         9LRQ==
X-Gm-Message-State: AGi0PubjmxblNIaL1e5Jo8LvzZ7Z665iZlZJI5ouil+bzYQbMERSmhDc
	Nxgt8BdWedJ302yPQaXfLxrFgTCQaIUBMqEIPVEnNA==
X-Google-Smtp-Source: APiQypKEDAV5gwF23M5VP/8gl6U6Gy3cqim24Iuin1lK4ss6zmhc4vs2Wqi7hhydH1+xUO30LspySgRDOqBFxgoST1g=
X-Received: by 2002:a67:e998:: with SMTP id b24mr26907254vso.222.1588187609363;
 Wed, 29 Apr 2020 12:13:29 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1588175775.git.steve@sakoman.com> <f03ee1a2a697394f3c4168350089526ef6b87de6.1588175775.git.steve@sakoman.com>
In-Reply-To: <f03ee1a2a697394f3c4168350089526ef6b87de6.1588175775.git.steve@sakoman.com>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Wed, 29 Apr 2020 12:13:20 -0700
Message-ID: <CAJ86T=WRV+Uny9-4J--0sS2cr5CAtA=D4gFXHgm=-pXsX=BjKg@mail.gmail.com>
Subject: Re: [OE-core][dunfell 02/16] bzip2/pbzip2: Correct license information
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 29, 2020 at 9:11 AM Steve Sakoman <steve@sakoman.com> wrote:
>
> From: Richard Purdie <richard.purdie@linuxfoundation.org>
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
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
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

The corresponding update to the busybox recipe should be merged too.


> diff --git a/meta/recipes-extended/bzip2/bzip2_1.0.8.bb b/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
> index 8e9b779e67..d58f553a49 100644
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
> index 1275cc0097..d7450c73c1 100644
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
> 2.17.1
>
> 
