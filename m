Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f50.google.com (mail-pl0-f50.google.com
	[209.85.160.50])
	by mail.openembedded.org (Postfix) with ESMTP id 1873D78AB6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Jul 2018 17:06:07 +0000 (UTC)
Received: by mail-pl0-f50.google.com with SMTP id o7-v6so6473387plk.10
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Jul 2018 10:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=2VV4C9Q8+OjnQSvLIAN4CStrGGx7JocHZGlpxm3uCb4=;
	b=peIcebVI+Ly2p1NR/NEkn9+UzBhQlE/PVVv2Pl33MH03xBVjEKAB6LViXDQdjMuxlV
	TlWOlFapOBeZ3pGxXWgPm4QQ4mirM9yOzUTbFcSDk1xEi7C2LdDA0+4bqNJaoYdn9sS0
	JnlBsDWGxtIY1sErhyP9l3DQ5Hj19XT4KkkqkKKa2bTwbIEDTvThWYLMGiRXCbMwSjxa
	PbowSpfhOxI6gLi2mgUfEn0sHPqDhVzTxnyk0j9RqrcqqZuIEiwND003Ho9hnxCNU4QM
	H/L0+Lwjq4c5Ez6qefFKpipkVGiLyf2I5crA2n9asHr/3sW7c7155Iv0RLaDHgvy03PC
	U+zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=2VV4C9Q8+OjnQSvLIAN4CStrGGx7JocHZGlpxm3uCb4=;
	b=pd0JEeh+6zhE8coYnaZ7beZX20YUAU1RSnGRbGnUlbYLOxxW5Kv4yTPDvxATM9urEL
	mQS+iPZdS8prm9yTKLevNap5NLqtw/Fknu7Boc/tXg8rxaKSG1KmnfFoi1/CTwZW1Cey
	IKqEU6gRnvOvEnDBhl53QDnwk4ln8fxVuZAqQ0yVRUz4sXa0eKNJf2ksf2YZHJfvNMJe
	+89WU9UT9cjGAeyamBqYh0SYO8Ao38GdUcXdY7E45L/vKFF1UHXgHX1WcyZlwylPVe9t
	YcsW8WoVeVy7Jw36MuuCYZs50x8HHjtwAELvyNuxzAeqJHk8b0e7J/M+7Aso13C8RSG2
	faKQ==
X-Gm-Message-State: AOUpUlH835twNpdRh5bkSxLKplXhVET8deh+WNqAspspoxcGJw/G4D77
	x2EWPXMsRaYz0EqCBjxuXbUwJ8fn
X-Google-Smtp-Source: AAOMgpef8ECxK4/eJsVEYZsFUhJBEhOjiI+c/B9W2byS0xPpB/V/wYDGmbYaOfT5Ni4zxLLegpjXvQ==
X-Received: by 2002:a17:902:1703:: with SMTP id
	i3-v6mr6368122pli.263.1532192768759; 
	Sat, 21 Jul 2018 10:06:08 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::8092])
	by smtp.gmail.com with ESMTPSA id
	f6-v6sm7818791pgf.52.2018.07.21.10.06.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 21 Jul 2018 10:06:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 21 Jul 2018 10:06:00 -0700
Message-Id: <20180721170600.8910-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
Subject: [PATCH] systemd: Explicitly add hidden attribute to __start_BUS_ERROR_MAP and __stop_BUS_ERROR_MAP
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
X-List-Received-Date: Sat, 21 Jul 2018 17:06:08 -0000

These symbols appear in dynsyms of libsystemd.so and musl loader
doesnt like it

Error relocating /mnt/a/oe/build/tmp/work/i586-bec-linux-musl/avahi/0.7-r0/recipe-sysroot//lib/libsystemd.so.0: __start_BUS_ERROR_MAP: symbol not found
Error relocating /mnt/a/oe/build/tmp/work/i586-bec-linux-musl/avahi/0.7-r0/recipe-sysroot//lib/libsystemd.so.0: __stop_BUS_ERROR_MAP: symbol not found

[YOCTO #12577]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...S_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch | 34 +++++++++++++++++++
 meta/recipes-core/systemd/systemd_239.bb      |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0021-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch

diff --git a/meta/recipes-core/systemd/systemd/0021-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch b/meta/recipes-core/systemd/systemd/0021-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch
new file mode 100644
index 0000000000..668f273208
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0021-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch
@@ -0,0 +1,34 @@
+From 687a5af8dc5d38f918a6ce08fed5297234bf8346 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 2 Mar 2018 18:00:17 -0800
+Subject: [PATCH] Hide __start_BUS_ERROR_MAP and __stop_BUS_ERROR_MAP
+
+for currently unknown reasons they get exported to the shared libries
+even without being listed in the sym file
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+
+Upstream-Status: Pending [ Conditional on master needing this, 239 does need it ]
+
+ src/libsystemd/sd-bus/bus-error.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/libsystemd/sd-bus/bus-error.c b/src/libsystemd/sd-bus/bus-error.c
+index 378f7a377..49d797abd 100644
+--- a/src/libsystemd/sd-bus/bus-error.c
++++ b/src/libsystemd/sd-bus/bus-error.c
+@@ -71,8 +71,8 @@ BUS_ERROR_MAP_ELF_REGISTER const sd_bus_error_map bus_standard_errors[] = {
+ };
+ 
+ /* GCC maps this magically to the beginning and end of the BUS_ERROR_MAP section */
+-extern const sd_bus_error_map __start_BUS_ERROR_MAP[];
+-extern const sd_bus_error_map __stop_BUS_ERROR_MAP[];
++extern const sd_bus_error_map __start_BUS_ERROR_MAP[] _hidden_;
++extern const sd_bus_error_map __stop_BUS_ERROR_MAP[] _hidden_;
+ 
+ /* Additional maps registered with sd_bus_error_add_map() are in this
+  * NULL terminated array */
+-- 
+2.16.2
+
diff --git a/meta/recipes-core/systemd/systemd_239.bb b/meta/recipes-core/systemd/systemd_239.bb
index 7822548993..dc1545abad 100644
--- a/meta/recipes-core/systemd/systemd_239.bb
+++ b/meta/recipes-core/systemd/systemd_239.bb
@@ -52,6 +52,7 @@ SRC_URI_MUSL = "file://0001-Use-getenv-when-secure-versions-are-not-available.pa
                file://0018-Define-glibc-compatible-basename-for-non-glibc-syste.patch \
                file://0019-Do-not-disable-buffering-when-writing-to-oom_score_a.patch \
                file://0020-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch \
+               file://0021-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch \
                "
 
 # Workaround undefined reference to `__stack_chk_fail_local' on qemux86 and qemuppc for musl
-- 
2.18.0


