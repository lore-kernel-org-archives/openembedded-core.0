Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id C82EE7C47B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 12:47:09 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id m22so13826071wml.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 04:47:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=gdWFtyit1HxD1RJ4n6U6eerKvhG5d/Vj9gkhtK7yIdc=;
	b=KN4VoX5WPZyoG5sxY0o281QbFeXQ9Oad42dvi4OuYzJxK9llkrq1RC4N5XbKJ/9TUr
	r7t0GdN2NJzsbH3TMT561STpPtjISoV3E1kPZvLqp9C6gXBd2ujxZ2M+HKZzrghdYObd
	Dwi61u5DJFpqv7jVEzJUWF8CwNz3LqMWrt5Ru1EP+RVLND+FlEG5pzlsRdLU+z0h0Mtn
	kKggvQ5CV1fUInrBXer1FyUCLzVTskdvAuwpXTN5T+RXyakTZZfHNPqeC96166KCteHP
	774g/3ULEBJcIFLZucTvuLgxUbUpVU27J3wP+5p9f5mGAb/9JNmypaBE6PCVNOekdSt9
	dQuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=gdWFtyit1HxD1RJ4n6U6eerKvhG5d/Vj9gkhtK7yIdc=;
	b=Z+TT3TpaorWMOv+Cax5GFtjNL9UnCYAaVTu5un3FAKHZVsj/B6Sroddkts35O8gzQ0
	nbQ9J/akoS1tlqnPBFZfkCULtYujywqj97FvkH0XTNYuCkEHr1SW3JoZWTN1IGbwg89s
	EINhi2WX1ahWHmPhqO6OriS/j1B/xz8ocFAzIbjE5tLTfDMPH++PaeyvYzDK3591rAYq
	X6AyvtetdYDxsQVGaJx9W1+JMtgoPjhtE6+eEdM64iDSSQWMicuoQEnpxD8Dj+JUHUKc
	jHENI8L558wqFUb5X2+BVe3rP56CAfw6Tq17iZUGQKRUdvCn8RyIL7pEJqNUiXKfx87G
	PS8Q==
X-Gm-Message-State: AJcUukcpf4/C/ekvk+HmKnFf6lT3W4qmUvv9Pm8blnGM02moVS88yeQU
	Za5bEyeEHMjhKJp30Mvw2P/Al0Mu
X-Google-Smtp-Source: ALg8bN7A/1L1NgSTcLZbmbFRtWBe1MpomGmGINYcfxJUcsxAbqR9de8u5Ok4H+UEquU1iv/VV3Derg==
X-Received: by 2002:a1c:7eca:: with SMTP id z193mr16466643wmc.5.1548679630298; 
	Mon, 28 Jan 2019 04:47:10 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	j33sm186026218wre.91.2019.01.28.04.47.09
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 Jan 2019 04:47:09 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Jan 2019 13:46:34 +0100
Message-Id: <3fbd377eef44e9d9029d6ebb884418556593fa1a.1548679462.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1548679462.git.alex.kanavin@gmail.com>
References: <cover.1548679462.git.alex.kanavin@gmail.com>
Subject: [PATCH 03/24] shared-mime-info: update the database also in native builds
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
X-List-Received-Date: Mon, 28 Jan 2019 12:47:10 -0000

Otherwise glib-compile-resources fails when building gtk+3-native.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-support/shared-mime-info/shared-mime-info.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info.inc b/meta/recipes-support/shared-mime-info/shared-mime-info.inc
index 344da7ea77c..3fe1a445b0c 100644
--- a/meta/recipes-support/shared-mime-info/shared-mime-info.inc
+++ b/meta/recipes-support/shared-mime-info/shared-mime-info.inc
@@ -30,6 +30,8 @@ do_install () {
 
 do_install_class-native () {
 	autotools_do_install
+
+	${B}/update-mime-database ${D}${datadir}/mime
 }
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1


