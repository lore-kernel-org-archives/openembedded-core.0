Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9985EC64ED6
	for <webhook@archiver.kernel.org>; Wed, 15 Feb 2023 17:20:59 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.21414.1676481652986870713
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Feb 2023 09:20:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HedbRcz8;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id m10so10990884wrn.4
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Feb 2023 09:20:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZxCi0gZaI81z7guYh8Sd4Ei1YWYuoOt22OyVc6NDpLk=;
        b=HedbRcz86pvtiwesy/KvsrQO3f3pkDcSovGkOuJqE5GbR2j2fq0ain6+ZfqceYzX0z
         4ohEk9hrbchAOmKFigHnl0rDM0bu5zmEzz5DvXjIQCMOmY3jvvvx6Mp7RyGb2hbBkKFk
         kwkvSIWVgz4dkdgKSiWa7wMRCfKCvFHgTYYKmwkIMVhzNptG47N04GINKoFO7RdD3S4Y
         wSa3rxutJnPgp8CA0+BQs0I5+DRiHVSRS2/sCEwNzgEP5OaJbHafm/gG/vSZb2HLsNqm
         PGY5JGKlMq1WRlvkkI0ZyuPGCrCwPD1WUSqls0LzXYDSu1ugF3gDRvQfr1dACqnhPxIn
         MRng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZxCi0gZaI81z7guYh8Sd4Ei1YWYuoOt22OyVc6NDpLk=;
        b=muEuq0MWEaUqoTq8tONS/n6N8S2PRm+h+8QylJ/U7/Bo9Q4zIK9tAQeY/6xa0fBFgU
         li2dFI1C4wlGpr+rf/5sXl51tUe2kHN0GMH4di0ArFlXIRO2KZflliY2rMGwcdyljvTs
         Mm1X53q1Olwit4eVVUHuZJ85ykMQ3VHpqZc8hk/cafJV7OpNK2SC4J74QeJV8fpitkET
         tslhUqdfxBAU3xrALEvioFigPbzZv+wL5vDKc/vjglL27pR0cCj7OSCkEQGXL1GGpobt
         sYD2N41jv8/UrXuhoJSRQlj1U+Rtl+lAp580Cf7fkUPuNMzsPL7WHTOQqJ5FbgyYclv7
         KOGw==
X-Gm-Message-State: AO0yUKVPq34/gz98xtEo+T63IgAnc/zVWZzV30H0T1r5pFwDKhMqapIL
	/x9I/bgf57Av/xkUnxp8NZrGBG5Spqw=
X-Google-Smtp-Source: AK7set+5i27ZYp1NepMkOw+AVIUNGJd0xx3hlPH5RIZxZKxNWSxoxfWVZC83zGzZVvhJAVqGdo4Mng==
X-Received: by 2002:adf:ce91:0:b0:2bf:ec8b:3a5 with SMTP id r17-20020adfce91000000b002bfec8b03a5mr2171768wrn.46.1676481651414;
        Wed, 15 Feb 2023 09:20:51 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id hg6-20020a05600c538600b003b47b80cec3sm2589251wmb.42.2023.02.15.09.20.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Feb 2023 09:20:51 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: ross.burton@arm.com,
	Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH 1/3] insane.bbclass: use 4 spaces for indentation
Date: Wed, 15 Feb 2023 18:20:39 +0100
Message-Id: <20230215172041.636292-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Feb 2023 17:20:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177205

* this block was using just 3

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes-global/insane.bbclass | 50 +++++++++++++++---------------
 1 file changed, 25 insertions(+), 25 deletions(-)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
index e1295f8539..720b75c395 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -1349,31 +1349,31 @@ python do_qa_patch() {
 
     coremeta_path = os.path.join(d.getVar('COREBASE'), 'meta', '')
     for url in patch.src_patches(d):
-       (_, _, fullpath, _, _, _) = bb.fetch.decodeurl(url)
-
-       # skip patches not in oe-core
-       patchtype = "patch-status-core"
-       if not os.path.abspath(fullpath).startswith(coremeta_path):
-           patchtype = "patch-status-noncore"
-           if not allpatches:
-               continue
-
-       kinda_status_re = re.compile(r"^.*upstream.*status.*$", re.IGNORECASE | re.MULTILINE)
-       strict_status_re = re.compile(r"^Upstream-Status: (Pending|Submitted|Denied|Accepted|Inappropriate|Backport|Inactive-Upstream)( .+)?$", re.MULTILINE)
-       guidelines = "https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Patch_Header_Recommendations:_Upstream-Status"
-
-       with open(fullpath, encoding='utf-8', errors='ignore') as f:
-           file_content = f.read()
-           match_kinda = kinda_status_re.search(file_content)
-           match_strict = strict_status_re.search(file_content)
-
-           if not match_strict:
-               if match_kinda:
-                   msg = "Malformed Upstream-Status in patch\n%s\nPlease correct according to %s :\n%s" % (fullpath, guidelines, match_kinda.group(0))
-                   oe.qa.handle_error(patchtype, msg, d)
-               else:
-                   msg = "Missing Upstream-Status in patch\n%s\nPlease add according to %s ." % (fullpath, guidelines)
-                   oe.qa.handle_error(patchtype, msg, d)
+        (_, _, fullpath, _, _, _) = bb.fetch.decodeurl(url)
+
+        # skip patches not in oe-core
+        patchtype = "patch-status-core"
+        if not os.path.abspath(fullpath).startswith(coremeta_path):
+            patchtype = "patch-status-noncore"
+            if not allpatches:
+                continue
+
+        kinda_status_re = re.compile(r"^.*upstream.*status.*$", re.IGNORECASE | re.MULTILINE)
+        strict_status_re = re.compile(r"^Upstream-Status: (Pending|Submitted|Denied|Accepted|Inappropriate|Backport|Inactive-Upstream)( .+)?$", re.MULTILINE)
+        guidelines = "https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Patch_Header_Recommendations:_Upstream-Status"
+
+        with open(fullpath, encoding='utf-8', errors='ignore') as f:
+            file_content = f.read()
+            match_kinda = kinda_status_re.search(file_content)
+            match_strict = strict_status_re.search(file_content)
+
+            if not match_strict:
+                if match_kinda:
+                    msg = "Malformed Upstream-Status in patch\n%s\nPlease correct according to %s :\n%s" % (fullpath, guidelines, match_kinda.group(0))
+                    oe.qa.handle_error(patchtype, msg, d)
+                else:
+                    msg = "Missing Upstream-Status in patch\n%s\nPlease add according to %s ." % (fullpath, guidelines)
+                    oe.qa.handle_error(patchtype, msg, d)
 
     oe.qa.exit_if_errors(d)
 }
-- 
2.39.2


