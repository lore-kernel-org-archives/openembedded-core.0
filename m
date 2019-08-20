Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
	[209.85.221.52])
	by mail.openembedded.org (Postfix) with ESMTP id 793487ECA6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2019 15:32:34 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id j16so12853622wrr.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2019 08:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=TXs0hf72vR/MgSn23gv5CD7gQSSgx078KIWu5QYeDEo=;
	b=d4XDGndDdPf2SpYPVTMKRnQrTQ5mVReyF3IURYA2MlLUcp5PFK0vCIBNxpsTUChcCm
	ZLap+f+UWvauLm0zd4Dv3FP5gOpV69zKpuNCztwzetQZEvZUkz4sa9zlKxybbfe19vYo
	Tw9x+yxNFpVzKjYC+1+nlqN/HgBIoBaiwPi6ePGIv0NYq/UseBWh+W9uVOqExrC2wpcK
	DhZRjDivM3d89gVYH5jWfFNGCTG7OYJuq++cPsrBCeehuu1MGov0UoxxpOxdlvjNDwuA
	tp1hDOf/AOzSfnMu7kJOiuehtL6pINgODYTM1OztBm4vC5XEjAS8ho2P9CNKWhT8pzvL
	RODw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=TXs0hf72vR/MgSn23gv5CD7gQSSgx078KIWu5QYeDEo=;
	b=otWlWvbK0qjriXXEXeoqphgDttSusBpG9oT648kXsY1S7luXt9xhPxZJmZFrFDwSyi
	2fH+jSqM9eHlgQvj2HQXBeYFu6kvCaEnDWkb6D4ihPYD8wQgoYgGm2Z/1knnb5LExNhh
	fslAff0lzV9SIZKCHqNaUYHLNW+UQqxNJnC0cmk0775bI8yIKrjkTY2NY2nPhizp6HRy
	ebyH2M2RXlieiq8NSCFnEe7PT0y/+O//1R9tmKHNQacKNQQFpyfJCXxWwP2/DQvqivK+
	qDEc+CyWaeaRfzAjiV/t8fepIEkkfkizE9uT9NEa8az86IXBQAOVp18faySQTXfjNv4H
	IfZA==
X-Gm-Message-State: APjAAAWYXseHWLB/SjSUlzoeh4HcyZH9u9oSt77xvRhqHhs8GVQHXJQ4
	vHUwCgL1OxJOHk1N3tXmAx+LHSGoPIk=
X-Google-Smtp-Source: APXvYqysiQgMZv4Gy8g3ZSC4mTDscp1Wpc+LAuhVau9sVQxg0hZ8zkq39+ogJeLh0ZMAspkHO9WE5Q==
X-Received: by 2002:adf:e390:: with SMTP id e16mr25379855wrm.153.1566315154986;
	Tue, 20 Aug 2019 08:32:34 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id 6sm466700wmf.23.2019.08.20.08.32.34
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 20 Aug 2019 08:32:34 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Aug 2019 17:32:18 +0200
Message-Id: <20190820153219.62435-11-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190820153219.62435-1-alex.kanavin@gmail.com>
References: <20190820153219.62435-1-alex.kanavin@gmail.com>
Subject: [PATCH 11/12] libdazzle: upgrade 3.32.2 -> 3.32.3
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
X-List-Received-Date: Tue, 20 Aug 2019 15:32:34 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../libdazzle/{libdazzle_3.32.2.bb => libdazzle_3.32.3.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/libdazzle/{libdazzle_3.32.2.bb => libdazzle_3.32.3.bb} (73%)

diff --git a/meta/recipes-gnome/libdazzle/libdazzle_3.32.2.bb b/meta/recipes-gnome/libdazzle/libdazzle_3.32.3.bb
similarity index 73%
rename from meta/recipes-gnome/libdazzle/libdazzle_3.32.2.bb
rename to meta/recipes-gnome/libdazzle/libdazzle_3.32.3.bb
index 58e78a5b789..e1a11830070 100644
--- a/meta/recipes-gnome/libdazzle/libdazzle_3.32.2.bb
+++ b/meta/recipes-gnome/libdazzle/libdazzle_3.32.3.bb
@@ -7,8 +7,8 @@ inherit gnomebase upstream-version-is-even vala distro_features_check gobject-in
 
 DEPENDS = "glib-2.0-native glib-2.0 gtk+3"
 
-SRC_URI[archive.md5sum] = "b5c99a8f483a0defe7c7124a3220e412"
-SRC_URI[archive.sha256sum] = "413f8dfb8706760e0c649e2994bd10524ac0736601dd03ad2036293bed3bf141"
+SRC_URI[archive.md5sum] = "b6da085649dcda2795e6980a84667950"
+SRC_URI[archive.sha256sum] = "6c8d9b1514b5f6422107596f4145b89b8f2a99abef6383e086dfcd28c28667e8"
 
 GIR_MESON_OPTION = 'with_introspection'
 
-- 
2.17.1


