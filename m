Return-Path: <jpuhlman@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 23A6161221
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Feb 2020 04:43:04 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id 84so5940975pfy.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2020 20:43:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=7voht2jI5quyeIYuVmTzWvurmOEpx5/C7XidNdDoSqo=;
	b=Qzpe7uo7nSlsOr7zfyO1tRt1VitK3jjK9MwSaXI98U+ikZT8Z6AR6Z6UEcP20zaOpe
	F+NXsQescBGLeDQmq+xU2/YHu3uKd7hYXsPs3jWsFRuGSSkeE45WqQ4AjNqENjrChWDz
	ChS28Jef7J5IoqD/jHbzq7epTSNH/aXc9yUg8osb87M/jNmrj8YXFccY6MLerQlDzsvr
	f+E5FkjeFZhJmHZ+Kl1y019IBRvwje8PfI8YWjV1k2vmnUFHkfF+5lYPKBUpRyyY5Rbm
	xlAmPHtD84ySr5kY5LmyRvlIHoUoKoxQHpweCANvsu7RfrK3uhagxvpG0HEv+V2PcWGf
	/r/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=7voht2jI5quyeIYuVmTzWvurmOEpx5/C7XidNdDoSqo=;
	b=Ndkr5NCOFIq5DX6TEEoWWPXzAmPMOCNK3yqUq7pkZHYzhMUJiRX+bNmF71d2CJQA4G
	6YmupufhpoOeAYwuYOlm56anmjxco7L33aW+FiQ0pu9jRJhZzgZ8f3nkIDKxVBiYMxEx
	fk1JO1t4bUldVJ5H4bdoqu+/1g7mWUFn7EU/4DaLJRskVQsNQKCTAdrlkJH4HkdQ4Z10
	5LyHC4ACw9KlZTv2HWlgHIpGFKFBbc6QYMEOoUcc/lyjsLFm5oCOc/VW73nHdslzYcEa
	WJbEbWNq/PSgLKoyCN5bEsQ9st+j1vMPZ9tyiaFIRaBl4qEq1GPl1jg4NoEB2uMNAgJL
	V2Tg==
X-Gm-Message-State: APjAAAWAdq3tE9Y8z74QCARvEgvUIMNXpvmaY6S02Ey+dAnxnre2tdPl
	vn8HyPKyf2L2DZtlB7qYsug+YEUXWkzr5A==
X-Google-Smtp-Source: APXvYqxvI+m59hvov3O3mf/BBGL9KmZkEIz9yBjOt3uhgR7g50On71CbTon6qd7TzZyS1aa+40g8MQ==
X-Received: by 2002:aa7:83c7:: with SMTP id j7mr6796993pfn.228.1581741785908; 
	Fri, 14 Feb 2020 20:43:05 -0800 (PST)
Received: from workhorse.localdomain
	([2600:1700:4c90:60a0:56be:f7ff:fe12:d0bd])
	by smtp.gmail.com with ESMTPSA id
	v4sm8175919pff.174.2020.02.14.20.43.05
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 14 Feb 2020 20:43:05 -0800 (PST)
Sender: Jeremy Puhlman <jpuhlman@gmail.com>
Received: by workhorse.localdomain (Postfix, from userid 1000)
	id A7B812A04B2; Fri, 14 Feb 2020 20:43:04 -0800 (PST)
From: Jeremy Puhlman <jpuhlman@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Feb 2020 20:42:49 -0800
Message-Id: <20200215044253.5596-2-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20200215044253.5596-1-jpuhlman@mvista.com>
References: <20200215044253.5596-1-jpuhlman@mvista.com>
Subject: [PATCH 2/6] libxslt: multilib_header xsltconfig.h
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
X-List-Received-Date: Sat, 15 Feb 2020 04:43:05 -0000

From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>

xsltconfig.h is generated and can be different between multilibs

Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
---
 meta/recipes-support/libxslt/libxslt_1.1.34.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/libxslt/libxslt_1.1.34.bb b/meta/recipes-support/libxslt/libxslt_1.1.34.bb
index ad37b5a44a..1961bb5b31 100644
--- a/meta/recipes-support/libxslt/libxslt_1.1.34.bb
+++ b/meta/recipes-support/libxslt/libxslt_1.1.34.bb
@@ -20,7 +20,7 @@ S = "${WORKDIR}/libxslt-${PV}"
 
 BINCONFIG = "${bindir}/xslt-config"
 
-inherit autotools pkgconfig binconfig-disabled lib_package
+inherit autotools pkgconfig binconfig-disabled lib_package multilib_header
 
 do_configure_prepend () {
 	# We don't DEPEND on binutils for ansidecl.h so ensure we don't use the header.
@@ -43,6 +43,10 @@ do_install_append_class-native () {
     create_wrapper ${D}/${bindir}/xsltproc XML_CATALOG_FILES=${sysconfdir}/xml/catalog
 }
 
+do_install_append () {
+   oe_multilib_header libxslt/xsltconfig.h
+}
+
 FILES_${PN} += "${libdir}/libxslt-plugins"
 FILES_${PN}-dev += "${libdir}/xsltConf.sh"
 
-- 
2.13.3


