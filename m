Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 0794D7FA49
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Dec 2019 15:39:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47Txbm3ZsKz3L
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Dec 2019 16:39:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1575646788;
	bh=f8NQJnwXRp6Dg+1HZIxxTXzcbx5GbpxgpLQ9G3Zf/v0=;
	h=From:To:Subject:Date:From;
	b=idZCd1hzWiYxVxTj/K95O/16WR6rsPnc19HDM4fHOF3Wu8e+jceccD92Wdf/tVxug
	AK+Nh932o64DZhv5nUR4rKmMo0HweEfk6Zm5rsfWiW9tc+QY/njxCSkWVGqNi66JeA
	CisbdYe+EHW0edEN1s7gk3uo9K4CTOjpbwpCh94NPmzc9xzjG/KT5ewx7RxEsBXQMm
	lHdN2fF8BRPv4uYrm4V0EXel6sGax1ceoXl6zskbzixXoLup1tx9WrTEhQGSS9oAqL
	T2qI0FcRFxAbkESt/98LQfpdyBsUac8hww1wuudcvwXSdYKvdMSENlack3FyZewdk4
	2piNOSc741dnb9enlG57c8l8I22KdgoV/A0zmwWMoDO163yJOleP2TSEgcjhSvRJHi
	kw8fVWJIbVcznujpciuGwnu5MQEjivWOvxdUByHRThhIshWiMlVtQ89T9fV46P+lIM
	FbBUNQ4VrMfRUK0D2/QHC2gZhXvP6HTZjsg8CuhMVly9Op0yXwEP/DwBG8EeBKsMu/
	xmI7qJjDPM7IR1leQh2MqeeSJaJNQYwfwOu/4vAOqTfvP2ePyQia3s7Pxbqvw/8YMp
	pnGjLbh1jGm0E2hZ1MhxQorGNPpPtc+CWo9DSz7MGzYNyj6qiqGt+7SuoJIrGrkbwY
	/H5wN+JQz8jo59o3mZwiPJoY=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Dec 2019 17:39:47 +0200
Message-Id: <20191206153947.30935-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH v2] python/python3: Whitelist CVE-2019-18348
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
X-List-Received-Date: Fri, 06 Dec 2019 15:39:50 -0000

This is not exploitable when glibc has CVE-2016-10739 fixed,
which is fixed in the upstream version since warrior.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-devtools/python/python.inc       | 3 +++
 meta/recipes-devtools/python/python3_3.8.0.bb | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/meta/recipes-devtools/python/python.inc b/meta/recipes-devtools/python/python.inc
index 110ec315d9..19a2f3e743 100644
--- a/meta/recipes-devtools/python/python.inc
+++ b/meta/recipes-devtools/python/python.inc
@@ -29,6 +29,9 @@ CVE_CHECK_WHITELIST += "CVE-2017-18207"
 # of Python that cannot really be altered at this point."
 CVE_CHECK_WHITELIST += "CVE-2015-5652"
 
+# This is not exploitable when glibc has CVE-2016-10739 fixed.
+CVE_CHECK_WHITELIST += "CVE-2019-18348"
+
 PYTHON_MAJMIN = "2.7"
 
 inherit autotools pkgconfig
diff --git a/meta/recipes-devtools/python/python3_3.8.0.bb b/meta/recipes-devtools/python/python3_3.8.0.bb
index 1feaebea8e..92f6527c70 100644
--- a/meta/recipes-devtools/python/python3_3.8.0.bb
+++ b/meta/recipes-devtools/python/python3_3.8.0.bb
@@ -42,6 +42,9 @@ UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
 
 CVE_PRODUCT = "python"
 
+# This is not exploitable when glibc has CVE-2016-10739 fixed.
+CVE_CHECK_WHITELIST += "CVE-2019-18348"
+
 PYTHON_MAJMIN = "3.8"
 
 S = "${WORKDIR}/Python-${PV}"
-- 
2.17.1


