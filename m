Return-Path: <fabien.thomas@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F146CCD3445
	for <webhook@archiver.kernel.org>; Tue,  5 May 2026 16:59:03 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1089.1778000343048352921
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2026 09:59:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=dHqN6/TO;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4890d945eb4so586045e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 05 May 2026 09:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1778000341; x=1778605141; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u4aGmhFFmVhLT9sPC+X5gctrwuuYTDfEf9PVxMmFJ5I=;
        b=dHqN6/TOGk61bN4uqzuiEW70BKTFk8Lpogq3iB2vfTIZMLOv1n5VjvQgAZamo3Po5r
         rzf5Aat6CbsoJgjl30vsROD3Kqrya/ibQ94cOzqKqZgg6kT9U1QyjYGAU/rBYilWliPJ
         /Hy+Q3CV7oQ6V8MzVlndJj5aBW1iYe1Vvltok=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778000341; x=1778605141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=u4aGmhFFmVhLT9sPC+X5gctrwuuYTDfEf9PVxMmFJ5I=;
        b=SmlW2m2CjMfozV3sbdODgFE0jurcfTVw1jqvFcI5FgypndTLkVoT7DLQIufjeGcvNI
         oVFnjbUu5u4rkLwrR/Zlv9FND+pxbyC/riP6Esy8zmgItvJZI/tv4VenIuvuBYIzqpqy
         0X9VAc5q5UKrv67v18HHG6n8ayI+Oa19x05bBiKdUcLhpA5ruVr0dHk7AYQxbGvv2Bkk
         qSFJf+8s/hKdXIegqWE0ic1XdTqKXdy0FAYE8WOu25E2YYy6Y7Emd0LQ46rku+I6iO3U
         syVKfzZSwRjJYR0BvLvrgXRa5Es/eXFYBQVcdRwSE4gcHf7+tw0yf1yFKKDamY3304HR
         jVeQ==
X-Gm-Message-State: AOJu0Yz3LsTx5gt6cowUrq0sUoHVJZPcWJgEmxBbiWsEKKPXZlo4gFDe
	8GH4lsidAyt3TKRQAIAcGhFAM9BgbDvbFjB4C2x2kIkVXzXTxC+wBGP/RekXUyS/2/HQPdsaADD
	cUi0gm6o=
X-Gm-Gg: AeBDievsYTPEdi+NyC/RXN5bqxqu+BILv+FLOseMtCcKe8RxyKXUCVEjMAHmQyzVRAQ
	Wmba0uuLwoSt9LGGbSz9qBSUNDi3ANcXBhl88K+J0HFg6Gvdo9S1kJkUrrdQQFKcd9KWVcJBnaQ
	YcFrrUrZnpeumGUG+kJmjKyqFfvtFJ4KkXD60EUAj9BYB4Vc1MQdqaUTvFCxeKm+acQz33z+zfP
	EzJpoLjlZscXiF6jIXjSK+rzGVtDVaCjCLcyftJAfizyN3MwS/oa5gxbF5EZ3wF1Dr8UzcvYAYu
	Hq488sNZdW7117SEtwzhMv4tA8cSHbksFFkYz/hMwZjjyDtMw3/FiGfUJb4Wf0nm69TJroBIgiR
	IOtPhhywe7W2vA8ksKjMUg817n08F49L/RsUHyJMYP7lHP+pqy78z4480TlhXYGmEUZjSi38QYS
	5ZnzWkkrNmGA4ZxhsR9GE7jOMTHd3/Vv3i5nN//XzB3PqQn9IXdHuV6gilZw0zTdclIJ+nMY+Hf
	5ECmbl1DAMBq5O7L5iEL9BDUcVKUBZwrSqe
X-Received: by 2002:a05:600c:4e16:b0:486:f893:56c6 with SMTP id 5b1f17b1804b1-48d1425b450mr73514655e9.10.1778000341055;
        Tue, 05 May 2026 09:59:01 -0700 (PDT)
