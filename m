Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 5A04D6C207
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Nov 2018 14:29:23 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id u9-v6so2127615wrr.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Nov 2018 06:29:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=5W/hx8G5BFndGAA71ucxsjSblWWByECZYtFDlYX8ViI=;
	b=P4mX0CKOsRoOIGDqz/CZtfxKicHuUtX8Mb0jPmHm0ze9/3p/sZdabrl0/Vt91346f4
	kajvEa6Rs/31uTda8Bv/s8s9aAEU2iqzP8CHDQDOr/DGOWc5LkYdWtryMYDXXnly1Uni
	zBfewb3ga3RcIao7Rkrcp9UVIpSH3WEeVYR5o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=5W/hx8G5BFndGAA71ucxsjSblWWByECZYtFDlYX8ViI=;
	b=L5uzgSuurEP1VN3fgg9Ly7/k4aIpDWFOEtxugh+dDx8u44O62ZGblQEXxyLajk9L6+
	XykD/+rlwZkDVvuRF4BqWGSV5pfv0bSzEJ8Xj9SikSLNz3jd8U/Wlpm539bCYooCS6Wv
	GMimV8+GCJkEdyqbDDJ/AjNGR5QZKG64wb/vROoFZyu+N9IHO0PQOhFQwUz6pUGZY96K
	kYoBERfHzuMuXgJx/HbDHVDaMT5bmP3qP8QW2XsZ++Gdp3LDTjsr/0xn26VEIHO/aNOm
	OvfblaxWkS6YI3soeJUCYC9kxm6cJR9B8aitF+goCwwv33VKrMt29kE4wnnRLqj8QsIf
	oZpw==
X-Gm-Message-State: AGRZ1gK8zP5saFVlC7VWbFNZEtffjwFO1fkfik46ALjGPmZwpfNVoiyv
	rhmFdck6QzE8dhmif2ALX6HBp2DIYqQ=
X-Google-Smtp-Source: AJdET5cwvidg1G38JoQUK7RFmYrg7aEzRMjdaMlnlBaWOSA8XN6+0jWz66tqPJ0krtq2kTyaGzj2aQ==
X-Received: by 2002:adf:e6c4:: with SMTP id
	y4-v6mr8139975wrm.101.1541773763678; 
	Fri, 09 Nov 2018 06:29:23 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	h16-v6sm7713764wrb.73.2018.11.09.06.29.22
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 09 Nov 2018 06:29:23 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Nov 2018 14:29:09 +0000
Message-Id: <20181109142912.23102-9-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181109142912.23102-1-richard.purdie@linuxfoundation.org>
References: <20181109142912.23102-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 09/12] testimage: Remove duplicate dependencies
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
X-List-Received-Date: Fri, 09 Nov 2018 14:29:24 -0000

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/testimage.bbclass | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index b8acd3ce782..b00d47441b2 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -66,12 +66,10 @@ TEST_TARGET ?= "qemu"
 TESTIMAGEDEPENDS = ""
 TESTIMAGEDEPENDS_append_qemuall = " qemu-native:do_populate_sysroot qemu-helper-native:do_populate_sysroot qemu-helper-native:do_addto_recipe_sysroot"
 TESTIMAGEDEPENDS += "${@bb.utils.contains('IMAGE_PKGTYPE', 'rpm', 'cpio-native:do_populate_sysroot', '', d)}"
-TESTIMAGEDEPENDS_append_qemuall = " ${@bb.utils.contains('IMAGE_PKGTYPE', 'rpm', 'cpio-native:do_populate_sysroot', '', d)}"
-TESTIMAGEDEPENDS_append_qemuall = " ${@bb.utils.contains('IMAGE_PKGTYPE', 'rpm', 'createrepo-c-native:do_populate_sysroot', '', d)}"
 TESTIMAGEDEPENDS += "${@bb.utils.contains('IMAGE_PKGTYPE', 'rpm', 'dnf-native:do_populate_sysroot', '', d)}"
+TESTIMAGEDEPENDS += "${@bb.utils.contains('IMAGE_PKGTYPE', 'rpm', 'createrepo-c-native:do_populate_sysroot', '', d)}"
 TESTIMAGEDEPENDS += "${@bb.utils.contains('IMAGE_PKGTYPE', 'ipk', 'opkg-utils-native:do_populate_sysroot package-index:do_package_index', '', d)}"
 TESTIMAGEDEPENDS += "${@bb.utils.contains('IMAGE_PKGTYPE', 'deb', 'apt-native:do_populate_sysroot  package-index:do_package_index', '', d)}"
-TESTIMAGEDEPENDS += "${@bb.utils.contains('IMAGE_PKGTYPE', 'rpm', 'createrepo-c-native:do_populate_sysroot', '', d)}"
 
 TESTIMAGELOCK = "${TMPDIR}/testimage.lock"
 TESTIMAGELOCK_qemuall = ""
-- 
2.17.1


