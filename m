Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
	[209.85.221.48])
	by mail.openembedded.org (Postfix) with ESMTP id 3DC757F8BD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2019 10:54:14 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id v9so5709450wrq.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2019 03:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=YYWF3w7Ua7JmGsXmBYPBbimPE7arkTZTYOkKbF+TnaE=;
	b=JrqEQHdIPKKHLRChc8WV1qKpzVvN28jsfxXTVNF/emqYzfXiARVl0eSAo7NWB3Fqvx
	IKLEXHhg2xwK292vK/JqWInrD94afPmNQhPL7049SLMSaz8S6ZN1eiAGhbOvCMzldRZJ
	vPBHU14SV/kdyRriv4KY6Q3mfA91C2nfKLq4sD5Z7pDli9sDbdAHaj3OuIeBsSfzQOR8
	z3aRfqIytfiValnukxKPo77Uwgpq3HCWLmRVMqALD+SLErP67sktWSb2wGx2ICgYtGTf
	Jwsjned55Qp+mELm9PbIDV6hEBsEKG/YPiRSDxZxxmDsPJB5wuFRMVJjoBCkhwAytb3j
	H2Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=YYWF3w7Ua7JmGsXmBYPBbimPE7arkTZTYOkKbF+TnaE=;
	b=e2e1ZuS0IwcpqUuTVizBB2EaKawVroM1Z7y0ZBMcAphWhCchUvh+RVbRJYcwSgU783
	aWVcWi6VyFGTkHY72YhTd2pxg7ekPTsRe/Gy/ncKnx43M+1Uj/ogP/hJ34gJzfDAytCd
	NuYUEpyr15KGWQmmbXrCzhAE/GdxnDfpA0CJSpERghb6q9Z+u4OmGMzZgueMSmeZAXLX
	OGTus7rcoh42Ti/U3/fTT9rRIYEL1c+jMU15wkBGGyl804ca/RIG4RiG1GCISdYP0l4S
	Bdy9MJXE5uDdcUa6gt+/P2tKZI8uuUmSjrt0mxyLw0NJvMZrK7r/+Ne6KvVy/rrAYZ8f
	x6fw==
X-Gm-Message-State: APjAAAUED94NFSxMUoRyb+HECzgX+0lWCbV9tm6PlY1U3b7lOlqpKNcm
	8f1/ya/cUc6fz78s5FS/C1EFlY66TQs=
X-Google-Smtp-Source: APXvYqxh+K1yvNNL+wifQvc6FVK3Mk9EpeBxszESnNRFW0t64sVlmKGEMCXl9dGrG7+XlSo4zgkT9w==
X-Received: by 2002:a05:6000:343:: with SMTP id
	e3mr5148220wre.20.1572519253761; 
	Thu, 31 Oct 2019 03:54:13 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id f8sm3236557wmb.37.2019.10.31.03.54.11
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 31 Oct 2019 03:54:12 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 Oct 2019 10:54:09 +0000
Message-Id: <20191031105409.7445-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] gcr: remove intltool-native
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
X-List-Received-Date: Thu, 31 Oct 2019 10:54:14 -0000
Content-Transfer-Encoding: 8bit

gcr uses gettext now, so no need to depend on intltool-native.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-gnome/gcr/gcr_3.34.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gcr/gcr_3.34.0.bb b/meta/recipes-gnome/gcr/gcr_3.34.0.bb
index f13bfecbe19..616b0e5bf5d 100644
--- a/meta/recipes-gnome/gcr/gcr_3.34.0.bb
+++ b/meta/recipes-gnome/gcr/gcr_3.34.0.bb
@@ -8,7 +8,7 @@ BUGTRACKER = "https://gitlab.gnome.org/GNOME/gcr/issues"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605"
 
-DEPENDS = "intltool-native gtk+3 p11-kit glib-2.0 libgcrypt \
+DEPENDS = "gtk+3 p11-kit glib-2.0 libgcrypt \
            ${@bb.utils.contains('GI_DATA_ENABLED', 'True', 'libxslt-native', '', d)}"
 
 inherit gnomebase gtk-icon-cache gtk-doc distro_features_check upstream-version-is-even vala gobject-introspection gettext
-- 
2.20.1


