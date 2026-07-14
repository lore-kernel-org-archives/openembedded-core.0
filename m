Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44339C4450C
	for <webhook@archiver.kernel.org>; Tue, 14 Jul 2026 19:04:20 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1642.1784055856164861137
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jul 2026 12:04:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=R/cCtOlY;
 spf=pass (domain: gmail.com, ip: 209.85.160.48, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-4518ad44e83so804091fac.0
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Jul 2026 12:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784055855; x=1784660655; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P8qw51GbQBfsMvbjKJAvD96MlPeh+dr3m8fgKoJadGs=;
        b=R/cCtOlYfGLk3XLlnVYQyzsy6hTNPosfv0S9btYBYtBES9jf4mEFo+EcS4Y9z1pOTO
         f/UV4DBfeUDwrUrUAbQT9F6cJ9wdxwqL6DxKMsMwJZ+wEpg5C9wFBxmVsgHjnPE0r6/6
         ZUJCEhuQ/EYznqV18UvXJJ60PjAfswW0DVs9Yx0oC+Dpdy3kNBgn0T1JAhVCewDFnKtI
         uGbDvEmP5RdJmS1GoOl7ADkOh1F8QX96LQYNSmqhTplV5sCGKR+Ul680zWoXho9TJAC8
         x12Ol/HNRQRCyiVyHhJH+7M8AX3Bb9gIX55GB0nCJXY/XpT05EWzWaLgz2ed8PgxXtwG
         pLtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784055855; x=1784660655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=P8qw51GbQBfsMvbjKJAvD96MlPeh+dr3m8fgKoJadGs=;
        b=Mu3gwcmwnj1iQ5XjLT5d/6xjMOAcemv5scyG2Xeto216r/A2AF3GCsyCE0LpPtWEli
         zfM/UOrKvUTc2yXwO8yy2upkxRjX2ZpBKET4WSmco+uIoc+4g+1Pvz2VfGP+YpQ3z1fl
         iIl+mcEwp0OWne5fgaIlHKCf/PHiT+nTGgunYQRSY6YE+Z4bUQx4iSYOAauks9Fn0722
         UWIa5brVw8ynq9R1p1z9QPaTsPoZ4iL1dXlkPMmo9OxR8CqLmjU0GkTb8FBWe89DHzUN
         qBUGSKB3KcxIuT8AxnV/gXbppdivRlcYGkJYVqy5TQg91DtvIfscQKeRIcV+CWwhwPz5
         GyOA==
X-Gm-Message-State: AOJu0YwRMZgOn9lX9jNrP7cv0H/tytvRZnMtWmo1QMiSZXMA7CynVA9a
	BV8uLzpyeDdGiVdi8fJ84z2FguPqsKED3mMpV7r4but6Cixh4bAjvvjCYlkJew==
X-Gm-Gg: AfdE7cmAQ4rLq7QrEkfatJhP0aPb5CLCkze39aNIRwFeTxf2AVIZP7I/QB8EUiv8DZA
	2jTkP0Heg7py2EpySPAgiGsRBWJgnuoFnn9psBp0yeIbFxLJcZLy2Dw72LNgfT757OqSG4Xxwc5
	pKQOVn7Powgv5/6rQT2Z2+iKRVyuAe4PHoxe9h//gIGzILq8RXTk8zl2d1lop4D1dWyyjHAR3K9
	ah9bRmiktYWqJWoiRveHVpvwJT4sJrsvrvG4HMh1EDQyKvBdzzvWoG6ZqRSMFVRcDdE8aOuVDYC
	YWZKTR6nZ4+WkVd5wQ0nDT6rMDow+t0QqH1DwVEeTla0ctdcV7kzpVnSCeTq02RKLGmwhENNbs0
	oG0SuycDdoyjH/NNUbmEmgFQfp48fbOsZOWJgrEcwy1CTAugc+Kx8kI1xXkAsMnmii9GNwYwnyd
	oG5o0x7HP0TWjOllVWqipY
X-Received: by 2002:a05:6870:c38b:b0:448:5591:15da with SMTP id 586e51a60fabf-451f15328d4mr6796524fac.38.1784055855298;
        Tue, 14 Jul 2026 12:04:15 -0700 (PDT)
Received: from localhost.localdomain ([2601:283:4b02:22d0::7b52])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-451916f31d4sm17695629fac.16.2026.07.14.12.04.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 12:04:14 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 08/22] gcc-common.inc: Remove LICENSE
Date: Tue, 14 Jul 2026 12:31:18 -0600
Message-ID: <20260714190405.3328796-9-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260714190405.3328796-1-JPEWhacker@gmail.com>
References: <20260714190405.3328796-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jul 2026 19:04:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240916

Removes the LICENSE expression from gcc-common.inc; the format is not an
SPDX identifier and is not necessary since the gcc recipes already have
a valid LICENSE identifier

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-common.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-common.inc b/meta/recipes-devtools/gcc/gcc-common.inc
index 8d95698743..a7f01cd045 100644
--- a/meta/recipes-devtools/gcc/gcc-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-common.inc
@@ -2,7 +2,6 @@ SUMMARY = "GNU cc and gcc C compilers"
 HOMEPAGE = "http://www.gnu.org/software/gcc/"
 DESCRIPTION = "The GNU Compiler Collection includes front ends for C, C++, Objective-C, Fortran, Ada, Go, and D, as well as libraries for these languages (libstdc++,...). GCC was originally written as the compiler for the GNU operating system."
 SECTION = "devel"
-LICENSE = "GPL"
 
 NATIVEDEPS = ""
 
-- 
2.54.0


