Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D357C76195
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 22:18:17 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.7259.1678918688748033129
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 15:18:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Kaxks+Xt;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id c8-20020a05600c0ac800b003ed2f97a63eso1961457wmr.3
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 15:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1678918687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZJisi6iX1DRXw/A1w0WwHanAYylJ0+sGS2QgGcvAZOo=;
        b=Kaxks+Xt1rkKfkTmnTsqwvDTj8ZFX5xaHX8pesPL4RtegwMhTQn7txABdg5orO7X3b
         QYRpdWl7WlyxJd1EJcT6vZ6Tg+euxlIJXjYuBLbFct04wE5V7KPW7vCiSlDKfCkdV1KU
         znE6Nwojfd0mbgN17D/H1gH+mThD+NCAoYK24=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678918687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZJisi6iX1DRXw/A1w0WwHanAYylJ0+sGS2QgGcvAZOo=;
        b=yep8h2eOaN0YS5/T0UUrKvqnncEdRWy017wGT6NwT/U1AS6P+ivyqH43vipZ5SYi4t
         qsm9VKfjendxxCvOd7Dm/9VvofWOf1WkruWm2//off8c+5lJKbUo8PyDY1z4QpnDtWbg
         s2/SAMTPNItmwAoxHHLEkHL20ezpXtiB56xndx3T9bP83mrfkCsXmi80ObDIMc+cCc0Z
         qyM1bo82+uBXK5L8Id2XF21XuPpKanuNSN4F7anSwjhVkPLhzyvBbiFS0P5wIKRgKOrl
         IcclKgGmt/zeRH+jPcppYTuflkrkdsTGDl9cA4zO6qp+XFEu97Xc6+lUdlASQz57Qfdi
         1wCg==
X-Gm-Message-State: AO0yUKU6sO5CPBJGax0XtEOaFXyLPFQ5T1mR9BkcCuWjhE40lgcGdWWH
	hD3VWr+XleyUCkP4wBWEta3a0rEZkVnlQhVN1vs=
X-Google-Smtp-Source: AK7set9jIBpHw48aq9rXBh5XvcYWCO5ZBOGvrCDJcScGKKY9ohy1PPc0GfvnWCN++cWvVucIUidnqA==
X-Received: by 2002:a05:600c:3151:b0:3eb:f664:b6e with SMTP id h17-20020a05600c315100b003ebf6640b6emr18944327wmo.24.1678918687067;
        Wed, 15 Mar 2023 15:18:07 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:4181:67:6e43:6a9])
        by smtp.gmail.com with ESMTPSA id t4-20020a5d4604000000b002cfefad9c1dsm4258160wrq.66.2023.03.15.15.18.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 15:18:06 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/5] matchbox-config-gtk: Update to latest SRCREV
Date: Wed, 15 Mar 2023 22:18:03 +0000
Message-Id: <20230315221803.4189345-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230315221803.4189345-1-richard.purdie@linuxfoundation.org>
References: <20230315221803.4189345-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 22:18:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178661

License changes were the addition of SPDX license headers and license
header fixes.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../matchbox-config-gtk/matchbox-config-gtk_0.2.bb          | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-sato/matchbox-config-gtk/matchbox-config-gtk_0.2.bb b/meta/recipes-sato/matchbox-config-gtk/matchbox-config-gtk_0.2.bb
index d951baf3610..04aa5ba2e5f 100644
--- a/meta/recipes-sato/matchbox-config-gtk/matchbox-config-gtk_0.2.bb
+++ b/meta/recipes-sato/matchbox-config-gtk/matchbox-config-gtk_0.2.bb
@@ -4,16 +4,16 @@ BUGTRACKER = "http://bugzilla.yoctoproject.org/"
 
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
-                    file://appearance/mb-appearance.c;endline=25;md5=ea92333cf8a6802639d62d874c114a28"
+                    file://appearance/mb-appearance.c;endline=25;md5=f49d7ae8b8634a94315410cd2e055bdf"
 
 DEPENDS = "gconf gtk+3"
 RDEPENDS:${PN} = "settings-daemon"
 
-# SRCREV tagged 0.2
-SRCREV = "ef2192ce98d9374ffdad5f78544c3f8f353c16aa"
+SRCREV = "7182e603357250952aa24d90f6d89345f93da7ce"
 SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master \
            file://no-handed.patch"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
+PV = "0.2+git${SRCPV}
 
 S = "${WORKDIR}/git"
 
-- 
2.38.1


