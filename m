Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web12.8481.1621943324076769442
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 May 2021 04:48:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=C+3ISUMd;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id 6so22509438pgk.5
        for <openembedded-core@lists.openembedded.org>; Tue, 25 May 2021 04:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=HZEvDujruPYq9T9+XlgENpS6girXcxahakgB5XVzpdg=;
        b=C+3ISUMd2ZrFUoh4BU9s16R+lxqBShGP28m6xlkb/TWctDS/J8LInLmmT/vbxOeTtq
         OsB+8wtOCXM85i4qlR8KHgZ9eXfVe+dM50xsezMbqJRdsjipFTI2OnSE9ai5KPrL0ooC
         XO0Lbx7dno2T91DyDm/dy6+JFk+Jy42M7BD+mwJ3QPpoEGzme9nKVMHWt/GSmZ0a2zEQ
         N4PDf7ycGdp4T91D1gvNkzGyeRNzhNJiGrOhVLm1AWacR5eWdo/fmng4b69cNXhHwMb/
         DD8rrGhbyryPY5iVLwzLSNFqAluBqnwiQiMkmSkRdthlB3LZvUW3AAdRUDTvtbYntu4L
         CJnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=HZEvDujruPYq9T9+XlgENpS6girXcxahakgB5XVzpdg=;
        b=V9CjTHPUs6Nh4Doc2WuJgJqkW00FaBqRjpinl3Zho8Ao5U3isoDEzqFRMuja3zu/IO
         NtBcQGYkKE1b4SDv6BjylmROU3JB6e6tLcNkPi/30htv+Ab5D0I1OyyLAwDM5YkXn/Mm
         ZVkWXsMLsJMrhWtc6vaZYCsgf4nAAzfmkVw4LDb41zcoguBIwzmcvSG2IdokN199MI+M
         m6zOy4PBhfz168F1z5xW6v97Di+YvhbSimBq8srCfncaUzwKZZG0BzlAzJe/g7WxsH03
         0mDRDrB/LvJXaF4HS+9s/ERkL8NFtxw5RlhSGW7liRytPQumO09uPGeuyNvl7N3/EElv
         kgEg==
X-Gm-Message-State: AOAM531Z3Yl61xhQ5Tfsv0AyefPnSJaldkOWX8V90rWgrYc69NcZE2fJ
	M7swgpwagaPEFvsER+mk7CY=
X-Google-Smtp-Source: ABdhPJxNG3MlaaDrgnhVrWteOj01JMKlD5kmIocKMJ/MdDQwVoDSeMtt94WeBXftqrjwMxrl7mRI5g==
X-Received: by 2002:a62:5306:0:b029:2de:6ce0:5526 with SMTP id h6-20020a6253060000b02902de6ce05526mr29638541pfb.13.1621943323524;
        Tue, 25 May 2021 04:48:43 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:9834:cb1a:11fd:affb? ([2601:202:4180:a5c0:9834:cb1a:11fd:affb])
        by smtp.gmail.com with ESMTPSA id 35sm13650941pgq.91.2021.05.25.04.48.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 May 2021 04:48:43 -0700 (PDT)
Subject: Re: [OE-core] [meta-oe][dunfell][PATCH] opencv: Add fix for CVE-2019-5063 and CVE-2019-5064
To: akash hadke <akash.hadke@kpit.com>,
 openembedded-core@lists.openembedded.org, raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com, harpritkaur.bhandari@kpit.com
References: <1621929554-4038-1-git-send-email-akash.hadke@kpit.com>
From: "Armin Kuster" <akuster808@gmail.com>
Message-ID: <6aaa2037-e3b2-8269-98b4-d64b525b41ff@gmail.com>
Date: Tue, 25 May 2021 04:48:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1621929554-4038-1-git-send-email-akash.hadke@kpit.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 5/25/21 12:59 AM, akash hadke wrote:
> From: "akash.hadke" <akash.hadke@kpit.com>
>
> Added fix for below CVE's
>
> CVE-2019-5063
> CVE-2019-5064
> Link: https://github.com/opencv/opencv/commit/f42d5399aac80d371b17d689851406669c9b9111.patch
>
> Signed-off-by: akash hadke <akash.hadke@kpit.com>

wrong ml. should be openembedded-devel@.

patch noted.

