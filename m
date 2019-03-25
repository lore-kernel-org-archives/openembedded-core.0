Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
	[209.85.128.46])
	by mail.openembedded.org (Postfix) with ESMTP id D4CE27CDEB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Mar 2019 09:37:57 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id z11so8157397wmi.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Mar 2019 02:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=zy1OEL4em2hUS3qDu+gmVPiKHY9oUV6qjffelsFwtt8=;
	b=odshv0mpZCGHbA4aQjgGIBPwtf68b6cTTF5n2h7X2IDEgX0pCx/nqHIdfawlBBuF9Y
	FE9GWvfOMZ5fWcbNYaQ6zXI64CSx7lZnYsU7rA7mP/MAureiH839jCfQgT6GvEGQKO/I
	KautZolWJwuUgVE61tTYt5fIZ723xza2yx3p5g1TRqn9ABJzIn7xT3Fur4NfS+efMxoH
	zx50a1FT31a4JGotLaO6M60EsqvvAkKNJvpPI6ztx6zZuDOC74rfsZwr1+X/JUyHoSht
	HRf7KFVKxk1yFzZK2RnsPjt5nYB3kYoUPQqoouMEqMR39tVzEbJ4lNo5tZGnuXNHrkdT
	lhwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=zy1OEL4em2hUS3qDu+gmVPiKHY9oUV6qjffelsFwtt8=;
	b=giT5xWTyhBM2GOC/0nTd08/64EkHa+cPb3uXtWhHdoufQmYtV2LnlnaLHgwqcxTocW
	AQhknXa7scsflaVzIsbMiFzlZUVs/A8l/H5Tyw18yEaQGCZmJ+WVQoxq/E67Zrj6MoP6
	LzltVTuQWcCpjPC7QrRgWyW5OU2IOR2NjPpmHY3UqgwHntWms35wLHxbHxo3ko6avLN2
	QdCEYbejFcQ0JR0KTR6+zSfXclpa+XyyshMlQeuLAA4C5hl6dDmnXHlUbjZY1nFQ8ZHZ
	psPEvoYLIJE1W8ZqPOvyxtbnAvEzaD7RbflcL9ZiGmJTHKC27GupZKPaM++J0FBd30P9
	+crQ==
X-Gm-Message-State: APjAAAXSo+k4VI/uJtnMIx9dqVtsJLxK9uw3rjENX0yXkqgWSa4Ta9X5
	oAdbA7SPo1XgKIOqNUjQ+q7YTXxa7ZQ=
X-Google-Smtp-Source: APXvYqxarSbeVE0M+xyQ8DVkBqZPxW05Mw0MgyG2JIGOtmnI/+9hW6hZi3nyhthn79EyMnUdXBrFyA==
X-Received: by 2002:a05:600c:d5:: with SMTP id
	u21mr10289692wmm.12.1553506678425; 
	Mon, 25 Mar 2019 02:37:58 -0700 (PDT)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
	[91.135.6.246]) by smtp.gmail.com with ESMTPSA id
	d14sm12249776wro.79.2019.03.25.02.37.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 25 Mar 2019 02:37:57 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Mar 2019 09:37:54 +0000
Message-Id: <1553506675-11519-1-git-send-email-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH v2 1/2] libpsl: Extend with native, nativesdk
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
X-List-Received-Date: Mon, 25 Mar 2019 09:37:58 -0000

To allow wget with libpsl to build native/nativesdk versions we need
those variants here.
Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

Changes in v2:
- new

 meta/recipes-support/libpsl/libpsl_0.20.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/libpsl/libpsl_0.20.2.bb b/meta/recipes-support/libpsl/libpsl_0.20.2.bb
index 89a87b67c744..5cb20d46bc48 100644
--- a/meta/recipes-support/libpsl/libpsl_0.20.2.bb
+++ b/meta/recipes-support/libpsl/libpsl_0.20.2.bb
@@ -16,3 +16,5 @@ inherit autotools gettext gtk-doc manpages pkgconfig lib_package
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[manpages] = "--enable-man,--disable-man,libxslt-native"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.7.4


