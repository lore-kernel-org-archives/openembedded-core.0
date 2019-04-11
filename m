Return-Path: <changhyeok.bae@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 1B05F7D44F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2019 21:27:36 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id y13so9236788wrd.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2019 14:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=1k8hJ/KesKNjvujLiJuz4w0qi6nbMOBCUqgH/GZCt9E=;
	b=m7nJ/lhPZzv207UKI7sCZCoGTjfRdlH3cQdVIgfOe6llmlPn30i5LGwRsZ1iJvsy12
	R8MIxCuM6ogzV8POle+AnxAx8hx4JZAeXhTsHIbL2s2efVwsM5wfS53cbobC733ZXcXu
	Co/CFX4ojUm+W23GO+ofHWiDn/pEZRwqaDWckL3/6sCzUO5sBgeEoU2boKvoKN0LTYrF
	hmdPpwqIUVkM5SWin1Uucf3aYEObw6b6lWD/LUGL41HWtOFAkRkkGM2I3Lf9HueZHf7Y
	Dhs4/1u1I1inrVBvstb/DO3/DQRHQUCnws4vg6q5A6lRpiA0Q9AtdsMYlOZ8LaohcgxQ
	3dFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=1k8hJ/KesKNjvujLiJuz4w0qi6nbMOBCUqgH/GZCt9E=;
	b=HoISWkgPksxx8vJIqkNj7Wkd/WC1q+EIxwCIH6SUEdRumgPncZNmFNheCTpJv9TuEK
	CbY0v8iq5j66ly7bJHRrYmciXUxqEcMJoEuTuamSKOttRY+KRIvaGMhUt3CADs9H8h8t
	POU59XL05M0roK8ZFuDwoDpfBJ5cq//r2NQ8gR1BHX5RL2//+M+nRJ+JfMXqL4xjC0FL
	i2kBdZTr0EMUBFmwJL382nNaEHiH5g/Kf0o5WDOsYMfenn+jDpLwivWK6/duxWwuk9wE
	G278yNAExS2vmvRKoCOoiGaT++xiUQqTFhnc5wSP0Q719h0PeyMeUNGCNXSwWZAHa0B2
	xG2A==
X-Gm-Message-State: APjAAAXq5CvA4ZIWGW/HNhcjr+cyx2d3t9rYmoBYrg0K4wW1o1lK0h6v
	B468EzOgIVvAWZKRDFuAfRnqJLpy
X-Google-Smtp-Source: APXvYqx8eMUylGPAlHSo44atONX6iBWw7khZKLwtol4wqPClsyjWuzWx8lFB8ujMy5OGruJ1esB2Aw==
X-Received: by 2002:adf:ee01:: with SMTP id y1mr34615798wrn.51.1555018056450; 
	Thu, 11 Apr 2019 14:27:36 -0700 (PDT)
Received: from 81c5895b9d0e.corpintra.net
	(dslb-178-008-197-077.178.008.pools.vodafone-ip.de. [178.8.197.77])
	by smtp.gmail.com with ESMTPSA id
	c10sm46330516wrt.65.2019.04.11.14.27.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 11 Apr 2019 14:27:35 -0700 (PDT)
From: Changhyeok Bae <changhyeok.bae@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Apr 2019 21:26:31 +0000
Message-Id: <1555017992-64163-2-git-send-email-changhyeok.bae@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1555017992-64163-1-git-send-email-changhyeok.bae@gmail.com>
References: <1555017992-64163-1-git-send-email-changhyeok.bae@gmail.com>
Subject: [PATCH 2/3] iw: upgrade 4.14 -> 5.0.1
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
X-List-Received-Date: Thu, 11 Apr 2019 21:27:36 -0000

Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
---
 .../iw/0001-connect-fix-parsing-of-WEP-keys.patch  | 194 ---------------------
 .../iw/iw/separate-objdir.patch                    |  27 +--
 .../iw/{iw_4.14.bb => iw_5.0.1.bb}                 |   5 +-
 3 files changed, 19 insertions(+), 207 deletions(-)
 delete mode 100644 meta/recipes-connectivity/iw/iw/0001-connect-fix-parsing-of-WEP-keys.patch
 rename meta/recipes-connectivity/iw/{iw_4.14.bb => iw_5.0.1.bb} (80%)

