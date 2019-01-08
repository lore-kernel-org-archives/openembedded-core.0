Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 515A96BE3A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Jan 2019 20:42:58 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id y126so2495560pfb.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Jan 2019 12:42:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Ebw+tin9CFV/b8CFXFlx3z1yFrzw7Nzksl8wMo3dnkE=;
	b=g8rHrF/CE74CuQFAlZUqjLr3ZOrfk0WbOeO9ucqfbYu1SfXRdaaQCP4jsYSsXeGRwC
	OVWFglLtCPg6yQTiija1JCsu7so9+dYwdMH/f4uI5kpLadUN/YIiU/CwDqicuFiYmFMi
	H9nJ79E41abnYc2pd9xj/N46nvXYVAo/xkCKBFoz5dhZJg2CcVatS0pO6ZwvGz3sxp4t
	gYTzq8HSnqvBxkCD/P/0CQlRVScaHejP1CTwj7AsLk9BM61sZYfB7zNBbvxSMaO9aweM
	+Fueqe4/QVRi7DEGFaYZmjJV/+5dqlezLxJTEnGSzYukLf6c9ayV6cVyU2ZAGs6qMOPp
	1bHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Ebw+tin9CFV/b8CFXFlx3z1yFrzw7Nzksl8wMo3dnkE=;
	b=Fg8jruF8PZwgh9Qo8KLw1eoiz2pt736wGceMDBVSEaVzX3592H3XpQ7b1X3ObqVvCg
	iYX0NlqhbuyPJFghw6YTa3aAbkgQtk/yCbRNFOl9pxunPhsZPZIrYV1EvhQbsOzxTpx0
	X7+IzJFg00A9bLslzXYL5N7d/4jNEnMVqnZ7MJkQxbqCI7a4+IRxNayevQmiC+lZ4vX7
	QGmL9ZwKsfCTtAb29SttPwWRvVhFArAX6q94CILmPzSozhLF/nyCN7EKJcsYN8SlbOmB
	mpk5li+zb+DDe6biACc4Z3sKActCUrSlUJhPG8hPg1XNRvfKi8MUSoxiwfAGQtfEAKxm
	Orpg==
X-Gm-Message-State: AJcUukeQw1/aEgffZVErUC9Z8udv+lGBSUKD0PWoo5B3kScdmgClrvs1
	YYFsKwqZOkAyHTmUCoTqOZdS8RJA+XU=
X-Google-Smtp-Source: ALg8bN4XH+WjRhpAcD6LpSC5I43ZJMwTRajfCZpVpPcKEgO9e/nH1pH57r4/2AmpjlddMvR7QPw2Gw==
X-Received: by 2002:a63:1e17:: with SMTP id e23mr666182pge.130.1546980178723; 
	Tue, 08 Jan 2019 12:42:58 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:877f:9499::6e98])
	by smtp.gmail.com with ESMTPSA id
	t5sm109789607pfb.60.2019.01.08.12.42.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 08 Jan 2019 12:42:58 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Jan 2019 12:42:48 -0800
Message-Id: <20190108204249.8087-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190108204249.8087-1-raj.khem@gmail.com>
References: <20190108204249.8087-1-raj.khem@gmail.com>
MIME-Version: 1.0
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>
Subject: [PATCH 2/3] linux-libc-headers: Remove spurious x.mbox file
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
X-List-Received-Date: Tue, 08 Jan 2019 20:42:58 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux-libc-headers/x.mbox | 174 ------------------
 1 file changed, 174 deletions(-)
 delete mode 100644 meta/recipes-kernel/linux-libc-headers/x.mbox

