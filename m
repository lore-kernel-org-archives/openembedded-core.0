Return-Path: <jpuhlman@gmail.com>
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
	[209.85.210.179])
	by mail.openembedded.org (Postfix) with ESMTP id EE49C61260
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Feb 2020 04:43:07 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id 4so5936691pfz.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2020 20:43:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=U+QKkXK0bSW+OQ72Nr5iTR/wqzAmD0jAGSIeogGlscw=;
	b=AlcyAR7OxgFt98K/tI1gWo4EKE4lawu8MTdhFt/MZV7YqXacq2cmJ+d8x8KcQXDSao
	FieN5dAs3tc59w39JU4zugvoKkJu8IsmJykEQyQ0AMRjtZw4rsGmAl1om6YzpOAUnmEg
	NdcjSdjjd/daRpHxz94h/7PVEPBy0eUSdOO8NaPXmpmS9yya8z7KOoWvuH5UvCmkJIdh
	X8YHHU+uXi8Up4M9idi7jBkPZm7X+Sotv9wDAf+Me5xDmCiZEtu/MJVbuqG9HhAvQwA7
	NMgIaePzTrepgKE5oAGj24GWSWb0nCFluiVThnKIrmqH0rmBiZSXAbXFGh2chmiDCyJL
	xUuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=U+QKkXK0bSW+OQ72Nr5iTR/wqzAmD0jAGSIeogGlscw=;
	b=Em+YeYkokCmS2ePUy1c5ZB8WMcyP2aI5twtF1+iRUgycoPzt7CNAqNeyFIZOlgQMcV
	XlhY2RjbYBJtEbWu+dRkAMsymYZRfpB9npr0TxBIrnIlnd6FeIFYfGxzSmRguI/sawQ2
	a9oIS1isZOr6DQ5LmjtPZMiCd7IKylXvQipeon2gDq7dNACBODkqUMOQLC9IRNd54R4O
	3hzx+4hW+st9kC3gi6CoK8wcQX3jDBBk1rvJwsQqLKgOCvAroyASkEtmjPZyKVePmZE8
	KzhvIZLuse8ClPg80yEahTDpeihaBZukaALQee1Keae14gHIUe+q5uKnnjcuJGAf6oA7
	a88g==
X-Gm-Message-State: APjAAAVxgDM6VeLTn4utPVrjVlAhz6iygzk2iQrOp/2JD+oE5k8xotyC
	hyLmPcU9sq4lXhF8OsKVV7WTzuU6jg8VUA==
X-Google-Smtp-Source: APXvYqxQsj6kzT8Dkkht01j6t1ngIiAhaHWZwI6QVGW5rr7ktRCAc3L5tpbWUl8gb7os/Fcq/9Y8VA==
X-Received: by 2002:a63:fe43:: with SMTP id x3mr7255164pgj.119.1581741787998; 
	Fri, 14 Feb 2020 20:43:07 -0800 (PST)
Received: from workhorse.localdomain
	([2600:1700:4c90:60a0:56be:f7ff:fe12:d0bd])
	by smtp.gmail.com with ESMTPSA id f8sm8633957pfn.2.2020.02.14.20.43.07
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 14 Feb 2020 20:43:07 -0800 (PST)
Sender: Jeremy Puhlman <jpuhlman@gmail.com>
Received: by workhorse.localdomain (Postfix, from userid 1000)
	id A41E82A04B2; Fri, 14 Feb 2020 20:43:06 -0800 (PST)
From: Jeremy Puhlman <jpuhlman@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Feb 2020 20:42:51 -0800
Message-Id: <20200215044253.5596-4-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20200215044253.5596-1-jpuhlman@mvista.com>
References: <20200215044253.5596-1-jpuhlman@mvista.com>
Subject: [PATCH 4/6] libassuan: multilib header for assuan.h
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
X-List-Received-Date: Sat, 15 Feb 2020 04:43:08 -0000

From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>

assuan.h is generated and can differ between mutlilibs.

Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
---
 meta/recipes-support/libassuan/libassuan_2.5.3.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/libassuan/libassuan_2.5.3.bb b/meta/recipes-support/libassuan/libassuan_2.5.3.bb
index 6fb3d2f3a4..52b4c0f1b9 100644
--- a/meta/recipes-support/libassuan/libassuan_2.5.3.bb
+++ b/meta/recipes-support/libassuan/libassuan_2.5.3.bb
@@ -22,11 +22,15 @@ SRC_URI[sha256sum] = "91bcb0403866b4e7c4bc1cc52ed4c364a9b5414b3994f718c70303f7f7
 
 BINCONFIG = "${bindir}/libassuan-config"
 
-inherit autotools texinfo binconfig-disabled pkgconfig
+inherit autotools texinfo binconfig-disabled pkgconfig multilib_header
 
 do_configure_prepend () {
 	# Else these could be used in preference to those in aclocal-copy
 	rm -f ${S}/m4/*.m4
 }
 
+do_install_append () {
+    oe_multilib_header assuan.h
+}
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.13.3


