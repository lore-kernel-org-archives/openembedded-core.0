Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
	[209.85.128.49])
	by mail.openembedded.org (Postfix) with ESMTP id B6CE47C9DC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2019 17:47:36 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id z84so3700115wmg.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2019 09:47:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=hjGHIpcin8tW9kGR/NgQyLkFHlpKtvjWh5AXy7uNvAc=;
	b=cgOnt3K/1/X8x9svo3GWK98KAtMNTYIx0Mw8CkRBcoBXLLoV6083Ms+yuUTMLVXhSy
	EJW46A9HzzjKNOmsRH48bN/g15/8ToNIMOtHizBPL8h8iSR1KKlOMoxS0xVHCgNrJGYd
	SIPKaDXONuk/TMQbIdTy2+YVfQFmgMbzHsldU99GPT3nUbwkfwLOr9G9pqIDUsRzs4xG
	Weyz5A5ZMODUFnktU2cajVLfT4ludwLrcmZm0YePBJQUeQnxHoFn27k4y1Yg3h7fPUNc
	4P2JgCwcWLG+14Pj+3091d9hO6p5Le82wQgPifsTA7qS+rDqF0BDubzh+4+24WCHOSOg
	PArg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=hjGHIpcin8tW9kGR/NgQyLkFHlpKtvjWh5AXy7uNvAc=;
	b=NNimc8xYirSysTGzbQcE1A/eXWjfI+qX0fhaqgr6lmNTZUzOCUdZqxoQeC3xcKVZxA
	s6o+4EillIIAhcDkZQxVWgN20c2A1ryrjlG0Rzm1NrMZ90UgfkodXehnJaAsuNBGEnoz
	MuYslrg/ZJ30S0kdVKFzCY6p+UsNrIgEq1mq3MOn8K41uREnwIRw19yjYyJxpBeI0xou
	JHlpP/igZuPqzKwoagejiJfUnw9SXHf5qkcKJSXkbC2bm3jwsDmNXC/1q4SOO+dvm36n
	YDu16einAu8onhGspcdyAB0cA2rbdiEirn86HvfcuUl1OJttGUiU4PxbqrtyoO6dRSBi
	pTJw==
X-Gm-Message-State: AHQUAublbqQyjAHxJanBsBI+48Mv27wvG4PQ7AVSmM1JpW3aiEVgjoZn
	dxwyQMh185SRC086NFUNMy/9CTTW
X-Google-Smtp-Source: AHgI3IajhQTiu197NtvUgOZlqDDByP5psspV+oM7em5EsUm+/nDdwxBm8+WUUi0KqPpvAmMXMEYsGA==
X-Received: by 2002:a1c:44c3:: with SMTP id r186mr3747993wma.63.1550598457213; 
	Tue, 19 Feb 2019 09:47:37 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	z15sm2006684wmi.46.2019.02.19.09.47.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Feb 2019 09:47:36 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Feb 2019 18:47:08 +0100
Message-Id: <20190219174712.60694-16-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190219174712.60694-1-alex.kanavin@gmail.com>
References: <20190219174712.60694-1-alex.kanavin@gmail.com>
Subject: [PATCH 16/20] dnf: upgrade 4.0.10 -> 4.1.0
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Feb 2019 17:47:37 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/dnf/{dnf_4.0.10.bb => dnf_4.1.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/dnf/{dnf_4.0.10.bb => dnf_4.1.0.bb} (98%)

diff --git a/meta/recipes-devtools/dnf/dnf_4.0.10.bb b/meta/recipes-devtools/dnf/dnf_4.1.0.bb
similarity index 98%
rename from meta/recipes-devtools/dnf/dnf_4.0.10.bb
rename to meta/recipes-devtools/dnf/dnf_4.1.0.bb
index cd2713fcc6d..d45023eb0c0 100644
--- a/meta/recipes-devtools/dnf/dnf_4.0.10.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.1.0.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://github.com/rpm-software-management/dnf.git \
            file://0030-Run-python-scripts-using-env.patch \
            "
 
-SRCREV = "622e6d6fab05f0b15460c5b734f9e7b5935864f2"
+SRCREV = "ad9b2175517c896c898cf9c8660e9b9b688ac5c7"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.17.1


