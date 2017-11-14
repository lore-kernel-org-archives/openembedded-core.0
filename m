Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id E45CC78542
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 19:39:42 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id x7so15165406pfa.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 11:39:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=6ppnAlze5UiFxrTjIn49mW0zEteV4eq569u7qPpfRMA=;
	b=GYY2fuJtGV4EiML61EmaC3jzvISaac4t6crgzjSpdNSyJo6OkqyjzPyu3k9YbrHHPu
	vPmAKS/5Pl+62OG3lUTIMJCE666UBSUzmPfI87Q1Rn7hDoIigGvG3RABCYke1QMSW0jO
	veDBU4ciObwiFFKCJajrl7kX2Wxj0Mx+G28mFrcnzoRMw2KfGUEKIMCICfVmEqR4hmHz
	DLU0osiKO6RCvXued0Z6gi/+/MU3cjox0C4oGh36Oa8I1O9y6kB+iwBfqGG6hAEiuxjR
	zicKZxZVK1r5KweDFULeYNsdn/UbFAkO+Mk659xN/49YC65ZMr8iJxqQB5dLN2evI+z2
	rIEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=6ppnAlze5UiFxrTjIn49mW0zEteV4eq569u7qPpfRMA=;
	b=njwAwNshufLUX0uGerrYjFVPSR+b6jwXuxFEB0MHv6JVCb/4yAsA3Oa8sqFwP8t7yI
	gx5aExlTf7KVnQoYlZMFNwAAmzjD3BB5nd3hxBIfmTjWwP4h6KsSByX+vHpdJS0USVWv
	b5JaVKhVmiF+FgfRc1GMh6/bDIfqCYGw7917QiAxI3g124ogv2Hku7nPHUtFjQJj6luI
	u3KZNYYsY3lCDkyixwERs3QAbXmuJJZGSUM/KKfBu8T/pz6NUtzs0lzSlgYuYRnpz+oB
	B7Le4hYRkgNqcbbqSlQ1b1PphrOKBoSjXlr9rO6mKsJ1m+xImp6SlHrS4UVwnVICjiUa
	UYIg==
X-Gm-Message-State: AJaThX4QMXang61o7HvFaIN7EtxdRHIkSUgm5m/Ct8t10O9bYlBZfJHT
	Cu3CdbfpIAU/PSYL45Muj6lQ8Q==
X-Google-Smtp-Source: AGs4zMaWftu2s2ZsLxsO8LwKZuNktW/7JZKFhYIOJNQBaCNPKrdVRWNwbmeLV2eY00NNrMjFPDaVCA==
X-Received: by 10.159.195.7 with SMTP id bd7mr13664063plb.366.1510688384141;
	Tue, 14 Nov 2017 11:39:44 -0800 (PST)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	f4sm30804162pgs.30.2017.11.14.11.39.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 14 Nov 2017 11:39:43 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Nov 2017 11:39:22 -0800
Message-Id: <1510688364-32667-5-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1510688364-32667-1-git-send-email-armccurdy@gmail.com>
References: <1510688364-32667-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 4/6] systemd: sort PACKAGECONFIG options
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
X-List-Received-Date: Tue, 14 Nov 2017 19:39:43 -0000

Also fix some minor formatting inconsistencies (extra spaces or
commas etc). No functional changes.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-core/systemd/systemd_234.bb | 78 ++++++++++++++++----------------
 1 file changed, 39 insertions(+), 39 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_234.bb b/meta/recipes-core/systemd/systemd_234.bb
index b7968b1..1e2377a 100644
--- a/meta/recipes-core/systemd/systemd_234.bb
+++ b/meta/recipes-core/systemd/systemd_234.bb
@@ -95,59 +95,59 @@ PACKAGECONFIG_remove_libc-musl = " \
 # systemd-serialgetty.bb - not enabled by default.
 PACKAGECONFIG[serial-getty-generator] = ""
 
-PACKAGECONFIG[journal-upload] = "--enable-libcurl,--disable-libcurl,curl"
-# Sign the journal for anti-tampering
-PACKAGECONFIG[gcrypt] = "--enable-gcrypt,--disable-gcrypt,libgcrypt"
+PACKAGECONFIG[audit] = "--enable-audit,--disable-audit,audit"
+PACKAGECONFIG[backlight] = "--enable-backlight,--disable-backlight"
+PACKAGECONFIG[binfmt] = "--enable-binfmt,--disable-binfmt"
+PACKAGECONFIG[bzip2] = "--enable-bzip2,--disable-bzip2,bzip2"
+PACKAGECONFIG[coredump] = "--enable-coredump,--disable-coredump"
 PACKAGECONFIG[cryptsetup] = "--enable-libcryptsetup,--disable-libcryptsetup,cryptsetup"
