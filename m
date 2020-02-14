Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
	[209.85.216.44])
	by mail.openembedded.org (Postfix) with ESMTP id C6D4660586
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2020 23:28:56 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id d5so4470174pjz.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2020 15:28:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=113ppS9gKG3COFVz1lB9Dr5BeLc0pZnLTNb9WlcJdOM=;
	b=NEEU6qqgfa1mT2pf4YBLo38zd8G7YdRT1LtDExfnhbFDk4aI8y6ydt9nv7CXG0UQtC
	Ki3PaLZIMPKgS1Se0NgtIyE2jolIFeeVVsbh+rG7Rpu2yt5q9UK9gX+zBqnXhYYX1osn
	8oqHYmuQbwUexhGAntCl82OWh/bOodBl2XY2hWpGh5krMG/exlNGL6uCfZXGD09TsnHh
	31XItNKVdcoxaJbbqmtoDmsbsTbYlouv0/Rbt/dAEoK0LskT416DYSFVfOxuzKqtGpX4
	iN5HFge1Zv7wkmUVW0u3e2zBKX2XTC1RfYYJMYNDp7BIZr4A8co8lANCck7y/U+B4kAt
	TtnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=113ppS9gKG3COFVz1lB9Dr5BeLc0pZnLTNb9WlcJdOM=;
	b=DWnAe2RJbwMMpLoBd3I+QBfzzv722+bycvuxCPqU2vosEnxLBzcWRJLi7zcz0+5Kbg
	4zEK+WeikZHrtLo2zKUZP2Fv5WVaw3doGA1xQNJyC87nV6rCzMNKsBiSXpghZflmBqQJ
	7zfAuhvd+RihX+p+wb+j1pZa36AYD1LdsVaT6FKXA35HjnTruJzlefXevzXj3lw0geJ2
	g2DhLIVl0EuxUx0bjTgPmJVSdkB8+Cd+cApo2cmUsmrF+AqnVjNch4e9aiz4tSnFwrim
	e+Xlr+UNdBgKmKo2HGUB5aC/hJIYbce+J4s/7oPBXxedYyQOaJzhpoDDimXoEvYckhJ1
	CgMQ==
X-Gm-Message-State: APjAAAVYkKyWo7gfKurqefmI4dviT9Q8mg1Td3xC0bU+9pobiM8TKLuS
	TIp8+xZdPXCX6EAzRATTT4KxKv4JqqM=
X-Google-Smtp-Source: APXvYqwm56nc4od7Tc9mSKXkffHsFY4cfLEq3d844NFbMKYbAgMUIKvpPcJE0KNU6QSOBieCeEAGQQ==
X-Received: by 2002:a17:90a:1f8d:: with SMTP id
	x13mr6634033pja.27.1581722937440; 
	Fri, 14 Feb 2020 15:28:57 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::709])
	by smtp.gmail.com with ESMTPSA id
	d26sm8006847pgv.66.2020.02.14.15.28.56
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 14 Feb 2020 15:28:56 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Feb 2020 15:29:01 -0800
Message-Id: <20200214232901.3344491-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [PATCH] image.bbclass, package-index.bb: Delete do_populate_lic task
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
X-List-Received-Date: Fri, 14 Feb 2020 23:28:57 -0000
Content-Transfer-Encoding: 8bit

These are meta packages

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/image.bbclass              | 1 +
 meta/recipes-core/meta/package-index.bb | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index c2824395c9..07aa1f1fa5 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -609,6 +609,7 @@ do_patch[noexec] = "1"
 do_configure[noexec] = "1"
 do_compile[noexec] = "1"
 do_install[noexec] = "1"
+deltask do_populate_lic
 deltask do_populate_sysroot
 do_package[noexec] = "1"
 deltask do_package_qa
diff --git a/meta/recipes-core/meta/package-index.bb b/meta/recipes-core/meta/package-index.bb
index a4123b7622..98c5bcb372 100644
--- a/meta/recipes-core/meta/package-index.bb
+++ b/meta/recipes-core/meta/package-index.bb
@@ -12,6 +12,7 @@ deltask do_patch
 deltask do_configure
 deltask do_compile
 deltask do_install
+deltask do_populate_lic
 deltask do_populate_sysroot
 
 do_package_index[nostamp] = "1"
-- 
2.25.0


