Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lb0-f176.google.com (mail-lb0-f176.google.com
	[209.85.217.176])
	by mail.openembedded.org (Postfix) with ESMTP id A0A566010B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Nov 2015 14:14:23 +0000 (UTC)
Received: by lbbsy6 with SMTP id sy6so6218705lbb.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Nov 2015 06:14:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=M/wg+i+gihTT1t/JMJp6nq1V6VbhGa+hLvXWWk5858I=;
	b=y4NEKyXo7DiuNvWa+MfjIl7Z8mx8lZbBUIG6z9Kq6pnbTxn3YePKYN+lEIo+zN8lH2
	au625lNcmRwoGIqW4b101ZkEDfSgSQJgEqS/777SKr0yByji9t/gL/0hMZm6szHuyFG2
	2nD1nuwMpx2/xTeMflHievN3DNW+RbNjx1epSTo7whQ1EJjomc4PxBC92ME8M9BO9iX/
	9LdjV1t3bFbypiTqdqB0BkWiGBQCV+RVcnptYwsy3oQ761PfFlMjB/0ToHvimDDbpYtr
	cFjIbQ3KRFGT2ACdE7xBQ/J94sa6ms3iSAXBf0oBRLrHHEo2EmQtipq0Xy+sm83QtzEF
	fWvw==
X-Received: by 10.112.124.199 with SMTP id mk7mr20450626lbb.108.1447769663467; 
	Tue, 17 Nov 2015 06:14:23 -0800 (PST)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id i13sm1235775lfe.9.2015.11.17.06.14.22
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 17 Nov 2015 06:14:22 -0800 (PST)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-core@lists.openembedded.org,
	Robert Yang <liezhi.yang@windriver.com>
Date: Tue, 17 Nov 2015 15:14:21 +0100
Message-Id: <1447769661-6818-1-git-send-email-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.6.2
Subject: [PATCH] python-git: Add missing dependency
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
X-List-Received-Date: Tue, 17 Nov 2015 14:14:24 -0000

Python-git depends on getpass, which is part of python-unixadmin.

If it is missing:

root@qt5022:~# python
Python 2.7.9 (default, Nov 12 2015, 17:41:32)
[GCC 5.2.0] on linux2
Type "help", "copyright", "credits" or "license" for more information.
>>> import git
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  File "/usr/lib/python2.7/site-packages/git/__init__.py", line 35, in <module>
    from git.config import GitConfigParser
  File "/usr/lib/python2.7/site-packages/git/config.py", line 21, in <module>
    from git.util import LockFile
  File "/usr/lib/python2.7/site-packages/git/util.py", line 14, in <module>
    import getpass
ImportError: No module named getpass
>>>

Reported-by: Dimitrios Katsaros <patcherwork@gmail.com>
Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 meta/recipes-devtools/python/python-git_1.0.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python-git_1.0.1.bb b/meta/recipes-devtools/python/python-git_1.0.1.bb
index a78d7c83c4f9..e1509e6c2076 100644
--- a/meta/recipes-devtools/python/python-git_1.0.1.bb
+++ b/meta/recipes-devtools/python/python-git_1.0.1.bb
@@ -18,6 +18,6 @@ S = "${WORKDIR}/GitPython-${PV}"
 
 inherit setuptools
 
-RDEPENDS_${PN} += "python-gitdb python-lang python-io python-shell python-math python-re python-subprocess python-stringold"
+RDEPENDS_${PN} += "python-gitdb python-lang python-io python-shell python-math python-re python-subprocess python-stringold python-unixadmin"
 
 BBCLASSEXTEND = "nativesdk"
-- 
2.6.2