-PACKAGECONFIG[microhttpd] = "--enable-microhttpd,--disable-microhttpd,libmicrohttpd"
+PACKAGECONFIG[dbus] = "--enable-dbus,--disable-dbus,dbus"
+PACKAGECONFIG[efi] = "--enable-efi,--disable-efi"
 PACKAGECONFIG[elfutils] = "--enable-elfutils,--disable-elfutils,elfutils"
-PACKAGECONFIG[resolved] = "--enable-resolved,--disable-resolved"
-PACKAGECONFIG[networkd] = "--enable-networkd,--disable-networkd"
-PACKAGECONFIG[machined] = "--enable-machined,--disable-machined"
-PACKAGECONFIG[backlight] = "--enable-backlight,--disable-backlight"
-PACKAGECONFIG[vconsole] = "--enable-vconsole,--disable-vconsole,,${PN}-vconsole-setup"
-PACKAGECONFIG[quotacheck] = "--enable-quotacheck,--disable-quotacheck"
+PACKAGECONFIG[firstboot] = "--enable-firstboot,--disable-firstboot"
+# Sign the journal for anti-tampering
+PACKAGECONFIG[gcrypt] = "--enable-gcrypt,--disable-gcrypt,libgcrypt"
+PACKAGECONFIG[hibernate] = "--enable-hibernate,--disable-hibernate"
 PACKAGECONFIG[hostnamed] = "--enable-hostnamed,--disable-hostnamed"
+PACKAGECONFIG[ima] = "--enable-ima,--disable-ima"
+# importd requires curl/xz/zlib/bzip2/gcrypt
+PACKAGECONFIG[importd] = "--enable-importd,--disable-importd"
+# Update NAT firewall rules
+PACKAGECONFIG[iptc] = "--enable-libiptc,--disable-libiptc,iptables"
+PACKAGECONFIG[journal-upload] = "--enable-libcurl,--disable-libcurl,curl"
+PACKAGECONFIG[ldconfig] = "--enable-ldconfig,--disable-ldconfig"
+PACKAGECONFIG[libidn] = "--enable-libidn,--disable-libidn,libidn"
+PACKAGECONFIG[localed] = "--enable-localed,--disable-localed"
+PACKAGECONFIG[logind] = "--enable-logind,--disable-logind"
+PACKAGECONFIG[lz4] = "--enable-lz4,--disable-lz4,lz4"
+PACKAGECONFIG[machined] = "--enable-machined,--disable-machined"
+PACKAGECONFIG[manpages] = "--enable-manpages,--disable-manpages,libxslt-native xmlto-native docbook-xml-dtd4-native docbook-xsl-stylesheets-native"
+PACKAGECONFIG[microhttpd] = "--enable-microhttpd,--disable-microhttpd,libmicrohttpd"
 PACKAGECONFIG[myhostname] = "--enable-myhostname,--disable-myhostname"
+PACKAGECONFIG[networkd] = "--enable-networkd,--disable-networkd"
 PACKAGECONFIG[nss] = "--enable-nss-systemd,--disable-nss-systemd"
+PACKAGECONFIG[pam] = "--enable-pam,--disable-pam,libpam,${PAM_PLUGINS}"
+PACKAGECONFIG[polkit] = "--enable-polkit,--disable-polkit"
+PACKAGECONFIG[qrencode] = "--enable-qrencode,--disable-qrencode,qrencode"
+PACKAGECONFIG[quotacheck] = "--enable-quotacheck,--disable-quotacheck"
+PACKAGECONFIG[randomseed] = "--enable-randomseed,--disable-randomseed"
+PACKAGECONFIG[resolved] = "--enable-resolved,--disable-resolved"
 PACKAGECONFIG[rfkill] = "--enable-rfkill,--disable-rfkill"
