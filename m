Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A666C54EBF
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 15:47:24 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.15380.1672847241462200168
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 07:47:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=c35tZLsD;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id d17so13674119wrs.2
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 07:47:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d9q8zIWaAlp0keP+ZwIcTQeIi//cIHzwznow4ks6o/E=;
        b=c35tZLsDD7vaONieKl/+dAGWwad4HvywY4Qlh8PCGSIBcCW/doPo7VPr2iGiOFAcIT
         OAovVTzEjz+vFeBlBCMnfzBwV4sUjVD6RjOCLZTdoCzmZ47LUeFWSEWk2H0kVg1QHG/+
         4LbRcertHdbYKND++QYdpC9angIpGmRDG33bc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d9q8zIWaAlp0keP+ZwIcTQeIi//cIHzwznow4ks6o/E=;
        b=aeKI8VIHqQxmT9i63yCxAvOFCGCo48UDDGhZoYxVs6lTI5477DdkyGHCV80DVGM7UB
         uDwYkb72kPLPRf6wuq7jfAY8+SJhoVXo62RYjvr8NwN//zAzlVyn/Y1K6RcfOc3g4J1O
         M1CbZLnkb/xsQYOwP9YKRKZNmlGTgpMLfEokmM5nEhlOo+H2DOtBNGNalXtthnMRy55+
         UMZUZRRY9V6OT4nu0biDQuLSZIDv94tho+VeEAJyRJ62Tqm7Ee0KG9u8CVivq6m77tAG
         XX5PkdEySMMUnHKvJlpMzQmahCnT7fGeEApG0x8fmiahvoFfmVwg9031jUJEhxbktTxu
         ieMg==
X-Gm-Message-State: AFqh2kpnUXfQQjhhSN3D2CIFn6RFcIVnGUknLvdmJgDcr4GnsW6KCxb+
	Z11UThlqat+yoE6D8l6VcMTAdXX3X549nE2g
X-Google-Smtp-Source: AMrXdXvS20VFQJhaqghbPDS+QoB9fMEh/UsZbN+eYw/aQuNI2v3jw6TUrY3k1HiXLWjxMyTWp3ylvg==
X-Received: by 2002:a5d:5908:0:b0:279:4938:eb98 with SMTP id v8-20020a5d5908000000b002794938eb98mr23847545wrd.11.1672847239698;
        Wed, 04 Jan 2023 07:47:19 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:fcc2:4e85:26d2:6527])
        by smtp.gmail.com with ESMTPSA id u3-20020adff883000000b002423edd7e50sm34812560wrp.32.2023.01.04.07.47.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 07:47:19 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 06/10] package: Drop unused function and obsolete comment
Date: Wed,  4 Jan 2023 15:47:10 +0000
Message-Id: <20230104154714.1168535-6-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230104154714.1168535-1-richard.purdie@linuxfoundation.org>
References: <20230104154714.1168535-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 15:47:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175493

The function appears unused and the comment obsolete, drop them.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/package.bbclass | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/meta/classes-global/package.bbclass b/meta/classes-global/package.bbclass
index 21a50bbb45e..5c250776f8d 100644
--- a/meta/classes-global/package.bbclass
+++ b/meta/classes-global/package.bbclass
@@ -243,18 +243,6 @@ python () {
         d.appendVarFlag('do_package', 'deptask', " do_packagedata")
 }
 
-def checkbuildpath(file, d):
-    tmpdir = d.getVar('TMPDIR')
-    with open(file) as f:
-        file_content = f.read()
-        if tmpdir in file_content:
-            return True
-
-    return False
-
-#
-# Used by do_packagedata (and possibly other routines post do_package)
-#
 
 PRSERV_ACTIVE = "${@bool(d.getVar("PRSERV_HOST"))}"
 PRSERV_ACTIVE[vardepvalue] = "${PRSERV_ACTIVE}"
-- 
2.37.2


