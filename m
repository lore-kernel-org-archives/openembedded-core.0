Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F395FC282EC
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 18:39:05 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web11.2875.1742323136183815190
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Mar 2025 11:38:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JfaC7k7K;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2ff6e91cff5so5671014a91.2
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 11:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742323135; x=1742927935; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EXbSqvhVSsKvj7vj8l9HWrGMl70WPnCT0uvZi2+V6L4=;
        b=JfaC7k7KXPqCn0Y0M3fpPAS3KeQequrYVWNGHPbd9X7W1mIsVqny7PGR5OhtuWvsE0
         +VM5mgomqL/krPIcMyxeZPPwFG3NbNLFikGCi2WacaRGkvwUG8Ie50/A1hV7vJHi8pbs
         N3uq+09ixKA/A2fMBQbHx1a/hJLbQEoiJxk4MpBqV3ndZjZxIsd8TzXyU4Z/cBi6wQN0
         ClhW0Z9HTD+tDWDliGRdCj80UYFvth2hYiJTG0WrfbJe1d4vGzB7kHxxIPvfaAcWJoe2
         TDkicUOApSg3wtfDlFCx1LkqjMuQP+RPAO9gQO95ns1Ct4IkO+bIMLHfyi6SMdRLSaP0
         u85g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742323135; x=1742927935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EXbSqvhVSsKvj7vj8l9HWrGMl70WPnCT0uvZi2+V6L4=;
        b=uv/3iIHi43lKUhWLl0t9Ph2+s1gml0KWnJOeNxa0GprAbH0nBHJdHcxtRm1pCMKD5k
         DcvuKdWUQN4+DnDXMsC/LXt8NL6qon6wJyNuiBig+gwrzcbhs+unwyERbgEe+Jgm2un3
         UGwCf4g9F/MBMqSxLukDNOUO6maV3dzSyelxlo2z3C4LxQ7cYB1GUHrh/kq4tnT+Ykfm
         5lSxE4AWJPsjttRe5iGtTlbcJSNtNQ+eORW2pAJx3nt7Pwzn8CYZ0k0ZPRnaQSulKd6q
         PPw5AInHomQq7J1gO83HBXLQulqNHODsmNcGb0YAR58pLWhuqewANB9IbT5xJcfw/KgP
         X/yg==
X-Gm-Message-State: AOJu0YyjtV1zwHDjdgYxNAr/HP2WeGu04nyIecSjhfhBMp9qw56PDkke
	Jf1EcgaV1KGfQ5UK9n1A0dX6Hz5Cxa2cRO3fIEbrXL0gvA/IJTB3ulnK62HE
X-Gm-Gg: ASbGncufy4GLnDK7Wi4rXniXcJ2l+8jQ9Q1WIAA0bkVmKAgFLZXxf2uXwGMeCxI5fqE
	Zz9ZQYdlshVvYU3I1iVbd8almSBL0+K1vzeqTXdKXkJJGhN5OXSVyuQFp8hv9Vl7nYtyOloTtnb
	9bpXCONN1Q6nE0amfH5n1RJSIPttYQim6tdYMhrLKXy6bBf6qzoyLJHscITj7+qB6h7QLCVBT0w
	s0sCQPApU/grtw2J82UeABkzpPlqNP3joSD0X2wRADe0GBOvxHuZR0gVDUZAbp2JN4SVx3iqK8x
	QWdfoqouzBDyp+IuZgl45vF84CzrOK/jEPAk
X-Google-Smtp-Source: AGHT+IFjWH2e813zIgZ/jcwz/aELAN6hEaiZnMB0Fi6Dy7ycYtN4WVeshB6Z3YGAbu97f5PPEHwYLQ==
X-Received: by 2002:a17:90b:38cd:b0:2ee:bbe0:98c6 with SMTP id 98e67ed59e1d1-301a5b12e82mr4815081a91.8.1742323135381;
        Tue, 18 Mar 2025 11:38:55 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::6874])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30153afee51sm8537489a91.28.2025.03.18.11.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 11:38:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [[PATCH v2 13/25] dbus-glib: Fix build with GCC 15
Date: Tue, 18 Mar 2025 11:38:28 -0700
Message-ID: <20250318183842.2256284-13-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250318183842.2256284-1-raj.khem@gmail.com>
References: <20250318183842.2256284-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 18:39:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213239

GCC 15 defaults to C23, it can not handle it
latest release is from 2021, and this seems to be
deprecated upstream and no longer actively
developed.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/dbus/dbus-glib_0.112.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/dbus/dbus-glib_0.112.bb b/meta/recipes-core/dbus/dbus-glib_0.112.bb
index 4753997d3d2..33675f50fd8 100644
--- a/meta/recipes-core/dbus/dbus-glib_0.112.bb
+++ b/meta/recipes-core/dbus/dbus-glib_0.112.bb
@@ -26,6 +26,8 @@ PACKAGECONFIG[tests] = "--enable-tests,,,"
 
 EXTRA_OECONF:class-target = "--with-dbus-binding-tool=${STAGING_BINDIR_NATIVE}/dbus-binding-tool"
 
+CFLAGS += "-std=gnu17"
+
 PACKAGES += "${PN}-tests"
 
 FILES:${PN} = "${libdir}/lib*${SOLIBS}"

