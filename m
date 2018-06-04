Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id DA49D600E3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jun 2018 16:27:01 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id l1-v6so15145304wmb.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Jun 2018 09:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=iqwjLz4g39qjg3HR49C3WHSOHerO1euw20reBN/AgP0=;
	b=flsl8FgRnzSAu3Ee+9ABcwaxHi8fcNg9isItxlWKd8vw0zfoPL+BlX4axrpVFpixRh
	IOTARZG9r41qH9V+XcOXWxxOEErDbedZQG6AIAi5yKIalXRudsqS13hlFFMb+qHrXV5o
	yBsGgD01MAGVQUg8QOFASfLIiGjpMGGPNT8EH6YkYIq5D0Jl0Y8Zef4fhohAVej9VqEa
	ni23h9PQn9Nbbyeg8xP5xLbAYL8ZqBX7KjIxhHICe14j/QxlKhQ17WhDupVp3tSg7kf1
	hSY7wvZl4lBNM04c2FAZAonPuTDwZnwCQGnh9GcOopDq5b1voRm29AMo7DCVFUqdngyE
	NoVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=iqwjLz4g39qjg3HR49C3WHSOHerO1euw20reBN/AgP0=;
	b=LuQIWNFvpKNNxDaQClNUk+Dm6hkFHLUDaRD9WAZ2fusVC230STjWxjqvCMa5p9wOJb
	gmK2MtCwiCx/BziQ31mrpAFbgjPmsZhkQ7DMOO5o5JIM+edVDh8uTXpMwD7gwNmvtLDX
	qV6Qxr8kkHWvcDAt0W2pEyOE52j1XNtJ3sCvVfbnyu947+bAiXekc3JlBi+urmtGwS6g
	e3TAj2gO5Y6pCLcPZrgBGwKXAN1THAzPHICU2tz6zSXNB3xS1MyA1HZnS0IJlrugpd3e
	krccz7U0n5/AQ3Y4BlF+OM+8pVnx43LJdRQbpoUxFgPTmCkxTuqQ30qTkS8gWAUGyXxN
	Oo5A==
X-Gm-Message-State: ALKqPwddfvzn4b3qdkSdlxKRmQooDjOnPrP616KQDbIOcMsT4xqo71VJ
	AF3257Y/lPRU8ih/QcQ1QSEy20Vf
X-Google-Smtp-Source: ADUXVKISmMyNA3FP/wAlshnNiuqb+5c9423VyshjKbndvTe9pQbSzjD+U7NZu8x4WYVEFd/wUfpZuA==
X-Received: by 2002:a50:cfca:: with SMTP id
	i10-v6mr25303102edk.35.1528129622175; 
	Mon, 04 Jun 2018 09:27:02 -0700 (PDT)
Received: from localhost.localdomain ([2a04:ae08:1403:ff00:489:7961:466d:7cf7])
	by smtp.gmail.com with ESMTPSA id
	b1-v6sm5960971edq.82.2018.06.04.09.27.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Jun 2018 09:27:01 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
X-Google-Original-From: Oleksandr Kravchuk <dev@sashko.rv.ua>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Jun 2018 18:26:54 +0200
Message-Id: <20180604162654.472-1-dev@sashko.rv.ua>
X-Mailer: git-send-email 2.17.0
Cc: Oleksandr Kravchuk <dev@sashko.rv.ua>
Subject: [meta-oe][PATCH v2] minicom: fix SRC_URI
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
X-List-Received-Date: Mon, 04 Jun 2018 16:27:02 -0000

The original source, alioth.debian.org has been permanently taken down
by the Debian Project. Use Debian mirrors instead.

Source: https://wiki.debian.org/Alioth

Signed-off-by: Oleksandr Kravchuk <dev@sashko.rv.ua>
---
 meta/recipes-extended/minicom/minicom_2.7.1.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/minicom/minicom_2.7.1.bb b/meta/recipes-extended/minicom/minicom_2.7.1.bb
index e6afe2b655..4fdaed05b2 100644
--- a/meta/recipes-extended/minicom/minicom_2.7.1.bb
+++ b/meta/recipes-extended/minicom/minicom_2.7.1.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Text-based modem control and terminal emulation program"
-HOMEPAGE = "http://alioth.debian.org/projects/minicom/"
+HOMEPAGE = "https://salsa.debian.org/minicom-team/minicom/"
 DESCRIPTION = "Minicom is a text-based modem control and terminal emulation program for Unix-like operating systems"
 SECTION = "console/network"
 DEPENDS = "ncurses virtual/libiconv"
@@ -7,7 +7,7 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=420477abc567404debca0a2a1cb6b645 \
                     file://src/minicom.h;beginline=1;endline=12;md5=a58838cb709f0db517f4e42730c49e81"
 
-SRC_URI = "https://alioth.debian.org/frs/download.php/latestfile/3/${BP}.tar.gz \
+SRC_URI = "${DEBIAN_MIRROR}/main/m/http://http.debian.net/main/m/minicom/minicom_${PV}.orig.tar.gz \
            file://allow.to.disable.lockdev.patch \
            file://0001-fix-minicom-h-v-return-value-is-not-0.patch \
            file://0001-Fix-build-issus-surfaced-due-to-musl.patch \
@@ -16,7 +16,7 @@ SRC_URI = "https://alioth.debian.org/frs/download.php/latestfile/3/${BP}.tar.gz
 SRC_URI[md5sum] = "9021cb8c5445f6e6e74b2acc39962d62"
 SRC_URI[sha256sum] = "532f836b7a677eb0cb1dca8d70302b73729c3d30df26d58368d712e5cca041f1"
 
-UPSTREAM_CHECK_URI = "https://alioth.debian.org/frs/?group_id=30018"
+UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/m/minicom/"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[lockdev] = "--enable-lockdev,--disable-lockdev,lockdev"
-- 
2.17.0