diff --git a/meta/recipes-kernel/linux-libc-headers/x.mbox b/meta/recipes-kernel/linux-libc-headers/x.mbox
deleted file mode 100644
index 25e76e7595..0000000000
--- a/meta/recipes-kernel/linux-libc-headers/x.mbox
+++ /dev/null
@@ -1,174 +0,0 @@
-From openembedded-core-bounces@lists.openembedded.org Tue Dec 25 20:46:09 2018
-Delivered-To: bruce.ashfield@gmail.com
-Received: by 2002:a2e:4c3:0:0:0:0:0 with SMTP id a64-v6csp5312962ljf;
-        Tue, 25 Dec 2018 17:46:09 -0800 (PST)
-X-Google-Smtp-Source: ALg8bN5+ydksOT9csVRJHxYDz7K6mUppK0qIlnMBsbGWz9Sq8Fdlk64bzsaJk68T9XGeIzgSwxS9
-X-Received: by 2002:a63:295:: with SMTP id 143mr16751743pgc.362.1545788769434;
-        Tue, 25 Dec 2018 17:46:09 -0800 (PST)
-ARC-Seal: i=1; a=rsa-sha256; t=1545788769; cv=none;
-        d=google.com; s=arc-20160816;
-        b=jG9fBrPvXAw8K+BjylRwE9cyo1dGTSQIXWYQAsxDXBL4sJKb/9HQ7t9CARYj48ptNC
-         PyU9C1SF8FBe8jel1WM2zKHYxcoKShkfNv92t9jrw7thhkeRGtOPIfoQXt1ma6+1MLGa
-         hdinQ5eBKdQt2AouG0A8huAMuHJfxYB9XpD5771sN0XD51Ecc8oYTYOEPmzg21EYg9EC
-         /8A+bodbKwBlIjg6x/O1ucx7W6fV5iyeyaOsJbzbPZeTdC3FqGycgSfErAkyoEJjYwAP
-         /k5PPo4vm6SU3PHJOV7a2cLbWfG6bS5K6/cxzdpXQKTGheKZOc6FFE3ptZfAwkFbVxfX
-         Siww==
-ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
-        h=errors-to:sender:content-transfer-encoding:mime-version
-         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
-         :list-id:precedence:subject:cc:message-id:date:to:from:delivered-to;
-        bh=L66KCbYgtwDc95aWv7eY3oTToexeHY5x8MVGyHJ/gPM=;
-        b=rrE3b6NDRkazf03I4sTmeHnGX/emKFRWJSUcjyKS2hmAS83KcWTj/WfkinO4w4TeuB
-         S7hPfsAA+DsVLI8Qz0Y2FpZp8dyCeDTDkJtPqZdlDhErV2b3weNNFqbiY4fjIlREkYO/
-         OIg0TgyyPGu4Ekur2dkYbdGmxIGtNsdIEQwv/zROwASqQiK/jpz7M156pGCbKYiSZz1g
-         k3Bwrg+ON72xwBpMoN/x/9Ep7UXl3dvKAkgxUgPaBnPuwDW3HV+y4a3AYyiBoXRRILvm
-         NDuAEwBRysljjsAeD1fxvwtKosRKuNfQpKDwibdgcsHjywPZKykADwYvp3Yc9bdOUwry
-         A8FA==
-ARC-Authentication-Results: i=1; mx.google.com;
-       spf=pass (google.com: best guess record for domain of openembedded-core-bounces@lists.openembedded.org designates 140.211.169.62 as permitted sender) smtp.mailfrom=openembedded-core-bounces@lists.openembedded.org
-Return-Path: <openembedded-core-bounces@lists.openembedded.org>
-Received: from mail.openembedded.org (mail.openembedded.org. [140.211.169.62])
-        by mx.google.com with ESMTP id j35si31697173pgl.223.2018.12.25.17.46.08;
-        Tue, 25 Dec 2018 17:46:09 -0800 (PST)
-Received-SPF: pass (google.com: best guess record for domain of openembedded-core-bounces@lists.openembedded.org designates 140.211.169.62 as permitted sender) client-ip=140.211.169.62;
-Authentication-Results: mx.google.com;
-       spf=pass (google.com: best guess record for domain of openembedded-core-bounces@lists.openembedded.org designates 140.211.169.62 as permitted sender) smtp.mailfrom=openembedded-core-bounces@lists.openembedded.org
-Received: from 165.28.230.35.bc.googleusercontent.com (localhost [127.0.0.1])
-	by mail.openembedded.org (Postfix) with ESMTP id 564896BEF4;
-	Wed, 26 Dec 2018 01:45:54 +0000 (UTC)
-X-Original-To: openembedded-core@lists.openembedded.org
-Delivered-To: openembedded-core@lists.openembedded.org
-Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
-	by mail.openembedded.org (Postfix) with ESMTP id 812D86B79B
-	for <openembedded-core@lists.openembedded.org>;
-	Wed, 26 Dec 2018 01:45:45 +0000 (UTC)
-Received: from ala-blade48.wrs.com (ala-blade48.wrs.com [147.11.105.68])
-	by mail.windriver.com (8.15.2/8.15.1) with SMTP id wBQ1ji3b015924;
-	Tue, 25 Dec 2018 17:45:44 -0800 (PST)
-Received: by ala-blade48.wrs.com (sSMTP sendmail emulation);
-	Tue, 25 Dec 2018 17:45:44 -0800
-From: He Zhe <zhe.he@windriver.com>
-To: openembedded-core@lists.openembedded.org
-Date: Tue, 25 Dec 2018 17:45:44 -0800
-Message-Id: <20181226014544.1991-1-zhe.he@windriver.com>
-X-Mailer: git-send-email 2.11.0
-Cc: bruce.ashfield@windriver.com
-Subject: [OE-core] [PATCH] linux-libc-headers: Fix build failure with fixed
-	input and output files instead of pipe
-X-BeenThere: openembedded-core@lists.openembedded.org
-X-Mailman-Version: 2.1.12
-Precedence: list
-List-Id: Patches and discussions about the oe-core layer
-	<openembedded-core.lists.openembedded.org>
-List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
-	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
-List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
-List-Post: <mailto:openembedded-core@lists.openembedded.org>
-List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
-List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
-	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
-MIME-Version: 1.0
-Content-Type: text/plain; charset="us-ascii"
-Content-Transfer-Encoding: 7bit
-Sender: openembedded-core-bounces@lists.openembedded.org
-Errors-To: openembedded-core-bounces@lists.openembedded.org
-Status: RO
-X-Status: A
-Content-Length: 4076
-Lines: 94
-
-This is an amendment for
-2322dc4 "linux-libc-headers: Fix build failure by using fixed temporary file instead of pipe"
-which moves just the temporary input file from /tmp to build directory. But the
-build directory may not in the same file system with the output file,
-/dev/null, either and thus make it possible to trigger that bug, 67f846b, in
-binutil v2.31.
-
-This patch puts both the input and output files into build directory for good.
-
-Signed-off-by: He Zhe <zhe.he@windriver.com>
----
- ...fixed-input-and-output-files-instead-of-.patch} | 22 ++++++++++------------
- .../linux-libc-headers/linux-libc-headers_4.18.bb  |  2 +-
- 2 files changed, 11 insertions(+), 13 deletions(-)
- rename meta/recipes-kernel/linux-libc-headers/linux-libc-headers/{0001-scripts-Use-fixed-temporary-file-instead-of-pipe-for.patch => 0001-scripts-Use-fixed-input-and-output-files-instead-of-.patch} (83%)
-
-diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-scripts-Use-fixed-temporary-file-instead-of-pipe-for.patch b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-scripts-Use-fixed-input-and-output-files-instead-of-.patch
-similarity index 83%
-rename from meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-scripts-Use-fixed-temporary-file-instead-of-pipe-for.patch
-rename to meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-scripts-Use-fixed-input-and-output-files-instead-of-.patch
-index 0d8fa80939..9ba1c076e8 100644
---- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-scripts-Use-fixed-temporary-file-instead-of-pipe-for.patch
-+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-scripts-Use-fixed-input-and-output-files-instead-of-.patch
-@@ -1,7 +1,7 @@
--From 3bbea65e11918f8753e8006a2198b999cdb0af58 Mon Sep 17 00:00:00 2001
-+From 694eba7bb974f6b8bd308804cb24350150108b2b Mon Sep 17 00:00:00 2001
- From: He Zhe <zhe.he@windriver.com>
- Date: Wed, 21 Nov 2018 15:12:43 +0800
--Subject: [PATCH] scripts: Use fixed temporary file instead of pipe for
-+Subject: [PATCH] scripts: Use fixed input and output files instead of pipe for
-  here-doc
- 
- There was a bug of "as" in binutils that when it checks if the input file and
-@@ -40,31 +40,29 @@ Upstream-Status: Inappropriate [A work around for binutils v2.31]
- 
- Signed-off-by: He Zhe <zhe.he@windriver.com>
- ---
-- scripts/gcc-goto.sh | 7 ++++++-
-- 1 file changed, 6 insertions(+), 1 deletion(-)
-+ scripts/gcc-goto.sh | 5 ++++-
-+ 1 file changed, 4 insertions(+), 1 deletion(-)
- 
- diff --git a/scripts/gcc-goto.sh b/scripts/gcc-goto.sh
--index 083c526..0aaf1b4 100755
-+index 083c526..8dfac55 100755
- --- a/scripts/gcc-goto.sh
- +++ b/scripts/gcc-goto.sh
--@@ -3,7 +3,9 @@
-+@@ -3,7 +3,7 @@
-  # Test for gcc 'asm goto' support
-  # Copyright (C) 2010, Jason Baron <jbaron@redhat.com>
-  
- -cat << "END" | $@ -x c - -c -o /dev/null >/dev/null 2>&1 && echo "y"
--+TMPFILE=`mktemp -p .`
--+
--+cat << "END" > ${TMPFILE}
-++cat << "END" > ./input
-  int main(void)
-  {
-  #if defined(__arm__) || defined(__aarch64__)
--@@ -20,3 +22,6 @@ entry:
-+@@ -20,3 +20,6 @@ entry:
-  	return 0;
-  }
-  END
- +
--+$@ -x c ${TMPFILE} -c -o /dev/null && echo "y"
--+rm ${TMPFILE}
-++$@ -x c ./input -c -o ./output && echo "y"
-++rm ./input ./output
- -- 
- 2.7.4
- 
-diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.18.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.18.bb
-index 00420aa6f7..229a0027d7 100644
---- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.18.bb
-+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.18.bb
-@@ -10,7 +10,7 @@ SRC_URI_append_libc-musl = "\
-    "
- 
- SRC_URI_append = "\
--    file://0001-scripts-Use-fixed-temporary-file-instead-of-pipe-for.patch \
-+    file://0001-scripts-Use-fixed-input-and-output-files-instead-of-.patch \
- "
- 
- SRC_URI[md5sum] = "bee5fe53ee1c3142b8f0c12c0d3348f9"
--- 
-2.11.0
-
--- 
-_______________________________________________
-Openembedded-core mailing list
-Openembedded-core@lists.openembedded.org
-http://lists.openembedded.org/mailman/listinfo/openembedded-core
-
-- 
2.20.1