Received: from localhost ([2a01:e0a:8cc:5b00:b8fa:c45c:f26d:53a3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e51f6805fsm60025e9.2.2026.05.05.09.59.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 09:59:00 -0700 (PDT)
From: Fabien Thomas <fabien.thomas@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 16/23] avahi: Fix CVE-2026-34933
Date: Tue,  5 May 2026 18:57:33 +0200
Message-ID: <a556622a3964957491e7e7e56ed695f1bcfffc02.1777995876.git.fabien.thomas@smile.fr>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1777995876.git.fabien.thomas@smile.fr>
References: <cover.1777995876.git.fabien.thomas@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 May 2026 16:59:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236507

From: Vijay Anusuri <vanusuri@mvista.com>

Pick patch according to [1]

[1] https://security-tracker.debian.org/tracker/CVE-2026-34933
[2] https://github.com/avahi/avahi/pull/891
[3] https://nvd.nist.gov/vuln/detail/CVE-2026-34933

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
---
 meta/recipes-connectivity/avahi/avahi_0.8.bb  |   2 +
 .../avahi/files/CVE-2026-34933-1.patch        | 108 ++++++++++++++++++
 .../avahi/files/CVE-2026-34933-2.patch        |  96 ++++++++++++++++
 3 files changed, 206 insertions(+)
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2026-34933-1.patch
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2026-34933-2.patch

diff --git a/meta/recipes-connectivity/avahi/avahi_0.8.bb b/meta/recipes-connectivity/avahi/avahi_0.8.bb
index fce2d7cd56..31febc360d 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.8.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.8.bb
@@ -41,6 +41,8 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/avahi-${PV}.tar.gz \
            file://CVE-2025-68468.patch \
            file://CVE-2025-68471.patch \
            file://CVE-2026-24401.patch \
+           file://CVE-2026-34933-1.patch \
+           file://CVE-2026-34933-2.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/avahi/avahi/releases/"
diff --git a/meta/recipes-connectivity/avahi/files/CVE-2026-34933-1.patch b/meta/recipes-connectivity/avahi/files/CVE-2026-34933-1.patch
new file mode 100644
index 0000000000..208345a325
--- /dev/null
+++ b/meta/recipes-connectivity/avahi/files/CVE-2026-34933-1.patch
@@ -0,0 +1,108 @@
+From 0be89b6bb5c3983837b5e0febcbbbf452ecf7675 Mon Sep 17 00:00:00 2001
+From: Evgeny Vereshchagin <evvers@ya.ru>
+Date: Wed, 1 Apr 2026 05:31:58 +0000
+Subject: [PATCH] core: refuse to accept publish flags where both wide_area and
+ multicast are set
+
+It fixes a bug where it was possible for unprivileged local users to
+crash avahi-daemon via D-Bus by calling EntryGroup methods accepting
+flags and passing both AVAHI_PUBLISH_USE_WIDE_AREA and
+AVAHI_PUBLISH_USE_MULTICAST there. For example when AddRecord was
+invoked like that avahi-daemon crashed with
+```
+dbus-entry-group.c: interface=org.freedesktop.Avahi.EntryGroup, path=/Client0/EntryGroup1, member=AddRecord
+avahi-daemon: entry.c:57: transport_flags_from_domain: Assertion `!((*flags & AVAHI_PUBLISH_USE_MULTICAST) && (*flags & AVAHI_PUBLISH_USE_WIDE_AREA))' failed.
+==84944==
+==84944== Process terminating with default action of signal 6 (SIGABRT)
+==84944==    at 0x4B353BC: __pthread_kill_implementation (pthread_kill.c:44)
+==84944==    by 0x4ADE941: raise (raise.c:26)
+==84944==    by 0x4AC64AB: abort (abort.c:77)
+==84944==    by 0x4AC641F: __assert_fail_base.cold (assert.c:118)
+==84944==    by 0x48A9404: transport_flags_from_domain (entry.c:57)
+==84944==    by 0x48A9F8F: server_add_internal (entry.c:224)
+==84944==    by 0x48AA49F: avahi_server_add (entry.c:324)
+==84944==    by 0x401A670: avahi_dbus_msg_entry_group_impl (dbus-entry-group.c:348)
+==84944==    by 0x4A70741: ??? (in /usr/lib/x86_64-linux-gnu/libdbus-1.so.3.38.3)
+==84944==    by 0x4A5FB22: dbus_connection_dispatch (in /usr/lib/x86_64-linux-gnu/libdbus-1.so.3.38.3)
+==84944==    by 0x401D01D: dispatch_timeout_callback (dbus-watch-glue.c:105)
+==84944==    by 0x488E3AE: timeout_callback (simple-watch.c:447)
+==84944==
+```
+It's a follow-up to fbce111b069aa1e4c701ed37ee1d9f6d6cefaac5 where
+those flags were introduced and consistent with the other places
+where wide_area/multicast flags are used.
+
+It was discovered by
+Guillaume Meunier - Head of Vulnerability Operations Center France - Orange Cyberdefense
+
+https://github.com/avahi/avahi/security/advisories/GHSA-w65r-6gxh-vhvc
+
+CVE-2026-34933
+
+Upstream-Status: Backport [https://github.com/avahi/avahi/commit/0be89b6bb5c3983837b5e0febcbbbf452ecf7675]
+CVE: CVE-2026-34933
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ avahi-core/entry.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/avahi-core/entry.c b/avahi-core/entry.c
+index 0d862133d..06eb12076 100644
+--- a/avahi-core/entry.c
++++ b/avahi-core/entry.c
+@@ -207,6 +207,7 @@ static AvahiEntry * server_add_internal(
+                                          AVAHI_PUBLISH_UPDATE|
+                                          AVAHI_PUBLISH_USE_WIDE_AREA|
+                                          AVAHI_PUBLISH_USE_MULTICAST), AVAHI_ERR_INVALID_FLAGS);
++    AVAHI_CHECK_VALIDITY_RETURN_NULL(s, !(flags & AVAHI_PUBLISH_USE_WIDE_AREA) || !(flags & AVAHI_PUBLISH_USE_MULTICAST), AVAHI_ERR_INVALID_FLAGS);
+     AVAHI_CHECK_VALIDITY_RETURN_NULL(s, avahi_is_valid_domain_name(r->key->name), AVAHI_ERR_INVALID_HOST_NAME);
+     AVAHI_CHECK_VALIDITY_RETURN_NULL(s, r->ttl != 0, AVAHI_ERR_INVALID_TTL);
+     AVAHI_CHECK_VALIDITY_RETURN_NULL(s, !avahi_key_is_pattern(r->key), AVAHI_ERR_IS_PATTERN);
+@@ -454,6 +455,7 @@ int avahi_server_add_address(
+                                               AVAHI_PUBLISH_UPDATE|
+                                               AVAHI_PUBLISH_USE_WIDE_AREA|
+                                               AVAHI_PUBLISH_USE_MULTICAST), AVAHI_ERR_INVALID_FLAGS);
++    AVAHI_CHECK_VALIDITY(s, !(flags & AVAHI_PUBLISH_USE_WIDE_AREA) || !(flags & AVAHI_PUBLISH_USE_MULTICAST), AVAHI_ERR_INVALID_FLAGS);
+     AVAHI_CHECK_VALIDITY(s, !name || avahi_is_valid_fqdn(name), AVAHI_ERR_INVALID_HOST_NAME);
+ 
+     /* Prepare the host naem */
+@@ -595,6 +597,7 @@ static int server_add_service_strlst_nocopy(
+                                                                 AVAHI_PUBLISH_UPDATE|
+                                                                 AVAHI_PUBLISH_USE_WIDE_AREA|
+                                                                 AVAHI_PUBLISH_USE_MULTICAST), AVAHI_ERR_INVALID_FLAGS);
++    AVAHI_CHECK_VALIDITY_SET_RET_GOTO_FAIL(s, !(flags & AVAHI_PUBLISH_USE_WIDE_AREA) || !(flags & AVAHI_PUBLISH_USE_MULTICAST), AVAHI_ERR_INVALID_FLAGS);
+     AVAHI_CHECK_VALIDITY_SET_RET_GOTO_FAIL(s, avahi_is_valid_service_name(name), AVAHI_ERR_INVALID_SERVICE_NAME);
+     AVAHI_CHECK_VALIDITY_SET_RET_GOTO_FAIL(s, avahi_is_valid_service_type_strict(type), AVAHI_ERR_INVALID_SERVICE_TYPE);
+     AVAHI_CHECK_VALIDITY_SET_RET_GOTO_FAIL(s, !domain || avahi_is_valid_domain_name(domain), AVAHI_ERR_INVALID_DOMAIN_NAME);
+@@ -754,6 +757,7 @@ static int server_update_service_txt_strlst_nocopy(
+                                                                 AVAHI_PUBLISH_NO_COOKIE|
+                                                                 AVAHI_PUBLISH_USE_WIDE_AREA|
+                                                                 AVAHI_PUBLISH_USE_MULTICAST), AVAHI_ERR_INVALID_FLAGS);
++    AVAHI_CHECK_VALIDITY_SET_RET_GOTO_FAIL(s, !(flags & AVAHI_PUBLISH_USE_WIDE_AREA) || !(flags & AVAHI_PUBLISH_USE_MULTICAST), AVAHI_ERR_INVALID_FLAGS);
+     AVAHI_CHECK_VALIDITY_SET_RET_GOTO_FAIL(s, avahi_is_valid_service_name(name), AVAHI_ERR_INVALID_SERVICE_NAME);
+     AVAHI_CHECK_VALIDITY_SET_RET_GOTO_FAIL(s, avahi_is_valid_service_type_strict(type), AVAHI_ERR_INVALID_SERVICE_TYPE);
+     AVAHI_CHECK_VALIDITY_SET_RET_GOTO_FAIL(s, !domain || avahi_is_valid_domain_name(domain), AVAHI_ERR_INVALID_DOMAIN_NAME);
+@@ -843,6 +847,7 @@ int avahi_server_add_service_subtype(
+     AVAHI_CHECK_VALIDITY_SET_RET_GOTO_FAIL(s, AVAHI_IF_VALID(interface), AVAHI_ERR_INVALID_INTERFACE);
+     AVAHI_CHECK_VALIDITY_SET_RET_GOTO_FAIL(s, AVAHI_PROTO_VALID(protocol), AVAHI_ERR_INVALID_PROTOCOL);
+     AVAHI_CHECK_VALIDITY_SET_RET_GOTO_FAIL(s, AVAHI_FLAGS_VALID(flags, AVAHI_PUBLISH_USE_MULTICAST|AVAHI_PUBLISH_USE_WIDE_AREA), AVAHI_ERR_INVALID_FLAGS);
++    AVAHI_CHECK_VALIDITY_SET_RET_GOTO_FAIL(s, !(flags & AVAHI_PUBLISH_USE_WIDE_AREA) || !(flags & AVAHI_PUBLISH_USE_MULTICAST), AVAHI_ERR_INVALID_FLAGS);
+     AVAHI_CHECK_VALIDITY_SET_RET_GOTO_FAIL(s, avahi_is_valid_service_name(name), AVAHI_ERR_INVALID_SERVICE_NAME);
+     AVAHI_CHECK_VALIDITY_SET_RET_GOTO_FAIL(s, avahi_is_valid_service_type_strict(type), AVAHI_ERR_INVALID_SERVICE_TYPE);
+     AVAHI_CHECK_VALIDITY_SET_RET_GOTO_FAIL(s, !domain || avahi_is_valid_domain_name(domain), AVAHI_ERR_INVALID_DOMAIN_NAME);
+@@ -910,6 +915,7 @@ static AvahiEntry *server_add_dns_server_name(
+     assert(name);
+ 
+     AVAHI_CHECK_VALIDITY_RETURN_NULL(s, AVAHI_FLAGS_VALID(flags, AVAHI_PUBLISH_USE_WIDE_AREA|AVAHI_PUBLISH_USE_MULTICAST), AVAHI_ERR_INVALID_FLAGS);
++    AVAHI_CHECK_VALIDITY_RETURN_NULL(s, !(flags & AVAHI_PUBLISH_USE_WIDE_AREA) || !(flags & AVAHI_PUBLISH_USE_MULTICAST), AVAHI_ERR_INVALID_FLAGS);
+     AVAHI_CHECK_VALIDITY_RETURN_NULL(s, type == AVAHI_DNS_SERVER_UPDATE || type == AVAHI_DNS_SERVER_RESOLVE, AVAHI_ERR_INVALID_FLAGS);
+     AVAHI_CHECK_VALIDITY_RETURN_NULL(s, port != 0, AVAHI_ERR_INVALID_PORT);
+     AVAHI_CHECK_VALIDITY_RETURN_NULL(s, avahi_is_valid_fqdn(name), AVAHI_ERR_INVALID_HOST_NAME);
+@@ -967,6 +973,7 @@ int avahi_server_add_dns_server_address(
+     AVAHI_CHECK_VALIDITY(s, AVAHI_IF_VALID(interface), AVAHI_ERR_INVALID_INTERFACE);
+     AVAHI_CHECK_VALIDITY(s, AVAHI_PROTO_VALID(protocol) && AVAHI_PROTO_VALID(address->proto), AVAHI_ERR_INVALID_PROTOCOL);
+     AVAHI_CHECK_VALIDITY(s, AVAHI_FLAGS_VALID(flags, AVAHI_PUBLISH_USE_MULTICAST|AVAHI_PUBLISH_USE_WIDE_AREA), AVAHI_ERR_INVALID_FLAGS);
++    AVAHI_CHECK_VALIDITY(s, !(flags & AVAHI_PUBLISH_USE_WIDE_AREA) || !(flags & AVAHI_PUBLISH_USE_MULTICAST), AVAHI_ERR_INVALID_FLAGS);
+     AVAHI_CHECK_VALIDITY(s, type == AVAHI_DNS_SERVER_UPDATE || type == AVAHI_DNS_SERVER_RESOLVE, AVAHI_ERR_INVALID_FLAGS);
+     AVAHI_CHECK_VALIDITY(s, port != 0, AVAHI_ERR_INVALID_PORT);
+     AVAHI_CHECK_VALIDITY(s, !domain || avahi_is_valid_domain_name(domain), AVAHI_ERR_INVALID_DOMAIN_NAME);
diff --git a/meta/recipes-connectivity/avahi/files/CVE-2026-34933-2.patch b/meta/recipes-connectivity/avahi/files/CVE-2026-34933-2.patch
new file mode 100644
index 0000000000..479d0d7e93
--- /dev/null
+++ b/meta/recipes-connectivity/avahi/files/CVE-2026-34933-2.patch
@@ -0,0 +1,96 @@
+From a93fdd980d2db5d453475c0aa2b39946bd6611bd Mon Sep 17 00:00:00 2001
+From: Evgeny Vereshchagin <evvers@ya.ru>
+Date: Wed, 1 Apr 2026 05:30:58 +0000
+Subject: [PATCH] tests: make sure AVAHI_PUBLISH_USE_WIDE_AREA is refused
+
+Upstream-Status: Backport [https://github.com/avahi/avahi/commit/a93fdd980d2db5d453475c0aa2b39946bd6611bd]
+CVE: CVE-2026-34933
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ avahi-client/client-test.c | 25 +++++++++++++++++++++++++
+ avahi-core/avahi-test.c    | 12 +++++++++++-
+ 2 files changed, 36 insertions(+), 1 deletion(-)
+
+diff --git a/avahi-client/client-test.c b/avahi-client/client-test.c
+index 9a015d7..c80e12f 100644
+--- a/avahi-client/client-test.c
++++ b/avahi-client/client-test.c
+@@ -212,6 +212,28 @@ static void terminate(AVAHI_GCC_UNUSED AvahiTimeout *timeout, AVAHI_GCC_UNUSED v
+     avahi_simple_poll_quit(simple_poll);
+ }
+ 
++static void test_refuse_publish_flags(AvahiEntryGroup *g, AvahiPublishFlags flags, int expected) {
++    AvahiAddress a;
++    AvahiStringList *l = NULL;
++    int r;
++
++    r = avahi_entry_group_add_record(g, AVAHI_IF_UNSPEC, AVAHI_PROTO_UNSPEC, flags, "test.local", AVAHI_DNS_CLASS_IN, AVAHI_DNS_TYPE_CNAME, 120, "\0", 1);
++    assert(r == expected);
++
++    avahi_address_parse("224.0.0.251", AVAHI_PROTO_UNSPEC, &a);
++    r = avahi_entry_group_add_address(g, AVAHI_IF_UNSPEC, AVAHI_PROTO_UNSPEC, flags, "test.local", &a);
++    assert(r == expected);
++
++    r = avahi_entry_group_add_service_strlst(g, AVAHI_IF_UNSPEC, AVAHI_PROTO_UNSPEC, flags, "test", "_http._tcp", NULL, NULL, 80, l);
++    assert(r == expected);
++
++    r = avahi_entry_group_update_service_txt_strlst(g, AVAHI_IF_UNSPEC, AVAHI_PROTO_UNSPEC, flags, "test", "_http._tcp", NULL, l);
++    assert(r == expected);
++
++    r = avahi_entry_group_add_service_subtype(g, AVAHI_IF_UNSPEC, AVAHI_PROTO_UNSPEC, flags, "test", "_http._tcp", NULL, "_magic._sub._http._tcp");
++    assert(r == expected);
++}
++
+ int main (AVAHI_GCC_UNUSED int argc, AVAHI_GCC_UNUSED char *argv[]) {
+     AvahiClient *avahi;
+     AvahiEntryGroup *group, *group2;
+@@ -275,6 +297,9 @@ int main (AVAHI_GCC_UNUSED int argc, AVAHI_GCC_UNUSED char *argv[]) {
+     error = avahi_entry_group_add_record (group, AVAHI_IF_UNSPEC, AVAHI_PROTO_UNSPEC, 0, "TestX", 0x01, 0x10, 120, "", 0);
+     assert(error != AVAHI_OK);
+ 
++    test_refuse_publish_flags(group, AVAHI_PUBLISH_USE_WIDE_AREA, AVAHI_ERR_NOT_SUPPORTED);
++    test_refuse_publish_flags(group, AVAHI_PUBLISH_USE_WIDE_AREA|AVAHI_PUBLISH_USE_MULTICAST, AVAHI_ERR_INVALID_FLAGS);
++
+     avahi_entry_group_commit (group);
+ 
+     domain = avahi_domain_browser_new (avahi, AVAHI_IF_UNSPEC, AVAHI_PROTO_UNSPEC, NULL, AVAHI_DOMAIN_BROWSER_BROWSE, 0, avahi_domain_browser_callback, (char*) "omghai3u");
+diff --git a/avahi-core/avahi-test.c b/avahi-core/avahi-test.c
+index 2a7872b..2bae82b 100644
+--- a/avahi-core/avahi-test.c
++++ b/avahi-core/avahi-test.c
+@@ -30,6 +30,7 @@
+ #include <netinet/in.h>
+ #include <arpa/inet.h>
+ 
++#include <avahi-common/error.h>
+ #include <avahi-common/malloc.h>
+ #include <avahi-common/simple-watch.h>
+ #include <avahi-common/alternative.h>
+@@ -150,6 +151,7 @@ static void remove_entries(void) {
+ static void create_entries(int new_name) {
+     AvahiAddress a;
+     AvahiRecord *r;
++    int error;
+ 
+     remove_entries();
+ 
+@@ -181,7 +183,15 @@ static void create_entries(int new_name) {
+         goto fail;
+     }
+ 
+-    if (avahi_server_add_dns_server_address(server, group, AVAHI_IF_UNSPEC, AVAHI_PROTO_UNSPEC, 0, NULL, AVAHI_DNS_SERVER_RESOLVE, avahi_address_parse("192.168.50.1", AVAHI_PROTO_UNSPEC, &a), 53) < 0) {
++    avahi_address_parse("192.168.50.1", AVAHI_PROTO_UNSPEC, &a);
++
++    error = avahi_server_add_dns_server_address(server, group, AVAHI_IF_UNSPEC, AVAHI_PROTO_UNSPEC, AVAHI_PUBLISH_USE_WIDE_AREA, NULL, AVAHI_DNS_SERVER_RESOLVE, &a, 53);
++    assert(error == AVAHI_ERR_NOT_SUPPORTED);
++
++    error = avahi_server_add_dns_server_address(server, group, AVAHI_IF_UNSPEC, AVAHI_PROTO_UNSPEC, AVAHI_PUBLISH_USE_WIDE_AREA|AVAHI_PUBLISH_USE_MULTICAST, NULL, AVAHI_DNS_SERVER_RESOLVE, &a, 53);
++    assert(error == AVAHI_ERR_INVALID_FLAGS);
++
++    if (avahi_server_add_dns_server_address(server, group, AVAHI_IF_UNSPEC, AVAHI_PROTO_UNSPEC, 0, NULL, AVAHI_DNS_SERVER_RESOLVE, &a, 53) < 0) {
+         avahi_log_error("Failed to add new DNS Server address");
+         goto fail;
+     }
+-- 
+2.43.0
+

