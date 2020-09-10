Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web12.10206.1599696457600098045
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2020 17:07:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MD3NOQ7w;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id o68so3711814pfg.2
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2020 17:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=x2whzHog8bt/aWPII0vX6Q89EKDzUrDoehzCScCrrhk=;
        b=MD3NOQ7w3rLVHb0wkfatbU19QBqgoyk3j3CnuDiw5wh+MTI2QlTmzkN0XCx53ylanM
         WthMkVnULAkOYwOxpTOG3Lg4WkpPkdpQCro82+5dIGFYBXj9XJcYCVpJYEC5TvkdLkzu
         VQvxEueIHpiUXlxqXSkRPd37G51BVaLe4xnfCoqOL3Rq+j6A/bMLIzSCkheRxJ1EsbLb
         tSA5rBUw4FJNy+4NpTk946mMy7CyUYFcoZ7wmiy+nqlmlc/YMntWBl1aUIkq+CHl5uFd
         6JDpoDPFumfE1LfkUCbc1Y4OHRfks1iXaT5XCYPkYNZr1cvNyMXVXYqzelA4NctEgYum
         9VJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=x2whzHog8bt/aWPII0vX6Q89EKDzUrDoehzCScCrrhk=;
        b=cl52VY4jXnSKYY5uaMk887JLLfUWBAyxz2l/fJw+DiCefcirbmMn2xu5AwIdcQ5b4J
         j6v7s72YW+C93wpqd8OdHuow2kK99ovLVRh6LrjQqAGODL1hHS7dHLYUYxi3fUrkIYAK
         TBkFSFGfO4XOaoOc68MOi2hJP0Mt3lYHV6J23Jo6jmSisPq82HLlFhXMeuqON5PY/N0x
         s3LrgfXZP0lFt641cCcEHnxRoB6bSWUag3tx+Be4AAW0udf7M3rKPQEkNPKcgm96gym4
         fpV58iOuD01zR442oG+ujriE03G3j9hGZY7D+WxvaEc1n73aHpWLw8gRSholKaitqfsP
         P9eA==
X-Gm-Message-State: AOAM530nYN723J0wsklh76Vvt2eV+eC8YP9edykm//qRmYAUhQef/Obi
	2EsqHoEtFDEOka56tg6z6FkCeWSX3owR3g==
X-Google-Smtp-Source: ABdhPJzf2T4mshV2/HZV9C/IGz/+LnMa70TZPehl46bbn28AHxmcSyt/6SOO/oDxzrsY5JHf8ETzqQ==
X-Received: by 2002:a62:178d:0:b029:13e:d13d:a0f8 with SMTP id 135-20020a62178d0000b029013ed13da0f8mr3035359pfx.20.1599696456729;
        Wed, 09 Sep 2020 17:07:36 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0::ff6e? ([2601:646:9200:4e0::ff6e])
        by smtp.gmail.com with ESMTPSA id r15sm3281236pgg.17.2020.09.09.17.07.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2020 17:07:36 -0700 (PDT)
Subject: Re: [OE-core] [PATCH] libxml2: Fix CVE-2020-24977
To: Ovidiu Panait <ovidiu.panait@windriver.com>,
 openembedded-core@lists.openembedded.org
References: <20200909081153.5022-1-ovidiu.panait@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <004c88be-3a4f-9e06-8987-3a4d862f643d@gmail.com>
Date: Wed, 9 Sep 2020 17:07:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200909081153.5022-1-ovidiu.panait@windriver.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 9/9/20 1:11 AM, Ovidiu Panait wrote:
> GNOME project libxml2 v2.9.10 and earlier have a global Buffer Overflow
> vulnerability in xmlEncodeEntitiesInternal at libxml2/entities.c. The issue has
> been fixed in commit 8e7c20a1 (20910-GITv2.9.10-103-g8e7c20a1).
> 
> Reference:
> https://gitlab.gnome.org/GNOME/libxml2/-/issues/178
> 
> Upstream patch:
> https://gitlab.gnome.org/GNOME/libxml2/-/commit/50f06b3efb638efb0abd95dc62dca05ae67882c2
> 

Do we need this on dunfell too ?


> Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
> ---
>  .../libxml/libxml2/CVE-2020-24977.patch       | 41 +++++++++++++++++++
>  meta/recipes-core/libxml/libxml2_2.9.10.bb    |  1 +
>  2 files changed, 42 insertions(+)
>  create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2020-24977.patch
> 
> diff --git a/meta/recipes-core/libxml/libxml2/CVE-2020-24977.patch b/meta/recipes-core/libxml/libxml2/CVE-2020-24977.patch
> new file mode 100644
> index 0000000000..8224346660
> --- /dev/null
> +++ b/meta/recipes-core/libxml/libxml2/CVE-2020-24977.patch
> @@ -0,0 +1,41 @@
> +From 50f06b3efb638efb0abd95dc62dca05ae67882c2 Mon Sep 17 00:00:00 2001
> +From: Nick Wellnhofer <wellnhofer@aevum.de>
> +Date: Fri, 7 Aug 2020 21:54:27 +0200
> +Subject: [PATCH] Fix out-of-bounds read with 'xmllint --htmlout'
> +
> +Make sure that truncated UTF-8 sequences don't cause an out-of-bounds
> +array access.
> +
> +Thanks to @SuhwanSong and the Agency for Defense Development (ADD) for
> +the report.
> +
> +Fixes #178.
> +
> +CVE: CVE-2020-24977
> +Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/50f06b3efb638efb0abd95dc62dca05ae67882c2]
> +
> +Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
> +---
> + xmllint.c | 6 ++++++
> + 1 file changed, 6 insertions(+)
> +
> +diff --git a/xmllint.c b/xmllint.c
> +index f6a8e463..c647486f 100644
> +--- a/xmllint.c
> ++++ b/xmllint.c
> +@@ -528,6 +528,12 @@ static void
> + xmlHTMLEncodeSend(void) {
> +     char *result;
> + 
> ++    /*
> ++     * xmlEncodeEntitiesReentrant assumes valid UTF-8, but the buffer might
> ++     * end with a truncated UTF-8 sequence. This is a hack to at least avoid
> ++     * an out-of-bounds read.
> ++     */
> ++    memset(&buffer[sizeof(buffer)-4], 0, 4);
> +     result = (char *) xmlEncodeEntitiesReentrant(NULL, BAD_CAST buffer);
> +     if (result) {
> + 	xmlGenericError(xmlGenericErrorContext, "%s", result);
> +-- 
> +2.17.1
> +
> diff --git a/meta/recipes-core/libxml/libxml2_2.9.10.bb b/meta/recipes-core/libxml/libxml2_2.9.10.bb
> index d11b083e8b..90890ffaed 100644
> --- a/meta/recipes-core/libxml/libxml2_2.9.10.bb
> +++ b/meta/recipes-core/libxml/libxml2_2.9.10.bb
> @@ -22,6 +22,7 @@ SRC_URI = "http://www.xmlsoft.org/sources/libxml2-${PV}.tar.gz;name=libtar \
>             file://fix-execution-of-ptests.patch \
>             file://CVE-2020-7595.patch \
>             file://CVE-2019-20388.patch \
> +           file://CVE-2020-24977.patch \
>             "
>  
>  SRC_URI[libtar.md5sum] = "10942a1dc23137a8aa07f0639cbfece5"
> 
> 
> 
> 
