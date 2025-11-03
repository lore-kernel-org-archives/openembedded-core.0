Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D815CCF9F8
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 12:49:51 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19743.1762174184005431690
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Nov 2025 04:49:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BkocUk2H;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6407e617ad4so5374951a12.0
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 04:49:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762174182; x=1762778982; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TzKYQs5C2Lt8W7WEUr7THiwf6ucG6O1khGkUv08GM+M=;
        b=BkocUk2HBvldIs0270fxWGU+r5ZGsDJEkKQy4oalYgXy7qs4T6+6LAmApVo3UVa1ws
         gVObTiVBMBRToEKWvt/kNO2Herr36a0Ub667NbbHs+sCK0zmwOkeGPukL4oIcJEgYgAQ
         pzcglvd2lAQuO+H9s/v2q6ifamYcc0tWNZR2+1jTMRbL7CY1bSK6GNopHWVwdBrT7Yib
         aUfVppyIMj7iutNPpSaB+cGl/Oplr8eRfKm/1IwNhX0uNHDegJBDikqA/hGlDG7/hjFs
         57Rj5Zm5GKOmAn7Tho5xwtByBGyt1+iezoTJ/i7Wsdxk+hdT/AMS+cROYw3bfXzX5ng/
         qvzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762174182; x=1762778982;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TzKYQs5C2Lt8W7WEUr7THiwf6ucG6O1khGkUv08GM+M=;
        b=VtJXwTTSERwtxBNRhx61QhdNHunfhl8GenXWZIsV52ipksSV4hNskoHvpZj17gXKeh
         WZPG5ajkc/ZLbv1AT8zqSST5OKJUYi5c5NfGht1WBk+pAvc77rkdIqPRVSUYYuwJLiFr
         mZqBV6oKnysJB8rwYyqOx5E54m27GA1+tAOgTEK1ISt5c7LunolfNAA/Xb3zBK3GHjcg
         95Ab5dxuaVuBb0OThxEBhcz/MBs3HRbAWxNLsVxv8qFj6gfYKH7FnhYwbyi8uM0MpHVG
         ZqO27c74ZP31yEXy7skfXHuaGNDA86JAXhtsyLgvg6uVog/1IoWz5rlAHujzdjC59ZNx
         JUPA==
X-Gm-Message-State: AOJu0Ywwqn7IC3zCWzFdMFRY/cbJNi48xW7JS43KcAg/k0P3wopETHQs
	niLqbJYcz/rwRe6/WIWvi18FrkB70Fhbk0oqa5tjIac0HekGybE59qEcqJvT7g==
X-Gm-Gg: ASbGnctaaYdAmYK5L7KKSBl5CZFeFmdDOnZ26nR23LdX8uBLVa2W3Uwdva1vIBiq45u
	WLkfcEnpJUnn2Y19rfNNL3DShprKzVhsKVRDBUp9fvviWOYDADp6mDEyX2urxxrjEGpR0/navoi
	8hjfnjggXQDVttImOfErPgEwP17zDIyZWUyuTEZJwhLfVTzVSST/3P/6vihZ42YWiJToz+z/TLt
	b6NVjot9jXQDz/YakVfAg6+V3AMOdY/MgbmSjhdb+lbLgeoy2mBEx0ZrdHSoQPYuxQ7YMemmm5Q
	DJVlOJTra46pvVDG4hEmEz3/YkSZheuOIod4FLYXUIeKvh8D6H1t7Z36DO9TSK6FGBr04gjF3NS
	qKi7rfNc/BybuPEFSzOHviI9NkJqnlcHOU23H1qTrXHxl+fx3aZJDapm2n2pyf4wiKrrEwB0J+A
	htg9lFVBZZd5YJjsYqZjJGTWpZm64x5jsQ
X-Google-Smtp-Source: AGHT+IEajUn6jh+GOEX2XslrNkRou5/N4XBDpXSsmL3752zcXZSBgF55mi2t6hwJn33dP7FmA9We+g==
X-Received: by 2002:a05:6402:1469:b0:640:9bb0:a059 with SMTP id 4fb4d7f45d1cf-6409bb0d2ebmr6642834a12.10.1762174181954;
        Mon, 03 Nov 2025 04:49:41 -0800 (PST)
Received: from fedora (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64095f9ee0csm7224348a12.16.2025.11.03.04.49.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 04:49:41 -0800 (PST)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH v2] meta/conf/layer.conf: Omit most build deps of rpm-sequoia-native
Date: Mon,  3 Nov 2025 13:49:39 +0100
Message-ID: <20251103124939.2076502-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 12:49:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225653

Omit most of the build dependencies of rpm-sequoia-native as it
needs only OpenSSL, and implicitly, libgcc and the C runtime
to run.

The list of build dependencies were determined by

  $ bitbake -e rpm-sequoia-native 2>&1 | grep ^DEPENDS=
  DEPENDS="pkgconfig-native cargo-native openssl-native python3-native rust-native rust-native"

Omitting these (except openssl-native) can save significant
amount of disk space and it also speeds up packaging into
signed rpms a little.

Omitting rust-native (and implicitly, llvm-native) also avoids
conflicts with different LLVM/CLANG versions, like those found
in meta-clang-revival.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/conf/layer.conf | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index 54fa04e213..ba25ca3029 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -116,6 +116,13 @@ SSTATE_EXCLUDEDEPS_SYSROOT += "\
     .*->perlcross-native \
     libarchive-native->e2fsprogs-native \
 "
+# rpm-sequoia-native does not need most of its build dependencies to run,
+# so omit them. The necessary ones are openssl-native, and implicitly,
+# libgcc-native and the C runtime. Omitting these build dependencies can save
+# significant disk space and speeds up packaging into signed rpms a little.
+SSTATE_EXCLUDEDEPS_SYSROOT += "\
+    rpm-sequoia-native->(pkgconfig-native|cargo-native|python3-native|rust-native) \
+"
 # Nothing needs to depend on libc-initial
 # base-passwd/shadow-sysroot don't need their dependencies
 SSTATE_EXCLUDEDEPS_SYSROOT += "\
-- 
2.51.0


