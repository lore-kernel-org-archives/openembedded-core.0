Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25764.1794830320963107225
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2026 03:58:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=G/5fHBBJ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so35794985e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 03:58:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1794830319; x=1795435119; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1dS9Z2lytkYlfAaXK0dULfb0jGr+WqGLesnK5WxSN0E=;
        b=G/5fHBBJcm3BEG59XtdOp02DwhqMGQxwa81fQ5GpFFTiR3UIYwlAkz/7+Su1RmMmSJ
         aXM+Wwc16VcWnzaj8akv1bwh+Zk1IRb5QGOl1mlsZMD0aB93Wudv27RVheSQEbuQWiDq
         cHL/X1mzHQ6kjGkfXnbXiIqMDfFciUWp1o76A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794830319; x=1795435119;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1dS9Z2lytkYlfAaXK0dULfb0jGr+WqGLesnK5WxSN0E=;
        b=SwF8PMHwDCIMsrucOa4HkBqIitLH8VjubxCh8jrPhCtYNJNJtqxGCCa9xbKKWAWY1G
         g9vrud0dU+0km/4Ck8WNr418t0QUEVg900H1A3PXmbmT8CdlSXSE+LV0H625vDK201I/
         8yQu33Bo30pr385dJQvY0a//QKFAe0u+Tv3dy0nftJy9uK2M8DdlRIAt13jecvmwJhK5
         pI8bFSUaIdP8SUswbVbbL/ZOCsVSTEyUlYa1LHLs5EOnHzF807PQys+jc599n6uU9rxb
         EQ6sU+VvQlPf2c40unSkxyhzI54tBuLffTMKdUbEBq/8xcuNkCYO7NmmJbQoAfqX4tBu
         OBgA==
X-Gm-Message-State: APuU4Z/5Pz8bbGNd1SD+KoeuLRFYmi4xdQbw738vLPJr7pEiWRsSasYr
	fHvuYlw75/CsO968ykRCiLYeImwMHEuaYQh34Ff35qu854v4/Q7DLQzht7NaRpzw9U5swb7cXv7
	uBc/yoJU=
X-Gm-Gg: AYBFou0KuN4o3WR0gdMjWYYPWKURElNfCvggtFI5RdcayU+3hNYbQ+TLaoqJlERRlUg
	9f3pfcbdkkAMlXgzOU3OhFe6JvIDoiL673fLXjaX2LULBDm+on3kAkhVGgPw50mOpoFg7cbDAFj
	EQ2oDlZagxV3VmpcjT6dMiTL15C71+6Njcf/n9yGhe2J8KY8PBTTlmz/cv9ntDLbEHWze3hvRjx
	lNg0210UxSfqvdBd2t4YnnIm5hhUsGMgwCsw66XZosS2iec+0im0FR3aJNLEse7zGJ713qWfrVu
	g30R+z2jE9IwYn3oK3f6B5rXl5gwSaKQJNebWwOuIoBTMLOEGdWEh6PwCMBwWi7zyeHB1qKrSpA
	/lhLgejUiDAJmrybU/NV0HbSQO4GOWxrWJksBHGo6VO5Hti9ZRVXUB3wkwnYbBIKbDEcgfRBmml
	GsiIOMYceN5KK+NXO8F/2j/xgtqDhYn+j0uIGJaTqjVxTWJD4HuRxegO2n2l5ZShNOM51ICT0gN
	B+omcuyG519VxShTIUKlZ3/kBFVv+nk18Ts9MbakkqwiNuauoEDZscCyOhTOHUfnsyZIXHkRhBa
	ty1AL3uvRYlTgLyUOqLpO0J8+H6x0R7VG9AeDa8PKrssooZRVkX9Mos=
X-Received: by 2002:a05:600c:c166:b0:4ba:6d8:df8f with SMTP id 5b1f17b1804b1-4bb55a832c0mr239731595e9.15.1794830318909;
        Mon, 16 Nov 2026 03:58:38 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:e765:5fb4:66be:d7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb69ac4e16sm110712975e9.0.2026.11.16.03.58.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 03:58:38 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] reproducible: Add include_all
Date: Mon, 16 Nov 2026 11:58:35 +0000
Message-ID: <20261116115835.1354918-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 11:58:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250339
Content-Type: text/plain; charset="utf-8"

Some layers have components which are known not to be reproducible yet. It is
useful for the tests to know these so that we can test the ones which are known
to reproduce for regressions. The question is then how to get that data to the
tests.

This is a good usecase for include_all, so layers can place a file in a
consistent location, conf/distro/include/test_reproducible_vars.inc and
the tests will then have the right data.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index 1a71b9832e3..28236a28d52 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -240,6 +240,7 @@ class ReproducibleTests(OESelftestTestCase):
             TMPDIR = "{tmpdir}"
             LICENSE_FLAGS_ACCEPTED = "commercial"
             DISTRO_FEATURES:append = ' pam'
+            include_all conf/distro/include/test_reproducible_vars.inc
             USERADDEXTENSION = "useradd-staticids"
             USERADD_ERROR_DYNAMIC = "skip"
             USERADD_UID_TABLES += "files/static-passwd"