-PACKAGECONFIG[hibernate] = "--enable-hibernate,--disable-hibernate"
-PACKAGECONFIG[timedated] = "--enable-timedated,--disable-timedated"
-PACKAGECONFIG[timesyncd] = "--enable-timesyncd,--disable-timesyncd"
-PACKAGECONFIG[localed] = "--enable-localed,--disable-localed"
-PACKAGECONFIG[efi] = "--enable-efi,--disable-efi"
-PACKAGECONFIG[ima] = "--enable-ima,--disable-ima"
-PACKAGECONFIG[smack] = "--enable-smack,--disable-smack"
 # libseccomp is found in meta-security
 PACKAGECONFIG[seccomp] = "--enable-seccomp,--disable-seccomp,libseccomp"
-PACKAGECONFIG[logind] = "--enable-logind,--disable-logind"
+PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux,initscripts-sushell"
+PACKAGECONFIG[smack] = "--enable-smack,--disable-smack"
 PACKAGECONFIG[sysusers] = "--enable-sysusers,--disable-sysusers"
-PACKAGECONFIG[firstboot] = "--enable-firstboot,--disable-firstboot"
-PACKAGECONFIG[randomseed] = "--enable-randomseed,--disable-randomseed"
-PACKAGECONFIG[binfmt] = "--enable-binfmt,--disable-binfmt"
+PACKAGECONFIG[timedated] = "--enable-timedated,--disable-timedated"
+PACKAGECONFIG[timesyncd] = "--enable-timesyncd,--disable-timesyncd"
+PACKAGECONFIG[usrmerge] = "--disable-split-usr,--enable-split-usr"
 PACKAGECONFIG[utmp] = "--enable-utmp,--disable-utmp"
-PACKAGECONFIG[polkit] = "--enable-polkit,--disable-polkit"
-# importd requires curl/xz/zlib/bzip2/gcrypt
-PACKAGECONFIG[importd] = "--enable-importd,--disable-importd"
-PACKAGECONFIG[libidn] = "--enable-libidn,--disable-libidn,libidn"
-PACKAGECONFIG[audit] = "--enable-audit,--disable-audit,audit"
-PACKAGECONFIG[manpages] = "--enable-manpages,--disable-manpages,libxslt-native xmlto-native docbook-xml-dtd4-native docbook-xsl-stylesheets-native"
-PACKAGECONFIG[pam] = "--enable-pam,--disable-pam,libpam,${PAM_PLUGINS}"
+PACKAGECONFIG[valgrind] = "ac_cv_header_valgrind_memcheck_h=yes ac_cv_header_valgrind_valgrind_h=yes,ac_cv_header_valgrind_memcheck_h=no ac_cv_header_valgrind_valgrind_h=no,valgrind"
+PACKAGECONFIG[vconsole] = "--enable-vconsole,--disable-vconsole,,${PN}-vconsole-setup"
 # Verify keymaps on locale change
 PACKAGECONFIG[xkbcommon] = "--enable-xkbcommon,--disable-xkbcommon,libxkbcommon"
-# Update NAT firewall rules
-PACKAGECONFIG[iptc] = "--enable-libiptc,--disable-libiptc,iptables"
-PACKAGECONFIG[ldconfig] = "--enable-ldconfig,--disable-ldconfig,,"
-PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux,initscripts-sushell"
-PACKAGECONFIG[valgrind] = "ac_cv_header_valgrind_memcheck_h=yes ac_cv_header_valgrind_valgrind_h=yes ,ac_cv_header_valgrind_memcheck_h=no ac_cv_header_valgrind_valgrind_h=no ,valgrind"
-PACKAGECONFIG[qrencode] = "--enable-qrencode,--disable-qrencode,qrencode"
-PACKAGECONFIG[dbus] = "--enable-dbus,--disable-dbus,dbus"
-PACKAGECONFIG[coredump] = "--enable-coredump,--disable-coredump"
-PACKAGECONFIG[bzip2] = "--enable-bzip2,--disable-bzip2,bzip2"
-PACKAGECONFIG[lz4] = "--enable-lz4,--disable-lz4,lz4"
 PACKAGECONFIG[xz] = "--enable-xz,--disable-xz,xz"
 PACKAGECONFIG[zlib] = "--enable-zlib,--disable-zlib,zlib"
-PACKAGECONFIG[usrmerge] = "--disable-split-usr, --enable-split-usr"
 
 CACHED_CONFIGUREVARS += "ac_cv_path_KILL=${base_bindir}/kill"
 CACHED_CONFIGUREVARS += "ac_cv_path_KMOD=${base_bindir}/kmod"
-- 
1.9.1


