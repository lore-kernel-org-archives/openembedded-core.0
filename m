Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 41E54752A7
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jun 2018 16:32:03 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id z6-v6so14362561wma.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Jun 2018 09:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=sCfJlZ+STCjPstZRcNeuTquLdGt183ijXp8J6tTthtQ=;
	b=A3D7+cLgtd3To1HcV9SBzI9OkgunDyfSGnuPIiAjls3DgLH3plhuUfqXLpGj3pPgYX
	gGYjXVNuaRNm4tw4XJ0TCqyFAlDTKKspzKp8OSkNMcXuVmJJhCWU0CSZmFxeWAtI9zl0
	YSgJV0HXc4+j9ZF1BxFk4OsX/wC8Sb6xiZruJfOQVur1RfXKx4THNYDNwAvxditLzqb5
	fPiDzG4/Rvyw/unv1RAIMOm/JCdpfCK9yRWab+ygSlY8Deq0p8vE0uddutVVz6Rsw+bL
	TLF92XXAJGEzshWatw7Lz7CJp1THwQc5vHaHul4bZ2/TOpQqHd2FYDe7PXtr+d9z9mKj
	MEXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=sCfJlZ+STCjPstZRcNeuTquLdGt183ijXp8J6tTthtQ=;
	b=MjFs9zYMKAUPgUwt/FMK1qOYKmh2qCMdW8Aj3+wC6oQ5/hNeTNqU9pndHX8Lme6oBa
	HwoLq5eS8JI0qKCIN1rfqYfx4LIbRlUNlkzhY+4hYbvAhY+FCSHsjc9ByFcddj6yUvEV
	SZahWA5rOQqtHrRNH1Kwn/vsma4gtNs0rLxNlap92feNFbiXeAbIfyk49CvC4FR9cWtd
	W3OOGeG1nn5QInJVa2fcktaCdRbSd1y6E8ty8liaD2lqmp54XSvJ3aoElNwSy8Skclj2
	MZdHjv4J68tlgxFCLMJoZ7JOmkYAxqgSSLogO/8utpFaJ7kHK0caKJb5Zukg06k21T6x
	fjxw==
X-Gm-Message-State: ALKqPwfAf0Douu1RPWNh8PmmhsCdY1Cg1nbxsN6ZqoO6EU1zNSgdBtJq
	QneI80qW9xlq9t1GiqlaJvXQedYI
X-Google-Smtp-Source: ADUXVKKkSPNduBRDRlRg18KTF4XNpGnZ+cmOx4xU/kZBB+hlolAdJHjeQKjbKsnAQMqa/awH/0z9fg==
X-Received: by 2002:a50:8987:: with SMTP id
	g7-v6mr24639790edg.25.1528129923674; 
	Mon, 04 Jun 2018 09:32:03 -0700 (PDT)
Received: from localhost.localdomain ([2a04:ae08:1403:ff00:489:7961:466d:7cf7])
	by smtp.gmail.com with ESMTPSA id
	l37-v6sm1899678edc.49.2018.06.04.09.32.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Jun 2018 09:32:03 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
X-Google-Original-From: Oleksandr Kravchuk <dev@sashko.rv.ua>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Jun 2018 18:31:57 +0200
Message-Id: <20180604163157.4032-1-dev@sashko.rv.ua>
X-Mailer: git-send-email 2.17.0
Cc: Oleksandr Kravchuk <dev@sashko.rv.ua>
Subject: [meta-oe][PATCH v2] chrpath: fix SRC_URI
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
X-List-Received-Date: Mon, 04 Jun 2018 16:32:03 -0000

The original source, alioth.debian.org has been permanently taken down
by the Debian Project. Use Debian mirrors instead.

Source: https://wiki.debian.org/Alioth

Signed-off-by: Oleksandr Kravchuk <dev@sashko.rv.ua>
---
 meta/recipes-devtools/chrpath/chrpath_0.16.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/chrpath/chrpath_0.16.bb b/meta/recipes-devtools/chrpath/chrpath_0.16.bb
index b61eef9c8b..a8f9bae46a 100644
--- a/meta/recipes-devtools/chrpath/chrpath_0.16.bb
+++ b/meta/recipes-devtools/chrpath/chrpath_0.16.bb
@@ -2,18 +2,17 @@ SUMMARY = "Tool to edit rpath in ELF binaries"
 DESCRIPTION = "chrpath allows you to change the rpath (where the \
 application looks for libraries) in an application. It does not \
 (yet) allow you to add an rpath if there isn't one already."
-HOMEPAGE = "http://alioth.debian.org/projects/chrpath/"
 BUGTRACKER = "http://alioth.debian.org/tracker/?atid=412807&group_id=31052"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
-SRC_URI = "https://alioth.debian.org/frs/download.php/file/3979/chrpath-0.16.tar.gz \
+SRC_URI = "http://${DEBIAN_MIRROR}/main/c/chrpath/chrpath_${PV}.orig.tar.gz \
            file://standarddoc.patch"
 
 SRC_URI[md5sum] = "2bf8d1d1ee345fc8a7915576f5649982"
 SRC_URI[sha256sum] = "bb0d4c54bac2990e1bdf8132f2c9477ae752859d523e141e72b3b11a12c26e7b"
 
-UPSTREAM_CHECK_URI = "http://alioth.debian.org/frs/?group_id=31052"
+UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/c/chrpath/"
 
 inherit autotools
 
-- 
2.17.0


