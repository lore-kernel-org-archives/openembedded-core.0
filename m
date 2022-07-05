Return-Path: <jacob.kroon@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9612FC433EF
	for <webhook@archiver.kernel.org>; Tue,  5 Jul 2022 04:36:55 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web09.80996.1656995810229555653
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Jul 2022 21:36:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fa6Lq67r;
 spf=pass (domain: gmail.com, ip: 209.85.167.54,
 mailfrom: jacob.kroon@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id t19so17934089lfl.5
        for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Jul 2022 21:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=NwsCqQuf+eU6Y9Z5vznwRoc9d8d8f4GyJo4JsXxxdd8=;
        b=fa6Lq67rmskoOqQKPnUA1KM/pT5GTsdlBUyJVLn1xl++3efItH9NwLI42CBB+GLeW8
         iKR1wB6DT5Jk2iPNIaOh02EsBfjXtdNWPy6JKEvS7ZQqSNTmrD5m/c+DvVYeOmE71Sq9
         z02/dICIxBI3AZYGG6f+15AsttOHPx7JCmNI0G/bsAWrbFkJB/77LGoJp0+6OLV/BUNT
         mcvOv5/zGoy1atumI0Ul/mcWBV0rGh1kHll/fuA8JE/THiWIMxGLQr+x1nwm7BLMMU97
         PuwfXnrEfu2NKa/j5oxDU2p2x+kFa9fCTAEXmNdZs+lzRQElj1N6GL3lhU6yusOSy5i9
         zU3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=NwsCqQuf+eU6Y9Z5vznwRoc9d8d8f4GyJo4JsXxxdd8=;
        b=mXcW1NMb0zqcAXkGrxSaMoVbosSrW136GqSl7zXJ6vFwPqltt2cp5iiNEjXlz8kQUF
         MpAsAs4ZuEMbSH2Gj5ac6Vlz2sp0Ll5aaucf7CaFQ6e8B8wNIRaqwM4UAYAg9v3/EByT
         x7Rkg+3PPMOdv0m9qo9dVvPAIJFBRRSKuzq9clN1gsHZHnS3DsQjFChzo5yNGQU3hvGI
         mJPiAL9Ac0UWEur8ASZWrckB9T58fk19gvmlXuqie6BhnqBNZd3PlWpexz52IhEq69uT
         +deLM329sJrQznR86Oobgl7PjsjtjGyrDIx9EnYHTwnrUyEb0PL+KjJVJqr/fBdwj7Jd
         KSvg==
X-Gm-Message-State: AJIora+aLa3LwcbrCLeIgukN7fYbsydPULeNFY1hsGpYGdSRBT+4KWDH
	S4hqYpNYGhKqrg6VjsmmFbQ=
X-Google-Smtp-Source: 
 AGRyM1s/yVj3SnRUOVRd5NdJ/6HN/IiCGC9g2vO6SstajHPPGR4KL+iy0TfSWIZHwZgFZlYAJVeK1Q==
X-Received: by 2002:ac2:4214:0:b0:481:6399:eaae with SMTP id
 y20-20020ac24214000000b004816399eaaemr12602813lfh.634.1656995808189;
        Mon, 04 Jul 2022 21:36:48 -0700 (PDT)
Received: from [192.168.10.102] (89-253-118-72.customers.ownit.se.
 [89.253.118.72])
        by smtp.gmail.com with ESMTPSA id
 u5-20020a05651220c500b004797b92f4cdsm5479865lfr.91.2022.07.04.21.36.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Jul 2022 21:36:47 -0700 (PDT)
Message-ID: <02d29713-0c1a-19f7-6494-100c7524bf81@gmail.com>
Date: Tue, 5 Jul 2022 06:36:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [OE-core] [PATCH] gperf: Add a patch to work around
 reproducibility issues
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20220704132504.913976-1-richard.purdie@linuxfoundation.org>
From: Jacob Kroon <jacob.kroon@gmail.com>
In-Reply-To: <20220704132504.913976-1-richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Jul 2022 04:36:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167637

On 7/4/22 15:25, Richard Purdie wrote:
> Add a patch to avoid writing the full pathname to gperf into source
> files which leads to reproducibility issues.
> 
> This fixes issues with systemd reproducibility in particular.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>   .../gperf/gperf/reproducibility.patch         | 26 +++++++++++++++++++
>   meta/recipes-extended/gperf/gperf_3.1.bb      |  2 ++
>   2 files changed, 28 insertions(+)
>   create mode 100644 meta/recipes-extended/gperf/gperf/reproducibility.patch
> 
> diff --git a/meta/recipes-extended/gperf/gperf/reproducibility.patch b/meta/recipes-extended/gperf/gperf/reproducibility.patch
> new file mode 100644
> index 00000000000..9f80828dbd7
> --- /dev/null
> +++ b/meta/recipes-extended/gperf/gperf/reproducibility.patch
> @@ -0,0 +1,26 @@
> +By default gperf puts a header into generated files with the full path to
> +the tool along with the commandline used. This patch removes the path to
> +the binary, allowing reproducible source files (which can be included in
> +debug source packages).
> +
> +Upstream-Status: Pending
> +Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> +
> +Index: gperf-3.1/src/options.cc
> +===================================================================
> +--- gperf-3.1.orig/src/options.cc
> ++++ gperf-3.1/src/options.cc
> +@@ -280,6 +280,13 @@ Options::print_options () const
> +     {
> +       const char *arg = _argument_vector[i];
> +
> ++      if (i == 0) {
> ++          const char *shortarg = strrchr(arg, '/');
> ++          if (shortarg) {
> ++              arg = shortarg + 1;
> ++          }
> ++      }
> ++
> +       /* Escape arg if it contains shell metacharacters.  */
> +       if (*arg == '-')
> +         {
> diff --git a/meta/recipes-extended/gperf/gperf_3.1.bb b/meta/recipes-extended/gperf/gperf_3.1.bb
> index 82750fca05c..3564ac0805b 100644
> --- a/meta/recipes-extended/gperf/gperf_3.1.bb
> +++ b/meta/recipes-extended/gperf/gperf_3.1.bb
> @@ -9,6 +9,8 @@ SRC_URI  = "${GNU_MIRROR}/${BPN}/${BP}.tar.gz"
>   SRC_URI[md5sum] = "9e251c0a618ad0824b51117d5d9db87e"
>   SRC_URI[sha256sum] = "588546b945bba4b70b6a3a616e80b4ab466e3f33024a352fc2198112cdbb3ae2"
>   
> +SRC_URI:append = " file://reproducibility.patch"
> +

Can I ask if :append was really necessary here, couldn't we just have 
used += ? I'm a little saddened with all these :append/:prepend/:remove 
creeping in to OE-Core.

Jacob

