Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
	[209.85.128.50])
	by mail.openembedded.org (Postfix) with ESMTP id 08B097D672
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 09:00:46 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id f204so2091733wme.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 02:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=t11rmxyIrEuR9W25PCdK+vSdCqX7AZlvqUjmV9Eqi4c=;
	b=VgBEwxeDsMjON2aVQIYvG6jq9Hriwue9j9jmkzO2QLMF5+a9XdKO9Fy9YSKWxLveZv
	S78pncNsOc/Iw4YY2dn+IdOIT/lvuqkHnXBJHQzx/4ahL3jmCScQen+emVhuO7/NhSnn
	Fk51jAq5tdRVvu0S1e3oSAXSlf/ldizfK6lV8BsdjrgN5csXlYLL22Pt13Y3Z6/7wRgk
	SlBZOEtA0kpx0bGhGhm1mnxeH6mA0YxGnHoxSJNqha2/xxWUQ2/dw2uIvcDvvB4L2fTp
	qB9ayNjWT2jJpoBX+3+MMMxNcsPs2/f9XRRK3JNm+LYi+vyUrIBEvG28OHzaR/jn+V/J
	QMFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=t11rmxyIrEuR9W25PCdK+vSdCqX7AZlvqUjmV9Eqi4c=;
	b=AmVsidssYrj9pI/W0pl0dWa8rptMjRC5Bx5/Pli4eUlobWehxUzRCrOYTK7LGBHHsZ
	bFqcWUFiJ6CPFZax1f/U0ILs5nTiAJfpjIUQSA5gVhkVQSO9fT8JJEY8aoYRjElUkxbm
	KnrEOGqH1GTemUXzlUVGN/2wNgu4VmIjKUvhzDOVEKk3UUvLRb8iy97973pMXog1FbRl
	4BpMGpjURKumptVpBY3k7bHTYmD80l41OmVw1cm/HAt/qNcBvKG3kYiMKjjXUbTwDy+1
	+5ur9MXd9IGg80b4ptFJmYm0fHS6apxwFDFtq7iBTErLS/F9dXvPbz+0SSy810XJyt+E
	kvZg==
X-Gm-Message-State: APjAAAWNb8UGdxpizKvd19HDgHy/vp+HlOkdxIfYGrN8M1HlLPWKBWtV
	5FEtoCwJTCVTs6gItQF5rbV6Q5Cv
X-Google-Smtp-Source: APXvYqw0lOam1j0cVawe2vbUBVKIrLKyuldwhuCGd/1vKtRSyJPlssDCp5qAn3vFjpzNVrMxlz4goA==
X-Received: by 2002:a1c:ca01:: with SMTP id a1mr2397399wmg.30.1558429247439;
	Tue, 21 May 2019 02:00:47 -0700 (PDT)
Received: from localhost.localdomain (p509737a3.dip0.t-ipconnect.de.
	[80.151.55.163]) by smtp.gmail.com with ESMTPSA id
	f20sm2194838wmh.22.2019.05.21.02.00.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 21 May 2019 02:00:46 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 May 2019 11:00:32 +0200
Message-Id: <20190521090032.14859-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190521090032.14859-1-schnitzeltony@gmail.com>
References: <20190521090032.14859-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] python-six: put python2/3 variant together
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
X-List-Received-Date: Tue, 21 May 2019 09:00:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Upcoming 60.2.3 mozjs (meta-oe) requires python(2)-six-native for its
configuration. Currently python(2)-six lives in meta-python and it could be
moved to mozjs's home meta-oe but that would be just further clutter.

Once applied here patch to meta-python will be send.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta/recipes-devtools/python/python-six_1.12.0.bb | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python-six_1.12.0.bb

diff --git a/meta/recipes-devtools/python/python-six_1.12.0.bb b/meta/recipes-devtools/python/python-six_1.12.0.bb
new file mode 100644
index 0000000000..9075745d74
--- /dev/null
+++ b/meta/recipes-devtools/python/python-six_1.12.0.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools
+require python-six.inc
-- 
2.20.1


