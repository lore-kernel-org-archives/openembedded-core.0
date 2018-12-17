Return-Path: <serhe.popovych@gmail.com>
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	by mail.openembedded.org (Postfix) with ESMTP id 3BAEB7BDDB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2018 22:30:23 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id z13so10698061lfe.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2018 14:30:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=dyOosU0u3gM03odnSf3XH6sI+4nwNsgKp0uEWocKxiQ=;
	b=LwcEP+ka9s7+rXQfGh/aFcoxIdp/xUVmHdilvmtjGQFT+AQ2ZP3eqY8YmqLP3YTJGB
	sDMq3CFTPhxwiUKdzfSzbuRjA4HV0DCpSEicerM09XlW44g3A8l7nU3/Ip7XUdlXQApR
	IulWJ6O+ozc0QCkEzFXLSRhM4AnF0D3IahSv3so7r68PWlSc0dO4xVZ3BmgkOyBrGQAf
	KYwo6mvA15kEXnGiL/KSQf4LXwlJKVatNgVlyEC9Bi6oekaw5KEVzei4BT2csFcSNyVe
	F/1ck2el8peQddeEDNil6wTykd835TbPDeqg+g8GiblPT07uRo5r+OXsqe1QX0Hs0PVA
	wBvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=dyOosU0u3gM03odnSf3XH6sI+4nwNsgKp0uEWocKxiQ=;
	b=bpOt4VXb4snUR3YXhHwj0FvxHHI0+5VEbQ8Qmicqok1GjYXZbyQcJOzeCWQz3CPn8q
	DsbjFCkHvD2yO7Er4uX3MQJ8zDZiyPh77Qa3ifzgjDkovWp+nTz19dTLw/NBPx8hCYjK
	lU8p5VIuTZAziumaL4vAJcmIN62V/RafI8Cuh9djEaTr3EmH5NK44kI9PoVpgJqgbvI0
	GwFtXQdXLl/5Dv93uY3T0+fh8bE7GnGGgOr05VL8PDU0kZWtn85uXLspkcXziQ+LxwZz
	ZtWtSScCHbkmmqazime+4P/nrgDLpTlx3wqtdlPJ+R0cGayETs70/zKI+LYk6EDFcsuY
	hqpA==
X-Gm-Message-State: AA+aEWbU5exS+PO2IzgJ2kYTSegmNs/gQlPiJEuu/F4bB5xUHgSJdOVi
	kZcoxbVIXNsBk0eVzPKlX1/67i6h
X-Google-Smtp-Source: AFSGD/VB611BoVNNM1EZtt5v3k9XnJn/fjnQHBXJL9BYCz0ijQIp9s76kl+hr/x78nmk7qMB1zU5+A==
X-Received: by 2002:a19:5059:: with SMTP id z25mr8219095lfj.120.1545085823746; 
	Mon, 17 Dec 2018 14:30:23 -0800 (PST)
Received: from v-ubt16-x64-sonic.as41781.net ([193.34.155.16])
	by smtp.gmail.com with ESMTPSA id
	v17-v6sm2691726ljg.32.2018.12.17.14.30.22
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 17 Dec 2018 14:30:23 -0800 (PST)
From: Serhey Popovych <serhe.popovych@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Dec 2018 00:29:53 +0200
Message-Id: <1545085793-30072-3-git-send-email-serhe.popovych@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1545085793-30072-1-git-send-email-serhe.popovych@gmail.com>
References: <1545085793-30072-1-git-send-email-serhe.popovych@gmail.com>
Subject: [PATCH 2/2] glibc: Rename ldd in multilib package
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
X-List-Received-Date: Mon, 17 Dec 2018 22:30:23 -0000

This is symmetrical to musl change that renames ldd to ldd.${PN} for
multilib package to avoid filename collision on install.

While there add ldd to glibc package RRECOMMENDS since it is a shell
script not larger than 6Kb in size that costs nothing in compare with
overall glibc binary size and utility could be useful for trivial
debugging steps. If required recommendation can be easily dropped
(e.g. via NO_RECOMMENDATIONS).

Signed-off-by: Serhey Popovych <serhe.popovych@gmail.com>
---
 meta/recipes-core/glibc/glibc-package.inc | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
index a98ae1a..3ab56bd 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -19,7 +19,8 @@ libc_baselibs_append_aarch64 = " /lib/ld-linux-aarch64*.so.1"
 INSANE_SKIP_${PN}_append_aarch64 = " libdir"
 
 FILES_${PN} = "${libc_baselibs} ${libexecdir}/* ${base_sbindir}/ldconfig ${sysconfdir}/ld.so.conf"
-FILES_ldd = "${bindir}/ldd"
+RRECOMMENDS_${PN} = "ldd"
+FILES_ldd = "${bindir}/ldd${@['.${PN}', ''][not d.getVar('MLPREFIX')]}"
 FILES_libsegfault = "${base_libdir}/libSegFault*"
 FILES_libcidn = "${base_libdir}/libcidn-*.so ${base_libdir}/libcidn.so.*"
 FILES_libmemusage = "${base_libdir}/libmemusage.so"
@@ -92,6 +93,10 @@ do_install_append () {
 		return
 	fi
 
+	if [ -n "${MLPREFIX}" ]; then
+		mv "${D}${bindir}/ldd" "${D}${bindir}/ldd.${PN}"
+	fi
+
 	install -d ${D}${sysconfdir}/init.d
 	install -d ${D}${localstatedir}/db/nscd
 	install -m 0755 ${S}/nscd/nscd.init ${D}${sysconfdir}/init.d/nscd
-- 
2.7.4


