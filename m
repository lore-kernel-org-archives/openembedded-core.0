Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web12.654.1617210824236879222
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Mar 2021 10:13:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OoLGLkIu;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id v23so8240564ple.9
        for <openembedded-core@lists.openembedded.org>; Wed, 31 Mar 2021 10:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:references:from:organization:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rHeKzXiaZhAH8oHmdL0NE0qCsklwnvv9rKhZzrR7Tfk=;
        b=OoLGLkIut3oXpDmHKGkRIsdJ8JqwZM1EPXgc03J1rankgpmh5gGRZXEUQyHoZ6f1ni
         A+cAbXbtfTJHFlMab4tqXb1bETtX29ynmhTXiKR2yZBCrLj0IfEUMli1Ss/QLBn1Y15I
         WfDQ2cYfdylxwFqgk0lft9FWXG83nwM6etdyvUL22NKudbahqMP4DWgot4+t8y1MYECS
         vmoi23itxQsnw7Vf3Av7nIwrbiS3ubXAVOTKV9Y8Eq5fycve9/BwcAT64thbbxLoPxA/
         W+fk39fj0lLx0f5HHBxemSj3wExlg84jKg6xgn+zj1IPFewg2CNH9AG/cvoSkXJRktLb
         HSdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:from:organization:subject
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=rHeKzXiaZhAH8oHmdL0NE0qCsklwnvv9rKhZzrR7Tfk=;
        b=pz6ny89ho6q+PLuBcJBFFq5yhkUdmsRssLVMwcvUyWuuL0puYDdD5Flb0kT0b3HAhd
         FwXpj7p9ZdjTHAQY7J4UJF17CEvm4EyhDWsr7k8XkqlUhTMfsHotvyOITih7EcwqdcRc
         B3D4ylAZX8vXdccVIitAD1jU6b4eW9FtSsMqkrr3yQsoIB45oPZXd/ADWu7LKzbgaX9G
         JET3tonJ+/6Dyu8Kkkz03VNvUEmW0N/DxM0LGpqL9hYmCPZEwiplVN+YIrR306rQWDCO
         07LDZuGbjUPHRLvsh9HDhS7BAK2M6Sptz4BPguYJEVvlAw1jQl1iwCtt1JMe5Jx+23wS
         FB+A==
X-Gm-Message-State: AOAM5300jKl1fIVedbl5D4mZbLL9nSAD0eHNY+wzxRVHcx8HED+N3lbp
	+Cz3bu6CSWbvkz1jqU1IjCW4/AwK1VJIfg==
X-Google-Smtp-Source: ABdhPJxfYyQoFrW1ck+k3Qei6vumZycj9dH3fK4Oc+WVClIs0hYgsywdzRozs8oWTodCGaZ8eBwPdw==
X-Received: by 2002:a17:902:ee02:b029:e6:5397:d79c with SMTP id z2-20020a170902ee02b02900e65397d79cmr4175585plb.21.1617210823459;
        Wed, 31 Mar 2021 10:13:43 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:9042:8df6:cee8:da6a? ([2601:646:9200:a0f0:9042:8df6:cee8:da6a])
        by smtp.gmail.com with ESMTPSA id 132sm3014778pfu.158.2021.03.31.10.13.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Mar 2021 10:13:43 -0700 (PDT)
To: Martin Jansa <Martin.Jansa@gmail.com>,
 Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <20210331122254.121192-1-alex.kanavin@gmail.com>
 <CA+chaQeR3hT_jAUUjM4uEMF+U2a60tR-6kKiL1v-58+1Euo++A@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Subject: Re: [OE-core] [PATCH 1/2] mesa: update 21.0.0 -> 21.0.1
Message-ID: <d4b500da-5aec-075e-4632-8a65852b1600@gmail.com>
Date: Wed, 31 Mar 2021 10:13:42 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQeR3hT_jAUUjM4uEMF+U2a60tR-6kKiL1v-58+1Euo++A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 3/31/21 6:05 AM, Martin Jansa wrote:
> Are you going to fix meta-gl issue with swrast still in DRIDRIVERS 
> reported on previous upgrade?
> 
> https://lists.openembedded.org/g/openembedded-core/message/149775 
> <https://lists.openembedded.org/g/openembedded-core/message/149775>
> 
> https://lists.openembedded.org/g/openembedded-core/message/149779 
> <https://lists.openembedded.org/g/openembedded-core/message/149779>
> I don't know what exactly AB builds, but it's easy to reproduce locally, 
> something like:
> DISTRO_FEATURES_remove = "x11"
> PREFERRED_PROVIDER_virtual/libgl = "mesa-gl"
> PREFERRED_PROVIDER_virtual/mesa = "mesa-gl"
> bitbake mesa-gl
> should be enough to see build failure.

