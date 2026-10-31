Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3753.1793405776211266806
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 17:16:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=Xt+qcVd9;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so16513025e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 17:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793405774; x=1794010574; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Obo4iaglS2spej9exaSf0x5XqvhW9wlUGJqtR8qQ0/0=;
        b=Xt+qcVd9rEtBxk1F9TL/ZtuXu/D54E4QTUM5sZ+yY4YVC5XaqtGf3Hz56MMToxl/Od
         NCYthbOvqhNmu6IaNAtdBM4LgFcs4nIXMo8bIdDpiG8arsWlg+Yu6z0R0Aweu74sWHY3
         DRS+PDAGiBKG3v3f1l2MxmyT+9ZWeE98M5WGNmTno3pBiPEOEydaqKrfOPSU9YRj8/cf
         ODCi5KJjIZGcuZTrVMUAax3jqYBkZUgXA371qNGHjYA4E/WGY2XfdQ4qfMYrhOfSObNB
         U12ToijjCC5QmPVxSzjo8Oc7xcCfSrEo0WeP+07SpsM26sJ29BBS6xKH4m31rCIMBb6n
         otpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793405774; x=1794010574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Obo4iaglS2spej9exaSf0x5XqvhW9wlUGJqtR8qQ0/0=;
        b=Mtc2Zmn6CAAcxXp9jsc8PpVv4ruG1W2Cq7KiTN+hXt4fjw2nBJsHtRlmYTsJRELGSL
         0M/ibfPX69YO1DHX3NR18uRg21eVuy7j0Cy+UxPJzU9z5Tby6lHNiyWvLSsbgzvDYSNw
         4TDbS76VmFX8aFYlQ4IIvkLSPS1KsysGMC8Gm2XgSbty8orrQGPzPLajn4B7KbioZUZ5
         7RC1wD/nKUrcovVnHK7MRSP2Nx2TQsx/KenPx/75rvYYjABpnlmD0wDdTi5C2jD/S4ky
         OsHN674WZxjVl+MCssbuZOafwOzfOS47tcG5T7bmql74ISCrVOrfUNKsTjEKRrIo1gHJ
         NpMQ==
X-Gm-Message-State: AFq9FYIDWVuNcC+/4LqAIJKTMSPPSWKYqRGcyDf0oqcoC7MX0OIcGqSs
	NTYplNpyDoBY1p/7LsXKKsdhY0qcS+RvhcqPHSJ4RTTehy/BCKK+mWM/G2+IWH9ILTris/p6jeR
	0dy+mIRA=
X-Gm-Gg: AYBFou1Y6LxAlm16oW/nY3bPNSlTIXa4tEfOsUeaxLRhmt2zuHls2Mlz6QaIPY8p/D7
	y49Rpzkjzm/xgZrj8e7eLxXlXMkkEY7AcS6HEPRhk67/zruXlONp72LQpAPd0GeKFDAPjzN2hNZ
	Covgsa1Jgo+eKMyMI8WyCPWAHHN6/500nyfQto+H8Sjf/fQbrehsuIm3hnipVvDiT1BlnINRDC8
	lVcsFjZOS99lhemTGy3WXNclPBxAPL7CvtGeDznxcOcvvVCw31mcOVDaDGbYoEAL5PZAsMWEaxO
	/4rptj+rqdcJkTRMnOh3VjvOKaZWnG2dJ6w3Qj962Xd8GjE70cCTCoH7AqeJDUMcnfxLpQ5Wt9F
	peAlKyTVAH3neFvWZXps/qYRLGe97FAjnxeORWvy7RZDSmAmuNvTDNxYKJrdDB5T2qkosKIBefQ
	nps/q0A98FG1AgSyFCQ2yxtIPqYowpEWYiFuJtPpYWIDBWiz9zJd4CNwHyApeU+BFYjNgszlfbn
	4/WZnO7P0IZ9cg218rr8BY5eUdyvGVWbgNidbEUr7gRh7csvbaK6QASr/1avT35IbzRZF8ShFk1
	EeHe8K+qPDv6axeEyrF7H6nqQQFBucA3uoxSx+XwQeiIvfS4oCtBsKS0Xm+jCoqvWkl3tazpqFk
	vsMRGdXgZFycrTTqMHnkPiq/05EzJ
X-Received: by 2002:a05:600c:6285:b0:4a1:c6f5:2450 with SMTP id 5b1f17b1804b1-4ac180f07d1mr105793905e9.17.1793405774605;
        Fri, 30 Oct 2026 17:16:14 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ab61d8b9f4sm130350635e9.12.2026.10.30.17.16.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 17:16:14 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 52/55] apr-util: Mark CVE-2026-34191 not applicable
Date: Sat, 31 Oct 2026 01:15:13 +0100
Message-ID: <7d8d78bdf698be81a89edcea5e45a693086d31f9.1793405493.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1793405493.git.yoann.congal@smile.fr>
References: <cover.1793405493.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 31 Oct 2026 00:16:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249127
Content-Type: text/plain; charset="utf-8"

From: Hetvi Thakar <hthakar@cisco.com>

CVE-2026-34191 affects only the apr_dbd_oracle provider [1].
The apr-util recipe does not enable --with-oracle, so configure keeps
apu_have_oracle=0 [2]. Hence mark the CVE not applicable to this build.

[1] https://nvd.nist.gov/vuln/detail/CVE-2026-34191
[2] https://github.com/apache/apr-util/blob/1.6.3/build/dbd.m4

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-support/apr/apr-util_1.6.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/apr/apr-util_1.6.3.bb b/meta/recipes-support/apr/apr-util_1.6.3.bb
index 00a9589ae83..1b7beda9042 100644
--- a/meta/recipes-support/apr/apr-util_1.6.3.bb
+++ b/meta/recipes-support/apr/apr-util_1.6.3.bb
@@ -101,3 +101,5 @@ do_install_ptest() {
 
 # Add CVE_PRODUCT to match the NVD CPE product name
 CVE_PRODUCT = "apache:apr-util apache:portable_runtime_utility"
+
+CVE_STATUS[CVE-2026-34191] = "not-applicable-config: apr_dbd_oracle is not built because --with-oracle is not enabled"
