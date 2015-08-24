Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id 1444A76C02
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 20:03:49 +0000 (UTC)
Received: by iodv127 with SMTP id v127so161984325iod.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 13:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=d2WpJHde18PlZ2wW4dLmdwFaafbIj6sLkZ14lMoqRgU=;
	b=k/xe5L+P++xE5m5z0DspaJKYk5h4bqILCaQr9rqH+9hFwp8n4gyKL9EoW+x9JtVP2t
	BBQcl8Q7zAQEU0T5OxhNmkuHKjje5efG6LEVi68gneMr5XIBsrInVf2KxcvZijr0NQ7y
	P2sQ3Jm8fbyNnC4yEP3ALcM74Zb2h8r6E7m5uvyHWveZZP8TXgR5JXZexJVsIkt9+jcf
	h7KulWa+9by5OLhaXt7hZVRoz6iQQRVXr9Dq3BAz5sqyPyLs7+TbUfQ3i6vh8LPnn+fL
	xBYXw/SOClTqrYAzrMEhlepz+BQwpe5+8ZGfbtNt7b93ZA8hARcMHcH50ZTH087UaZs6
	xUNw==
X-Received: by 10.107.19.94 with SMTP id b91mr19117624ioj.144.1440446629410;
	Mon, 24 Aug 2015 13:03:49 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79]) by smtp.gmail.com with ESMTPSA id
	hh9sm9538417igb.18.2015.08.24.13.03.48
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 24 Aug 2015 13:03:49 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Aug 2015 13:03:35 -0700
Message-Id: <13450b1ae0a08740698a3c1cdf3cdd90cb20125f.1440446290.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <87b72ec93b53c0a0ac61950f52480fa86a93c937.1440446289.git.raj.khem@gmail.com>
References: <87b72ec93b53c0a0ac61950f52480fa86a93c937.1440446289.git.raj.khem@gmail.com>
In-Reply-To: <cover.1440446289.git.raj.khem@gmail.com>
References: <cover.1440446289.git.raj.khem@gmail.com>
Subject: [PATCH 17/17] classes, conf: Remove python-distribute refrences
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
X-List-Received-Date: Mon, 24 Aug 2015 20:03:49 -0000

We have removed python-distribute so these references should go as well

Fixes [YOCTO #8201]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/setuptools.bbclass            | 2 +-
 meta/conf/distro/include/distro_alias.inc  | 2 --
 meta/conf/distro/include/package_regex.inc | 4 ----
 3 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/meta/classes/setuptools.bbclass b/meta/classes/setuptools.bbclass
index 56343b1..157ef63 100644
--- a/meta/classes/setuptools.bbclass
+++ b/meta/classes/setuptools.bbclass
@@ -1,6 +1,6 @@
 inherit distutils
 
-DEPENDS += "python-distribute-native"
+DEPENDS += "python-setuptools-native"
 
 DISTUTILS_INSTALL_ARGS = "--root=${D} \
     --prefix=${prefix} \
diff --git a/meta/conf/distro/include/distro_alias.inc b/meta/conf/distro/include/distro_alias.inc
index ec8570d..fb5f531 100644
--- a/meta/conf/distro/include/distro_alias.inc
+++ b/meta/conf/distro/include/distro_alias.inc
@@ -385,11 +385,9 @@ DISTRO_PN_ALIAS_pn-psplash = "OpenedHand"
 DISTRO_PN_ALIAS_pn-ptest-runner = "OE-Core"
 DISTRO_PN_ALIAS_pn-puzzles = "Debian=sgt-puzzles Fedora=puzzles"
 DISTRO_PN_ALIAS_pn-python3 = "Fedora=python3 Debian=python3.2"
-DISTRO_PN_ALIAS_pn-python3-distribute = "Debian=python3-setuptools Fedora=python3-setuptools"
 DISTRO_PN_ALIAS_pn-python-ZSI = "OE-Core"
 DISTRO_PN_ALIAS_pn-python-argparse = "Fedora=python-argparse OpenSuSE=python-argparse"
 DISTRO_PN_ALIAS_pn-python-dbus = "Ubuntu=python-dbus Debian=python-dbus Mandriva=python-dbus"
-DISTRO_PN_ALIAS_pn-python-distribute = "Opensuse=python-setuptools Fedora=python-setuptools"
 DISTRO_PN_ALIAS_pn-python-git = "Debian=python-git Fedora=GitPython"
 DISTRO_PN_ALIAS_pn-python-mako = "Fedora=python-mako Opensuse=python-Mako"
 DISTRO_PN_ALIAS_pn-python-pycairo = "Meego=pycairo Fedora=pycairo Ubuntu=pycairo Debian=pycairo"
diff --git a/meta/conf/distro/include/package_regex.inc b/meta/conf/distro/include/package_regex.inc
index 0c29ade..1e85c35 100644
--- a/meta/conf/distro/include/package_regex.inc
+++ b/meta/conf/distro/include/package_regex.inc
@@ -120,10 +120,6 @@ REGEX_pn-qt4-native = "(?P<pver>\d+(\.\d+)+)/"
 # PyPI sites
 REGEX_URI_pn-python-nose = "https://pypi.python.org/pypi/nose/"
 REGEX_pn-python-nose = "/nose/${COMMON_REGEX}"
-# python-distribute 0.7.x is a simple compatibility layer that installs Setuptools 0.7+.
-# so we stick to 0.6.x series
-REGEX_URI_pn-python-distribute = "https://pypi.python.org/pypi/distribute/"
-REGEX_pn-python-distribute = "/distribute/(?P<pver>\d+.6.\d+)"
 REGEX_URI_pn-python-gitdb = "https://pypi.python.org/pypi/gitdb/"
 REGEX_URI_pn-python-async = "https://pypi.python.org/pypi/async/"
 REGEX_URI_pn-python-smmap = "https://pypi.python.org/pypi/smmap/"
-- 
2.1.4


