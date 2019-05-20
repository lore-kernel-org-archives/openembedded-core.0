Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
	[209.85.221.46])
	by mail.openembedded.org (Postfix) with ESMTP id 0ABF27DECF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 14:11:41 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id s17so14819766wru.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 07:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=VeDZrZEkikt4/Ph08iANpbCDaVcUcT7widJ05AoRd3M=;
	b=DKn4ukXXZrDrIzd6G34B9dT5vnONDEDQfCLxWAZvU+m0JMGuIjBGrhFyHJC3ZjnWtE
	YMR4TCT9sPstTzvRbj//h/fmVHf1irhIs9XB5tZY9NIZc9U6xMJe/yZkUPXgaSqGvyOS
	7w1+2cVzRxRjOYjDFDGk7KK2DLMTYsMp3Q6Eiffd91lYTd0O4tubkZ0KkvMWFGPW4a0i
	qBIBJYaU3YCpZRxRVQ1Vz91WQvRJYCRj7doiID5yIYrnbdCX93AHAP65wAYQtgczBOfJ
	A3YVonGZxlQeVvfnt1eK0o2GH8yvh9C6TFihnGiAovZCeWgCINFMtwUHRiYOXgMD4q6n
	lIWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=VeDZrZEkikt4/Ph08iANpbCDaVcUcT7widJ05AoRd3M=;
	b=nLFlBPTQTgVILgVgG8Kohs9q2EVU5++gu8tWgy/2M7VM5M779RkQWjFUa6HU6j59yY
	U4oa5e8bgTjgrFSt6N8xvVWMcHbr+Q4MRBlwfRJ0Iq0LkzOgPgBa+U0kEVk0nRpePvED
	djpXeFFf98HheyqVZ41Mu2If7hpmBp0Kk89i1wuimmjuK0oQhlQVPMuQLtpiFO00Ada4
	ouVrAzXHK5Rt6fJVdVyYAiGbB2Tn6u4NoQuTMP5DgTydtSO4o+8MPCeve23G9BNXznSv
	5Eo1l1IRV+Dh02LpFW2L7AQiTWC7ggL7Kw0ijfEeLBHgDzgCuvFgGVrAy44h+fq8YmOE
	pj8w==
X-Gm-Message-State: APjAAAVRRsx//uWYN+C9/HeEtzO9DXwbKi1BTW8piouvql6WaoWuZwsu
	10H9E9Ki5DngGGawCtugIy1ppnXe
X-Google-Smtp-Source: APXvYqy8Hyl7Wtpc7hA9ACHaw10g5yweVF5POpn4bEmSJyGCJFmYjbapfZt/lWP6EF1FaIAagq+oRg==
X-Received: by 2002:a5d:6703:: with SMTP id o3mr714469wru.183.1558361502660;
	Mon, 20 May 2019 07:11:42 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	v5sm36242015wra.83.2019.05.20.07.11.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 May 2019 07:11:42 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 May 2019 16:10:53 +0200
Message-Id: <20190520141125.10805-10-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190520141125.10805-1-alex.kanavin@gmail.com>
References: <20190520141125.10805-1-alex.kanavin@gmail.com>
Subject: [PATCH 10/42] python3-mako: upgrade 1.0.9 -> 1.0.10
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
X-List-Received-Date: Mon, 20 May 2019 14:11:42 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/python/python-mako.inc                  | 4 ++--
 .../python/{python3-mako_1.0.9.bb => python3-mako_1.0.10.bb}  | 0
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-mako_1.0.9.bb => python3-mako_1.0.10.bb} (100%)

diff --git a/meta/recipes-devtools/python/python-mako.inc b/meta/recipes-devtools/python/python-mako.inc
index 97c624bbc66..20808fe5aca 100644
--- a/meta/recipes-devtools/python/python-mako.inc
+++ b/meta/recipes-devtools/python/python-mako.inc
@@ -8,8 +8,8 @@ PYPI_PACKAGE = "Mako"
 
 inherit pypi
 
-SRC_URI[md5sum] = "d739720f3f0d6a1cb6a96ea7a4760c3e"
-SRC_URI[sha256sum] = "0728c404877cd4ca72c409c0ea372dc5f3b53fa1ad2bb434e1d216c0444ff1fd"
+SRC_URI[md5sum] = "a94d376078dda65f834ea5049a81ebb5"
+SRC_URI[sha256sum] = "7165919e78e1feb68b4dbe829871ea9941398178fa58e6beedb9ba14acf63965"
 
 RDEPENDS_${PN} = "${PYTHON_PN}-html \
                   ${PYTHON_PN}-netclient \
diff --git a/meta/recipes-devtools/python/python3-mako_1.0.9.bb b/meta/recipes-devtools/python/python3-mako_1.0.10.bb
similarity index 100%
rename from meta/recipes-devtools/python/python3-mako_1.0.9.bb
rename to meta/recipes-devtools/python/python3-mako_1.0.10.bb
-- 
2.17.1


