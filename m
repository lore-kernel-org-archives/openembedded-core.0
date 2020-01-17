Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
	[209.85.221.41])
	by mail.openembedded.org (Postfix) with ESMTP id 6CE477FC2C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 21:29:26 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id q6so23967590wro.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 13:29:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=zE6g2NntZRTIbvQj7Gm8wId+hBMm1fzMEz/MrAuwcSc=;
	b=Ug9u8WSUjiuR4NA1BriyY6adr4/pAhArcfQZtr68hR7Jx1LLjCVWkjGT6YBobSoRL4
	umVs4lh8ym2f3iiHX3/TBqScyzIC9jrcTRSK+9w/NLkucH7z0pGt7idcf2DaQm9T5/sZ
	CHCjtxiFaSbd31/WTNqfnrWyRbKpHXhGj3IIEFVzFc4d7xc9ArKn/P0BPMZgk3wYqrcB
	9c92nnr+ywRkNjOQQ5tJvD3oxZYsm7Q/l/0ju2xCNfqjL5b90yAuGq25XQFrEWOjT2F8
	Rmq9rVdZMBQ9Cr9vCwXeeoqMFzoa07WOL1H3JYwgHICICK8mWQ+3ZvO8AeSEWIRDvH5K
	3Iqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=zE6g2NntZRTIbvQj7Gm8wId+hBMm1fzMEz/MrAuwcSc=;
	b=bvHDK0hEHlCKaD86PAb7CR/Bvq2z6xVUyt97rN0qsGnxYAUwLpmnn6CeWoRqM9FTFp
	7rNkuIqVCFtOCsEORIvrhuRtMs63WQ+172jhguH0dOPQ5s4XdR3Nnb3ClwgrSDPo7Xbg
	40UGhlDr6P3QKSpBDOi1zEoX2bG1FC+J5SLEHKTujPdYusK/7Cqp8+Yc/Lgqa3JejzGn
	eG3RuO3fI6j2hVvdpQeTeft/cTRdLIbE7Y1PJeK8rP/9/kpFaG72QdKSYTwczwRQTeOU
	KABHV71yUa11lxCN91g799DlKzXBfYRf8EUUTweOVInFA6KzFiqwsGmsOofqtk6hO95J
	fdXg==
X-Gm-Message-State: APjAAAVDv5zSsCbcbtChHtj8RDv+oj/l5m7ElOQDlscATEO/lGqRQf42
	E3rQcaZ7gQ40W1yI7nUIgwl7LJ1J6D0=
X-Google-Smtp-Source: APXvYqzYWrqcrjvbK6qv9S2+FcnfBE28zaZPtR59QNp0xswM6SvYBd5M/dQlB1QSMRodRcrQ/ICpXw==
X-Received: by 2002:adf:81c2:: with SMTP id 60mr5069771wra.8.1579296567074;
	Fri, 17 Jan 2020 13:29:27 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F0BBB19EA1F5BE194E084E5.dip0.t-ipconnect.de.
	[2003:f0:7f0b:bb19:ea1f:5be1:94e0:84e5])
	by smtp.gmail.com with ESMTPSA id
	l7sm36094689wrq.61.2020.01.17.13.29.26
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 17 Jan 2020 13:29:26 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Jan 2020 22:29:08 +0100
Message-Id: <20200117212908.32647-11-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200117212908.32647-1-schnitzeltony@gmail.com>
References: <20200117212908.32647-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH][v2 10/10] gcr: add mime-xdg to inherit
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
X-List-Received-Date: Fri, 17 Jan 2020 21:29:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta/recipes-gnome/gcr/gcr_3.34.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gcr/gcr_3.34.0.bb b/meta/recipes-gnome/gcr/gcr_3.34.0.bb
index 272112dd12..9853b3f416 100644
--- a/meta/recipes-gnome/gcr/gcr_3.34.0.bb
+++ b/meta/recipes-gnome/gcr/gcr_3.34.0.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605"
 DEPENDS = "gtk+3 p11-kit glib-2.0 libgcrypt \
            ${@bb.utils.contains('GI_DATA_ENABLED', 'True', 'libxslt-native', '', d)}"
 
-inherit gnomebase gtk-icon-cache gtk-doc features_check upstream-version-is-even vala gobject-introspection gettext mime
+inherit gnomebase gtk-icon-cache gtk-doc features_check upstream-version-is-even vala gobject-introspection gettext mime mime-xdg
 # depends on gtk+3, but also x11 through gtk+-x11
 REQUIRED_DISTRO_FEATURES = "x11"
 
-- 
2.21.0


