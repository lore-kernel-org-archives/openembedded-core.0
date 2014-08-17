Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id ECC006FC4F
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Aug 2014 08:52:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7H8qk1f018999 for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Aug 2014 09:52:46 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 5Po67KskCKD5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Aug 2014 09:52:46 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7H8qiVZ018996
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Aug 2014 09:52:45 +0100
Message-ID: <1408265564.24858.4.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sun, 17 Aug 2014 09:52:44 +0100
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Subject: [PATCH] chrpath: Drop warning from darwn builds
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
X-List-Received-Date: Sun, 17 Aug 2014 08:52:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This was old debug which can safely be removed for less noisy builds.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/chrpath.bbclass b/meta/classes/chrpath.bbclass
index 7765020..77b1937 100644
--- a/meta/classes/chrpath.bbclass
+++ b/meta/classes/chrpath.bbclass
@@ -54,7 +54,6 @@ def process_file_darwin(cmd, fpath, rootdir, baseprefix, tmpdir, d):
             continue
 
         newpath = "@loader_path/" + os.path.relpath(rpath, os.path.dirname(fpath.replace(rootdir, "/")))
-        bb.warn("%s %s %s %s" % (fpath, rpath, newpath, rootdir))
         p = sub.Popen([d.expand("${HOST_PREFIX}install_name_tool"), '-change', rpath, newpath, fpath],stdout=sub.PIPE,stderr=sub.PIPE)
         err, out = p.communicate()
 



