Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by mail.openembedded.org (Postfix) with ESMTP id 5D64A7E7D4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2019 15:59:34 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id x25so2934977ljh.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2019 08:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=O2md4ukXHeuJfGchnIi0iFAgA1uFCJ9Td1bHM1oLPK8=;
	b=vOLH6HLuqP3TMylL9/Rd0lGImgNDX+U7D8v2DHBB6y+SRcA3uc8D7v+FSVecF1nElo
	gkOTMfk55upD52zpcCvrDQ+Ip8NH1VhnyFJUSn3GPwGkuy/dgwBd65sA/fOqcsvT6YCP
	nagh++kT6gZdKklqwQSQKQSSzcCkOmaAAAwvb6SKOEr0kw5OygfeYI5aznFL4Lb0Wp6+
	wi7Ix1OfHYDnv4m/47u9sMwPj3Ub/Xyf1syNS11dQ1zsVV1gCsjDU1S6n1Tfs+neigF4
	byjtuL//n87MBr4TpIalnm0GmI4c0BiMxpv+5Dd4tiiGcHKLMf9OPkNrtCeF+c0Dc7B/
	x4bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=O2md4ukXHeuJfGchnIi0iFAgA1uFCJ9Td1bHM1oLPK8=;
	b=GgRxq7MI19a/TNmK7wZb+l9nabXpg27Y74g9JELU+QfprdvZiQUnmMiFfAUhYNUo/g
	LBuf9L05vL5VKstgw7jFflHgrYJbyGH2EYai2atp5DcojzA+zy8Ev5/NDpHQ5RTVlJBl
	YTTH9ZnZsL46tM9YVXE8AJUc6qc/v816DHQB3ALiEta8dF3NM5YO3jGBMMkiLRhY5Ybh
	8e9h/QboYG5FeRbqoI94TnhdGOCAkYOyYhQaOCfHHwO5lLT2Kq3KB5TAsBw7VJJpTFSF
	XoeQCDDMy/ZFGpYlpNYFSJc0M8zWqU/KOuAN2QCDSlZ3t1IIaPnmL0o6hK7ab7OZg+p9
	bWkw==
X-Gm-Message-State: APjAAAWjjaxsQnjMpoCgdyPYUITnLKB6j5NTAYR1j0M7qp1mZWRhA2DY
	MIcv5fKAg6T9RJFdc0pyFnSSWi0UXnU=
X-Google-Smtp-Source: APXvYqzdt6o4QPq0us2ZrwiJjmH5VGmJKMUdK8xTji3FgN5tWLZNcbDvzMPXLoLFOphigfCROxp9TQ==
X-Received: by 2002:a2e:5b94:: with SMTP id m20mr3077311lje.7.1561651174603;
	Thu, 27 Jun 2019 08:59:34 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id 199sm563150ljf.44.2019.06.27.08.59.33
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 27 Jun 2019 08:59:34 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Jun 2019 17:59:32 +0200
Message-Id: <20190627155932.2326-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] python3-pygobject: update to 3.32.2
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
X-List-Received-Date: Thu, 27 Jun 2019 15:59:34 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...hon3-pygobject_3.32.1.bb => python3-pygobject_3.32.2.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/python/{python3-pygobject_3.32.1.bb => python3-pygobject_3.32.2.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-pygobject_3.32.1.bb b/meta/recipes-devtools/python/python3-pygobject_3.32.2.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-pygobject_3.32.1.bb
rename to meta/recipes-devtools/python/python3-pygobject_3.32.2.bb
index 8eda06e9e1..05688be603 100644
--- a/meta/recipes-devtools/python/python3-pygobject_3.32.1.bb
+++ b/meta/recipes-devtools/python/python3-pygobject_3.32.2.bb
@@ -9,16 +9,16 @@ inherit gnomebase distutils3-base gobject-introspection upstream-version-is-even
 DEPENDS += "python3 glib-2.0"
 
 SRCNAME="pygobject"
+
 SRC_URI = " \
     http://ftp.gnome.org/pub/GNOME/sources/${SRCNAME}/${@gnome_verdir("${PV}")}/${SRCNAME}-${PV}.tar.xz \
     file://0001-Do-not-build-tests.patch \
 "
+SRC_URI[md5sum] = "92ffa25351782feb96362f0dace2089f"
+SRC_URI[sha256sum] = "c39ca2a28364b57fa00549c6e836346031e6b886c3ceabfd8ab4b4fed0a83611"
 
 UNKNOWN_CONFIGURE_WHITELIST = "introspection"
 
-SRC_URI[md5sum] = "9d5dbca10162dd9b0d03fed0c6cf865d"
-SRC_URI[sha256sum] = "32c99def94b8dea5ce9e4bc99576ef87591ea779b4db77cfdca7af81b76d04d8"
-
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
 PACKAGECONFIG ??= "${@bb.utils.contains_any('DISTRO_FEATURES', [ 'directfb', 'wayland', 'x11' ], 'cairo', '', d)}"
-- 
2.17.1


