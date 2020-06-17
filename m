Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
 by mx.groups.io with SMTP id smtpd.web11.6402.1592396858600907421
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jun 2020 05:27:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.8, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.100.179]:60844 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1jlXAG-001Pgb-9M
	for openembedded-core@lists.openembedded.org; Wed, 17 Jun 2020 08:27:37 -0400
Date: Wed, 17 Jun 2020 08:27:34 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: [PATCH] python: use official "pypi.org" URLs for HOMEPAGE
Message-ID: <alpine.LFD.2.21.2006170825460.10457@localhost.localdomain>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-0.2
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel7.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel7.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel7.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Content-Type: text/plain; charset=US-ASCII

As the URL pypi.python.org simply redirects to pypi.org, simplify a
number of Python recipes by using that URL explicitly.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/meta/recipes-devtools/python/python-extras.inc b/meta/recipes-devtools/python/python-extras.inc
index b5e11b711a..335bde2724 100644
--- a/meta/recipes-devtools/python/python-extras.inc
+++ b/meta/recipes-devtools/python/python-extras.inc
@@ -1,5 +1,5 @@
 SUMMARY = "Useful extra bits for Python - things that should be in the standard library"
-HOMEPAGE = "https://pypi.python.org/pypi/extras/"
+HOMEPAGE = "https://pypi.org/project/extras/"
 SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6d108f338b2f68fe48ac366c4650bd8b"
diff --git a/meta/recipes-devtools/python/python-pbr.inc b/meta/recipes-devtools/python/python-pbr.inc
index ce3c224d51..bc470e7274 100644
--- a/meta/recipes-devtools/python/python-pbr.inc
+++ b/meta/recipes-devtools/python/python-pbr.inc
@@ -1,6 +1,6 @@
 SUMMARY = "Python Build Reasonableness"
 DESCRIPTION = "PBR is a library that injects some useful and sensible default behaviors into your setuptools run"
-HOMEPAGE = "https://pypi.python.org/pypi/pbr"
+HOMEPAGE = "https://pypi.org/project/pbr"
 SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
diff --git a/meta/recipes-devtools/python/python-setuptools.inc b/meta/recipes-devtools/python/python-setuptools.inc
index 032d337424..9322ca9a05 100644
--- a/meta/recipes-devtools/python/python-setuptools.inc
+++ b/meta/recipes-devtools/python/python-setuptools.inc
@@ -1,5 +1,5 @@
 SUMMARY = "Download, build, install, upgrade, and uninstall Python packages"
-HOMEPAGE = "https://pypi.python.org/pypi/setuptools"
+HOMEPAGE = "https://pypi.org/project/setuptools"
 SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;beginline=1;endline=19;md5=9a33897f1bca1160d7aad3835152e158"
diff --git a/meta/recipes-devtools/python/python-six.inc b/meta/recipes-devtools/python/python-six.inc
index 05b32810bd..df97f845bc 100644
--- a/meta/recipes-devtools/python/python-six.inc
+++ b/meta/recipes-devtools/python/python-six.inc
@@ -1,5 +1,5 @@
 SUMMARY = "Python 2 and 3 compatibility library"
-HOMEPAGE = "https://pypi.python.org/pypi/six/"
+HOMEPAGE = "https://pypi.org/project/six/"
 SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=43cfc9e4ac0e377acfb9b76f56b8415d"
diff --git a/meta/recipes-devtools/python/python-subunit.inc b/meta/recipes-devtools/python/python-subunit.inc
index fc63b38aaf..a2f9c5c3ff 100644
--- a/meta/recipes-devtools/python/python-subunit.inc
+++ b/meta/recipes-devtools/python/python-subunit.inc
@@ -1,5 +1,5 @@
 SUMMARY = "Python implementation of subunit test streaming protocol"
-HOMEPAGE = "https://pypi.python.org/pypi/python-subunit/"
+HOMEPAGE = "https://pypi.org/project/python-subunit/"
 SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://README.rst;beginline=1;endline=20;md5=909c08e291647fd985fbe5d9836d51b6"
diff --git a/meta/recipes-devtools/python/python-testtools.inc b/meta/recipes-devtools/python/python-testtools.inc
index f1f1e26468..e8d308b717 100644
--- a/meta/recipes-devtools/python/python-testtools.inc
+++ b/meta/recipes-devtools/python/python-testtools.inc
@@ -1,5 +1,5 @@
 SUMMARY = "Extensions to the Python standard library unit testing framework"
-HOMEPAGE = "https://pypi.python.org/pypi/testtools/"
+HOMEPAGE = "https://pypi.org/project/testtools/"
 SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e2c9d3e8ba7141c83bfef190e0b9379a"
diff --git a/meta/recipes-devtools/python/python3-iniparse_0.4.bb b/meta/recipes-devtools/python/python3-iniparse_0.4.bb
index 4eba9ecd34..47cd6598cc 100644
--- a/meta/recipes-devtools/python/python3-iniparse_0.4.bb
+++ b/meta/recipes-devtools/python/python3-iniparse_0.4.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Accessing and Modifying INI files"
-HOMEPAGE = "https://pypi.python.org/pypi/iniparse/"
+HOMEPAGE = "https://pypi.org/project/iniparse/"
 LICENSE = "MIT & PSF"
 LIC_FILES_CHKSUM = "file://LICENSE-PSF;md5=1c78a5bb3584b353496d5f6f34edb4b2 \
                     file://LICENSE;md5=52f28065af11d69382693b45b5a8eb54"
diff --git a/meta/recipes-devtools/python/python3-pip_20.0.2.bb b/meta/recipes-devtools/python/python3-pip_20.0.2.bb
index 96973db774..99eeea2edf 100644
--- a/meta/recipes-devtools/python/python3-pip_20.0.2.bb
+++ b/meta/recipes-devtools/python/python3-pip_20.0.2.bb
@@ -1,5 +1,5 @@
 SUMMARY = "The PyPA recommended tool for installing Python packages"
-HOMEPAGE = "https://pypi.python.org/pypi/pip"
+HOMEPAGE = "https://pypi.org/project/pip"
 SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=8ba06d529c955048e5ddd7c45459eb2e"

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                         http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================
