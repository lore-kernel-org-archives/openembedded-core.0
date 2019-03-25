Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
	[209.85.128.42])
	by mail.openembedded.org (Postfix) with ESMTP id F04CE7D08E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Mar 2019 13:27:32 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id z24so5789322wmi.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Mar 2019 06:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=ZwqG+1vLaOz/0zlOufC2Tppa+ECgUaJvoZgoWTSsl5E=;
	b=pvft5weEM4i6+WR/4eEKuOme0cFXe344jXQFmc+5ANizCArknQ43z5mwtrpAnCxdnu
	b+mAmTLMOgdsyNV4XdKz38ccCsBr9rZRzO1wa8NkjxloRbEqKb8pZUoGy6bz92+6kvwH
	HUrUiPFNwv7OemZ9I13jxsWyyeoADxz6d/a6v1G45nAXHhJ9p3K4BeHY/J6xYtWQfOOF
	wFfkHFkT/nli0L7M8Ct5BITk64XsPmJrYURysH+NDQBPaRbb8lLoCq8AUmsBUkjByWmd
	BkJzYUF31VuSg9E++V+VSsEwskZlQqT/w8yXCLwyHWTN0TwgOwFCHzipy5alPcXoMjTk
	zIsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ZwqG+1vLaOz/0zlOufC2Tppa+ECgUaJvoZgoWTSsl5E=;
	b=YeB2UIJR/g7NZaIj3If1TWU+6LG4b3FQSqp491kj9UMLO8+uvc2uVK9106VwTCaOX3
	o0YDmBkKcxFZn03zL/2zbIAol1Q1oQ3/p34MYZoi5JXz7CvRb6HodJru0sDixb6YzyqT
	wxFuaIUWGTp/h8bY9g32a3naHy1SnqI2KJZbEdTz2O0DvdskAy95jovp4yNc8c8zhEnk
	P3TxfNNB4FMH5iLLMnjmButyovlxq2rxcYS9WgFm1j5PzvyeizfY+m0HM7iSSn+nHj5D
	/12DK1O6zfo89hCfzis4YUm6uoOW5n9Q79SXPKjUhOvbOLEb9Q14DDT5uyxCnHDU6F2H
	xdPQ==
X-Gm-Message-State: APjAAAX8CffeQUf6iJ1ZhRl15HbCyCwnMFEzeKb2H7RvhKgk+3cKm75L
	EGUrzEKC5/ysNcTL7KcG3GwfsaZw9NE=
X-Google-Smtp-Source: APXvYqzgwaB0ub7spI2cJlnK3FxRVz5oveFXq7jGXd2f9Qn5do1TTwRnfXUMlHUX6g4pVI9PYdRCRg==
X-Received: by 2002:a1c:f906:: with SMTP id x6mr5662712wmh.126.1553520452987; 
	Mon, 25 Mar 2019 06:27:32 -0700 (PDT)
Received: from localhost.localdomain (193.164.125.18.ip.redstone-isp.net.
	[193.164.125.18]) by smtp.gmail.com with ESMTPSA id
	e135sm26563321wmg.24.2019.03.25.06.27.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 25 Mar 2019 06:27:31 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Mar 2019 13:27:27 +0000
Message-Id: <1553520448-12901-1-git-send-email-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH v3 1/2] libpsl: Extend with native, nativesdk
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
X-List-Received-Date: Mon, 25 Mar 2019 13:27:33 -0000

To allow wget with libpsl to build native/nativesdk versions we need
those variants here.
Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

Changes in v3: None
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


