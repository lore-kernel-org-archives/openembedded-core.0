Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 6CB436C245
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Nov 2018 22:59:36 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id r63-v6so13700644wma.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Nov 2018 14:59:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=xoyKCqhM3ovA3EdD2ZT9EcpKk3PkNFPTdrLKu/9+6Yk=;
	b=QQ//vgKM2lgtkbRPyz4CJuSB903GbBETcAz5oPfMnS0mrrHZyUT1mZrY+7SGXgS6uy
	Y3rcIPAnRPj9MWPJ0ZDa/HhKg3dHA7/Kh6HcaCxJe2ViNdnseaSY8I2Wb09Q673E6Om8
	OhVgRp65VxQCwm9wfkKeL29B+KAYRMZODI2l0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=xoyKCqhM3ovA3EdD2ZT9EcpKk3PkNFPTdrLKu/9+6Yk=;
	b=AS+SXsX7qpTRPRx39CDXfBDCxWBnOL+zUZndkpc8HlucJ1Mz1F2HG+3w5MGPvgnT5+
	wiQiL4opnVzKjEFUKwPJ0MZKOQ324B1ihSghYP0NEN2+orUnKZMRI31yZ6JnhzhxBgz1
	mvO6rNr16vi6YiX5vwk2hv8g6ENnpoCNbtlyMQDXUh53/pZhZYR8Z3TDC5nFnDO7FqkW
	COnIcavku6wawN8+oPj6Y7lMqkXg7Cp8N41ZHxRKoo8kReHVMC0Ae0CDRcjYjPn5xWqE
	2+t65cSwWPFYd+/lpaWqVL3UXUuypXsqoHVyA0rcPIJnVOg8q1o3hoR7V9yv9NAKZvQR
	+Asg==
X-Gm-Message-State: AGRZ1gKcwhqJ5gnQcz/9QgTs24h+CtY7EXUp9KR4AaoKEZdvOrXvh6Ut
	CKOQupDBc3p47HHAXBWBu66mux10/hQ=
X-Google-Smtp-Source: AJdET5dIyQs6H+EP+1l8Lh6Tz2wy7hLuq6+QfRxpRWkLjDWGy6Aqa6DDd0/4HyaglDAIJ8UxJb2YSw==
X-Received: by 2002:a7b:c404:: with SMTP id k4mr4638359wmi.144.1542149976439; 
	Tue, 13 Nov 2018 14:59:36 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	y2-v6sm36426474wrh.53.2018.11.13.14.59.35
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Nov 2018 14:59:35 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Nov 2018 22:59:30 +0000
Message-Id: <20181113225932.17726-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181113225932.17726-1-richard.purdie@linuxfoundation.org>
References: <20181113225932.17726-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 3/5] oeqa/loader: Fix deprecation warning
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
X-List-Received-Date: Tue, 13 Nov 2018 22:59:36 -0000

Clean up the warning:
meta/lib/oeqa/core/loader.py:27: DeprecationWarning: inspect.getargspec() is deprecated, use inspect.signature() or inspect.getfullargspec()
  _failed_test_args = inspect.getargspec(unittest.loader._make_failed_test).args

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/core/loader.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/core/loader.py b/meta/lib/oeqa/core/loader.py
index 6070bf53105..e66de32cb1b 100644
--- a/meta/lib/oeqa/core/loader.py
+++ b/meta/lib/oeqa/core/loader.py
@@ -24,7 +24,7 @@ from oeqa.core.decorator import decoratorClasses, OETestDecorator, \
 # Generate the function definition because this differ across python versions
 # Python >= 3.4.4 uses tree parameters instead four but for example Python 3.5.3
 # ueses four parameters so isn't incremental.
-_failed_test_args = inspect.getargspec(unittest.loader._make_failed_test).args
+_failed_test_args = inspect.getfullargspec(unittest.loader._make_failed_test).args
 exec("""def _make_failed_test(%s): raise exception""" % ', '.join(_failed_test_args))
 unittest.loader._make_failed_test = _make_failed_test
 
-- 
2.17.1


