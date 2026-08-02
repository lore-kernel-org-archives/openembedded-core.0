Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8624C55174
	for <webhook@archiver.kernel.org>; Sun,  2 Aug 2026 10:29:27 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21191.1785666565630401422
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Aug 2026 03:29:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=a75EOIK7;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49557167508so10458915e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 02 Aug 2026 03:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1785666564; x=1786271364; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6rbzQa8EzZZ2lgPiWnhSu3EWSv59h31c1j4Y/YVixXM=;
        b=a75EOIK7OJpYhPN/CxIo4+ZKBAoC7s42RXWJyapeqGTMJPQNis5UlSuqr87Xt/MonP
         oizmG8VJiHx5cQ7FvOwrk2bqTbR1X6V1oBoYg0I90Z5ZvQxjT/Hbe6FGyXnLcsfPRAb0
         DrtNnuyK+dqVLP/tZfAiBWy9Cj7Dt/o1hyEKE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785666564; x=1786271364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=6rbzQa8EzZZ2lgPiWnhSu3EWSv59h31c1j4Y/YVixXM=;
        b=C9bPWuUDs7hpnai71QvfgjCqW1Zfarvvx9Wff4nNsHaj/nEpXc2LXQcIJOsXN3cOTM
         NFwzUupJtXlWdgKzIb5RYk2q6HXf5MVtZf0/YilkEy1Wro5peuss1upuLF2Z6xnmGx7O
         xxjjtn4GYk6mTLiCWIlROX6IZG6ksOqTPYx6+93JinRbLlOeDTjsZe4imU2GSoDftbur
         9bbujKM3hvYJBmKzYHNkmMZ3LnsVqO0CQSfx2QztYPO3qTXPf6tRGBN28AMM2+We1Yjk
         mM2Bf+/0knyyzAGtQNv99saCSZwrCESeIwAKxktRq/nEnPIWWF6L20Rg1RpynOjp3qAW
         nE9g==
X-Gm-Message-State: AOJu0YzsXDyGG7B3c1chWHO9k9asT3/T2zUdQGKD6uVKokM/4s/mk2aw
	Fo2vYxpzHeblssdTGUn1KaH/sRgcFaKNv7A2giYPstbA9qnYFhLArWjKXM6iBUK4lKh5+PpyRh+
	qBZfOueI=
X-Gm-Gg: AR+sD11pB5Q4ICNr3joc0oxrJKGso8FvKy1ZWFyWewy4W9F7vCsEon1bRxPpIJxxFRv
	68mX+tNsFsgY1DUmLopc6CnG1zg7Wv0c71/eEVLMsoiwDlgEJB8y0fj3F72QonIbp+Va0v8ncfb
	jmsvwzpP620zZAdcrgXxxojyR3YT3G+VQ1JYOcBaJEnkIocP9A/2JKzszwgTmTIe6W0xzUHOgyG
	fldCQV1yzcdBaI1azVM75Y/eG0ipVdwTA/VGAdROetf/QHcQmLRlITUwsRptzECoDSGtL8TSdZp
	q9dI31yYB9dWxkvRTLmCZBXHSoaKENeerCfR1HN6krckcnE+UhQ7fvF0nMpC8ufYptaDT74Hus+
	GseVgaGRd33vUHCVpQL8Ww4nmum3BEwcoJLetGdiYmL0f+PEaFM9v0t4k7/MfvWkZgx+38qCzdn
	m2cotrdSWQ6nAKamDMYyb9Xobc07e1HQTDvbYJv1EtcjZ3eSvPSyPz1nOvtKg9ET5i5XqEQ5fHY
	RhKVV850HGpIoO5dbYaK/aAGXjQGw==
X-Received: by 2002:a05:600c:354a:b0:490:b8c0:d470 with SMTP id 5b1f17b1804b1-4980c67d71emr118937815e9.19.1785666563844;
        Sun, 02 Aug 2026 03:29:23 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:11e3:e7fc:e526:8a64])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b8d04fsm167140375e9.3.2026.08.02.03.29.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 03:29:22 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 21/25] utils: Drop explode_deps function
Date: Sun,  2 Aug 2026 11:28:50 +0100
Message-ID: <20260802102854.3952760-22-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260802102854.3952760-1-richard.purdie@linuxfoundation.org>
References: <20260802102854.3952760-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Aug 2026 10:29:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242546

This was just a wrapper around the bb.utils function, drop it in
favour of that.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/utils.bbclass                        | 3 ---
 meta/recipes-core/packagegroups/packagegroup-core-sdk.bb | 4 ++--
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta/classes-global/utils.bbclass b/meta/classes-global/utils.bbclass
index 530a490ea84..443f0c65560 100644
--- a/meta/classes-global/utils.bbclass
+++ b/meta/classes-global/utils.bbclass
@@ -271,9 +271,6 @@ def check_app_exists(app, d):
     path = d.getVar('PATH')
     return bool(bb.utils.which(path, app))
 
-def explode_deps(s):
-    return bb.utils.explode_deps(s)
-
 def base_set_filespath(path, d):
     filespath = []
     extrapaths = (d.getVar("FILESEXTRAPATHS") or "")
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
index e6d704b5bae..4a147c059e9 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
@@ -62,7 +62,7 @@ RRECOMMENDS:packagegroup-core-sdk = "\
 #        # the package depchain code
 #        spkgdata = read_subpkgdata(pkg, d)
 #
-#        rdepends = explode_deps(spkgdata.get('RDEPENDS:%s' % pkg) or '')
+#        rdepends = bb.utils.explode_deps(spkgdata.get('RDEPENDS:%s' % pkg) or '')
 #        rreclist = []
 #
 #        for depend in rdepends:
@@ -72,7 +72,7 @@ RRECOMMENDS:packagegroup-core-sdk = "\
 #                rreclist.append('%s-dev' % name)
 #            else:
 #                deppkgdata = read_subpkgdata(name, d)
-#                rdepends2 = explode_deps(deppkgdata.get('RDEPENDS:%s' % name) or '')
+#                rdepends2 = bb.utils.explode_deps(deppkgdata.get('RDEPENDS:%s' % name) or '')
 #                for depend in rdepends2:
 #                    split_depend = depend.split(' (')
 #                    name = split_depend[0].strip()

