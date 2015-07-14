Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id BCB506AC95
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jul 2015 14:56:41 +0000 (UTC)
Received: by widic2 with SMTP id ic2so40469845wid.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jul 2015 07:56:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=FEQe0FzyBGW2iEqPdP38M/fVax1JsbG2R8RfSRtEj+M=;
	b=GUg6vHOAGOHreAJw7rpCys4OBd/Fbkw4+Xbzh1x3p0YQgxOc829cxkWrYGTf2OVGdm
	IYFMYCxXRrpH/CxtElbHC2WcNXljv1aIUT8V+uyiVAVQJszrHOKDmU+QFwxhuKOz8P8g
	WRSllwU8oQAKPl9tae7yf3fMzLDbHtwG0PhTt7iBdLmYaDocjvFj9COkHohZvXjrl0eG
	PNnvRpNLxC+iYrcW0XSHcOAJHzDAiMJ9iSzi1xlEmnVTgjyJRjO10KMhY72OlOO5uwK4
	f9HcsJcI22oHDlMG5AwuUN6d3Zc+IxyCHODcT8O+fExC2VMKt3SC0gfUJyt/ZKOwrf3g
	jdBg==
X-Gm-Message-State: ALoCoQlYtjUx82zF9ExItZqq5S9h+GOKb0GXmMrU19VrGKyE8/YxKWhEdAMxEheTlabF9rGlbTQ8
X-Received: by 10.194.47.164 with SMTP id e4mr76748236wjn.157.1436885801242;
	Tue, 14 Jul 2015 07:56:41 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	lj14sm3644571wic.18.2015.07.14.07.56.40
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 14 Jul 2015 07:56:40 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jul 2015 15:50:58 +0100
Message-Id: <1436885463-4577-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1436885463-4577-1-git-send-email-ross.burton@intel.com>
References: <1436885463-4577-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/7] opkg-arch-config: set S correctly
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
X-List-Received-Date: Tue, 14 Jul 2015 14:56:42 -0000

This recipe doesn't unpack any source, so set S to ${WORKDIR}.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/opkg/opkg-arch-config_1.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/opkg/opkg-arch-config_1.0.bb b/meta/recipes-devtools/opkg/opkg-arch-config_1.0.bb
index 4540de2..ace3de4 100644
--- a/meta/recipes-devtools/opkg/opkg-arch-config_1.0.bb
+++ b/meta/recipes-devtools/opkg/opkg-arch-config_1.0.bb
@@ -4,6 +4,8 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 PR = "r1"
 
+S = "${WORKDIR}"
+
 do_compile() {
 	mkdir -p ${S}/${sysconfdir}/opkg/
 
-- 
2.1.4


