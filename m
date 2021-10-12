Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47882C433EF
	for <webhook@archiver.kernel.org>; Tue, 12 Oct 2021 02:09:05 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web11.8042.1634004544537029836
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Oct 2021 19:09:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oW6Uvc8r;
 spf=pass (domain: gmail.com, ip: 209.85.215.176,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id a73so12485711pge.0
        for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Oct 2021 19:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nAO7L4L2hUyIY0Kyoqf4Tbd6ZpIVr7uu9BFPDNuX8M0=;
        b=oW6Uvc8rChH1ahX+MsxMvkp/ZeKz3AV8NZ+wzthhy34TBnvsSC+6xpeFUwHLZuhOU1
         K8ChqkPkrKMD23wAxFie183nENT4W5hXtx+cg2xLHqyIyemD8tJ5Rc9NrJQ6SUfvTXIy
         L2MWXMK4EWahx7twWM7GGb6kQ1CIxmhFg6IVUXeizJmd1dxQhM8Xu4fTxKjlMN7wnKjW
         1JnmleXuV/nH3d2u2rXa4S/Hqyn8U6p3ayLm+QbIH+eUqbPWNsLBe6z0odUPMFxx56S4
         Huv3ZveQW4s89Pfu402+2zmSVwabFnXFgJWjBSY5yJGwqY/LOFSYJ6u4+qQrtAS6njRG
         Cx9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nAO7L4L2hUyIY0Kyoqf4Tbd6ZpIVr7uu9BFPDNuX8M0=;
        b=vO42QfC8lP3Ip5iWmhShGzefhtRwPVdQeXw+sMnDL2Qdn58RUzJk7oCtjUq4tCDoQ1
         u5LyrOdNRir6VSR6uBG2X2vrDWpgix8m3ZZ9eNfPDlhUduJsT1OZieGvOdYuCYyxVW07
         /YMveBAqutLRlRXSXgJoV6da6Juu97UUBLPI+EFU1ycoo3l+xmXIgUO5ZX7/ehmGI3as
         ZIhZqMK/h7mcRSsIj192ai9C+h/hS/YmnU3BBGs6KlWUTaRE/tVpc68WKitCav2VxAtg
         mmWLtK/DZjPmk8UE0exr7uBQIrTWQZBSHiDzAo1mXbxZTRmI/yV3gze1UCCO0gV+3gWT
         f0rg==
X-Gm-Message-State: AOAM532JjmdfMDy7wmRSHe7+v6UUaH3mJ8oSm+ODXF6qNY+Uc1UAThCa
	iXmfY4ok+0R+WCIWf9QYIsd4darlIvzRsw==
X-Google-Smtp-Source: 
 ABdhPJwf7psQmQ365yV4A7xDinv9wlEZQIfv+OOetvfWMFlVPFChXicn5GNOcEBwzFp+LFEkoOf3ag==
X-Received: by 2002:a05:6a00:10c1:b0:44d:20e5:b4d6 with SMTP id
 d1-20020a056a0010c100b0044d20e5b4d6mr9140043pfu.25.1634004543655;
        Mon, 11 Oct 2021 19:09:03 -0700 (PDT)
Received: from thetis.hsd1.or.comcast.net ([2601:1c0:6000:1830::17e1])
        by smtp.gmail.com with ESMTPSA id
 l207sm8949601pfd.199.2021.10.11.19.09.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Oct 2021 19:09:03 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <timothy.t.orling@intel.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <timothy.t.orling@intel.com>
Subject: [PATCH 2/7] python3-importlib-metadata: upgrade 4.6.4 -> 4.8.1
Date: Tue, 12 Oct 2021 02:08:49 +0000
Message-Id: <20211012020854.2073998-2-timothy.t.orling@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211012020854.2073998-1-timothy.t.orling@intel.com>
References: <20211012020854.2073998-1-timothy.t.orling@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Oct 2021 02:09:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156853

v4.8.1
  #348: Restored support for EntryPoint access by item, deprecating
        support in the process. Users are advised to use direct member
        access instead of item-based access:

    - ep[0] -> ep.name
    - ep[1] -> ep.value
    - ep[2] -> ep.group
    - ep[:] -> ep.name, ep.value, ep.group

v4.8.0
  #337: Rewrote EntryPoint as a simple class, still immutable and
        still with the attributes, but without any expectation for
        namedtuple functionality such as _asdict.

v4.7.1
  #344: Fixed regression in packages_distributions when neither
        top-level.txt nor a files manifest is present.

v4.7.0
  #330: In packages_distributions, now infer top-level names from
        .files() when a top-level.txt (Setuptools-specific metadata)
        is not present.

References:
  https://github.com/python/importlib_metadata/issues/348
  https://github.com/python/importlib_metadata/issues/337
  https://github.com/python/importlib_metadata/issues/344
  https://github.com/python/importlib_metadata/issues/330

Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
---
 ...ib-metadata_4.6.4.bb => python3-importlib-metadata_4.8.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-importlib-metadata_4.6.4.bb => python3-importlib-metadata_4.8.1.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-importlib-metadata_4.6.4.bb b/meta/recipes-devtools/python/python3-importlib-metadata_4.8.1.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-importlib-metadata_4.6.4.bb
rename to meta/recipes-devtools/python/python3-importlib-metadata_4.8.1.bb
index e5aad991e4c..3f756684314 100644
--- a/meta/recipes-devtools/python/python3-importlib-metadata_4.6.4.bb
+++ b/meta/recipes-devtools/python/python3-importlib-metadata_4.8.1.bb
@@ -8,7 +8,7 @@ inherit pypi setuptools3
 PYPI_PACKAGE = "importlib_metadata"
 UPSTREAM_CHECK_REGEX = "/importlib-metadata/(?P<pver>(\d+[\.\-_]*)+)/"
 
-SRC_URI[sha256sum] = "7b30a78db2922d78a6f47fb30683156a14f3c6aa5cc23f77cc8967e9ab2d002f"
+SRC_URI[sha256sum] = "f284b3e11256ad1e5d03ab86bb2ccd6f5339688ff17a4d797a0fe7df326f23b1"
 
 S = "${WORKDIR}/importlib_metadata-${PV}"
 
-- 
2.30.2


