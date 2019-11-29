Return-Path: <jacopo.dallaglio@kynetics.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id CAB5B7F7D7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Nov 2019 09:48:40 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id l1so13498695wme.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Nov 2019 01:48:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kynetics-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=oRzXiMf41kWFDaLQxLf0oWFihxA9mPA9xZOatA9+80o=;
	b=LCsm8rPquGO/MXKbADq6W9+lCfS9Vf2QKPHEVwcOz8Pz7Ual+/+dcCJi+54uR8OJl5
	qz6hJ6nZ8jlRSf+jzVqVg3hKke8n45giiJ1veUg31skHApKeFXL1nLCG9GtlUx/jspiy
	umNbNjPkqASgS2DKt2/xxDRAUeqjU1ZdvSJ8zRJzxagqebOvrG8BCKCBm7VEXyqU2+Rc
	sj3Cfa8m2nx3FNujuETlnwXCOI+KuIQcneyKSw5RWUTHqVBWM1uP+b80U2LIgiwftg+q
	Xt6LlgwaKNK6JlFjV/e7qhptmTksoLI64HWhLBOU/6GDY5L9zIrN+6Hz6f59ilaER+IX
	/H4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=oRzXiMf41kWFDaLQxLf0oWFihxA9mPA9xZOatA9+80o=;
	b=DEKl0vepb0yoM8DmwC+OESQ8+/2YbPQp8DVb1W9ox4Te5b9Iq3d/yXrMRM9vuGkltp
	BeZCiqT15++ymJb/phM5l5KW2ov7YEc8vO5arXiDhJraT8e5gjGOJM8jYfKe0RYWKJqO
	IoBliKpXQ4fKU+bVC4alQ5Pto3kks4QMsfa8gWeFZjJ614AzqLDlXezoVoVH7mbhkKIC
	1VEmyS1iCbszWsVINNGtO+WU7BoMZnJl6agtsKzMflPz4BxjHS/GVNINw9qT2a40F9oZ
	cUAbTcCku3R+N2/0T09euZxGSul8WbJBXTiH4Pqf2tHtObJj0Do3swyDMHHcu8zaR3nY
	dpwQ==
X-Gm-Message-State: APjAAAW+cMP1nS3YpyqujUTK+wi2Q6lUXFla34/6/hJuDTCg/UvjCJ/0
	Qchy+QIRiKa6idxIgCypeiwQyp1OyTiZiC6gMw==
X-Google-Smtp-Source: APXvYqwyVTJ/f5MwfIKdtjyoVXExGpGf8xqI6HH5kB1tosMV1XcTNzyyf54s5wZEwwVpCMxPy7pP8w==
X-Received: by 2002:a05:600c:228c:: with SMTP id
	12mr14060503wmf.154.1575020920613; 
	Fri, 29 Nov 2019 01:48:40 -0800 (PST)
Received: from ip-172-31-10-74.eu-west-1.compute.internal
	(ec2-34-245-99-139.eu-west-1.compute.amazonaws.com. [34.245.99.139])
	by smtp.gmail.com with ESMTPSA id
	c144sm12930360wmd.1.2019.11.29.01.48.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 29 Nov 2019 01:48:40 -0800 (PST)
From: Jacopo Dall'Aglio <jacopo.dallaglio@kynetics.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Nov 2019 09:48:33 +0000
Message-Id: <1575020914-1566-1-git-send-email-jacopo.dallaglio@kynetics.com>
X-Mailer: git-send-email 2.7.4
Cc: Jacopo Dall'Aglio <jacopo.dallaglio@kynetics.com>
Subject: [meta-networking][PATCH 1/2] python-netifaces: add recipes
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
X-List-Received-Date: Fri, 29 Nov 2019 09:48:42 -0000

With netifaces it's possible to get the addresses of the machine's network
interfaces from Python. Network configuration renderers such as Netplan depends
on its Python3 implementation.

Signed-off-by: Jacopo Dall'Aglio <jacopo.dallaglio@kynetics.com>
---
 meta-python/recipes-devtools/python/python-netifaces.inc       | 10 ++++++++++
 meta-python/recipes-devtools/python/python-netifaces_0.10.9.bb |  2 ++
 .../recipes-devtools/python/python3-netifaces_0.10.9.bb        |  2 ++
 3 files changed, 14 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-netifaces.inc
 create mode 100644 meta-python/recipes-devtools/python/python-netifaces_0.10.9.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-netifaces_0.10.9.bb

diff --git a/meta-python/recipes-devtools/python/python-netifaces.inc b/meta-python/recipes-devtools/python/python-netifaces.inc
new file mode 100644
index 0000000..daccc4f
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-netifaces.inc
@@ -0,0 +1,10 @@
+DESCRIPTION = "Portable network interface information for Python"
+SECTION = "devel/python"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=a53cbc7cb75660694e138ba973c148df"
+
+SRC_URI[md5sum] = "de92cc322b4f56047c073f802ad77860"
+SRC_URI[sha256sum] = "2dee9ffdd16292878336a58d04a20f0ffe95555465fee7c9bd23b3490ef2abf3"
+
+inherit pypi
diff --git a/meta-python/recipes-devtools/python/python-netifaces_0.10.9.bb b/meta-python/recipes-devtools/python/python-netifaces_0.10.9.bb
new file mode 100644
index 0000000..c4aa849
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-netifaces_0.10.9.bb
@@ -0,0 +1,2 @@
+require python-netifaces.inc
+inherit setuptools
diff --git a/meta-python/recipes-devtools/python/python3-netifaces_0.10.9.bb b/meta-python/recipes-devtools/python/python3-netifaces_0.10.9.bb
new file mode 100644
index 0000000..69d5c67
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-netifaces_0.10.9.bb
@@ -0,0 +1,2 @@
+require python-netifaces.inc
+inherit setuptools3
-- 
2.7.4