diff --git a/meta/recipes-connectivity/iw/iw/0001-connect-fix-parsing-of-WEP-keys.patch b/meta/recipes-connectivity/iw/iw/0001-connect-fix-parsing-of-WEP-keys.patch
deleted file mode 100644
index 8cf8f7a..0000000
--- a/meta/recipes-connectivity/iw/iw/0001-connect-fix-parsing-of-WEP-keys.patch
+++ /dev/null
@@ -1,194 +0,0 @@
-From 2a6be4166fd718be0694fe8a6e3f1013c125dee2 Mon Sep 17 00:00:00 2001
-From: Emmanuel Grumbach <emmanuel.grumbach@intel.com>
-Date: Tue, 12 Jun 2018 09:01:56 +0300
-Subject: [PATCH] connect: fix parsing of WEP keys
-
-The introduction of MFP options added a bug that causes a
-segmentation fault when parsing WEP keys.
-Fix that.
-
-Signed-off-by: Emmanuel Grumbach <emmanuel.grumbach@intel.com>
-Signed-off-by: Johannes Berg <johannes.berg@intel.com>
-
-Upstream-Status: Backport
-[https://git.kernel.org/pub/scm/linux/kernel/git/jberg/iw.git/commit/?id=0e39f109c4b8155697a12ef090b59cdb304c8c44]
-Signed-off-by: Liu Haitao <haitao.liu@windriver.com>
----
- ap.c      |  2 +-
- connect.c |  7 ++-----
- ibss.c    |  2 +-
- iw.h      |  3 ++-
- util.c    | 36 ++++++++++++++++++------------------
- 5 files changed, 24 insertions(+), 26 deletions(-)
-
-diff --git a/ap.c b/ap.c
-index 4bab5b9..dcce402 100644
---- a/ap.c
-+++ b/ap.c
-@@ -116,7 +116,7 @@ static int handle_start_ap(struct nl80211_state *state,
- 	argv++;
- 	argc--;
- 
--	return parse_keys(msg, argv, argc);
-+	return parse_keys(msg, &argv, &argc);
-  nla_put_failure:
- 	return -ENOSPC;
- }
-diff --git a/connect.c b/connect.c
-index 339fc73..4a847a1 100644
---- a/connect.c
-+++ b/connect.c
-@@ -54,13 +54,10 @@ static int iw_conn(struct nl80211_state *state,
- 	argv++;
- 	argc--;
- 
--	ret = parse_keys(msg, argv, argc);
-+	ret = parse_keys(msg, &argv, &argc);
- 	if (ret)
- 		return ret;
- 
--	argc -= 4;
--	argv += 4;
--
- 	if (!argc)
- 		return 0;
- 
-@@ -228,7 +225,7 @@ static int iw_auth(struct nl80211_state *state,
- 	argv++;
- 	argc--;
- 
--	return parse_keys(msg, argv, argc);
-+	return parse_keys(msg, &argv, &argc);
-  nla_put_failure:
- 	return -ENOSPC;
- }
-diff --git a/ibss.c b/ibss.c
-index 84f1e95..d77fc92 100644
---- a/ibss.c
-+++ b/ibss.c
-@@ -115,7 +115,7 @@ static int join_ibss(struct nl80211_state *state,
- 	argv++;
- 	argc--;
- 
--	return parse_keys(msg, argv, argc);
-+	return parse_keys(msg, &argv, &argc);
-  nla_put_failure:
- 	return -ENOSPC;
- }
-diff --git a/iw.h b/iw.h
-index ee7ca20..8767ed3 100644
---- a/iw.h
-+++ b/iw.h
-@@ -180,7 +180,8 @@ int parse_hex_mask(char *hexmask, unsigned char **result, size_t *result_len,
- 		   unsigned char **mask);
- unsigned char *parse_hex(char *hex, size_t *outlen);
- 
--int parse_keys(struct nl_msg *msg, char **argv, int argc);
-+
-+int parse_keys(struct nl_msg *msg, char **argv[], int *argc);
- int parse_freqchan(struct chandef *chandef, bool chan, int argc, char **argv, int *parsed);
- enum nl80211_chan_width str_to_bw(const char *str);
- int put_chandef(struct nl_msg *msg, struct chandef *chandef);
-diff --git a/util.c b/util.c
-index 6e0ddff..122c019 100644
---- a/util.c
-+++ b/util.c
-@@ -417,23 +417,23 @@ static int parse_cipher_suite(const char *cipher_str)
- 	return -EINVAL;
- }
- 
--int parse_keys(struct nl_msg *msg, char **argv, int argc)
-+int parse_keys(struct nl_msg *msg, char **argv[], int *argc)
- {
- 	struct nlattr *keys;
- 	int i = 0;
- 	bool have_default = false;
--	char *arg = *argv;
-+	char *arg = **argv;
- 	char keybuf[13];
- 	int pos = 0;
- 
--	if (!argc)
-+	if (!*argc)
- 		return 1;
- 
- 	if (!memcmp(&arg[pos], "psk", 3)) {
- 		char psk_keybuf[32];
- 		int cipher_suite, akm_suite;
- 
--		if (argc < 4)
-+		if (*argc < 4)
- 			goto explain;
- 
- 		pos+=3;
-@@ -451,9 +451,9 @@ int parse_keys(struct nl_msg *msg, char **argv, int argc)
- 		NLA_PUT(msg, NL80211_ATTR_PMK, 32, psk_keybuf);
- 		NLA_PUT_U32(msg, NL80211_ATTR_AUTH_TYPE, NL80211_AUTHTYPE_OPEN_SYSTEM);
- 
--		argv++;
--		argc--;
--		arg = *argv;
-+		*argv += 1;
-+		*argc -= 1;
-+		arg = **argv;
- 
- 		akm_suite = parse_akm_suite(arg);
- 		if (akm_suite < 0)
-@@ -461,9 +461,9 @@ int parse_keys(struct nl_msg *msg, char **argv, int argc)
- 
- 		NLA_PUT_U32(msg, NL80211_ATTR_AKM_SUITES, akm_suite);
- 
--		argv++;
--		argc--;
--		arg = *argv;
-+		*argv += 1;
-+		*argc -= 1;
-+		arg = **argv;
- 
- 		cipher_suite = parse_cipher_suite(arg);
- 		if (cipher_suite < 0)
-@@ -471,9 +471,9 @@ int parse_keys(struct nl_msg *msg, char **argv, int argc)
- 
- 		NLA_PUT_U32(msg, NL80211_ATTR_CIPHER_SUITES_PAIRWISE, cipher_suite);
- 
--		argv++;
--		argc--;
--		arg = *argv;
-+		*argv += 1;
-+		*argc -= 1;
-+		arg = **argv;
- 
- 		cipher_suite = parse_cipher_suite(arg);
- 		if (cipher_suite < 0)
-@@ -495,7 +495,7 @@ int parse_keys(struct nl_msg *msg, char **argv, int argc)
- 		struct nlattr *key = nla_nest_start(msg, ++i);
- 		char *keydata;
- 
--		arg = *argv;
-+		arg = **argv;
- 		pos = 0;
- 
- 		if (!key)
-@@ -537,15 +537,15 @@ int parse_keys(struct nl_msg *msg, char **argv, int argc)
- 
- 		NLA_PUT(msg, NL80211_KEY_DATA, keylen, keydata);
- 
--		argv++;
--		argc--;
-+		*argv += 1;
-+		*argc -= 1;
- 
- 		/* one key should be TX key */
--		if (!have_default && !argc)
-+		if (!have_default && !*argc)
- 			NLA_PUT_FLAG(msg, NL80211_KEY_DEFAULT);
- 
- 		nla_nest_end(msg, key);
--	} while (argc);
-+	} while (*argc);
- 
- 	nla_nest_end(msg, keys);
- 
--- 
-2.17.1
-
diff --git a/meta/recipes-connectivity/iw/iw/separate-objdir.patch b/meta/recipes-connectivity/iw/iw/separate-objdir.patch
index 0ea6a52..eb01a5a 100644
--- a/meta/recipes-connectivity/iw/iw/separate-objdir.patch
+++ b/meta/recipes-connectivity/iw/iw/separate-objdir.patch
@@ -7,29 +7,36 @@ Upstream-Status: Pending
 Signed-off-by: Christopher Larson <chris_larson@mentor.com>
 Signed-off-by: Maxin B. John <maxin.john@intel.com>
 ---
-diff -Naur iw-4.3-origin/Makefile iw-4.3/Makefile
---- iw-4.3-origin/Makefile	2015-11-20 16:37:58.752077287 +0200
-+++ iw-4.3/Makefile	2015-11-20 16:57:15.510615815 +0200
-@@ -1,5 +1,7 @@
+ Makefile | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 33aaf6a..9030796 100644
+--- a/Makefile
++++ b/Makefile
+@@ -1,5 +1,9 @@
  MAKEFLAGS += --no-print-directory
--
+
 +SRCDIR ?= $(dir $(lastword $(MAKEFILE_LIST)))
 +OBJDIR ?= $(PWD)
 +VPATH = $(SRCDIR)
++
  PREFIX ?= /usr
  SBINDIR ?= $(PREFIX)/sbin
  MANDIR ?= $(PREFIX)/share/man
-@@ -95,11 +97,11 @@
+@@ -103,11 +107,11 @@ VERSION_OBJS := $(filter-out version.o, $(OBJS))
  version.c: version.sh $(patsubst %.o,%.c,$(VERSION_OBJS)) nl80211.h iw.h Makefile \
  		$(wildcard .git/index .git/refs/tags)
  	@$(NQ) ' GEN ' $@
 -	$(Q)./version.sh $@
 +	$(Q)cd $(SRCDIR) && ./version.sh $(OBJDIR)/$@
- 
+
  %.o: %.c iw.h nl80211.h
  	@$(NQ) ' CC  ' $@
--	$(Q)$(CC) $(CFLAGS) -c -o $@ $<
-+	$(Q)$(CC) -I$(SRCDIR) $(CFLAGS) -c -o $@ $<
- 
+-	$(Q)$(CC) $(CFLAGS) $(CPPFLAGS) -c -o $@ $<
++	$(Q)$(CC) -I$(SRCDIR) $(CFLAGS) $(CPPFLAGS) -c -o $@ $<
+
  ifeq ($(IW_ANDROID_BUILD),)
  iw:	$(OBJS)
+--
+2.20.1 (Apple Git-117)
diff --git a/meta/recipes-connectivity/iw/iw_4.14.bb b/meta/recipes-connectivity/iw/iw_5.0.1.bb
similarity index 80%
rename from meta/recipes-connectivity/iw/iw_4.14.bb
rename to meta/recipes-connectivity/iw/iw_5.0.1.bb
index f414a4b..e127963 100644
--- a/meta/recipes-connectivity/iw/iw_4.14.bb
+++ b/meta/recipes-connectivity/iw/iw_5.0.1.bb
@@ -12,11 +12,10 @@ DEPENDS = "libnl"
 SRC_URI = "http://www.kernel.org/pub/software/network/iw/${BP}.tar.gz \
            file://0001-iw-version.sh-don-t-use-git-describe-for-versioning.patch \
            file://separate-objdir.patch \
-           file://0001-connect-fix-parsing-of-WEP-keys.patch \
 "
 
-SRC_URI[md5sum] = "2067516ca9940fdb8c091ee3250da374"
-SRC_URI[sha256sum] = "a0c3aad6ff52234d03a2522ba2eba570e36abb3e60dc29bf0b1ce88dd725d6d4"
+SRC_URI[md5sum] = "a0a17ab1b20132c716bba9a4f9974ba6"
+SRC_URI[sha256sum] = "36fc7592dde7bec934df83cd53ef1f2c08ceec5cd58d07eb8f71cc6e8464013c"
 
 inherit pkgconfig
 
-- 
2.7.4


