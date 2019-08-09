Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
	[209.85.128.50])
	by mail.openembedded.org (Postfix) with ESMTP id 67A4F6D666
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Aug 2019 14:05:33 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id l2so5748439wmg.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Aug 2019 07:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=xhnMt8NcMp9y/mYcnx9vN+2UyktYFQt9EPskcKh05Sc=;
	b=Hb2+ctzZ2hPz/uU41/1OckzkW/nvNCHRcAOXArGQMY3bHKEFCX27VqaIeIThoXxAaj
	yRSex7IefonTsrU0/gHH+YTBdG9gck3jRdwhP2x8V2oQ7JbwmA2JC2K3m7MW/fs26F3p
	w1IgX45/vra8WuPYHd4rrKqBDCBNajsguULU15zxVkerWxqcVLTXq5BqS3rh1ZkzGeFP
	b3T5wnrdF7lpPI+yo+mj0vwlNdITvf3kshKHhmsN+ZtgaXqA1sk/KatmWlSellxCThBN
	CHN+/vtEQ1Btvfyy6Y1s6cMpzh02NG981RRvU1AOqrsH2ZOUJu06WNdGyAcxYXVqLNE1
	E/Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=xhnMt8NcMp9y/mYcnx9vN+2UyktYFQt9EPskcKh05Sc=;
	b=e4AZv0flCr88S6u7o3n+QhZBM/tiaB3wbQyyvXLl2LXRDtzYoJE3Ic9CpmUFX3ayob
	dz1QovbZmMc8SMSsaxsOY188LCjiYlF3jv4txyU3ri3+OOytKCHx08C0QggmpvfDRHp0
	FxP8dFZXT5H9Ftnl9kUBeiz8FtqiSVfyHMIzuw4FhfAdghoAvBtGY6sn0Gtgq3JMv5r/
	n9SCXyPPjToS0/ONbCtf3LuIGGMSvAn2SoyloNpEWpO8sWEF4cOyWECUIhxOqwnDNXlp
	uHFQmqGGv9XgTtX+VdhW90FtPm6xhhA2E7YpkueHxV8n4a/1yHImmz560OUNVBoTeL59
	0Vrg==
X-Gm-Message-State: APjAAAX4SZzHFd3RMKjzwg+SEir1OsM6c+8RxM9BH1Qcf2IL0NtQvABW
	SWH0vcAjC0mAcj6aEq0Zm31sdmtWy98JUg==
X-Google-Smtp-Source: APXvYqy6xUN24SxY+7+3LW9bbnRpib6CQqc18bOEvnlE0PWJV4POZ7dDsdSSmwrfZPQ2S2yo+T9v8Q==
X-Received: by 2002:a1c:9e4b:: with SMTP id h72mr10664621wme.99.1565359533603; 
	Fri, 09 Aug 2019 07:05:33 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	o16sm7371628wrp.23.2019.08.09.07.05.32
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 09 Aug 2019 07:05:33 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Aug 2019 16:05:28 +0200
Message-Id: <20190809140528.64505-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] python-panads: remove the python 2.x version of the recipe
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
X-List-Received-Date: Fri, 09 Aug 2019 14:05:33 -0000

As it depends on pathon 2.x Numpy which has been removed from oe-core.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../recipes-core/packagegroups/packagegroup-meta-python.bb | 2 +-
 .../recipes-devtools/python/python-pandas_0.23.4.bb        | 7 -------
 2 files changed, 1 insertion(+), 8 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-pandas_0.23.4.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index e037abf53..42f416346 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -40,7 +40,7 @@ RDEPENDS_packagegroup-meta-python = "\
     python-sh python-greenlet python-paho-mqtt python-traceback2 python-gdata python-dbusmock \
     python-whoosh python-lockfile python-isort python-wtforms python-feedparser python-flask-restful \
     python-pysnmp python-flask-babel python-pytest-tempdir python-flask-nav python-pyzmq python-pyyaml \
-    python-protobuf python-pluggy python-jsonschema python-msgpack python-pandas \
+    python-protobuf python-pluggy python-jsonschema python-msgpack \
     python-periphery python-pint python-pycryptodome python-yappi python-pycrypto python-pretend \
     python-pyserial python-pyiface python-docutils python-grpcio-tools python-django-south \
     python-backports-functools-lru-cache python-py python-click python-flask-migrate \
diff --git a/meta-python/recipes-devtools/python/python-pandas_0.23.4.bb b/meta-python/recipes-devtools/python/python-pandas_0.23.4.bb
deleted file mode 100644
index b3bfab969..000000000
--- a/meta-python/recipes-devtools/python/python-pandas_0.23.4.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-inherit setuptools
-require python-pandas.inc
-
-RDEPENDS_${PN} += " \
-    ${PYTHON_PN}-future \
-    ${PYTHON_PN}-json \
-"
-- 
2.17.1