it is a build regression. mesa and mesa-gl should be updated in sync and 
especially if you reported the fallout and if it went unaddressed is sad.

Could you try a patch somethiing like this and see if it helps.

diff --git a/meta/recipes-graphics/mesa/mesa-gl_21.0.0.bb 
b/meta/recipes-graphics/mesa/mesa-gl_21.0.0.bb
index e50782be1c..fc8b4f7504 100644
--- a/meta/recipes-graphics/mesa/mesa-gl_21.0.0.bb
+++ b/meta/recipes-graphics/mesa/mesa-gl_21.0.0.bb
@@ -12,4 +12,4 @@ PACKAGECONFIG ??= "opengl dri 
${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x1
  PACKAGECONFIG_class-target = "opengl dri 
${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', 'osmesa', d)}"

  # When NOT using X11, we need to make sure we have swrast available.
-DRIDRIVERS_append = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '', 
',swrast', d)}"
+GALLIUMDRIVERS_append = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 
'', ',swrast', d)}"

> 
> On Wed, Mar 31, 2021 at 2:44 PM Alexander Kanavin 
> <alex.kanavin@gmail.com <mailto:alex.kanavin@gmail.com>> wrote:
> 
>     Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com
>     <mailto:alex.kanavin@gmail.com>>
>     ---
>       .../mesa/{mesa-gl_21.0.0.bb <http://mesa-gl_21.0.0.bb> =>
>     mesa-gl_21.0.1.bb <http://mesa-gl_21.0.1.bb>}               | 0
>       meta/recipes-graphics/mesa/mesa.inc                             | 2 +-
>       meta/recipes-graphics/mesa/{mesa_21.0.0.bb <http://mesa_21.0.0.bb>
>     => mesa_21.0.1.bb <http://mesa_21.0.1.bb>}   | 0
>       3 files changed, 1 insertion(+), 1 deletion(-)
>       rename meta/recipes-graphics/mesa/{mesa-gl_21.0.0.bb
>     <http://mesa-gl_21.0.0.bb> => mesa-gl_21.0.1.bb
>     <http://mesa-gl_21.0.1.bb>} (100%)
>       rename meta/recipes-graphics/mesa/{mesa_21.0.0.bb
>     <http://mesa_21.0.0.bb> => mesa_21.0.1.bb <http://mesa_21.0.1.bb>}
>     (100%)
> 
>     diff --git a/meta/recipes-graphics/mesa/mesa-gl_21.0.0.bb
>     <http://mesa-gl_21.0.0.bb>
>     b/meta/recipes-graphics/mesa/mesa-gl_21.0.1.bb
>     <http://mesa-gl_21.0.1.bb>
>     similarity index 100%
>     rename from meta/recipes-graphics/mesa/mesa-gl_21.0.0.bb
>     <http://mesa-gl_21.0.0.bb>
>     rename to meta/recipes-graphics/mesa/mesa-gl_21.0.1.bb
>     <http://mesa-gl_21.0.1.bb>
>     diff --git a/meta/recipes-graphics/mesa/mesa.inc
>     b/meta/recipes-graphics/mesa/mesa.inc
>     index e9b72ce063..a40dad2b81 100644
>     --- a/meta/recipes-graphics/mesa/mesa.inc
>     +++ b/meta/recipes-graphics/mesa/mesa.inc
>     @@ -21,7 +21,7 @@ SRC_URI =
>     "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz
>     <https://mesa.freedesktop.org/archive/mesa-$%7BPV%7D.tar.xz> \
>                 
>     file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch \
>                  "
> 
>     -SRC_URI[sha256sum] =
>     "e6204e98e6a8d77cf9dc5d34f99dd8e3ef7144f3601c808ca0dd26ba522e0d84"
>     +SRC_URI[sha256sum] =
>     "379fc984459394f2ab2d84049efdc3a659869dc1328ce72ef0598506611712bb"
> 
>       UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
> 
>     diff --git a/meta/recipes-graphics/mesa/mesa_21.0.0.bb
>     <http://mesa_21.0.0.bb> b/meta/recipes-graphics/mesa/mesa_21.0.1.bb
>     <http://mesa_21.0.1.bb>
>     similarity index 100%
>     rename from meta/recipes-graphics/mesa/mesa_21.0.0.bb
>     <http://mesa_21.0.0.bb>
>     rename to meta/recipes-graphics/mesa/mesa_21.0.1.bb
>     <http://mesa_21.0.1.bb>
>     -- 
>     2.29.2
> 
> 
> 
> 
> 
> 
> 
> 
