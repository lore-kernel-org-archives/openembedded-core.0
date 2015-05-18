Return-Path: <lucas.dutra.nunes@gmail.com>
Received: from mail-qk0-f173.google.com (mail-qk0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id F0F5360124
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 May 2015 20:08:30 +0000 (UTC)
Received: by qkai132 with SMTP id i132so50583296qka.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 May 2015 13:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=HSh9aSXLq4fT9bnhocaTOECPeP8MiYcMpDZOVg5CaVg=;
	b=qhkg/wORltLWzyEp3P+qlR5YUWwrvdDmdrCXq4GLxJG2USB0J8wXQtR47cZ5jpjTXi
	/rq3k49DWqULghDWKUG26auIx3UWZwtjG1NuDX+TMpzI7S8QljOBD38ff4FEvLtXKa3J
	IIQoZxvb6mGOaFy3yTnszuegftRY8ft4MuL8hz2vXGjCerMCFb8avQm/qnJC6qr2u/4l
	n0y4f4gZmuUnutQqy+T5pLP1OG+PoASFUDLMa8+zEZvTcRMRnFysNFg+rwnMldPwR+Zw
	XNzhfgbS44GPDhRxk2QwinqYpMwtNRciKVGUfAfaz9VdJ16jna/Q0y30jfbqsu3jIlLZ
	244A==
X-Received: by 10.140.51.106 with SMTP id t97mr31118662qga.44.1431979711113;
	Mon, 18 May 2015 13:08:31 -0700 (PDT)
Received: from ldnunes.lab.ossystems.com.br ([177.100.224.72])
	by mx.google.com with ESMTPSA id 33sm1654018qkq.41.2015.05.18.13.08.28
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 18 May 2015 13:08:29 -0700 (PDT)
Sender: Lucas Nunes <lucas.dutra.nunes@gmail.com>
From: Lucas Dutra Nunes <ldnunes@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 May 2015 17:08:17 -0300
Message-Id: <1431979698-29379-1-git-send-email-ldnunes@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 1/2] cleanup-workdir: add a method for getting the build dir
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
X-List-Received-Date: Mon, 18 May 2015 20:08:32 -0000

Signed-off-by: Lucas Dutra Nunes <ldnunes@ossystems.com.br>
---
 scripts/cleanup-workdir | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/scripts/cleanup-workdir b/scripts/cleanup-workdir
index a7f5a3a..bf37f90 100755
--- a/scripts/cleanup-workdir
+++ b/scripts/cleanup-workdir
@@ -64,6 +64,9 @@ def get_cur_arch_dirs(workdir, arch_dirs):
         m = re.match(pattern, output)
         arch_dirs.append(m.group(1))
 
+def get_build_dir():
+    return run_command('echo $BUILDDIR').strip()
+
 def main():
     global parser
     parser = optparse.OptionParser(
@@ -77,7 +80,7 @@ will be deleted. Be CAUTIOUS.""")
 
     options, args = parser.parse_args(sys.argv)
 
-    builddir = run_command('echo $BUILDDIR').strip()
+    builddir = get_build_dir()
     if len(builddir) == 0:
         err_quit("Please source file \"oe-init-build-env\" first.\n")
 
-- 
2.1.4


