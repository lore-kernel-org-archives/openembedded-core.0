Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3DA82745FB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Sep 2018 05:48:49 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id c14-v6so7983454wmb.4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Sep 2018 22:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=jNR83xODAHNxoFwbgLMr53AO5AJw8cCcdr9ZFqYiMjI=;
	b=rGwiutwHJ1UlRbamoXClRHgFAb+w12KrMD29nT2wFUPoXTpiLp4lHf/LbUGlB+fPtT
	GMfDPkBCFQDWL+9wDf/DZK/v0hxe5jRPzGaoSWF1Vm+h9zLta1jTC9fHRCEJ0JYufUoW
	zVUZK9hR187HOmUOywHVmG/cyvRf/JcEltixf6Wf4JAydu5OPKI15ze/1t96Jpun/4tL
	yJZJgEFBRvwRaqcrkOJi1RTcZjXMrju1sdW+lgVUPE15M+kEXNgBHJZ8iAUDZURhCm1/
	5yGjHYQz2WXe9EFQIIVhdbnBPohSI3ootR8iUmOdDrfAqvFm+wDCtlPTDagl16LZKrZy
	oGGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=jNR83xODAHNxoFwbgLMr53AO5AJw8cCcdr9ZFqYiMjI=;
	b=smCNy44DStUAdbhcsA8CvkuH5ZgpFeoXab1EY8p4bsuRykEpdbs5bkozPR2gXrCwry
	fSepcAAp4+HcUDGfzG8VlkaKIeC9GWHjXNjj4BDj0M5+w6srcTSGasI/LHzssEVc1+WU
	cLzfJj8jhEbbZy7MjDo/tVJzuqm8QhcHDxFxzN/hOUsA6cyS3l9DEzdXP0qcFLtOONsj
	ob0cOmrKyMqAADcInyMefTEOuwnCgE5SHCQ2EGc95gd+PQ7TkxISoijDCa0VczViN2BE
	VbFHSYKtppUyo4Yn/iYPsWCz41XWf8WiUJ2tbMhvbwfkLql99fL9rXqEwwfhcdCSHc//
	ZSLw==
X-Gm-Message-State: APzg51B0nSZPHALwIARbrbfqEO75g201qUwGIcjNta1hX94bM5pCnS+z
	x/ZvmSj6lML4tyhd5kL8e+7uITpL
X-Google-Smtp-Source: ANB0VdZslXr+l7jRbxX+IPw6wfc19aCdpZnHDbWUnYALXpDK/DFZIIRHQyzLVzvNnHIVojRVDp8rzg==
X-Received: by 2002:a1c:5e48:: with SMTP id
	s69-v6mr9310230wmb.19.1537163330511; 
	Sun, 16 Sep 2018 22:48:50 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	w15-v6sm11411960wrs.8.2018.09.16.22.48.49
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 16 Sep 2018 22:48:49 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Sep 2018 05:48:42 +0000
Message-Id: <20180917054844.12934-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/3] coreutils: update printenv's ALTERNATIVE_LINK_NAME
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
X-List-Received-Date: Mon, 17 Sep 2018 05:48:50 -0000

* use base_bindir like busybox does to prevent conflicting u-a configs

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-core/coreutils/coreutils_8.30.bb | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/coreutils/coreutils_8.30.bb b/meta/recipes-core/coreutils/coreutils_8.30.bb
index eb1dd2a93a..205ba4a0aa 100644
--- a/meta/recipes-core/coreutils/coreutils_8.30.bb
+++ b/meta/recipes-core/coreutils/coreutils_8.30.bb
@@ -42,12 +42,12 @@ PACKAGECONFIG[acl] = "--enable-acl,--disable-acl,acl,"
 PACKAGECONFIG[xattr] = "--enable-xattr,--disable-xattr,attr,"
 PACKAGECONFIG[single-binary] = "--enable-single-binary,--disable-single-binary,,"
 
-# [ df mktemp nice base64 gets a special treatment and is not included in this
+# [ df mktemp nice printenv base64 gets a special treatment and is not included in this
 bindir_progs = "arch basename chcon cksum comm csplit cut dir dircolors dirname du \
                 env expand expr factor fmt fold groups head hostid id install \
                 join link logname md5sum mkfifo nl nohup nproc od paste pathchk \
-                pinky pr printenv printf ptx readlink realpath runcon seq sha1sum sha224sum sha256sum \
-                sha384sum sha512sum shred shuf sort split stdbuf sum tac tail tee test timeout\
+                pinky pr printf ptx readlink realpath runcon seq sha1sum sha224sum sha256sum \
+                sha384sum sha512sum shred shuf sort split stdbuf sum tac tail tee test timeout \
                 tr truncate tsort tty unexpand uniq unlink uptime users vdir wc who whoami yes"
 
 # hostname gets a special treatment and is not included in this
@@ -77,7 +77,7 @@ do_install_class-native() {
 }
 
 do_install_append() {
-	for i in df mktemp nice base64; do mv ${D}${bindir}/$i ${D}${bindir}/$i.${BPN}; done
+	for i in df mktemp nice printenv base64; do mv ${D}${bindir}/$i ${D}${bindir}/$i.${BPN}; done
 
 	install -d ${D}${base_bindir}
 	[ "${base_bindir}" != "${bindir}" ] && for i in ${base_bindir_progs}; do mv ${D}${bindir}/$i ${D}${base_bindir}/$i.${BPN}; done
@@ -96,7 +96,7 @@ inherit update-alternatives
 ALTERNATIVE_PRIORITY = "100"
 # Make hostname's priority higher than busybox but lower than net-tools
 ALTERNATIVE_PRIORITY[hostname] = "90"
-ALTERNATIVE_${PN} = "lbracket ${bindir_progs} ${base_bindir_progs} ${sbindir_progs} base64 nice mktemp df"
+ALTERNATIVE_${PN} = "lbracket ${bindir_progs} ${base_bindir_progs} ${sbindir_progs} base64 nice printenv mktemp df"
 ALTERNATIVE_${PN}-doc = "base64.1 nice.1 mktemp.1 df.1 groups.1 kill.1 uptime.1 stat.1 hostname.1"
 
 ALTERNATIVE_LINK_NAME[hostname.1] = "${mandir}/man1/hostname.1"
@@ -117,6 +117,9 @@ ALTERNATIVE_LINK_NAME[nice] = "${base_bindir}/nice"
 ALTERNATIVE_TARGET[nice] = "${bindir}/nice.${BPN}"
 ALTERNATIVE_LINK_NAME[nice.1] = "${mandir}/man1/nice.1"
 
+ALTERNATIVE_LINK_NAME[printenv] = "${base_bindir}/printenv"
+ALTERNATIVE_TARGET[printenv] = "${bindir}/printenv.${BPN}"
+
 ALTERNATIVE_LINK_NAME[lbracket] = "${bindir}/["
 ALTERNATIVE_TARGET[lbracket] = "${bindir}/lbracket.${BPN}"
 
-- 
2.17.1


