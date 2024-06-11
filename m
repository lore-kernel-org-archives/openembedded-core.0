Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DE98C27C65
	for <webhook@archiver.kernel.org>; Tue, 11 Jun 2024 18:57:04 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web10.2330.1718132221961402526
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jun 2024 11:57:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=WObyDIly;
 spf=pass (domain: konsulko.com, ip: 209.85.215.173, mailfrom: tim.orling@konsulko.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-6e4e6230f42so103748a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Jun 2024 11:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1718132221; x=1718737021; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9u4+xa5flp8zy2guZ9HIbpBi6msEN5KKyhAlBU3jwTc=;
        b=WObyDIly37YPWaAwWU9GjZBPZsAx8vabm3kk0MyRxJlPR5Zn66Rg6gNiljFEqzdax/
         p08NnghHYEgPwasOZS9ByDugov4sRSEsbE7aNgFVirdd+YnwNsMGcWs2oQTqBkXYgYfE
         bhnIdHl0u5OxIMaLfQCLfTOzeAEi1xBCn7Na4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718132221; x=1718737021;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9u4+xa5flp8zy2guZ9HIbpBi6msEN5KKyhAlBU3jwTc=;
        b=di4nW9YJzTDvENC3i8h4gr1OWrQcIq8MdQ2ay28K5MavCt1zdtcjhuC6fvL3W1qGpF
         F1KW+KkyWIf+89G/xsEY/B6YGYKoOQtw5RqfC2JQnT5q0VMZPH3qFQRElIQSuLp6Vz4H
         6HOUgO96NhzdafvvrWEE76FYjm8OyXYo8zAKkn0ntstIpFNxOt6Y6XRn2ZyNAnhZZ3rk
         YMCZdT1GNhw0vefAN3N1PuCfRUFPs2kup+pvzJFKEljWyqvtuc/lmFHPQcuT6fsereM1
         moiyQpaQP4vnu4epj3XjbJjIO99IUs/AbYX3QIMJ1iMmCGtAFhvjs/fFRtzXfBVFRShS
         FYdw==
X-Gm-Message-State: AOJu0YwYlCCqeRAxBFVhVSkOpDAhg6oMnmh1WWA+9jfLnTGEM+lfdTpG
	fLTOhux2h9x71qSYbGcjzCv/Sus8Fuc1qI9kS7z7SOCyylf5FEhr9diuQU51Fgye15miX0VV+yM
	yHv8=
X-Google-Smtp-Source: AGHT+IH/LkuF5SDYMHWzp+6vZPQjBGoVu3OKpkxOxxlCNv5VwF25UM4fzWpHxcYDC1Ze+OxIosvxgg==
X-Received: by 2002:a05:6a20:9795:b0:1af:ac8c:4366 with SMTP id adf61e73a8af0-1b86bdf356dmr3230547637.30.1718132220727;
        Tue, 11 Jun 2024 11:57:00 -0700 (PDT)
Received: from localhost ([2601:1c2:c182:4da0::2bc4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f71a902a5csm36853455ad.37.2024.06.11.11.56.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 11:57:00 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] python3-requests: upgrade 2.32.1 -> 2.32.3
Date: Tue, 11 Jun 2024 11:56:55 -0700
Message-ID: <20240611185655.3071064-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jun 2024 18:57:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200548

From: Tim Orling <tim.orling@konsulko.com>

https://requests.readthedocs.io/en/latest/community/updates/#release-history

2.32.3 (2024-05-29)
  * Bugfixes - Fixed bug breaking the ability to specify custom SSLContexts
    in sub-classes of HTTPAdapter. (#6716)
  * Fixed issue where Requests started failing to run on Python versions
    compiled without the ssl module. (#6724)

2.32.2 (2024-05-21)
  * Deprecations - To provide a more stable migration for custom HTTPAdapters
    impacted by the CVE changes in 2.32.0, we’ve renamed _get_connection to a
	new public API, get_connection_with_tls_context. Existing custom
	HTTPAdapters will need to migrate their code to use this new API.
	get_connection is considered deprecated in all versions of
	Requests>=2.32.0.
  * A minimal (2-line) example has been provided in the linked PR to ease
    migration, but we strongly urge users to evaluate if their custom adapter
	is subject to the same issue described in CVE-2024-35195. (#6710)

https://github.com/psf/requests/compare/v2.32.1...v2.32.3

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../{python3-requests_2.32.1.bb => python3-requests_2.32.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-requests_2.32.1.bb => python3-requests_2.32.3.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-requests_2.32.1.bb b/meta/recipes-devtools/python/python3-requests_2.32.3.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-requests_2.32.1.bb
rename to meta/recipes-devtools/python/python3-requests_2.32.3.bb
index a1144181bc4..4f0638b50c8 100644
--- a/meta/recipes-devtools/python/python3-requests_2.32.1.bb
+++ b/meta/recipes-devtools/python/python3-requests_2.32.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://requests.readthedocs.io"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
 
-SRC_URI[sha256sum] = "eb97e87e64c79e64e5b8ac75cee9dd1f97f49e289b083ee6be96268930725685"
+SRC_URI[sha256sum] = "55365417734eb18255590a9ff9eb97e9e1da868d4ccd6402399eaf68af20a760"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.45.2


