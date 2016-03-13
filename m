Return-Path: <pespin.shar@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id BE1D3731F6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2016 19:15:25 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id l68so11567155wml.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2016 12:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=G1w/Sr7q6oJ3i8vyGtmtdhm62ZuNzbct1UwTBGr+8MQ=;
	b=QxCwj4W8VBlVrKJUbr9nVZSpheeMCaqu0xJ9nUUMet8/3OyDUEkfBld1b/6R/T28J5
	o2R3o98YVF1ObVdoBWenrOC9e6NxT711LCM/yP6bhaIVdB4oVWhRAflZghE5+hFLwKw8
	oOc5a/Z3fBgsluSAPSNWWiJ3SiIvcOEX5/so52/KqV2J7oXDeJfALkGwjhBZzAdtTRiA
	bZXbE8iEg++9tgFDMnl1mX3IWX/6pYTJCjslMLS8MsY8PR8w8wSOrK1eV0hZpwkCbhYJ
	jMKyWeSK27sfqOQM7CKsX5KQo3gB646eA/xWmom2U4zY74qfgnYAPca4q5RUOMgtd7sY
	T+DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=G1w/Sr7q6oJ3i8vyGtmtdhm62ZuNzbct1UwTBGr+8MQ=;
	b=W4wcjmaxItgwH4C5eueVGu9EmAKElnIthqH7SkI1cXatE5CMjaWV5tVVjDxRxUAOAp
	WHxq7u0tFNWvaG8Swl/donqc2nnF+Rz0bWzK9h7hJAcQWdh/IN6QfR5Sg4J+Qrm84/w9
	74yQET1tQHQaBMVR6x79LAFE51Tpp5Y2yV4rJT0RinXg/8SBf990WjEJM19BnfKBfRm3
	yu7KUfpG6I/x7HYTOGQikUwvdy8erqnZhFheFTzPS3upqWwBXf5dLhdj/d9kkaoZZrxd
	7/4lvMFxIty9YLza2/7qKNsTRIao2xFEU8LANiTcacw+4JK9hz6XJ1LbEgc/4Q03tpx1
	zd8A==
X-Gm-Message-State: AD7BkJL3X+Y0o0LMZSK4ogItasIqK9612JDHba35foYjN5AVz8XtazdbKY4F3cqmheW3Nw==
X-Received: by 10.28.0.148 with SMTP id 142mr13238531wma.72.1457896526365;
	Sun, 13 Mar 2016 12:15:26 -0700 (PDT)
Received: from localhost.localdomain ([2a02:1811:c1f:3300:9248:9aff:fe94:7ff1])
	by smtp.gmail.com with ESMTPSA id
	n66sm12851410wmg.20.2016.03.13.12.15.25
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 13 Mar 2016 12:15:25 -0700 (PDT)
From: Pau Espin Pedrol <pespin.shar@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 13 Mar 2016 20:13:38 +0100
Message-Id: <5359675110ddf1caa04887e4c82cef6cb5493d68.1457896224.git.pespin.shar@gmail.com>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <cover.1457896224.git.pespin.shar@gmail.com>
References: <cover.1457896224.git.pespin.shar@gmail.com>
In-Reply-To: <cover.1457896224.git.pespin.shar@gmail.com>
References: <cover.1457896224.git.pespin.shar@gmail.com>
Subject: [PATCH 40/42] systemd.bbclass: Remove user services too if systemd is not enabled
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
X-List-Received-Date: Sun, 13 Mar 2016 19:15:26 -0000

* Also change naming related to unitdir, as it's quite misleading because
  in here we are removing more stuff (parent directory) than just unitdir.

Signed-off-by: Pau Espin Pedrol <pespin.shar@gmail.com>
---
 meta/classes/systemd.bbclass | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/meta/classes/systemd.bbclass b/meta/classes/systemd.bbclass
index db7873f..9574cbd 100644
--- a/meta/classes/systemd.bbclass
+++ b/meta/classes/systemd.bbclass
@@ -179,17 +179,24 @@ python systemd_populate_packages() {
 
 PACKAGESPLITFUNCS_prepend = "systemd_populate_packages "
 
-python rm_systemd_unitdir (){
+python rm_systemd_dir (){
     import shutil
     if not bb.utils.contains('DISTRO_FEATURES', 'systemd', True, False, d):
-        systemd_unitdir = oe.path.join(d.getVar("D", True), d.getVar('systemd_unitdir', True))
-        if os.path.exists(systemd_unitdir):
-            shutil.rmtree(systemd_unitdir)
-        systemd_libdir = os.path.dirname(systemd_unitdir)
+        systemd_system_dir = oe.path.join(d.getVar("D", True), d.getVar('nonarch_base_libdir', True), 'systemd')
+        if os.path.exists(systemd_system_dir):
+            shutil.rmtree(systemd_system_dir)
+        systemd_libdir = os.path.dirname(systemd_system_dir)
+        if (os.path.exists(systemd_libdir) and not os.listdir(systemd_libdir)):
+            os.rmdir(systemd_libdir)
+
+        systemd_user_dir = oe.path.join(d.getVar("D", True), d.getVar('nonarch_libdir', True), 'systemd')
+        if os.path.exists(systemd_user_dir):
+            shutil.rmtree(systemd_user_dir)
+        systemd_libdir = os.path.dirname(systemd_user_dir)
         if (os.path.exists(systemd_libdir) and not os.listdir(systemd_libdir)):
             os.rmdir(systemd_libdir)
 }
-do_install[postfuncs] += "rm_systemd_unitdir "
+do_install[postfuncs] += "rm_systemd_dir "
 
 python rm_sysvinit_initddir (){
     import shutil
-- 
2.7.1


