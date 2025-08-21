Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73A06CA0FE2
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 06:45:39 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web11.3236.1755758734359101939
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Aug 2025 23:45:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ikwwJeEB;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b4756244423so446303a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Aug 2025 23:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755758733; x=1756363533; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BpOn1fhrWYcMXeSkERDadtQwRb73Qv0EhwOY+3sBr9k=;
        b=ikwwJeEBQ6kl+TpRvmsCNUdF/lwKhC6tCRcXmHXBoWXEOF8VcnJyWMgieYmqn9OfLF
         hYAje1/m0SXFMlhrKujObcxXwczr5yzm/9nh9EFVqqn0vw6ZZwY/TnFQBZo8h7U67Kuf
         J7yUBPHNGZgCrIcqOZma9NCkkiMF//0ntgIDcy5z9xvJBBQaqPeDTUjdnMH+KZbpATmd
         jo0a9peVUcvf18Zd9VY2OLD6cUDxofq0LE9WCk4pyiTZpA3Ra4IofwjHbbxn3964YkNj
         ITeqKm+p1pzc0K/lPe7YH4iN8FoKBSViKRu2nnEt8bpjbG5JzthL4a61r/Ca7iIrsTUW
         lJ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755758733; x=1756363533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BpOn1fhrWYcMXeSkERDadtQwRb73Qv0EhwOY+3sBr9k=;
        b=kbW6XgWnhDp6V4gP/sHJC4njbRROKTNDDFOelob9t4VPbc7SQA46vB42s52b9CWzNa
         vYxrojEqeOpsq4HGPH0P6ZSI3exThQzTUn8T1QyLfK6mAjni1nx6XRuWiCm1lkOi3i41
         tjLepPBNpKJNlQdySVeSq4XhYXoYGkltSb5ZpKE1Jb93cZw83ZDpRFl1WOfl9fJOTDfc
         YMlUeIDb9uoGB0VXvX9/+86RMyG5vGijCPJX4YSUG62ZOyy1lA0utAU8xdBmzlmaKod/
         uom888e8FSuYnsfVEcZhbZm6025EhJbVCdjjyDMskXug7TBCcQCZAJ/F+lhB1Z/HAx3Q
         /xlw==
X-Gm-Message-State: AOJu0Yz8ZQtM8hKK3UUrua7axFrTltZvoEdzQcN43yf8/gsVyHnbntSv
	S3TzljHmbDm0p1I68H6vyTM5kRYkhshUSCDowY5LPlwbCRMas9gUxE/xZvmQgP2B
X-Gm-Gg: ASbGnctencnxhExsgSUFYYNQjcptVu+jS/4AwbPgzqOl8ISDGiyKMzBkrLvp3fppaaN
	8W4OF5REHG06AMclRxbO+1LmwfKeoIPZouiuEz+GTrl+5dG8YV4bxfyois53RTSGyAkYYMYXRyw
	Pb3Fhd4rYo7SeVSVvGwgVXWEoebLEINUMJeHeWlSdXo7IXlE1xYR1a1t5z7X7SZscwKs+VsYYvV
	Syt7/i3MJxccZAvPpBuJjCRkbPGC/T+rmI9tBZeGlcQb9lMWVVouUA8j54JDV0V7EiBvzIYsAvR
	ikYnX5IHPyOa18LT+hNoJWUL1JwsJ1pTASOTEmkZVp+sQIN352Ukm5mjFfX0v2sulgJ7CxHRmmB
	cTLv00SK2PnCdubrgBzB36ftJdIv0zQeK
X-Google-Smtp-Source: AGHT+IEMOCef0MMhYDkNb1DPNyrWg/DaRWN9T7lm/IEt7M7WTHjpUIV4PdXXppOb5ug8X0ysUOsynw==
X-Received: by 2002:a17:902:f54e:b0:240:92cc:8fcf with SMTP id d9443c01a7336-245fedcfab5mr22348705ad.49.1755758733290;
        Wed, 20 Aug 2025 23:45:33 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::adc2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed35d778sm45876685ad.49.2025.08.20.23.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 23:45:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 3/9] lttng-tools: Fix build with libcxx runtime
