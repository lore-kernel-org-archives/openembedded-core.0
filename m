Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f172.google.com (mail-wr0-f172.google.com
	[209.85.128.172])
	by mail.openembedded.org (Postfix) with ESMTP id 7530A780BD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jun 2017 15:07:44 +0000 (UTC)
Received: by mail-wr0-f172.google.com with SMTP id y25so37112653wrd.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jun 2017 08:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=hgH+fy+rfTj7G4AjoUbcPJQjcvBnp/xaIuszIMRkMaU=;
	b=CCrhZ5i/LFc+7s1PNWhtvP81Fm3QPx++3uMs4dgaCtYrTzCENASNNLVhzSZkd6TybN
	v3RrvAwjAYhajS9Ju1ql4b0VNX61At8VzJVbtWNDdARZp/RTDrE422LfGA3LwiqN+EUd
	yY4hNnq7R79lJypOyX4XyqWTpjktuX5JgE8SVrP902g82pjVxsmfHADFEJgP0CK9Evvt
	yOvhd2zwVi9qhO4x8DczMaUR5Xzeec/biSIjbbuksRwLvfyGMI7Z1HT3z68pcdvf6Cj4
	DvlViXNekiFGI0OQ4HN0MH2gjaUfBxFfXjxbZlix4QiFxQjFyK2K165mQov/mPX0Me2D
	q9EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=hgH+fy+rfTj7G4AjoUbcPJQjcvBnp/xaIuszIMRkMaU=;
	b=DJ28grApKJLkGhVWtVeQA/Hx5C4MItigPaqDebXTBc3RHInpWtZWMHxiqUf0cpRw1H
	Nj10dWABYrjtrTAlw4RFqtThPgmXVqaOnajWzDBeIMObzUZXkD7gv7xbZb5RMwiYM2A6
	b9LVfrH82JIPDOMuXsUdOawCR1VYZMqb/uCuZHe1vBugOO3xmO1HtIhe7s6+2Dzd3C/F
	hwesCoIiL8aXCnW1ppAgh4ponBR7S+Oyd7tm+hp4+oEClGdT0pgdbxsCVNtv2e+K3WYl
	Kj3/0JdrQ+Jaywx7cFeVujhnLwFrbs0j0sl5tSeufGLAhgSd6K4GbSVuOWeC9ocr3Z7k
	NZCQ==
X-Gm-Message-State: AKS2vOyxG3aSBXyG/grZpr509HY0TFmUSGnFbUU4lmSGEjGFBx75AIbE
	dUGZO8Uhfo+pjTcTCYs=
X-Received: by 10.223.142.202 with SMTP id q68mr6589995wrb.13.1497884865139;
	Mon, 19 Jun 2017 08:07:45 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	f21sm15987569wra.5.2017.06.19.08.07.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 19 Jun 2017 08:07:44 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Jun 2017 16:07:40 +0100
Message-Id: <20170619150741.14635-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 1/2] insane: rename pkg to pn because that is what it is
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
X-List-Received-Date: Mon, 19 Jun 2017 15:07:48 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/insane.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index eecd5763c7e..17c9058b04e 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -1060,7 +1060,7 @@ python do_package_qa () {
     package_qa_check_encoding(['DESCRIPTION', 'SUMMARY', 'LICENSE', 'SECTION'], 'utf-8', d)
 
     logdir = d.getVar('T')
-    pkg = d.getVar('PN')
+    pn = d.getVar('PN')
 
     # Check the compile log for host contamination
     compilelog = os.path.join(logdir,"log.do_compile")
@@ -1069,7 +1069,7 @@ python do_package_qa () {
         statement = "grep -e 'CROSS COMPILE Badness:' -e 'is unsafe for cross-compilation' %s > /dev/null" % compilelog
         if subprocess.call(statement, shell=True) == 0:
             msg = "%s: The compile log indicates that host include and/or library paths were used.\n \
-        Please check the log '%s' for more information." % (pkg, compilelog)
+        Please check the log '%s' for more information." % (pn, compilelog)
             package_qa_handle_error("compile-host-path", msg, d)
 
     # Check the install log for host contamination
@@ -1079,7 +1079,7 @@ python do_package_qa () {
         statement = "grep -e 'CROSS COMPILE Badness:' -e 'is unsafe for cross-compilation' %s > /dev/null" % installlog
         if subprocess.call(statement, shell=True) == 0:
             msg = "%s: The install log indicates that host include and/or library paths were used.\n \
-        Please check the log '%s' for more information." % (pkg, installlog)
+        Please check the log '%s' for more information." % (pn, installlog)
             package_qa_handle_error("install-host-path", msg, d)
 
     # Scan the packages...
-- 
2.11.0