-armin
> ---
>  .../opencv/CVE-2019-5063_and_2019-5064.patch       | 78 ++++++++++++++++++++++
>  meta-oe/recipes-support/opencv/opencv_4.1.0.bb     |  1 +
>  2 files changed, 79 insertions(+)
>  create mode 100644 meta-oe/recipes-support/opencv/opencv/CVE-2019-5063_and_2019-5064.patch
>
> diff --git a/meta-oe/recipes-support/opencv/opencv/CVE-2019-5063_and_2019-5064.patch b/meta-oe/recipes-support/opencv/opencv/CVE-2019-5063_and_2019-5064.patch
> new file mode 100644
> index 0000000..b4d5e6d
> --- /dev/null
> +++ b/meta-oe/recipes-support/opencv/opencv/CVE-2019-5063_and_2019-5064.patch
> @@ -0,0 +1,78 @@
> +From f42d5399aac80d371b17d689851406669c9b9111 Mon Sep 17 00:00:00 2001
> +From: Alexander Alekhin <alexander.alekhin@intel.com>
> +Date: Thu, 7 Nov 2019 14:01:51 +0300
> +Subject: [PATCH] core(persistence): add more checks for implementation
> + limitations
> +
> +Signed-off-by: akash hadke <akash.hadke@kpit.com>
> +---
> + modules/core/src/persistence_json.cpp | 8 ++++++++
> + modules/core/src/persistence_xml.cpp  | 6 ++++--
> + 2 files changed, 12 insertions(+), 2 deletions(-)
> +---
> +CVE: CVE-2019-5063
> +CVE: CVE-2019-5064
> +Upstream-Status: Backport [https://github.com/opencv/opencv/commit/f42d5399aac80d371b17d689851406669c9b9111.patch]
> +---
> +diff --git a/modules/core/src/persistence_json.cpp b/modules/core/src/persistence_json.cpp
> +index 89914e6534f..2efdf17d3f5 100644
> +--- a/modules/core/src/persistence_json.cpp
> ++++ b/modules/core/src/persistence_json.cpp
> +@@ -578,10 +578,14 @@ class JSONParser : public FileStorageParser
> +                             sz = (int)(ptr - beg);
> +                             if( sz > 0 )
> +                             {
> ++                                if (i + sz >= CV_FS_MAX_LEN)
> ++                                    CV_PARSE_ERROR_CPP("string is too long");
> +                                 memcpy(buf + i, beg, sz);
> +                                 i += sz;
> +                             }
> +                             ptr++;
> ++                            if (i + 1 >= CV_FS_MAX_LEN)
> ++                                CV_PARSE_ERROR_CPP("string is too long");
> +                             switch ( *ptr )
> +                             {
> +                             case '\\':
> +@@ -605,6 +609,8 @@ class JSONParser : public FileStorageParser
> +                             sz = (int)(ptr - beg);
> +                             if( sz > 0 )
> +                             {
> ++                                if (i + sz >= CV_FS_MAX_LEN)
> ++                                    CV_PARSE_ERROR_CPP("string is too long");
> +                                 memcpy(buf + i, beg, sz);
> +                                 i += sz;
> +                             }
> +@@ -620,6 +626,8 @@ class JSONParser : public FileStorageParser
> +                             sz = (int)(ptr - beg);
> +                             if( sz > 0 )
> +                             {
> ++                                if (i + sz >= CV_FS_MAX_LEN)
> ++                                    CV_PARSE_ERROR_CPP("string is too long");
> +                                 memcpy(buf + i, beg, sz);
> +                                 i += sz;
> +                             }
> +diff --git a/modules/core/src/persistence_xml.cpp b/modules/core/src/persistence_xml.cpp
> +index 89876dd3da8..52b53744254 100644
> +--- a/modules/core/src/persistence_xml.cpp
> ++++ b/modules/core/src/persistence_xml.cpp
> +@@ -627,6 +627,8 @@ class XMLParser : public FileStorageParser
> +                                         c = '\"';
> +                                     else
> +                                     {
> ++                                        if (len + 2 + i >= CV_FS_MAX_LEN)
> ++                                            CV_PARSE_ERROR_CPP("string is too long");
> +                                         memcpy( strbuf + i, ptr-1, len + 2 );
> +                                         i += len + 2;
> +                                     }
> +@@ -635,9 +637,9 @@ class XMLParser : public FileStorageParser
> +                                 CV_PERSISTENCE_CHECK_END_OF_BUFFER_BUG_CPP();
> +                             }
> +                         }
> ++                        if (i + 1 >= CV_FS_MAX_LEN)
> ++                            CV_PARSE_ERROR_CPP("Too long string literal");
> +                         strbuf[i++] = c;
> +-                        if( i >= CV_FS_MAX_LEN )
> +-                            CV_PARSE_ERROR_CPP( "Too long string literal" );
> +                     }
> +                     elem->setValue(FileNode::STRING, strbuf, i);
> +                 }
> diff --git a/meta-oe/recipes-support/opencv/opencv_4.1.0.bb b/meta-oe/recipes-support/opencv/opencv_4.1.0.bb
> index de708fd..19d5d0c 100644
> --- a/meta-oe/recipes-support/opencv/opencv_4.1.0.bb
> +++ b/meta-oe/recipes-support/opencv/opencv_4.1.0.bb
> @@ -54,6 +54,7 @@ SRC_URI = "git://github.com/opencv/opencv.git;name=opencv \
>             file://CVE-2019-14493.patch \
>             file://CVE-2019-15939.patch \
>             file://CVE-2019-19624.patch \
> +           file://CVE-2019-5063_and_2019-5064.patch \
>             "
>  PV = "4.1.0"
>  
>
> 
>

