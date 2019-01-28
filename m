Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
	[209.85.221.51])
	by mail.openembedded.org (Postfix) with ESMTP id 2C88F7C492
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 12:47:18 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id p7so17949354wru.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 04:47:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=k9NrlisDw1r21WdK0e51ADQcGewFGjEsZ1dUzppD5w0=;
	b=acVwRV0fxK5K0NxYPzk4UtNSM29hFb214uJ9eZv9TxuShjVBKejZKzHb7AbJQpIjrS
	QuTyJiam8ndiY4qI6G5qgG4VNVE5uF2HO/j2oPjXdl4CraHRTA948l5HO0V3Em95ydNL
	gy1IQ/EX86R4M64Kyfj5VqUKsB9IAhlcroZfd5vYXHTmvJqDQ8eG2PvVACYDoB2G+CVz
	fjpKZ4irPLaLqMVdRprYJn2E1l7NbB8QZAic/CwlR4O+Lg+e0aBqS8/4mykUwVImKbb8
	1aKQE69HZB/Xivvp5BZaaz4mqUlCEIOpqpmEsC0CqZshhqVl09v10A1hkaQOEBOzqd5K
	nd6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=k9NrlisDw1r21WdK0e51ADQcGewFGjEsZ1dUzppD5w0=;
	b=Ti34Bva5518nNiFZqTMZ3F5KD61kDNOFIHX8q/ahnToef8coSMwTXUAgabg7d4LwfM
	RBCqFa+o+wDvt+7MAwTjhBA41qTkoVId4VpU/mVw7fX1HtfmzOfBS7bC0oGMWuNtDMLR
	SEZt+zsyWTTPzrv8q6p+utBWZpRMOsq/4BxID6iBZ8IQVBO7wkCPDo6XTrpjrIqEgibG
	+NJR6PGBnMceBhlGiEFdBuofN+rISN9hiO4VqMZuU+Pt4qWyLMVd422BGe3zkOd31CQk
	RrMyRLsdOUrtVeYeKcsWjZ8xo01ipijxQ4lH05HiqTx1A0TdM7QoKSFtj6j7zMx50MxB
	LVkQ==
X-Gm-Message-State: AJcUukcZv3rb3tw5p5HEOMSO31RcUQlW3x5RLo+SPWbY5PVoljDsE8EN
	PsTirl+0TJmymS75w/5SL7BkQQ+O
X-Google-Smtp-Source: ALg8bN5sFYOC21FqIDGgFYtG/lMk4TlfmEO6b9yEqOnq1Zy8e52/wg4sFhT3RRjGpvQSjLO+uRV+DA==
X-Received: by 2002:adf:a1d2:: with SMTP id v18mr20671944wrv.87.1548679639421; 
	Mon, 28 Jan 2019 04:47:19 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	j33sm186026218wre.91.2019.01.28.04.47.18
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 Jan 2019 04:47:18 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Jan 2019 13:46:42 +0100
Message-Id: <f26f729ae8292856bc3b1e73af1980fcb11d4972.1548679462.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1548679462.git.alex.kanavin@gmail.com>
References: <cover.1548679462.git.alex.kanavin@gmail.com>
Subject: [PATCH 11/24] mesa-gl: do not enable nativesdk variant to avoid clashes with main mesa recipe
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
X-List-Received-Date: Mon, 28 Jan 2019 12:47:19 -0000

An alternative would be setting PREFERRED_PROVIDER, but for native/nativesdk
builds mesa-gl is not a viable alternative to mesa, as it lacks all of the
bits that make accelerated qemu possible. Using PREFERRED_PROVIDER would
imply otherwise.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-graphics/mesa/mesa-gl_18.1.9.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_18.1.9.bb b/meta/recipes-graphics/mesa/mesa-gl_18.1.9.bb
index 73267eb4f0d..030db6c1440 100644
--- a/meta/recipes-graphics/mesa/mesa-gl_18.1.9.bb
+++ b/meta/recipes-graphics/mesa/mesa-gl_18.1.9.bb
@@ -7,3 +7,5 @@ PROVIDES = "virtual/libgl virtual/mesa"
 S = "${WORKDIR}/mesa-${PV}"
 
 PACKAGECONFIG ??= "opengl dri ${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
+
+BBCLASSEXTEND_remove = "nativesdk"
-- 
2.17.1


