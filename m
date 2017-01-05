Return-Path: <kergoth@gmail.com>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id E316671B0B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jan 2017 19:46:33 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id u143so3178202oif.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jan 2017 11:46:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=BQqataomkdbErGLuH/lHyCTBAaKbax0NgBXkAukEevg=;
	b=RnUHiFwl+aVCDqxiKLQiqI1zD+sopaC1wgo38YrDHNG9ekxMiqJifYSi1w7OTVsp/e
	PaVU0EG7vMUURiuf1W2DsZfnLa8fKIXA4i4maHdDSu5wNTWwo5cor6zcUMKqrrJiRyfk
	v0hXV3AouPijWikEeyfgHupu/SBOQ3GPiqwwd7MUgSUQk8Rck2FHOse8MfhvpdedBLqV
	Wgxd9C4OhalzP8JoJTZ0GpOX19NeKlKoVrPgB6hjwq1alFvjsHe+DOaoWn/JnoBzBjXF
	ECfg8AsqScvvfNEQZKXc+Lyh4vD/XM80NVGFOXSQMxNAqdgVS/mu4D6fC3pY1ueuz4eq
	iEdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=BQqataomkdbErGLuH/lHyCTBAaKbax0NgBXkAukEevg=;
	b=glyAkwhUpoCun8893dQawQUxiIMLMZZK9GCOC6gaLI+H4AJ3U/In3x+l3Unhx5z0A2
	wvClv7qKwNn6K2GayvPK5tsbYLC+CKEQscCaXMHVHc/Gdd8MGqGaiTu0tRC5B73OjiiA
	5W+We8BtndEvN9pPaB+k1hEK7dQXR6UjXWw7jgazUUtT3dyfzs4RChkqGb8vR0yFy3oE
	zS5ZiS8ecdiIpLkKSQ6CrWhroOEUVRrjXuDjQB0GfSwRKwDCSDf9BHi1r8sPN3ZC+8tG
	CbRVW52/rOvMdEJDgiS3ibu9ZgWDnXyA1prkXe19bgStGmh8owzPWB6arKRM7bCj3PJZ
	p+hw==
X-Gm-Message-State: AIkVDXIAjQtfc7wAoorF+9+JFoDw2USbFBNUcyhVS1ISZmqQgf7NgFaN3occ3l4igWRsXA==
X-Received: by 10.157.51.42 with SMTP id f39mr7004675otc.27.1483645594457;
	Thu, 05 Jan 2017 11:46:34 -0800 (PST)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id d10sm153783otb.4.2017.01.05.11.46.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Jan 2017 11:46:33 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Jan 2017 12:46:14 -0700
Message-Id: <9a0317a1b78a890d39a03cdde3ccafb8fb79f467.1483645446.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <cover.1483645446.git.chris_larson@mentor.com>
References: <cover.1483645446.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 02/16] packagegroup-core-tools-profile: exclude valgrind for x32
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
X-List-Received-Date: Thu, 05 Jan 2017 19:46:34 -0000

From: Christopher Larson <chris_larson@mentor.com>

valgrind doesn't seem to support x32 at this time, even in current upstream.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
index 31ad82b..946c947 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
@@ -68,6 +68,7 @@ VALGRIND_armv4 = ""
 VALGRIND_armv5 = ""
 VALGRIND_armv6 = ""
 VALGRIND_aarch64 = ""
+VALGRIND_linux-gnux32 = ""
 
 RDEPENDS_${PN} = "\
     ${PROFILETOOLS} \
-- 
2.8.0


