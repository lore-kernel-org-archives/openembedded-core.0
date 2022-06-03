Return-Path: <omkarpatil10.93@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E470DC433EF
	for <webhook@archiver.kernel.org>; Fri,  3 Jun 2022 12:18:16 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web11.6498.1654258692722554478
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jun 2022 05:18:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IV9rabrR;
 spf=pass (domain: gmail.com, ip: 209.85.215.177,
 mailfrom: omkarpatil10.93@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id u4so4124611pgk.11
        for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jun 2022 05:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=eiFf6Ajm0P636+DMOpvLbl+iEtS8/I74+N3I03uMj9c=;
        b=IV9rabrRa3qlkmpIlbTEEwLkzZmPEJ9cPDKtCWOOYZTUmKzPzUzD/E6MdbEd+HKXS+
         PF/hQ6Eyx7MBQeUBc6u1eRERub+GF/vkHyoKxlTAssAgKS9sufIqd4Ez0fncPpzYMuLd
         LFFSomQ+gV0adMKJPNgHFXiXsoVbFWRj9QnzI74LlyKoODkYe0Dr7dVZm0qq9SqBdDJV
         Yr7yho2I7gd80BCOfwzHe7Am4m70Qknv6zJOjMpq9u6ReXRP+XPMwEKoP0B+CBXPUTHU
         ERxYrekDXaDxssbctWDr5SSv3JC8IyLx3eC5Ori1WWgUDC9MR0VCt08nGOkWoKiu4dCO
         5e6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=eiFf6Ajm0P636+DMOpvLbl+iEtS8/I74+N3I03uMj9c=;
        b=7kdK4+L1eC0eNgbnP6ONVezmZ5QhxBgjsQrItydEPEyvpRXeOs3dvSFzbQ1CEfUqRn
         QCMsWSKx/tPd3Uya810GMw3fwioi0ksOCN9ukg6zixazmkgTEWWcyfrwZ1DL//HUn2oq
         UY5hs/lg2zo8CRNWlmEfoJ03RhLbLGAviCH2EtK/oYBGlFZIVUGz13s/VV/4zcyVYkP6
         k73Egrn4fMNvl4vXnZP+EtvSiUjDJVwpw0uiHS1RlWaA3fh+5WHb/PCIpM9LsJxWEuOC
         wEYoGFRiaWKCP4ev1vmBIPZI8rwy3BmTCmEC7PkE8jiKt7ysooiLDFoUX4axeDgwsrsR
         gULw==
X-Gm-Message-State: AOAM5324WKZBOEsKbVefQJYS5n+4gCsOVNs8ZJuZ+X9dYWzH347n3s7t
	p/MDbaflFnILf5uiB3fOjhH5hV8QOS0=
X-Google-Smtp-Source: 
 ABdhPJwpv892CxpAumu56Wjt9YmLU6oqzuChnVJPg8AP+S3Rsl7voa7SF5An6wEoFeofRyO/MmT4vA==
X-Received: by 2002:a63:e5d:0:b0:3aa:3c53:537e with SMTP id
 29-20020a630e5d000000b003aa3c53537emr8742091pgo.622.1654258691927;
        Fri, 03 Jun 2022 05:18:11 -0700 (PDT)
Received: from localhost.localdomain
 ([2409:4042:4e8c:4a84:cd17:5023:cf84:4172])
        by smtp.gmail.com with ESMTPSA id
 y2-20020a170902ed4200b0016392bd5060sm5247887plb.142.2022.06.03.05.18.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jun 2022 05:18:11 -0700 (PDT)
From: Omkar Patil <omkarpatil10.93@gmail.com>
To: openembedded-core@lists.openembedded.org,
	omkar.patil@kpit.com
Cc: ranjitsinh.rathod@kpit.com,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Omkar Patil <Omkar.Patil@kpit.com>
Subject: [OE-core][dunfell][PATCH 2/2] libxslt: Mark CVE-2022-29824 as not
 applying
Date: Fri,  3 Jun 2022 17:47:50 +0530
Message-Id: <20220603121750.30519-2-omkarpatil10.93@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220603121750.30519-1-omkarpatil10.93@gmail.com>
References: <20220603121750.30519-1-omkarpatil10.93@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jun 2022 12:18:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166519

From: Richard Purdie <richard.purdie@linuxfoundation.org>

We have libxml2 2.9.10 and we don't link statically against libxml2 anyway
so the CVE doesn't apply to libxslt.

(From OE-Core rev: c6315d8a2a1429a0fb7563b1d6352ceee7bc222c)

Signed-off-by: Omkar Patil <Omkar.Patil@kpit.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ad63694e6df4f284879f7220962a821f97928eb0)
---
 meta/recipes-support/libxslt/libxslt_1.1.34.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-support/libxslt/libxslt_1.1.34.bb b/meta/recipes-support/libxslt/libxslt_1.1.34.bb
index 62afec5755..4755677bec 100644
--- a/meta/recipes-support/libxslt/libxslt_1.1.34.bb
+++ b/meta/recipes-support/libxslt/libxslt_1.1.34.bb
@@ -22,6 +22,10 @@ SRC_URI[sha256sum] = "98b1bd46d6792925ad2dfe9a87452ea2adebf69dcb9919ffd55bf926a7
 
 UPSTREAM_CHECK_REGEX = "libxslt-(?P<pver>\d+(\.\d+)+)\.tar"
 
+# We have libxml2 2.9.10 and we don't link statically with it anyway
+# so this isn't an issue.
+CVE_CHECK_WHITELIST += "CVE-2022-29824"
+
 S = "${WORKDIR}/libxslt-${PV}"
 
 BINCONFIG = "${bindir}/xslt-config"
-- 
2.17.1


