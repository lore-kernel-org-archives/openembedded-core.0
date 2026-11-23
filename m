Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2462.1795462199090912439
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Nov 2026 11:29:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@9elements.com header.s=google header.b=FyP1n4uc;
 spf=pass (domain: 9elements.com, ip: 209.85.208.46, mailfrom: tan.siewert@9elements.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b86fcbd647so5850330a12.1
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2026 11:29:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1795462197; x=1796066997; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ikAEBdpVOM1ZrsqgO3B/ifS3C49BQZ+U/DDouuhaBIo=;
        b=FyP1n4ucl0lMOFSjlUoJ0Jw+9qz7HojlvA5bdCdTnu5yuB1pE+fEHQsv52nZORbAaj
         2uzpS6rpL+0FykBj1EM2+HbbYxv+kiPZsds/ythKqDx/URbon2Sj6L4cNdanqeFB/uyb
         lVQrIDQMs/PugAIbRYKLjb9l7MsxCejrmQV53uOspTSb9wJoSxVXXIoL3y3Uzt9pGNdy
         7Mh+Q71qfC6bGNynCaMOYRMxqPDduLfAqxJWeIQRtn1yrd3Aqlj2uE9ZRuoTsDuoM4j5
         HwcPAMlwlnaAaw7iOaUSx0YetGl6+7IhXK20FpReADK1fjtOWFv4aWtGpwZVSI/7unHV
         Bvhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795462197; x=1796066997;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ikAEBdpVOM1ZrsqgO3B/ifS3C49BQZ+U/DDouuhaBIo=;
        b=Uvwj7jxWNQcdIyp3Lk4LKttpDkex7GeShffH4KJe16B3MWs7Cj4sGgEZ/rWCqe94LI
         noadc+5JtHsHyLYyodLFMXaDF+fpX6G5tGzX/g49urKTnyIaj7041pchSjQnHjyaGbOk
         6xr439jCOeEToeaFLnG7d4HbfUkbo46UlcwnCa1KMVKodgUc5wZEh49PJuqpKmTngVyU
         MH46vBEM+zdW78jAkJTOpi/uwtbTYsolKhOrNGD36eCuZwMRcNeyPRjR94X10dAdgcEG
         9wwhSzENA3zqVZODTqvkH8TT1UolirBQSmdEOThksQ+ZUac2U7NAKeq0mqrGbJD0bjdZ
         etHQ==
X-Gm-Message-State: APuU4Z+f8v+oA/K/sirbn5lxR/RHVg1nYYh9wUkWZPuECEZfgdT4E35o
	O6pHEwCfnt6awOOo6wTGCiLuMuYlefFYcbkUuLDJ9lWUVFC53HSIkNoO4l2oh5W+SKxzQ9yjpJr
	ljcoBC5wSng==
X-Gm-Gg: AZFdTZcAj3X5nVPviD/V1IC9HjBZxR9uMwuqBwULgQ2aB3/W7lVN8YdIrEkomp8DyMQ
	5GYKTeFmzcNDi3unJel1NWQZqpoD5b3hC62v1fQb/k9q7AjdjuE3qd53tQdyzkW8NAXKBBfLxkU
	jH3WVwU7wR4nQQwz5lE04hduHuKCKX2GlxY2B1BHCjka6Op6+5W/ob75HpY+ZENhfC5PrhiXF4X
	Xvo+YcqT1iklu25MCmMk7cxxM0mXasJrU367SPOMrl+IcoX8QIKdqASSJI2QVXO5uvk8CEphDzg
	ZxM4baTs25Dux39QJEVd3Rzj83y81ntyUctFtnyr/LZSR7VyR9urgXxsqV2SfBLUtDp0ez4nyZK
	LgrJdjF+tV4z+SUYY5YukDGezFKooc0CbbAnF05ePQ0VH6sCyFVJXQRvCxZVdAfEwCctX6wksR7
	q5TNkZDSsgi/9jULDKrms9RpRqK8cjocveDYja6jDe3Ofif4XJxM9mz6X617CypgrayLTX1r3wM
	uAQLmQMi9EPnep1t6nSJqWB/1DbFG6V4ytCPDMsxb3/fo+IJPCPZRGJOTECF7l9S3NnMi003+kQ
	lN2PANIaz8/lT9FfLb3DTooNepy5xhUjfYvmEvWOvnb5HEijDEjPuSqP6zfMuhTa68egSEkgt2y
	YYj+fps8qjpjis+RczcLq7zM29FkbyYRY
X-Received: by 2002:a05:600c:4585:b0:4a1:c6f5:2450 with SMTP id 5b1f17b1804b1-4bb8881b8e4mr259795025e9.17.1795461778259;
        Mon, 23 Nov 2026 11:22:58 -0800 (PST)
Return-Path: <tan.siewert@9elements.com>
Received: from white-mocha.local (p200300e66714e500bfe47b00fa11e276.dip0.t-ipconnect.de. [2003:e6:6714:e500:bfe4:7b00:fa11:e276])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90660cb4sm299291305e9.2.2026.11.23.11.22.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:22:58 -0800 (PST)
From: Tan Siewert <tan.siewert@9elements.com>
Date: Mon, 23 Nov 2026 20:22:42 +0100
Subject: [PATCH v2 2/4] systemd: add sysinstall packageconfig
MIME-Version: 1.0
Message-Id: <20261123-systemd-optimisations-v2-2-0ecd5965985c@9elements.com>
References: <20261123-systemd-optimisations-v2-0-0ecd5965985c@9elements.com>
In-Reply-To: <20261123-systemd-optimisations-v2-0-0ecd5965985c@9elements.com>
To: openembedded-core@lists.openembedded.org
Cc: Sai Sireesha T <saisireesha.t@windriver.com>, 
 Tan Siewert <tan.siewert@9elements.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795461768; l=1962;
 i=tan.siewert@9elements.com; s=20260527; h=from:subject:message-id;
 bh=TdVJGPFYoj731vVArvmrLsjT+HB9SXF8OmxqDF+vQyU=;
 b=ve/Relewl1H51In8upWigEXTe0XyQeGz6wQ/AFu5GRJma+oKY3GZm/8EgBgH/t+pMzbm+W1eE
 OAIdw5uH6YJAse0opFUsjN3UyF5N7naJT5fogeS/nHeNLR8DbTeJ0S+
X-Developer-Key: i=tan.siewert@9elements.com; a=ed25519;
 pk=ORQd/zQf+LsAvJGXP1CjQwVO6t6iEOGq/eGUsmRVTG4=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2026 20:15:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250937

sysinstall is a system installer tool and is unnecessary on some
embedded systems. It calls systemd-repart at runtime, but repart is not
enabled by default, so the shipped tool could not work in the default
configuration anyway.

Add a packageconfig option, disabled by default, and warn when it is
enabled without repart.

Signed-off-by: Tan Siewert <tan.siewert@9elements.com>
---
 meta/recipes-core/systemd/systemd_262.2.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd_262.2.bb b/meta/recipes-core/systemd/systemd_262.2.bb
index eaa4b900e0..899df09fa2 100644
--- a/meta/recipes-core/systemd/systemd_262.2.bb
+++ b/meta/recipes-core/systemd/systemd_262.2.bb
@@ -187,6 +187,7 @@ PACKAGECONFIG[seccomp] = "-Dseccomp=enabled,-Dseccomp=disabled,libseccomp"
 PACKAGECONFIG[selinux] = "-Dselinux=enabled,-Dselinux=disabled,libselinux,initscripts-sushell"
 PACKAGECONFIG[smack] = "-Dsmack=true,-Dsmack=false"
 PACKAGECONFIG[sysext] = "-Dsysext=true, -Dsysext=false"
+PACKAGECONFIG[sysinstall] = "-Dsysinstall=true,-Dsysinstall=false"
 PACKAGECONFIG[sysusers] = "-Dsysusers=true,-Dsysusers=false"
 # When enabled use reproducible build timestamp if set as time epoch,
 # or build time if not. When disabled, time epoch is unset.
@@ -871,6 +872,9 @@ python __anonymous() {
 
     if bb.utils.contains('PACKAGECONFIG', 'homed', True, False, d) and not bb.utils.contains('PACKAGECONFIG', 'userdb openssl cryptsetup', True, False, d):
         bb.error("PACKAGECONFIG[homed] requires PACKAGECONFIG[userdb], PACKAGECONFIG[openssl] and PACKAGECONFIG[cryptsetup]")
+
+    if bb.utils.contains('PACKAGECONFIG', 'sysinstall', True, False, d) and not bb.utils.contains('PACKAGECONFIG', 'repart', True, False, d):
+        bb.warn("PACKAGECONFIG[sysinstall] may call commands from PACKAGECONFIG[repart]. Consider adding it")
 }
 
 ALTERNATIVE:${PN} = "halt reboot shutdown poweroff \

-- 
2.56.0

