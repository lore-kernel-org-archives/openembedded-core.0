Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 646307D249
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Apr 2019 15:59:24 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id t17so3553780wrw.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Apr 2019 08:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=HXbCvOFhfci96Y86zZN1gj9ELcKqgG4hBM9vkjTqDYc=;
	b=daPraG3iO945ttcP5Lq6DRbtOvqqcxOXt3wI5FiTCAUiMFP9mxLKF8LSX8BMBYqq57
	PxYqdBQmZ6J4VH7Ir6WvfjPBCn3walfV6rJk1+CFOml289uoP6gCXDiy1ciNsA1cPdTS
	HzsB5uh4r0AryKwJpuqLQTd60R5500PNlPA0CUGpMuonolo0JgY/FMBevWlPXaTFufiF
	jmHii84qzHIq8TS/ZUjrEu6X7eGClX8TqcPEHVaW8lvRgKCxv7KxvwXgP9EAraXXqm7o
	Wej4XHFQdX50cxvy22UkyMn3OBnoMaJUgG5gdcehdn0R4HG0GP716WAXBnxWZ7/sEe5A
	W+Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=HXbCvOFhfci96Y86zZN1gj9ELcKqgG4hBM9vkjTqDYc=;
	b=pexTvL6P0Pk6rjKEOOmkhOstuY6ByaPYl4ndLt9ZE9mZ/in8QEYFO0ku6fimSh1nQl
	AvJpjgmZcnmrnwctfEnThJntn5QtGM8GEkjj2C9AMqh6tasyaWAi9QUUIOuukfODS+bE
	qVIzGAou+VteFdNySAd5TNu6UYVONtVB5Hjw2JiGMJnDHwPKjV0wjmgoGj4lm+KdO6+K
	YwmgegySquchKMpZ5xqji+NJMqmrDAI5Qp1F4rs82a13QJSIrjFAdaRbpMz8L2LtoBwt
	JO0byl9WSUke7NCLpDVs0BzxaTiodyHpGdCCWqybxEV2aqNCO8MtEk2hlI7kEOqecYfP
	f+mw==
X-Gm-Message-State: APjAAAWIwSeoGG0IRrv80MWYvIDDXOqo62tcSuABltzKqaWkNYUGX4gY
	Vhj8T+dp5gJe/YVq3w4uFEZlC2Xmduk=
X-Google-Smtp-Source: APXvYqwLZ6iwhFd3zZEq+UCTqBJd6dIjFRVh2hAWcwVFgqK1TmR5jtsOSd1exlzUaENWJX8yE6SsMQ==
X-Received: by 2002:adf:f30b:: with SMTP id i11mr11029019wro.297.1555603164873;
	Thu, 18 Apr 2019 08:59:24 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	r196sm1761006wmf.22.2019.04.18.08.59.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 18 Apr 2019 08:59:24 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Apr 2019 17:59:15 +0200
Message-Id: <20190418155918.40653-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190418155918.40653-1-alex.kanavin@gmail.com>
References: <20190418155918.40653-1-alex.kanavin@gmail.com>
Subject: [PATCH 2/5] epiphany: update to 3.32.1.2
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
X-List-Received-Date: Thu, 18 Apr 2019 15:59:24 -0000

Drop an option no longer provided by upstream.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../epiphany/{epiphany_3.30.3.bb => epiphany_3.32.1.2.bb}   | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
 rename meta/recipes-gnome/epiphany/{epiphany_3.30.3.bb => epiphany_3.32.1.2.bb} (80%)

diff --git a/meta/recipes-gnome/epiphany/epiphany_3.30.3.bb b/meta/recipes-gnome/epiphany/epiphany_3.32.1.2.bb
similarity index 80%
rename from meta/recipes-gnome/epiphany/epiphany_3.30.3.bb
rename to meta/recipes-gnome/epiphany/epiphany_3.32.1.2.bb
index a64c82f48bf..ba2e851bb6f 100644
--- a/meta/recipes-gnome/epiphany/epiphany_3.30.3.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_3.32.1.2.bb
@@ -13,10 +13,8 @@ REQUIRED_DISTRO_FEATURES = "x11 opengl"
 SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOMEBN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=archive \
            file://0002-help-meson.build-disable-the-use-of-yelp.patch \
            "
-SRC_URI[archive.md5sum] = "fd05702b1c9bcb6a0633de54c4a6ccd2"
-SRC_URI[archive.sha256sum] = "76cdb8db6af2da8c3371a73e2dfd5ba64867b5f1e65fa9621f35348a42ff0d17"
-
-EXTRA_OEMESON += " -Ddistributor_name=${DISTRO}"
+SRC_URI[archive.md5sum] = "93faec353e9f62519859e6164350fd5d"
+SRC_URI[archive.sha256sum] = "a8284fb9bbc8b7914a154a8eac1598c8b59ae421e0d685146fb48198427926be"
 
 FILES_${PN} += "${datadir}/dbus-1 ${datadir}/gnome-shell/search-providers ${datadir}/metainfo"
 RDEPENDS_${PN} = "iso-codes adwaita-icon-theme gsettings-desktop-schemas"
-- 
2.17.1


