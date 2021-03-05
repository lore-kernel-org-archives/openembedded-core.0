Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
 by mx.groups.io with SMTP id smtpd.web08.13776.1614959349650411061
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Mar 2021 07:49:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gherzan.com header.s=fm1 header.b=HYMYfJVc;
 spf=pass (domain: gherzan.com, ip: 64.147.123.19, mailfrom: andrei@gherzan.com)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
	by mailout.west.internal (Postfix) with ESMTP id 5DD012A38;
	Fri,  5 Mar 2021 10:49:08 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Fri, 05 Mar 2021 10:49:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=fm1; bh=3SuS/QKr1IzJ/py0FwqpTF3slU
	cHknwKR5FEmXxAWY8=; b=HYMYfJVcXy+uCGD9jYd3XtB50vr7FKsAhqQ+esnrDY
	LgzUAogdwIpCb7VMkif+gZnWTAhbKpyh5YWrrJ1tmDWoEBFxlSN365hOD57r/CPG
	ccFgMMy5T6ExfibbgbFz1bLeGgQbQoeZo9Lg5vQTrs8kpZ71R7i5UtUPDGyq0ZeX
	NDk+UwVABIP3hB8GYYRHSYEhk2zyja3DewITr2V1E7o+My+CRXx7Td1FdD7RMjBY
	3yu0pPZz+iI95i7bThVutev7tjeyaBnmLn8vnGc6MwRkSC9oQF6HPiOX+FygFqqo
	hcdCijx0wF+BdrgmUKvZuGWJp8vGxgK+uqk9iP25xqhQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=3SuS/QKr1IzJ/py0F
	wqpTF3slUcHknwKR5FEmXxAWY8=; b=YFWBr+G6ZqNcdu9PJ5QkHp99eUVb1jhgz
	JmfS3/OXBidn9nWN2ETTKHD7ciNB2FVRpj2/oyaP7GboQSbN6oxC/q5yU+Z0Yr/4
	/EOYKynEhQIYFqMR8wgJzx8yPQcjC66JYB1O6jN9V3zuuej1N9fp8/Hg4+94xM3e
	TD09odBf6RWx5gd+Bv8k3F0lqA24eWGZ3OdWBmfxqE8mQ/TnT85AQGK+qehDwrhW
	c8iYYpWD1k+XQykO7lK5PckTCGRDEacqnJQGLapztNLydqXpzYlSWVKrLGPLw2bx
	+MxOcJyVmVQKyVQjkwNi/gENhsJBrTfhnUZbw9+NG6HEvuJ5shzIQ==
X-ME-Sender: <xms:8lJCYF2wSAnYBoIe1EhpGp9ZRzi-DKdTY9FNFZhS_12JyQOFQVnWoA>
    <xme:8lJCYMgYzbHkvEweeNzTIu3HQ8uunD4gJ8M_LZdeTamraB87JKlZXdRbVrPDIQ2PX
    40p5P8OUEnKkPVw7Hw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddtiedgjeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
    dttdenucfhrhhomheptehnughrvghiucfihhgvrhiirghnuceorghnughrvghisehghhgv
    rhiirghnrdgtohhmqeenucggtffrrghtthgvrhhnpeejhfdtffehkeetieefjefhgeeuud
    ehueekhedvgfdujedvtdfgudeltdelheekgfenucffohhmrghinhepghhnohhmvgdrohhr
    ghenucfkphepuddtledrudegiedrfeejrddukedvnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomheprghnughrvghisehghhgvrhiirghnrdgtohhm
X-ME-Proxy: <xmx:8lJCYFqt2qHLlau86qdlSzOb69Mju1Kk8TQllItLK7GuDUdVpqGbkQ>
    <xmx:8lJCYPN6ZJPMZMvl_ammK7jd4qXuU2T6vEq4FIJy_bPKiV8SSjVkbg>
    <xmx:8lJCYB227TRPT7F0CdM_sKzfrWR16iVfhk9kkKWpHou9ZGnQCKU9aQ>
    <xmx:81JCYP6p4QTlZuLIJngYHzc6gLt30U8oDBUqmRbZyGwXADt92zyrjA>
Received: from qwirkle.internal (host109-146-37-182.range109-146.btcentralplus.com [109.146.37.182])
	by mail.messagingengine.com (Postfix) with ESMTPA id 5D4021080063;
	Fri,  5 Mar 2021 10:49:06 -0500 (EST)
From: "Andrei Gherzan" <andrei@gherzan.com>
To: openembedded-core@lists.openembedded.org
Cc: andrei@gherzan.com,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: [PATCH v2 1/2] gcr: Add support for building without x11
Date: Fri,  5 Mar 2021 15:49:02 +0000
Message-Id: <20210305154903.3315094-1-andrei@gherzan.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Andrei Gherzan <andrei.gherzan@huawei.com>

Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
---
 meta/recipes-gnome/gcr/gcr_3.38.1.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-gnome/gcr/gcr_3.38.1.bb b/meta/recipes-gnome/gcr/gcr_3.38.1.bb
index fe80439b00..563087a360 100644
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
 
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'gtk', '', d)}"
+PACKAGECONFIG[gtk] = "-Dgtk=true,-Dgtk=false,gtk+3"
+
 FILES_${PN} += " \
     ${datadir}/dbus-1 \
     ${datadir}/gcr-3 \
-- 
2.30.1

