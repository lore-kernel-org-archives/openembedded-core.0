Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
 by mx.groups.io with SMTP id smtpd.web08.4758.1614900951207702743
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Mar 2021 15:35:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gherzan.com header.s=fm1 header.b=gfMwYhV/;
 spf=pass (domain: gherzan.com, ip: 66.111.4.27, mailfrom: andrei@gherzan.com)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 4FB465C00AF;
	Thu,  4 Mar 2021 18:35:50 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Thu, 04 Mar 2021 18:35:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=fm1; bh=bi9Mv0lSZap7qfU4HVZsBGAtsD
	9tkUPqIN033CcoykE=; b=gfMwYhV/NKL4rOK5qkSdHFZaoI2g70LnYcN9f0fRCe
	WYdokAZ+xhSEFcInuRhKmGPqVfGXNL1ST0WThLWR3QhE342QMvkVIgMnaRX2ilaI
	RZQrSgZ7gdV5fVMMaPD+sDLCgambZZZKaokWaapgGJAsvK0srFXeZSkDNB6BBOL8
	CgzzOQoePOeM75iui0GQMAM1Vs52W7/oeicm8Kd1jCnZqtBtSD0U4nr27b+epkFZ
	jO9YxnPD1mg0a9rrLKKmuoC0aTK2TFGxA3chKC4Ziuv0Y5AuiUZOdWdqyb8Yjej9
	IczsSPn2RhK/KAd/9W32k6ThvJ5qIZjqsL0fuU6QPKZA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=bi9Mv0lSZap7qfU4H
	VZsBGAtsD9tkUPqIN033CcoykE=; b=vvrK4rOggUvxUMD9wItRdnXtZlocIeTrk
	OLOopCVOQBbvRESKAT4lgtsN9UQbB1q1lR4VW2g0pwRCRAcpwpWG3tvhPz2ue+Mn
	9UzA8T9ss3dfND8jH+XGJrAmIBlHVzAT5Ii/nJs3wCk0kqTxdSKYivdORsB5tsq+
	9widJrVDvOWjbepZyy7f7JyUB8CZvcP9C1KnhH35geL5tU2Go5szSo4t2+NtADfw
	SPEiWoqb2BDFUCiyQdQTS+nN0ivzMVid7wEpMRT591cTCwBS/v1Otfu65JQ+l+fq
	HJd3lmWx0uLV86xmaWD+QkRol7+CONcY8GdpMQdwtbMGQNAahn0Og==
X-ME-Sender: <xms:1W5BYEu_plBeFoLXY7kbK4R4f9vhOaik_SNAKKpuBV4gF8j4cwNX-A>
    <xme:1W5BYK4KQjcvzVI6R_RVlJXl2OrB3bRBOMOkFVpMApN1_ahwgoepMlWxYSX7AakZc
    I4T9hKMX7nfRT4VrMU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddthedgudduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
    dttdenucfhrhhomheptehnughrvghiucfihhgvrhiirghnuceorghnughrvghisehghhgv
    rhiirghnrdgtohhmqeenucggtffrrghtthgvrhhnpeejhfdtffehkeetieefjefhgeeuud
    ehueekhedvgfdujedvtdfgudeltdelheekgfenucffohhmrghinhepghhnohhmvgdrohhr
    ghenucfkphepuddtledrudegiedrfeejrddukedvnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomheprghnughrvghisehghhgvrhiirghnrdgtohhm
X-ME-Proxy: <xmx:1W5BYPUttec7-I3zbG1QmLZ9LUKx_Rz0OWbiwNeF5OdQwWrHxd6TTA>
    <xmx:1W5BYM_CNcvyfZ7VLfjDpRpT8I9BKKgehc4u_jmthfhUQiD4Xznc3Q>
    <xmx:1W5BYLnS6gYgFKYEGXhS4g_TouRrd6aPzfpoNgtY_05uDy6hf4-Vxw>
    <xmx:1m5BYMBf6CKh7NM14OqZpyzJIGGi_w_N7tJTXg2LY6nZfgRfZ_PTsQ>
Received: from qwirkle.internal (host109-146-37-182.range109-146.btcentralplus.com [109.146.37.182])
	by mail.messagingengine.com (Postfix) with ESMTPA id 50DDE1080059;
	Thu,  4 Mar 2021 18:35:49 -0500 (EST)
From: "Andrei Gherzan" <andrei@gherzan.com>
To: openembedded-core@lists.openembedded.org
Cc: andrei@gherzan.com,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: [PATCH 1/2] gcr: Add support for building without x11
Date: Thu,  4 Mar 2021 23:35:25 +0000
Message-Id: <20210304233526.3373832-1-andrei@gherzan.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Andrei Gherzan <andrei.gherzan@huawei.com>

Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
---
 meta/recipes-gnome/gcr/gcr_3.38.1.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-gnome/gcr/gcr_3.38.1.bb b/meta/recipes-gnome/gcr/gcr_3.38.1.bb
index fe80439b00..292f5b5655 100644
--- a/meta/recipes-gnome/gcr/gcr_3.38.1.bb
+++ b/meta/recipes-gnome/gcr/gcr_3.38.1.bb
@@ -8,7 +8,7 @@ BUGTRACKER = "https://gitlab.gnome.org/GNOME/gcr/issues"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605"
 
-DEPENDS = "gtk+3 p11-kit glib-2.0 libgcrypt gnupg-native \
+DEPENDS = "p11-kit glib-2.0 libgcrypt gnupg-native \
            ${@bb.utils.contains('GI_DATA_ENABLED', 'True', 'libxslt-native', '', d)}"
 
 CACHED_CONFIGUREVARS += "ac_cv_path_GPG='gpg2'"
@@ -16,11 +16,12 @@ CACHED_CONFIGUREVARS += "ac_cv_path_GPG='gpg2'"
 GNOMEBASEBUILDCLASS = "meson"
 GTKDOC_MESON_OPTION = "gtk_doc"
 inherit gnomebase gtk-icon-cache gtk-doc features_check upstream-version-is-even vala gobject-introspection gettext mime mime-xdg
-# depends on gtk+3, but also x11 through gtk+-x11
-REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI[archive.sha256sum] = "17fcaf9c4a93a65fb1c72b82643bb102c13344084687d5886ea66313868d9ec9"
 
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'gtk+', '', d)}"
+PACKAGECONFIG[gtk+] = ",--without-gtk,gtk+3"
+
 FILES_${PN} += " \
     ${datadir}/dbus-1 \
     ${datadir}/gcr-3 \
-- 
2.30.1

