Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
	[209.85.210.182])
	by mail.openembedded.org (Postfix) with ESMTP id 554347E26B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 02:50:02 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id y22so286516pfr.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2019 19:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=BzB7vH//eWVq19WOL2q6aONVCwV2L6YjvlLpjrkKxS8=;
	b=oa25IHe7ZE5mgxWJwmMsJeEaky97QiGbcKszlvFOWDUS4VxPMTm0LXKl+5PlUyYlYC
	syDNDm1vsmo2Ls0viJZmTi9kspc9WM+UirnzJM7GKG93IKBiynvT6Jf0lp0VU9upsahs
	4ehXnH/l8SrqP//maxAv1xViQ3hpIvzbQKUCKjHnzNaJp3oe4Y+bB/vCiPHsMM4RxU8U
	eRusQ6RjsUiBfGiiF9hjtyJxwb+vStg2q6J1g8mLA0MmJ8l/PMpj9L2IrEuZvCmRYfoj
	d7qDA+o5dgbOwI8kZ0nw8lmX6p4YPg/SIpND1UlsdSDL+49/EZ0Yg8uPfwDOS5Xif4V1
	UaOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=BzB7vH//eWVq19WOL2q6aONVCwV2L6YjvlLpjrkKxS8=;
	b=A03gqhrtiBjtqk/NVrrOVKWCp2Uu2c4jOwdaBZ4S+0URnfDNSEk87oTrV4s9682QS4
	1N3cSEF028rHFnEgocHRscMvTtfiNZBOycRZH2VYmmckdbuVp+8ajR+wFVeIbCct0Gnk
	N08NdD2rVPNHXM+MTuM0c38hoLs9U1g5TwPIHvYChKuILsq414+MH0XvMmmfuFq6H3Nu
	cz+MMg4gpgRo2j8zA8YcXrmMxwwmznyK2F7oG4iY449VJpywBweW6RPvK73oYpbCyTJL
	mQExTCDTp+RP4f63hSysMQd1qaEFQuB8ksixDO/OZodAw7RWx5pF69FD9cCz9GA5Ipyz
	xeuw==
X-Gm-Message-State: APjAAAV7GnwsfItzPQBa9dSi+ejhS3hFVbkd1ucQ9r1+M7xGMZy5+O2v
	jtbuA9AOU0smXgf0q70rFfSTa9AWPpc=
X-Google-Smtp-Source: APXvYqy+mUFdMU/lDPSvxkbbyaiX5JwgPmMHfZt0oPb+McgNfQV4/dQPHZ3P4a/4u+TCRvsrlC4GUA==
X-Received: by 2002:a17:90a:983:: with SMTP id 3mr391051pjo.57.1569293403320; 
	Mon, 23 Sep 2019 19:50:03 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:ec07:55c0:9c8c:b3de])
	by smtp.gmail.com with ESMTPSA id
	q204sm146791pfc.11.2019.09.23.19.50.02
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 23 Sep 2019 19:50:02 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Sep 2019 19:49:09 -0700
Message-Id: <5da7878c965dff6a350b1a002e16de5f342255f0.1569292053.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569292053.git.akuster808@gmail.com>
References: <cover.1569292053.git.akuster808@gmail.com>
Subject: [warrior][ 29/50] dpkg: Use less as pager
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
X-List-Received-Date: Tue, 24 Sep 2019 02:50:02 -0000

From: Ricardo Ribalda Delgado <ricardo@ribalda.com>

Debian traditionaly uses /usr/bin/pager as the system pager, which is a
link to the user preferred pager. This is a Debianism.

Without this patch:

root@qt5122:~# dpkg -l
sh: pager: command not found
dpkg-query: error: showing package list on pager subprocess returned error exit status 127

Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/dpkg/dpkg/pager.patch | 21 +++++++++++++++++++++
 meta/recipes-devtools/dpkg/dpkg_1.19.4.bb   |  1 +
 2 files changed, 22 insertions(+)
 create mode 100644 meta/recipes-devtools/dpkg/dpkg/pager.patch

diff --git a/meta/recipes-devtools/dpkg/dpkg/pager.patch b/meta/recipes-devtools/dpkg/dpkg/pager.patch
new file mode 100644
index 0000000..e56b9d2
--- /dev/null
+++ b/meta/recipes-devtools/dpkg/dpkg/pager.patch
@@ -0,0 +1,21 @@
+pager: Use less instead of pager
+
+pager is a Debianism. Istead use directly pager.
+
+Upstream-Status: Inappropriate [OE-Core integration specific]
+
+Suggested-by: Burton, Ross <ross.burton@intel.com>
+Signed-off-by: Ricardo Ribalda <ricardo@ribalda.com>
+diff --git a/lib/dpkg/dpkg.h b/lib/dpkg/dpkg.h
+index 2bb067a..6cbce80 100644
+--- a/lib/dpkg/dpkg.h
++++ b/lib/dpkg/dpkg.h
+@@ -95,7 +95,7 @@ DPKG_BEGIN_DECLS
+ #define MAXUPDATES         250
+ 
+ #define DEFAULTSHELL        "sh"
+-#define DEFAULTPAGER        "pager"
++#define DEFAULTPAGER        "less"
+ 
+ #define MD5HASHLEN           32
+ #define MAXTRIGDIRECTIVE     256
diff --git a/meta/recipes-devtools/dpkg/dpkg_1.19.4.bb b/meta/recipes-devtools/dpkg/dpkg_1.19.4.bb
index c3dbda7..e6083e2 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.19.4.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.19.4.bb
@@ -13,6 +13,7 @@ SRC_URI = "${DEBIAN_MIRROR}/main/d/${BPN}/${BPN}_${PV}.tar.xz \
            file://0006-add-musleabi-to-known-target-tripets.patch \
            file://0007-dpkg-deb-build.c-Remove-usage-of-clamp-mtime-in-tar.patch \
            file://0001-dpkg-Support-muslx32-build.patch \
+           file://pager.patch \
            "
 SRC_URI_append_class-native = " file://glibc2.5-sync_file_range.patch \
                                 file://tweak-options-require-tar-1.27.patch \
-- 
2.7.4


