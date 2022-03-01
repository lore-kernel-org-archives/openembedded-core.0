Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A14DCC433F5
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 19:17:39 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web08.1318.1646162258816996610
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Mar 2022 11:17:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=P5MUZSk5;
 spf=pass (domain: gmail.com, ip: 209.85.210.177,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d187so15167171pfa.10
        for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Mar 2022 11:17:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=C5t50VXxOqXYfat4ikfB5/7a4hL+AxsgiQWDTAKqDc0=;
        b=P5MUZSk59c9NlsPo7NatniJRRqMZlBV3ERn2bTEQynD6ibGJ4o1G3kjyhEOW29LBev
         VVUWLtrkYXNdljoWRvSu0wr0428EG7kCbG8UNJta+FHZZ+T+KCeoMYuSen2IebB4Xi1F
         UCfHV3CxA3MN6IR/HFRqDfTpl4CdibiMd+9SaJjtiDkA/fOl3EiKG797tpEzVKyzK1Sd
         6Cu4sSPBdIsPd3fPhElpxHR5y4USh6s6rfyhgixn3ME4SbtmmmDg5tF31KapzFkUaiLI
         530mdD8nqf+46dU/DZIRHKeXdCs8aWwheEfmSJ4LqvtTnOAINKuuTqD2/lAKUAkmqqUt
         WPEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=C5t50VXxOqXYfat4ikfB5/7a4hL+AxsgiQWDTAKqDc0=;
        b=xqduiJ/vG/UC7FeSNizhh+QvcVfRotdgXX0lILZFrcgX2XQ365ureu++L6JqnXvqYL
         mtxR7shs4ZYXMOp75gfXDiDQOvU+7y482CGN4NpJSArqJRO8bnzZFjZJuRiL0/z1PjDw
         MensQMSQkvaabIOFJZiR7GTtLCroNrT3viL7AdgZvWB7vOWddU+5h29Dc2Jj/tyamZID
         NC23lKZY0CDvtcIDHxSg/XMmGW+JzRNmecPbQKMC309FlkQue/iDFMkdkF2iSrOXDX0q
         ddIhE46xlyJa39C4s0LTBP8yf2BtyfDiEbldwCFyeoZyvArgOjqmx9bBM1Z8Sva+oNkE
         sA4w==
X-Gm-Message-State: AOAM530dojqhh65732srKgzlovCEf0SiAsUA+BFakSQ+HoXkr9PJccqE
	yQbczOKlPtqLNv30Rm54T4p/9zNn4sc=
X-Google-Smtp-Source: 
 ABdhPJzd3rziOx5LZw6KrAK0f5lnuDNdn8i3cVxGC7UwGCsuBOpdNa8rttoSwgIK8UaYcjk36H7PpQ==
X-Received: by 2002:a65:5888:0:b0:374:5575:ba08 with SMTP id
 d8-20020a655888000000b003745575ba08mr22640063pgu.375.1646162257556;
        Tue, 01 Mar 2022 11:17:37 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:b4e2:b3d2:f012:52ea])
        by smtp.gmail.com with ESMTPSA id
 q12-20020a17090aa00c00b001bc6f1baaaesm2775356pjp.39.2022.03.01.11.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Mar 2022 11:17:37 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] python3-flit-core: upgrade 3.6.0 to 3.7.1
Date: Tue,  1 Mar 2022 11:17:30 -0800
Message-Id: <20220301191730.3418406-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Mar 2022 19:17:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162570

Version 3.7.1
* Fix building packages which need execution to get the version number,
  and have a relative import in __init__.py (:ghpull:`531`).

Version 3.7
* Support for :ref:`external data files <pyproject_toml_external_data>`
  such as man pages or Jupyter extension support files (:ghpull:`510`).
* Project names are now lowercase in wheel filenames and .dist-info folder
  names, in line with the specifications (:ghpull:`498`).
* Improved support for :doc:`bootstrapping <bootstrap>` a Python environment,
  e.g. for downstream packagers (:ghpull:`511`). flit_core.wheel is usable
  with python -m to create wheels before the build tool is available, and
  flit_core sdists also include a script to install itself from a wheel
  before installer is available.
* Use newer importlib APIs, fixing some deprecation warnings (:ghpull:`499`).

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../{python3-flit-core_3.6.0.bb => python3-flit-core_3.7.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-flit-core_3.6.0.bb => python3-flit-core_3.7.1.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-flit-core_3.6.0.bb b/meta/recipes-devtools/python/python3-flit-core_3.7.1.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-flit-core_3.6.0.bb
rename to meta/recipes-devtools/python/python3-flit-core_3.7.1.bb
index a00ea1810e3..f5e7506d5d2 100644
--- a/meta/recipes-devtools/python/python3-flit-core_3.6.0.bb
+++ b/meta/recipes-devtools/python/python3-flit-core_3.7.1.bb
@@ -8,7 +8,7 @@ BUGTRACKER = "https://github.com/pypa/flit/issues"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=41eb78fa8a872983a882c694a8305f08"
 
-SRC_URI[sha256sum] = "b1464e006df4df4c8eeb37671c0e0ce66e1d04e4a36d91b702f180a25fde3c11"
+SRC_URI[sha256sum] = "3c9bd9c140515bfe62dd938c6610d10d6efb9e35cc647fc614fe5fb3a5036682"
 
 inherit pip_install_wheel python3native python3-dir pypi setuptools3-base
 
-- 
2.30.2