Date: Wed, 20 Aug 2025 23:45:20 -0700
Message-ID: <20250821064528.754633-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821064528.754633-1-raj.khem@gmail.com>
References: <20250821064528.754633-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 06:45:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222210

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../lttng/lttng-tools/libc++.patch            | 48 +++++++++++++++++++
 .../lttng/lttng-tools_2.14.0.bb               |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-kernel/lttng/lttng-tools/libc++.patch

diff --git a/meta/recipes-kernel/lttng/lttng-tools/libc++.patch b/meta/recipes-kernel/lttng/lttng-tools/libc++.patch
new file mode 100644
index 00000000000..be793c76992
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-tools/libc++.patch
@@ -0,0 +1,48 @@
+sessiond: avoid std::vector range-ctor on non-standard iterators (libc++)
+
+libc++ SFINAE-gates std::vector(It, It) behind standard iterator requirements.
+The events_view/channels_ht_view iterators don’t model Input/Forward, so the
+range constructor is not viable and the build fails under clang+libc++.
+Populate the vectors via a simple loop instead, which only relies on !=, ++,
+and dereference. No functional change; fixes clang/libc++ builds while keeping
+libstdc++ behavior unchanged.
+
+Upstream-Status: Submitted [https://review.lttng.org/c/lttng-tools/+/15163]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: lttng-tools-2.14.0/src/bin/lttng-sessiond/ust-registry-channel.cpp
+===================================================================
+--- lttng-tools-2.14.0.orig/src/bin/lttng-sessiond/ust-registry-channel.cpp
++++ lttng-tools-2.14.0/src/bin/lttng-sessiond/ust-registry-channel.cpp
+@@ -529,8 +529,11 @@ void lsu::registry_channel::_accept_on_e
+ 		events_view(*_events->ht);
+ 
+ 	/* Copy the event ptrs from the _events ht to this vector which we'll sort. */
+-	std::vector<const lttng::sessiond::ust::registry_event *> sorted_event_classes(
+-		events_view.begin(), events_view.end());
++  std::vector<const lttng::sessiond::ust::registry_event *> sorted_event_classes;
++  /* Avoid libc++’s range-ctor SFINAE on non-standard iterators. */
++  for (auto it = events_view.begin(); it != events_view.end(); ++it) {
++  	sorted_event_classes.push_back(*it);
++  }
+ 
+ 	std::sort(sorted_event_classes.begin(),
+ 		  sorted_event_classes.end(),
+Index: lttng-tools-2.14.0/src/bin/lttng-sessiond/ust-registry-session.cpp
+===================================================================
+--- lttng-tools-2.14.0.orig/src/bin/lttng-sessiond/ust-registry-session.cpp
++++ lttng-tools-2.14.0/src/bin/lttng-sessiond/ust-registry-session.cpp
+@@ -586,8 +586,11 @@ void lsu::registry_session::_accept_on_s
+ 						  decltype(lsu::registry_channel::_node),
+ 						  &lsu::registry_channel::_node>
+ 		channels_ht_view(*_channels->ht);
+-	std::vector<const lttng::sessiond::ust::registry_channel *> sorted_stream_classes(
+-		channels_ht_view.begin(), channels_ht_view.end());
++  std::vector<const lttng::sessiond::ust::registry_channel *> sorted_stream_classes;
++  /* Avoid libc++’s range-ctor SFINAE on non-standard iterators. */
++  for (auto it = channels_ht_view.begin(); it != channels_ht_view.end(); ++it) {
++  	sorted_stream_classes.push_back(*it);
++  }
+ 
+ 	std::sort(sorted_stream_classes.begin(),
+ 		  sorted_stream_classes.end(),
diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.14.0.bb b/meta/recipes-kernel/lttng/lttng-tools_2.14.0.bb
index 5bb6033b12c..89fcb6b60b1 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.14.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.14.0.bb
@@ -53,6 +53,7 @@ SRC_URI = "https://lttng.org/files/lttng-tools/lttng-tools-${PV}.tar.bz2 \
            file://0001-eventfd.cpp-Remove-the-scope-resolution-operator.patch \
            file://disable-tests2.patch \
            file://0001-liblttng-ctl-drop-index-allocator-symbols-from-versi.patch \
+           file://libc++.patch \
            "
 
 SRC_URI[sha256sum] = "d8c39c26cec13b7bd82551cd52a22efc358b888e36ebcf9c1b60ef1c3a3c2fd3"

