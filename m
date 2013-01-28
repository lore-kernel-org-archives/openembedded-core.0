Received: from mail-ee0-f42.google.com ([74.125.83.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TzxMZ-0004r0-34
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Jan 2013 23:39:52 +0100
Received: by mail-ee0-f42.google.com with SMTP id b47so1539175eek.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2013 14:24:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=9Uo3/VqEQSY6h3ejLBaSlDsNe2Hpdtt3lcyx+u+UzuY=;
	b=SPs3a+2AC9wr9K6/xSqBV8ex+k8vsV3jwTETWLdRYBSyur8IZH3Sxgoy6W9OheTUEo
	rcYuyXuEsPLDgzaWK4ztkIcSsZv1cbJiBZaF11SPZ/ojCi0h7C+2nByXnLCV6nQ/f/uy
	Me1roDNzW5F6PsFRDOdR9HZXxh3K/T7qdp0UQKP/HDUj0EK+EjKAKm2asYLW6ErtctdV
	5Z+xgZSrPjoLprf53aNyG8+QJhqhy451EpW6jVoDFQ3Z61lw9dWFwH+uCTiW6WdjzJvC
	LmM1BSD0xonQ8SXA96SfHgpxkHUZayNBwwi2T2aMb/t8WXNz0YPHH6B9JWKBEWWWdD+/
	r/dw==
X-Received: by 10.14.184.134 with SMTP id s6mr55740357eem.43.1359411840432;
	Mon, 28 Jan 2013 14:24:00 -0800 (PST)
Received: from localhost.localdomain (p4FDF0BC2.dip.t-dialin.net.
	[79.223.11.194])
	by mx.google.com with ESMTPS id f6sm17785438eeo.7.2013.01.28.14.23.58
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 28 Jan 2013 14:23:59 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Jan 2013 23:23:46 +0100
Message-Id: <1359411826-5264-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1359411826-5264-1-git-send-email-schnitzeltony@googlemail.com>
References: <1359411826-5264-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] systemd: systemd-analyze remove python runtime dependencies
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 28 Jan 2013 22:40:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

systemd-analyze was rewritten in C

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta/recipes-core/systemd/systemd_197.bb |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_197.bb b/meta/recipes-core/systemd/systemd_197.bb
index 280fa51..a956265 100644
--- a/meta/recipes-core/systemd/systemd_197.bb
+++ b/meta/recipes-core/systemd/systemd_197.bb
@@ -113,8 +113,6 @@ USERADD_PACKAGES = "${PN}"
 GROUPADD_PARAM_${PN} = "-r lock"
 
 FILES_${PN}-analyze = "${base_bindir}/systemd-analyze"
-RDEPENDS_${PN}-analyze = "python-dbus python-argparse python-textutils"
-RRECOMMENDS_${PN}-analyze = "python-pycairo"
 
 FILES_${PN}-initramfs = "/init"
 RDEPENDS_${PN}-initramfs = "${PN}"
-- 
1.7.4.4



