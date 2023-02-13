Return-Path: <bindudaniel1996@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20697C636D4
	for <webhook@archiver.kernel.org>; Mon, 13 Feb 2023 10:01:47 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web10.11035.1676282497998570390
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Feb 2023 02:01:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MYBMlmhO;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: bindudaniel1996@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id n20-20020a17090aab9400b00229ca6a4636so16407823pjq.0
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Feb 2023 02:01:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iWF7jE8LI+VcugKheU7kA0Sm+5HRonYDmOYKCZw13Kc=;
        b=MYBMlmhOK5BzKu/C3dRcjkhHaMOQD/YiCprbVldtmhd9vHBYaJ87OOnj4NiC+xJXGB
         CT/hPc6C7tPZoEkmdue3EiXTkkMkBnCfCjnXKwDpQ8yhE9UkZUZ8SLbdxnqgUPh+4qQE
         3fce9UJ6xW3PILnVWMv12OvJgdOpPCZdhR+gxpwo/gEG9DoDvRg9dA4LmrXdfpbjNuvr
         2Fn6AOv/VhFOk1agwU6ur6DxGs8jHsyjB6mlTsxPih9N0ELNaFzutv8OEsHgmZOSbpw6
         v9PiXU7w8pukMGVdQqFALC8r9ZNaPBHqxASwWcdCZjx7KpB6JHnU4+OkjPq9FQPz89X9
         ZoWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iWF7jE8LI+VcugKheU7kA0Sm+5HRonYDmOYKCZw13Kc=;
        b=s1yRE3lH3WxGj6s7nJRq7l5MjEyrivhGf9PYam+hXms8qz1Hl791I/blvKCR5ZfVM0
         QX5Cj4PY+sWeA8758BLzmWsAR5ZgRNKQNIEMvsjSD8ZYka6tESvz+MkukhEDD5oC0vHD
         NKnEE4bn0orrXUMI8q6jN6QHZv+XN13uQ4hAAH0ipM1OFVqRfITEU6dpmRdvzCA628mK
         MG3K28xPrhi/clei7y1qEwKqEXoLb/1X82qQGsUOdCl7hZXXHoJlJYzACiZO7hwJjOmD
         wueNISfIRU9PqTiWjPq7M6XJ3rskN0wbaCd7c5e1QNe+Tj0sSZTnk+/sXH44+TRfPwtY
         H+Zw==
X-Gm-Message-State: AO0yUKWZY5HC4r4i3fBpd5DooPMFksqmIgrgEOuKGx/5XOWqFsdBxxHu
	Dfk7e8GIeDrgyw3lXuBqPUtxj/7B7Kw=
X-Google-Smtp-Source: AK7set9nhZzHrHfXYcv94A1YXVrJw/tSpliFTci5w6yd3KqO2tpDqsTCD9zEdKhJQo56WEn7ggFg1w==
X-Received: by 2002:a17:903:2289:b0:199:33ff:918a with SMTP id b9-20020a170903228900b0019933ff918amr27248543plh.21.1676282497166;
        Mon, 13 Feb 2023 02:01:37 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:1f26:135a:80f6:de1e:1fab:25ec])
        by smtp.gmail.com with ESMTPSA id y4-20020a170902ed4400b00188c9c11559sm5826683plb.1.2023.02.13.02.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 02:01:36 -0800 (PST)
From: Bhabu Bindu <bindudaniel1996@gmail.com>
To: openembedded-core@lists.openembedded.org,
	virendrak@kpit.com
Cc: akash.hadke@kpit.com
Subject: [OE-core][dunfell][PATCH] git: Whitelist CVE-2022-41953
Date: Mon, 13 Feb 2023 15:31:04 +0530
Message-Id: <20230213100104.22808-1-bindudaniel1996@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Feb 2023 10:01:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177088

From: Virendra Thakur <virendrak@kpit.com>

Whitelist CVE-2022-41953 as its specific to Git-for-Windows

Link: https://github.com/git-for-windows/git/security/advisories/GHSA-v4px-mx59-w99c

Upstream-Status: Pending

Issue: MGUBSYS-6605

Change-Id: Id9dde20c1c1b8244a7dc11e3eae0927d1604e7fd
Signed-off-by: Virendra Thakur <virendrak@kpit.com>
---
 meta/recipes-devtools/git/git.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/git/git.inc
index b5d0004712..9cc4092e17 100644
--- a/meta/recipes-devtools/git/git.inc
+++ b/meta/recipes-devtools/git/git.inc
@@ -24,6 +24,9 @@ CVE_PRODUCT = "git-scm:git"
 # we don't see this as a major issue for our general users/usecases.
 CVE_CHECK_WHITELIST += "CVE-2022-24975"
 
+# This is specific to Git-for-Windows
+CVE_CHECK_WHITELIST += "CVE-2022-41953"
+
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[cvsserver] = ""
 PACKAGECONFIG[svn] = ""
-- 
2.17.1


