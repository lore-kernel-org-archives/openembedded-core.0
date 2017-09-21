Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-wr0-f174.google.com (mail-wr0-f174.google.com
	[209.85.128.174])
	by mail.openembedded.org (Postfix) with ESMTP id DCD5378191
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Sep 2017 09:21:59 +0000 (UTC)
Received: by mail-wr0-f174.google.com with SMTP id 108so4065346wra.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Sep 2017 02:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=jpSXUD1+SXGKIqb4Pane5N5iGtTnGb2gssKernnPdYk=;
	b=Xt7jsXKG4Q/3hOZw/r8++KbYgnKF5f7vfSoEd7Ez0zLiEVE3LswIgeyoH3XIX8SeWl
	l+FwjoC9nO5Y26HA92wnLUCq7oqmdqHchgc1Vk0oZK7fDt8Etc/Ko+F+fsZebu3L6geg
	6NToh/9nSXLD8MV3x7W4Ep8py2CWFUmt549eA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=jpSXUD1+SXGKIqb4Pane5N5iGtTnGb2gssKernnPdYk=;
	b=XQcyNs4caavPAQDVjNwTLVWvw0X0GRUQHPCAuh0rLBUx/R2xu0SZKaRRagJHHlDIAw
	tZOUjyD0jS4OPWBaAXIhWd4YB2r8dfoIsPKdsLgUEdfHS/1PVEfyDzFu8qeLT6jl0Yej
	VHcgLNdRmiYUhgS80s9EWqnVvpYrgZWGkKU84WedGXLYjrd5yJQWG9SrAezSl7bECfo6
	4uG+VMhalYXTGkM1o2kcSch3HJ7okQ4Rlnu54HqRaeYPXYvjr2m6i6cRQm+dHA/qYN6m
	8LMuZ+VDIWGvheqOX+VX67qeq6PbRVzW1dQuhcUoAIDP+pjSSCimnNl7cXUCLY84g99B
	60xQ==
X-Gm-Message-State: AHPjjUgaCBWMOjZgabumZzYSgWzAWj0vhKjHcwILa5ut9D4+6e04KSjv
	pIGAxVK1HX3WnCgaYzbgo/SQUTYJWDE=
X-Google-Smtp-Source: AOwi7QAbIJlESsBf54xUAnitWi7hZL8Xqe2Xa0pGgqSFf/1+UXKxU8K/Ra5L9OLfgPcUd2rKwKT5dQ==
X-Received: by 10.223.135.66 with SMTP id 2mr1264954wrz.208.1505985720619;
	Thu, 21 Sep 2017 02:22:00 -0700 (PDT)
Received: from localhost.localdomain (static.8.26.4.46.clients.your-server.de.
	[46.4.26.8]) by smtp.gmail.com with ESMTPSA id
	g132sm1103466wmd.5.2017.09.21.02.21.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 21 Sep 2017 02:21:59 -0700 (PDT)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Sep 2017 11:21:31 +0200
Message-Id: <20170921092131.25537-11-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170921092131.25537-1-nicolas.dechesne@linaro.org>
References: <20170921092131.25537-1-nicolas.dechesne@linaro.org>
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH 10/10] gstreamer1.0-python: upgrade to version 1.12.3
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
X-List-Received-Date: Thu, 21 Sep 2017 09:22:00 -0000

* Bugfixes only release.
* Removed SRC_URI from .inc file since it was duplicated in .bb file as well.

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-python.inc             | 2 --
 .../{gstreamer1.0-python_1.12.2.bb => gstreamer1.0-python_1.12.3.bb}  | 4 ++--
 2 files changed, 2 insertions(+), 4 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.12.2.bb => gstreamer1.0-python_1.12.3.bb} (57%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python.inc
index 961b93017e..361f0bca41 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python.inc
@@ -8,8 +8,6 @@ RDEPENDS_${PN} += "gstreamer1.0 python3-pygobject"
 
 PNREAL = "gst-python"
 
-SRC_URI = "http://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
-
 S = "${WORKDIR}/${PNREAL}-${PV}"
 
 inherit autotools pkgconfig distutils3-base upstream-version-is-even gobject-introspection
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.12.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.12.3.bb
similarity index 57%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.12.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.12.3.bb
index b2dc05bbec..3978b9d563 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.12.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.12.3.bb
@@ -1,7 +1,7 @@
 require gstreamer1.0-python.inc
 
 SRC_URI = "http://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
-SRC_URI[md5sum] = "da5c9fa42290bc3006661c869e076ffe"
-SRC_URI[sha256sum] = "f4cc32ad46a653e1ae2f27ac2a16078b00075c9106b2784a1a8d1f31c5069e47"
+SRC_URI[md5sum] = "622125816c52a51205660d210f8e7b8b"
+SRC_URI[sha256sum] = "c3f529dec1294633132690806703b80bad5752eff482eaf81f209c2aba012ba7"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
-- 
2.11.0


