Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 749627C03C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2019 15:03:27 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id t6so23169019wrr.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2019 07:03:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=gdWFtyit1HxD1RJ4n6U6eerKvhG5d/Vj9gkhtK7yIdc=;
	b=nbcY9evAh378Fn2iDcqBTlwQSKLyP8SYljDIFKMS4eFN939CYYOvF45jMxaJ6oaRzD
	oEB2a8b1F0mJqe4BxpEWcoNhqU5Z7Msue3V1/IhMZUYoQleKvLleZPRyLkbBkaV+1P9o
	cvAa+lJTqmqzJCPL58DahCYqKG9vyHBCBiylSUZhz6xP5C/fyBvdq1Kkauyu4feb+LaL
	A11Y9YwUlE9CTDehhlWAVS8EHPKMD2PSqobSHtXgzAETwI83Qu3DmaGw4NiY+WN35bHV
	v0u/l17l0r2sq3BtubqUAtzvADP09V3DOmlsRQQVjI2u6XdH73SYLF4m/WJw9xOIvQiv
	6uWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=gdWFtyit1HxD1RJ4n6U6eerKvhG5d/Vj9gkhtK7yIdc=;
	b=ZyCq+uG3jie9DvRnTQM+yDyMtIGN5HuZYG3n4yHcyGeRbsxcB/h1Qk1kclRHXPBakk
	cyxxixZDvW8NAPYbta+C8oCQ4uA/TB+4AsWZwzl5r2h4QIuHYndHsxYBieZ4u4syN6Uh
	hHpSU70cldnfB6eJNaBg6RCgcjtt9CPIad/xWjti9fJnz1n0kt3KXyNWWOfETJmno1fK
	Y6u/kaUFMDAV8CiQvF/R3bXwDpeySzJI0V6r4rakQ0kbGzadnQNBrgEPSIBzwB3tpJje
	Bbs6apL+uxCExd4qDBlrIipCBuwq6goHn5sr00zH74Q9J1W1QUB3GYKZrDxVX3dd8Wy+
	OGpg==
X-Gm-Message-State: AJcUukfqsC3mg7goFvb9cVaK8GrLBLVkGz4nUWwSVOFxj0LTgVBjwl35
	Z0C291IwDbh3skJJZ/gveXNHLx1W
X-Google-Smtp-Source: ALg8bN5CmPW0UZiBT4vmYZoHhufyI0vBXF7A5qcByBQ1WAaX2vHRZF1GpyL27u2J9tY0YQQV6VnPiA==
X-Received: by 2002:adf:8342:: with SMTP id 60mr23178435wrd.212.1547478207937; 
	Mon, 14 Jan 2019 07:03:27 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	y34sm201725236wrd.68.2019.01.14.07.03.26
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Jan 2019 07:03:27 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Jan 2019 16:02:59 +0100
Message-Id: <4af12e92fa2ed9efb61c396bd06910d312e5d5f8.1547477793.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1547477793.git.alex.kanavin@gmail.com>
References: <cover.1547477793.git.alex.kanavin@gmail.com>
Subject: [PATCH 03/23] shared-mime-info: update the database also in native builds
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
X-List-Received-Date: Mon, 14 Jan 2019 15:03:27 -0000

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


