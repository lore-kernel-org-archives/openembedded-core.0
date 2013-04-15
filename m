Received: from mail-wg0-f54.google.com ([74.125.82.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1URltq-0003Pa-W9
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Apr 2013 18:05:04 +0200
Received: by mail-wg0-f54.google.com with SMTP id y10so1689679wgg.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2013 08:47:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=ysl1tnkBzaCOJGFobQhZlvIlcH+TY6XdTGDEUWcdzY8=;
	b=d7xzUpdPQs2ieW5gaBtjAlOwsH/rEolaA7DZprQbsOjm+9XPKii126CsGhnzmpRjCc
	W22g1DOfOXnn/QZp8PmiIsEdxsCaV0u0fClQA9Rtl6dKx9CjXb3Vspj5gqqYYOMHDV7d
	cKYXHAf0b1D3BOI9N1+d3KBFaYytAwx6CzD3wD+B2Yk0cSNCS7JLkwdgl3LHfkDFUGy/
	oZczW+vyGc71JocvHv/ycZNhoV4uH3S9FmSKrO0Yyn2/zOL5/xC6Rr4GKZlw33x1vopt
	JkhA5HjjvM057H/XAC5Z+lFa/zJ5m+i/YtebixAhua7MVZzbyBM7ExAnXwYBDuLsrcfS
	NbDg==
X-Received: by 10.194.222.100 with SMTP id ql4mr33155107wjc.59.1366040850048; 
	Mon, 15 Apr 2013 08:47:30 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id ej8sm14202278wib.9.2013.04.15.08.47.28
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 15 Apr 2013 08:47:29 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Apr 2013 16:44:40 +0100
Message-Id: <1366040680-8181-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQkZUrjW7htyBvKiP9eM2iEqOl7gtPq2GhS63kYuYVihgeYDqWdqMRx/ebeIhrODfJG91V77
Subject: [PATCH] coreutils: add realpath to alternatives
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 15 Apr 2013 16:05:05 -0000

New coreutils (8.15 onwards) build /usr/bin/realpath, which busybox also builds.
Add it to the alternatives handling to avoid file conflicts.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/coreutils/coreutils_8.21.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/coreutils/coreutils_8.21.bb b/meta/recipes-core/coreutils/coreutils_8.21.bb
index 88561c7..26ada48 100644
--- a/meta/recipes-core/coreutils/coreutils_8.21.bb
+++ b/meta/recipes-core/coreutils/coreutils_8.21.bb
@@ -29,7 +29,7 @@ EXTRA_OECONF_class-native = "--disable-acl --without-gmp"
 bindir_progs = "basename chcon cksum comm csplit cut dir dircolors dirname du \
                 env expand expr factor fmt fold groups head hostid id install \
                 join link logname md5sum mkfifo nice nl nohup nproc od paste pathchk \
-                pinky pr printenv printf ptx readlink runcon seq sha1sum sha224sum sha256sum \
+                pinky pr printenv printf ptx readlink realpath runcon seq sha1sum sha224sum sha256sum \
                 sha384sum sha512sum shred shuf sort split stat stdbuf sum tac tail tee test timeout\
                 tr truncate tsort tty unexpand uniq unlink uptime users vdir wc who whoami yes"
 
-- 
1.7.10.4



