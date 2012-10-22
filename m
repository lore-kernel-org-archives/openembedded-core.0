Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TQFrI-0006Iu-UY
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Oct 2012 13:07:49 +0200
Received: from mail-lb0-f197.google.com ([209.85.217.197])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 22 Oct 2012 03:54:22 -0700
Received: by mail-lb0-f197.google.com with SMTP id b5so1913456lbd.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2012 03:54:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=1Cn/ur/QBrcR2xye948dea9S8G0aeIhKJ1HdSEX9CUU=;
	b=kndHL8iH49UYRwQPwCJ2DdoRwt5TUSEciDmV0vi/iF/Jz383fuDpw30z6DW7XHdayy
	5SfiwfJGBjhjCagygget5LOZVEDvyuzJt+gFwpNm6Nh3fvHniWFw4cnQ6gWwCJLKR/lp
	n29mP00kK89LVUiItzomQyEPHh4Hru1Qo2AMt15nwny99gS409VEmXNYMDWUT9gRtwv4
	XVBdBj+/QMjkI5tKGTjNy3jEnP2XEcZi4sqPIzsPpJD4DDHtN9aA/dmuSbjSQRfryTZg
	417s7xKj1L7V32KPzQuQgitkEEsXDZowGDtxeFEXHAAX+6/IFd50tgJvsE2wwrfnZf9Y
	B80w==
Received: by 10.216.139.137 with SMTP id c9mr5051729wej.54.1350903259941;
	Mon, 22 Oct 2012 03:54:19 -0700 (PDT)
Received: by 10.216.139.137 with SMTP id c9mr5051724wej.54.1350903259760;
	Mon, 22 Oct 2012 03:54:19 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id k20sm50675173wiv.11.2012.10.22.03.54.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 22 Oct 2012 03:54:18 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Oct 2012 11:53:04 +0100
Message-Id: <1350903186-20334-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQkv0crj4lVoP6M7JGF5uEkM2cPEFwx6hcMuj/jE/RsM7e/NQbCqDlYjyBt3jbVpyVPT2xSGvFN7dwE/zQFxJgrN/KnIpaP8920eM95ge9EmrKSSYZS3Zm8vwbLxkLBNiUq5+4cGhDOEf2D3N15fbBnCgT4R4XsiQsaEXhpj9RWqAYczuAyq6iqLhFRSBrg1Eq9Sa1Dq
Subject: [PATCH 1/3] gmae: remove Evolution Data Server
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
X-List-Received-Date: Mon, 22 Oct 2012 11:07:49 -0000

Evolution Data Server is now maintained in meta-oe/meta-gnome and GMAE is dead,
so continue pruning the sdk-gmae package group until we can remove it entirely.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-gnome/packagegroups/packagegroup-sdk-gmae.inc |    3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-gnome/packagegroups/packagegroup-sdk-gmae.inc b/meta/recipes-gnome/packagegroups/packagegroup-sdk-gmae.inc
index a6403fc..58bc05b 100644
--- a/meta/recipes-gnome/packagegroups/packagegroup-sdk-gmae.inc
+++ b/meta/recipes-gnome/packagegroups/packagegroup-sdk-gmae.inc
@@ -7,9 +7,6 @@ SDK-GMAE = " \
     gconf-dev \
     avahi-dev \
     telepathy-glib-dev \
-    evolution-data-server-dev \
-    libecal-dev \
-    libebook-dev \
     libxi-dev \
     libsqlite3-dev \
     gnome-desktop \
-- 
1.7.10



