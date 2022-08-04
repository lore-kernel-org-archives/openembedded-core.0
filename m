Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5A34C19F2A
	for <webhook@archiver.kernel.org>; Thu,  4 Aug 2022 14:58:45 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com
 [209.85.167.175])
 by mx.groups.io with SMTP id smtpd.web08.5871.1659625117984239180
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Aug 2022 07:58:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZB+pKGUL;
 spf=pass (domain: gmail.com, ip: 209.85.167.175,
 mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f175.google.com with SMTP id i4so23515122oif.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Aug 2022 07:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WRtyjZgCHt/YKpXhPSClfmDWTwFvRHb/2o/zJV9NP7g=;
        b=ZB+pKGUL4yCwFme1yORqqTsCDWc1X09cnnogAGKfUHjkNBXj3MSiEg4zzXZs0NNvlC
         B3Ngx2RywLioSFm6+rlyLLLSV2mMdnqyNa3psN3y4DkX3qXgTN09aO5LLRQ9ehqB0Tkp
         OPd4m9wBaCtigQE5dG2iCLChqe1FnyZtHc/xD7RsJzuAE8XlvUtCqXesPAwDERlE5ZLP
         Uw/C54xmS5E4+D4XpDx53pIlm6HxsDK8aXV6jFykwLaZUCzlqOIeFcXY+QR2Mh8iOKrl
         8p+R4dZZ+Cj9i3rDVFpf2VFWTI6KYHrQcg2rZKoPhI35vf7mxSLaQE0uUKcGUl7OQftl
         Q+hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WRtyjZgCHt/YKpXhPSClfmDWTwFvRHb/2o/zJV9NP7g=;
        b=7JwSBHdvi/NbJLzPuxvoFUSUqSUIZ/rj5jmsJhCzC0bJfJFzDSBtV6aMctxWTWZTiq
         BSVQ0ReKOuVbq/VGhObuylUIYxeE8mofrCzW4nBC0SzS1oTf0aXI5nvJBaUCRMCXD125
         8ep6M+hTddJUS1m2cEpKKXWKU7ahx9DucZp9WbP9qc826qrk9grz9KuE2SsgYFi9rFAq
         OR/No8Q60Uid30YT536/pUPVtkG2W0Bt1ZSFLzbM8epFAsvef5ks1JNsDZ4jCYvfxq2u
         DBiKn2VmDjIi5S0/mtyPro2QHSwPMUd71gQmHso47KH39MVJsTCWeov89VgYJnyA725v
         BEmw==
X-Gm-Message-State: ACgBeo3rU0lT6BtUhFwodmBnB6GY4gyZY6vPre9+vlYKBWoVXZagcSVv
	WV76uNleLfrOEXRNA4pPU2PMQnbd0R4=
X-Google-Smtp-Source: 
 AA6agR58cMqpLrvVOdJ0MYp5HbesXNQEMs6KrPAyerBuId7sJMMTtKsxn1VNWcjPbok/lpSzLomOrw==
X-Received: by 2002:a05:6808:1442:b0:340:86f7:7777 with SMTP id
 x2-20020a056808144200b0034086f77777mr3953218oiv.11.1659625116800;
        Thu, 04 Aug 2022 07:58:36 -0700 (PDT)
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id
 f34-20020a056871072200b0010e3cb4c98fsm156154oap.9.2022.08.04.07.58.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Aug 2022 07:58:36 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] classes/sanity: Add comment about github & gitlab
 archives
Date: Thu,  4 Aug 2022 09:58:31 -0500
Message-Id: <20220804145831.1545698-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Aug 2022 14:58:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168858

Add a comment so that users grepping for "github" or "gitlab" will find
this code (since the regex wont).

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/insane.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 37e10ad850..c8b434bb54 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -1335,6 +1335,7 @@ def unpack_check_src_uri(pn, d):
         oe.qa.handle_error("src-uri-bad", "%s: SRC_URI uses PN not BPN" % pn, d)
 
     for url in d.getVar("SRC_URI").split():
+        # Search for github and gitlab URLs that pull unstable archives (comment for future greppers)
         if re.search(r"git(hu|la)b\.com/.+/.+/archive/.+", url):
             oe.qa.handle_error("src-uri-bad", "%s: SRC_URI uses unstable GitHub/GitLab archives, convert recipe to use git protocol" % pn, d)
 
-- 
2.33.0


