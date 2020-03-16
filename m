Return-Path: <armccurdy@gmail.com>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id DEA0360F33
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2020 18:49:10 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id b22so8397288pls.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2020 11:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=h8me4N+q5iVL0wuwXeMLnH4529TY9SQz+tNes3AxZT4=;
	b=vK96QLUfkMhjcFvyY/0sF2bsImGmkTVVtg6mppez/Qo+FNtoRwpYxH3yiFaDBSP/Bs
	lDJG0hWphGfgYc60scUneE8+G8idpuBl91HOHjBidZxj0PVVTpMqYDj4SmWKory3A6+Y
	/ysO3wJ3w0f0iZAkK8UOaYcmPMYOvdw543TQLguSrShnwb2DVvcHOMwDe/28Z8I9Qqap
	O//9S3jd1DBA9jqtX4SiFqWYoSZww5RnSXn7BEQsIrx3EqF3IsuXIAA9+bWAxYcsi2Z9
	KhsIf1yBcnmmMmyniBHkmLCGC0ArP4wgoEolMm3kA/urObwnJemZcmnvfaw6030hBQE6
	B7Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=h8me4N+q5iVL0wuwXeMLnH4529TY9SQz+tNes3AxZT4=;
	b=rgFm2rOwYWf+Jifo+cVpzXmmj/AAsNoeG9zMxhlZqu05nNiH6lup3ByJpxF92a2n/4
	oN2IGaF0Yzelu4M+nVZQZZ9id4C+15n12V+DJjJ6Ochz5ESY8I6KefJd3YWhFXbMWMcF
	BP6wCu+B3h8Xl6Nn8ungr3d2eBny733LmPCyow4MZizWEijebZxb5UiPK7aPjzK8r05y
	ffgXbeKgSpsmLxWl4oTor5ngCojK4l5KIjdGLyGER2sLxEygo7l2qsntHHK/lv2kk0CU
	UVZyyMSHNM1Fxvsgqj0RxA3F2aJUxSEIl33DKiT3JBg8zHo4U9S98GAAERabDIPc7AKp
	wRmw==
X-Gm-Message-State: ANhLgQ0132xJxgVaOV18fIEOY3K4K9NZGfE+tWVbcei2XtKeR1VU5Yoz
	CI3vDSFqmfoSQCd6EZ90/iBi9qpQ
X-Google-Smtp-Source: ADFU+vv73I7lIdbvVaOFTxWIHxJX6Qh16sMKPPnS1lzbXDhZ6L9Fp65g/6StJwHLoARN9Ty51exURQ==
X-Received: by 2002:a17:90a:a40f:: with SMTP id
	y15mr958882pjp.143.1584384551506; 
	Mon, 16 Mar 2020 11:49:11 -0700 (PDT)
Received: from localhost.localdomain ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	c201sm632455pfc.73.2020.03.16.11.49.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 16 Mar 2020 11:49:11 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Mar 2020 11:48:56 -0700
Message-Id: <20200316184859.11635-2-armccurdy@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200316184859.11635-1-armccurdy@gmail.com>
References: <20200316184859.11635-1-armccurdy@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/5] opkg-utils: remove python scripts etc for the class-target only
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
X-List-Received-Date: Mon, 16 Mar 2020 18:49:11 -0000
Content-Transfer-Encoding: 8bit

OE's packaging functions assume that the opkg-utils python scipts are
always provided by opkg-utils-native, so the scripts should be removed
for class-target only.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-devtools/opkg-utils/opkg-utils_0.4.2.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.2.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.2.bb
index eda73db6a4..9315240190 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.2.bb
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.2.bb
@@ -34,13 +34,13 @@ do_install() {
 	if ! ${@bb.utils.contains('PACKAGECONFIG', 'update-alternatives', 'true', 'false', d)}; then
 		rm -f "${D}${bindir}/update-alternatives"
 	fi
-
-    if ! ${@bb.utils.contains('PACKAGECONFIG', 'python', 'true', 'false', d)}; then
-        grep -lZ "/usr/bin/env.*python" ${D}${bindir}/* | xargs -0 rm
-    fi
 }
 
 do_install_append_class-target() {
+	if ! ${@bb.utils.contains('PACKAGECONFIG', 'python', 'true', 'false', d)}; then
+		grep -lZ "/usr/bin/env.*python" ${D}${bindir}/* | xargs -0 rm
+	fi
+
 	if [ -e "${D}${bindir}/update-alternatives" ]; then
 		sed -i ${D}${bindir}/update-alternatives -e 's,/usr/bin,${bindir},g; s,/usr/lib,${nonarch_libdir},g'
 	fi
-- 
2.24.0


