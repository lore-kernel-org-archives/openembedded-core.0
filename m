Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30086.1793868250813356311
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 00:44:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=Px1wdAAK;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a210470b49so11433995e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 00:44:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793868249; x=1794473049; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3fgQykx7XfMKyLDZsiazWN2ESg0HTdtvAYLSv3X7Gf8=;
        b=Px1wdAAKrH2SEIhwTYwQEeZ+Kb6ZJu+iGcq6Q17zEuqmz5rsX7SpRS9349rhMCKzid
         qtw1ZRMzbVbEzoG3+9FiaJqWwSv4rqJKKAXMAQSr8Ir2ZqOJoXRHlFY5UrkT489UkC5Y
         NjyAIRI8nQ/7NNhly0zQjNWUdd0TAozdyqRC3C8D5MfxcGiemMiwukSxe2asyjhHQ5l/
         AFEAR0rSRoVcGtUvaHl3eUL75PfvNS+fbWjgwL9PxrzksjQIHOwMBOaS1CUZz9Vy8yxZ
         K2e7rmXBwMRXbvQFGmhYDogkZw33dEoMBVpBhEVCrzlvCEfoeFGZor81d+MkreVPsBg7
         CYkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793868249; x=1794473049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=3fgQykx7XfMKyLDZsiazWN2ESg0HTdtvAYLSv3X7Gf8=;
        b=BXlj7MYHSwEsx8dH6s7sNYriY11sihU3BCZCgMU8XH0yYrK+yo5ipagNmKPuI5/W1s
         s/I1bpczlGwmMNlSJumEG3sGyeAvVCxrpcC0+HtYdP5NH/TLC5ImRCnwKBUfWeJM9AC1
         MJEPlOIml/nosp+53v/e/nCxEjkowiZq3ugW85KInxk20TE3QiRRewoQV30TSl+HbHGi
         ehgNQqhqN0b+aDpD5Y8d/AiaC5zhZcRf+3C9mA9aC8Two3ru9MI1r0jm1jg14QBWDDuA
         Uk4GU05blOjXdfAw4cII9LzdyRFNrwY6lVebQb9sXsKfO8I94P7VNSTJOL2CF9FQDnR5
         KLtg==
X-Gm-Message-State: APuU4Z8nIaE68nTQra9wj0gQKKq7t2nZbgWe/eyOEo/59LBpKLvnsQfr
	uGA9eqSDziiHVjN+tyzYlfRp2GQ7xqxsCCDiJsx2CwfS6uWdQ/00ceuVoXGv8aVcpvvsBCnLfmb
	fZsl+ej4=
X-Gm-Gg: AYBFou3+L7fblnn2sZLPC7dpd6hZC7kLbjq0+4JSAotlnqaSYsvCHyU7eENUfsIP23A
	Jj8H7M3wXHxxUp8JB3MZofuGW4BqiZz51F1eQ7rE4JzpNfVGirS5SjlEEIX2DkyKOcL8JA1NNHb
	xohLR1GOxNDt28oKokkIfqWYqKzFI1veTz2h4wcrrQm1MINeYJyZNUcPx4gBsuIoAnNmroIo/17
	+Dn1SDaC6Ml5F2eI9TkHix+Cg38NRmnvglam/udiS0B+L7eIIghHkpzx0TXzNwHsi+euTEwWofL
	r866DWqTBqro394E1eT0v+AQUpgw13fFG8z8comdg5uMj2uyUc1k2UjS09/h96A7GMH77+DdJxM
	iTHfzjlTgjs1Vj/E65c+EuPYrDZGXij6OuVo6UltWu+KUExVyJCBPJJLag1UlJsErK3qdXRpvK0
	h9Yqo9+bve2C7QLquaDWe7ZNSe/vlUvvN+kxUM0BaeibkkPYOwP0h7nAcyo2HjoouZMobFCfpfK
	f+TWW08du3GulnoUIQeGQKxHRbOYIEpseS24V9szeYFNFwtxncN26R5q6sYypHwmhwSlzwfdSGr
	+qLpXz3ajwwuMhRT1WaAt7jLvaiPy1ni1gj265lSShoA2Wna3sv5xPwTXXQQkIb2/hzOsqb+EMt
	VyM49H+XjxUiAsofOVqVDdcKGyR/n
X-Received: by 2002:a05:600c:c16d:b0:4a1:e00b:a0ea with SMTP id 5b1f17b1804b1-4ac150b204fmr390452885e9.1.1793868248986;
        Thu, 05 Nov 2026 00:44:08 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d8e29sm9200620f8f.19.2026.11.05.00.44.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 00:44:08 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail 59/60] python3targetconfig: Do not add the current directory to PYTHONPATH
Date: Thu,  5 Nov 2026 09:43:18 +0100
Message-ID: <ebd8ff92916699a09b933eb26dab7a5ffcbf25b8.1793867929.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1793867929.git.yoann.congal@smile.fr>
References: <cover.1793867929.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 08:44:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249518
Content-Type: text/plain; charset="utf-8"

From: Khem Raj <raj.khem@gmail.com>

setup_target_config prepends the sysconfigdata directory as

  export PYTHONPATH=${STAGING_LIBDIR}/python-sysconfigdata:$PYTHONPATH

PYTHONPATH is normally unset in tasks, so this leaves a trailing empty
entry, which python treats as the current directory. The tasks run in
${S}, so any top level module in the source tree shadows the modules the
build tools import. wxPython ships a build.py there, and pyproject-build
then fails before it starts:

  File ".../recipe-sysroot-native/usr/bin/pyproject-build", line 5, in <module>
    from build.__main__ import entrypoint
  ModuleNotFoundError: No module named 'build.__main__'; 'build' is not a package

Currently, the wxPython recipe is unable to use
python_setuptools_build_meta class even though it should
It keeps using setuptools3 bbclass and disables QA warnings for
pep517-backend

Fix it by only adding the separator when PYTHONPATH already has a value.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 18712106f7506544ee361b5634b76abed2845403)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/classes-recipe/python3targetconfig.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/python3targetconfig.bbclass b/meta/classes-recipe/python3targetconfig.bbclass
index 3b9333a4be2..08be22ae654 100644
--- a/meta/classes-recipe/python3targetconfig.bbclass
+++ b/meta/classes-recipe/python3targetconfig.bbclass
@@ -14,7 +14,7 @@ DEPENDS:append = " ${EXTRA_PYTHON_DEPENDS}"
 setup_target_config() {
         export _PYTHON_SYSCONFIGDATA_NAME="_sysconfigdata"
         export _PYTHON_PROJECT_BASE="${B}"
-        export PYTHONPATH=${STAGING_LIBDIR}/python-sysconfigdata:$PYTHONPATH
+        export PYTHONPATH=${STAGING_LIBDIR}/python-sysconfigdata${PYTHONPATH:+:$PYTHONPATH}
         export PATH=${STAGING_EXECPREFIXDIR}/python-target-config/:$PATH
 }
 
