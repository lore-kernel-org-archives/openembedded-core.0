Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15286.1794495872804845175
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Nov 2026 07:04:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cdaKqDmy;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-491aaed7565so2608612f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Nov 2026 07:04:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1794495871; x=1795100671; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9mFhdntcQ7y4ZqIXr6Al9Q5n53+pjzlsu38G17fkyzw=;
        b=cdaKqDmy9iWALVZXtGZ2IVE7b/JbTNk34zn7tVphLlI96N6XNrCUlEYAcZzTHmCepk
         7CaxInLLTiDp/uRNvbu1aFFI9FvJIv90Fn/XIx6/TYkEiUg0WNoisWX5iB8fFJMSFcil
         wV8OxltcSsRPzdvolYe43J3Rcm8d/FPn1p54A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794495871; x=1795100671;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9mFhdntcQ7y4ZqIXr6Al9Q5n53+pjzlsu38G17fkyzw=;
        b=fZuWfjAqcp/WsQxsYEfUkDQq5aqhoqx9cd8lvJxSTwdyx1wg059uDtwerVayEXaQ7d
         hGQtGhyjn3CvQsicjuj7OPgtbx21kPzw/ZUr22UKJjJHXQx/KSSOBqpuW1rGv7SQ4Li/
         Aw6joo3YP1cjqqkLFwUQoj+gj0RymiE/TJe8miv74ahOJM6Q+DLb3uQMsgfQsvZV1yHS
         v96f7/A3WS1wZ+vMkv2NM95Yc//Nu5c4o1TlJxqMY+6JE+fGpRjthquUlUCK1EkECCd+
         i41+8YJ3LPz+hmEAksiRSMc0yEJbWN0EM7Rm9ypj4asVwIXAvmj084k+F9jiWujwL325
         k4ag==
X-Gm-Message-State: APuU4Z+EXR9WKP16N5XpbAcCXP0FYMCKrdvLPYJRbLhq1bCbW2eAjvny
	CfxJUFRAPQHXyXGPCmnD59yVly39dybmOd7MObY/NYZFTy9fUMp4dWvKNQv7tRrUHVaqfeQtVG2
	neG3kkME=
X-Gm-Gg: AYBFou3p4DUd8MExcvt7X3+YEa5Q8/LtdUzb5FjGFI4FA+/Mn7neC3jW+N+8iPsdK69
	t0b3Q0zWSUWVpHg/F5slx+itgQvU/1Na36Xep0DeQ/L+6nqCzisz0vQ3Q6V/vDlJjaKameSVdl9
	5LtITtaEILsozTJwQw+j7yRtZqU1uXDdTDBIzUYzX3LhvCtaJ9DP9Iv9QmwRpyVLVW4zftaN2EX
	SuhO4V/1NGw0Nam43UUPpPZkddOE0VRUNNhfQbhC0VpXUgqV3acpeKC3sRUCd2BEBp1mnKzVmjG
	ZvOYTj1FaL+Di5RKi+oIyStXqNVPl+WZtqJUJp26C7a6VqXZGBatdgfBb+AcGpQVgZAb/PxPxfA
	Idi5e4PfaOBm9JcmWC26FC21SIdtizeJDQqylzFbxhLyZj5bB9QSBA1sXJqfvY4teN2b3ZvodPc
	n+qDhzkGNXA52Hai0dliulAX6AhLju6i+cK9wFEjZ6Pa7yFunP7wAGlmxdMYOi+zkTQPlIL2fMf
	gwV5W0L1v2niddGyeoBc/DFH3WTgsnFC7Xrp5QlDI3ywHpCBJh1mLZsxJMRDi/5IwUQyrvbj0Sa
	83XsHFdVmBm0Q1L7/HvnzSobvO6+CNh+ccRcsm3ETl7atZGgCmiQSDjXLDo=
X-Received: by 2002:a05:6000:4b06:b0:48e:7026:5243 with SMTP id ffacd0b85a97d-499c7270e9cmr10154060f8f.20.1794495870440;
        Thu, 12 Nov 2026 07:04:30 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:1562:9f61:e354:1b51])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983284c9b1sm15744853f8f.6.2026.11.12.07.04.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 07:04:28 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] defaultsetup.conf: Promote security_flags.inc to include_all
Date: Thu, 12 Nov 2026 15:04:26 +0000
Message-ID: <20261112150427.3396468-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 12 Nov 2026 15:04:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250103
Content-Type: text/plain; charset="utf-8"

Other layers will likely need to extend security_flags.inc. Promote it
to include_all which was designed for this kind of use case. Other layers
can then simply use the standard location.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/defaultsetup.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/defaultsetup.conf b/meta/conf/distro/defaultsetup.conf
index c6be00e80cf..d3d445a3f44 100644
--- a/meta/conf/distro/defaultsetup.conf
+++ b/meta/conf/distro/defaultsetup.conf
@@ -6,7 +6,7 @@ require conf/distro/include/tcmode-${TCMODE}.inc
 require conf/distro/include/tclibc-${TCLIBC}.inc
 
 require conf/distro/include/no-static-libs.inc
-require conf/distro/include/security_flags.inc
+include_all conf/distro/include/security_flags.inc
 require conf/distro/include/yocto-space-optimize.inc
 
 require conf/distro/include/uninative-flags.inc
