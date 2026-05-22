Return-Path: <bindudaniel1996@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72013CD5BB1
	for <webhook@archiver.kernel.org>; Fri, 22 May 2026 10:21:10 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13872.1779445269445031458
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 May 2026 03:21:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=HRbWahZq;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: bindudaniel1996@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3697f25d26eso3679958a91.1
        for <openembedded-core@lists.openembedded.org>; Fri, 22 May 2026 03:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779445269; x=1780050069; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FLOLJJzYhoU+22NAtYIpdryhk/W+tnqzz3dwxf5bcCQ=;
        b=HRbWahZqGKiomNmAwJPqr1fELPyEW37T4wvrhuh8kT1yqgb5Pabkrm30kIP/3rSA4K
         1+BVUZmgJnlDCi2Xl6zBRfnVFTIT6ZoEJszhjb5nUK6p0PsL+8s9MNUb8VpK3+IvcjWS
         gOcRUQAXzaupmXgzwCoE0bnBINJDgCrQo0uhYfl/Vb2DVRdZ2lobYj/4K9poVW65eK6a
         okaAeuJ5R2vLdu6gmh0cuzlStDZooABLKZNB5YBpwlXtER7L4HcFLfKqK6MP5brK3Rzb
         RKOdA0onPUUt5Bk2O26fX0tLZcveGpTInk9tSvYO8c+M5BavZn9dTRqOHkP3//dmp99I
         LwNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779445269; x=1780050069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FLOLJJzYhoU+22NAtYIpdryhk/W+tnqzz3dwxf5bcCQ=;
        b=lwOBQJTtAwLS2Kzl0MHDoX61wmgQq6jE0meX93FfbO8M4sP1nGRU54N6QE6kqiEY2y
         lqUG02hRPcxD2xNDto1U7kXMzDmIHW9jP/gXsm7M7nBZ244VXmLxgJsKhelGSASVa+2W
         9Wc6L8idbVn+g66jMdQh76wVd/lspMfE5joJgyydxCxYcuA0hnQSotJ9wF6PcaGIyFIA
         wFkdkyi0vSB3HvGU38Hjjk8mK2DZApBOGin26aD/rHauNrIm/Ag/wbYUQKINLZ5sZK2v
         H6wdCOKxiFiX+192/IKbyOqYScVvx32v/H+rcvqgSnLxRyuaIDB5iUSmXQIqY7EWRJv2
         25MA==
X-Gm-Message-State: AOJu0Yz6OqfVhr6tZqNK5/BcA1gfN+C9yO38mS9otsjenVZmIZv+ORAi
	i5faTI1pFGG4nw/1fkIOn0XJfyz3kJ0ubrLQXKogL7vRMmd5rD6gr14Asr3BIg==
X-Gm-Gg: Acq92OFbddI485EHRkZm4pfxyNT/8gtteRhld+pmpwpia2qt/ktY+M7wvoYBP95+F4T
	saQnzIw5ugnbU0eqy5TjMUw9JV8CPDHFjW5TxOKithgtEN8/XQ5SqX0T+dwoxOp/8cynf3TLqZ0
	NOxgCab7D1AbJO++iL5y6jIz/u+IkOD32AH2jNPWu/mKNMHI86vXLQ5uoB4+YfNVyenevggDAvm
	5NfzqJ8d2ixCzRJT1OugtIThAyxHbyODD1Rr8XdmeIYR8X2jMrQO8TQNlBPnXcpCSH2Fk4SYWSm
	sPViSybrIzXTx7ARmZy6cOfgoO5QcjmipSYLR/07fEJUE7RFa6j/rLpMpbeZIEqleo8hWLHydmq
	Qmfyk3+1x3OR2X6XTimY6iafBspTRamMqbUPbT1sYIVmH03Jd6YMrDEgVA3Bnr/UUAxxkVeZ5d2
	zc2/Vem6lusTnw66aXuF5Hoi2OLVhNE5HIKOAsa1El
X-Received: by 2002:a17:90b:3dc3:b0:36a:75f0:d468 with SMTP id 98e67ed59e1d1-36a75f0e0camr1808421a91.26.1779445268784;
        Fri, 22 May 2026 03:21:08 -0700 (PDT)
Received: from L-12443L.kpit.com ([106.51.46.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a723cf27csm1542289a91.13.2026.05.22.03.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 03:21:08 -0700 (PDT)
From: Bhabu Bindu <bindudaniel1996@gmail.com>
X-Google-Original-From: Bhabu Bindu <bhabu.bindu@kpit.com>
To: openembedded-core@lists.openembedded.org
Cc: Bhabu Bindu <bhabu.bindu@kpit.com>,
	Sana Kazi <Sana.Kazi@bmwtechworks.in>
Subject: [poky][scarthgap][PATCH 2/2] libarchive: Ignore CVE-2026-5745
Date: Fri, 22 May 2026 15:48:08 +0530
Message-Id: <20260522101808.175426-2-bhabu.bindu@kpit.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260522101808.175426-1-bhabu.bindu@kpit.com>
References: <20260522101808.175426-1-bhabu.bindu@kpit.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 May 2026 10:21:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237536

Ignore CVE-2026-5745 as libarcihive maintainer rejected CVE-2026-5745.
This is reproducible only with UBSAN, using with
'-fsanitize=pointer-overflow -fsanitize-trap=pointer-overflow'.
The root cause remains a UBSAN violation, not a NULL pointer dereference

https://github.com/libarchive/libarchive/issues/2904#issuecomment-4257068822

Signed-off-by: Sana Kazi <Sana.Kazi@bmwtechworks.in>
---
 meta/recipes-extended/libarchive/libarchive_3.7.9.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-extended/libarchive/libarchive_3.7.9.bb b/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
index 6b31256960..e402a485b3 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
@@ -80,4 +80,9 @@ ALTERNATIVE:bsdcpio = "cpio"
 ALTERNATIVE_LINK_NAME[cpio] = "${base_bindir}/cpio"
 ALTERNATIVE_TARGET[cpio] = "${bindir}/bsdcpio"
 
+python() {
+    if not bb.utils.filter('CFLAGS', '-fsanitize=pointer-overflow -fsanitize-trap=pointer-overflow', d):
+        d.setVarFlag("CVE_STATUS", "CVE-2026-5745", "not-applicable-config: sanitize is disabled")
+}
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


