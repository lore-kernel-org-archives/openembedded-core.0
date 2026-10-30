Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5421.1793338225234936005
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2026 22:30:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=UL7X5218;
 spf=pass (domain: mvista.com, ip: 74.125.82.48, mailfrom: vanusuri@mvista.com)
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-18cdcfc05ffso400651c88.1
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 22:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1793338224; x=1793943024; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nOp3YulBVVtSPPpzQtzAKSV5/jnrUkaZLmD7JUHos0c=;
        b=UL7X52188aE6TphdLYM5RMDz/x/wRaIeE9X7YIduD++HEAlx47O89qXz/5bQ7cbioR
         7byIBuL8gUIOnD89ExWNMj+lxEtQZOKcvEBQgfbLUS/wTB2sAfbLrkrLwekjKe+U7mu7
         Zhlw9CySoDvKwksasJ1Z2U4/lXOYj7o5gRrA4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793338224; x=1793943024;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nOp3YulBVVtSPPpzQtzAKSV5/jnrUkaZLmD7JUHos0c=;
        b=V0486mbbbwRGBtJ4sCwIer2ErfxA7wfyMYW+ebSXSaaPDa/vJanfxJnPRJde4iK7kA
         hJPuCMyTs+5lmSimqeeCaojOmB7mZqMkjdidyLu2ZLnH7BB6z3P96EPkD1owNN/nZj2M
         uBWj+Iiq+rVT25Bt84ljN52VOsIG+3Gma7PFO/V2IAAtyB766ZLH0XjicRS5iOMdONrH
         0xjyVAetwrOpeAuculyWKyzqc38flyuoIYGPYisnx+KEo5slKmylV6u4kvesvAVALGey
         DdR0dWYYL2J3x/NT6hbodjBA2yMeImqKcI48e02HDnHWIwjxS/KRHobn5BK4YFpmKsRg
         wIug==
X-Gm-Message-State: AFq9FYI0Ds6vjTlV9pWtQXjwMe8Vmb2ra79dhDu/aRRHbMIak6BslFVr
	SYKEJDP+dGBFo5q/edU4O7q+hVylStETajP6b3B4GVzLhyuG8slqWADQyWe1+5IqoeADSQJfeZR
	3b27agZA=
X-Gm-Gg: AYBFou0GpT8jY3Ot/egvBL4dCBJZMQePW1JdigRybyfvwJSdq0uxX7ArbK5Wl1eA0Vx
	uueeECqyG9zXUWR/1CMyspScToPQ0wT4jzG1N2lOmdMxiI7n/kJeELSR76jBJrhpn1FV5C6JMvW
	FeM4khnBLvORMNp47/x9WmysJTPzrmPLSUiiaevEKVDm4l1LHKBzo7o0mM4qp5xfKX+s7aKnfqx
	hWkl4dhGbHaQLI6BOF6FAsAj0PukzzdvwzUm9IAb5EyJmmqAJQ7bZBFueI1xIQ4lxeefMo6E02O
	1hIwuXii5KNThoiRjIu/BCnNr9JpKtXxkrm0tdtby04VAKF2e0pSDtjYXmBzvmvy6AmwicytJsO
	z6v+fR90luEb9XOh6WWln36xv2RzBjQ7y+laeU6e66kh61J4MprvOokrLeopN+JlIA9SvjOAeuo
	oZNXAtdOTUn8R3hN5m3H98skLDTreLoUX8aTgN/IPBo8N6kP4ptQ2kPFE01LgDBZGpCHKx/YAhI
	qKNW3idMMiH0KNUGNz0fw/5sIi7oQJGFxh6/paYd4iANJzqOBAAeSBI58rR9s2J1iJdYqetzPHB
	Zc9d7BcHF5qrsF+nt7fMIQJyaKVbbiwJfAf3LCuJ
X-Received: by 2002:a05:701b:4192:10b0:1a3:8d5f:6f93 with SMTP id a92af1059eb24-1ac5c8369cbmr1711287c88.17.1793338224413;
        Thu, 29 Oct 2026 22:30:24 -0700 (PDT)
Return-Path: <vanusuri@mvista.com>
Received: from MVIN00352.mvista.com ([106.200.28.237])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1854da78sm5190624c88.6.2026.10.29.22.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 22:30:23 -0700 (PDT)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][scarthgap][patch] python3: upgrade 3.12.15 -> 3.12.16
Date: Fri, 30 Oct 2026 11:00:09 +0530
Message-ID: <20261030053009.1414220-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 05:30:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248988
Content-Type: text/plain; charset="utf-8"

Release information:
* https://www.python.org/downloads/release/python-31216/
* The release you're looking at is Python 3.12.16, a security bugfix release for the legacy 3.12 series.

Handles CVE-2026-115557, CVE-2026-77214, CVE-2026-102633, CVE-2024-3220,
CVE-2026-114583 CVE 2026-12345

Changelog: https://docs.python.org/release/3.12.16/whatsnew/changelog.html#python-3-12-16

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../python/{python3_3.12.15.bb => python3_3.12.16.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3_3.12.15.bb => python3_3.12.16.bb} (99%)

diff --git a/meta/recipes-devtools/python/python3_3.12.15.bb b/meta/recipes-devtools/python/python3_3.12.16.bb
similarity index 99%
rename from meta/recipes-devtools/python/python3_3.12.15.bb
rename to meta/recipes-devtools/python/python3_3.12.16.bb
index 6c6289b0e6..9946bb075d 100644
--- a/meta/recipes-devtools/python/python3_3.12.15.bb
+++ b/meta/recipes-devtools/python/python3_3.12.16.bb
@@ -42,7 +42,7 @@ SRC_URI:append:class-native = " \
            file://0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch \
            "
 
-SRC_URI[sha256sum] = "c2c4321961fab0fb999d66e0cecf521c2ab3994c7992873ea99e306c1094fd5a"
+SRC_URI[sha256sum] = "b5796915dc45ff745cfb4e990a7e7c93d6f546328a102ce31448d69ebc37575c"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.43.0

