Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f46.google.com (mail-pl0-f46.google.com
	[209.85.160.46])
	by mail.openembedded.org (Postfix) with ESMTP id 7182C78BF5
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Aug 2018 22:57:43 +0000 (UTC)
Received: by mail-pl0-f46.google.com with SMTP id f6-v6so6250665plo.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Aug 2018 15:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=xqZoWAcpZ2/Zg7wEVg1dgya9WLpijnFSV3FLRuxyybo=;
	b=tCB0T1Iu/Xcu7/a2jsKWWS8kLTr7ELBWwZPaIbjpDWWwIGIf3PRy2fs3sFpKlVvyNV
	VO3o8W1PxOTLKwXmIJJFOKVA2nBuVV3Csy3wIVTU+PZWQ85pFoEKgQ3pb1IQFl5g4sUR
	8iv3F7lGej5s93Y7iFTCez3JGRXKPFkwL1OCSXLeWi8sLy3OpomlXHftu3Ad1FaPvr9t
	0M64GO6Nee5Zx3lvW8mZUVQKuTcWnLnqNC92gEtLF7a+BR+CKi6DAvUigeS1xOKWlVpf
	1r9U55dbFkUgsAdB0Dfccf2F+gP0OdQH092fzfVbGa+E3XFWi45YfRi9xsFpi/x1x6gE
	EglQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=xqZoWAcpZ2/Zg7wEVg1dgya9WLpijnFSV3FLRuxyybo=;
	b=g3serelXn/le6Z+zPRkAFOwT84fbfo5V/PqUl65JD/3DkuDZunXe9hXzYIsgtliZ3w
	0fq/Wrc8wSgw5RtBZNAe6LICmbQqRq8dCcMOFAbu3OBWBWZFIh/eN1U8Yk5R9/WVhpsR
	L0DlYEJ7s3LtiKc8SpCS46gnTwOU3L/fkuwp5Ew8qZWm8QxfQy1IzES2AW3m5WogkGbT
	aue/bxzyrY27ui21kVoRXCRGk2ErD+JSHASCsDQry8EXkyIbq9vm1E43egSshY5r4DYz
	q/iSFJNvB/nZ+SYgePuALNw9E5zjeppxXCe5G3nPf3z7A7FK/Pbny4EHAQEc42b5fBDT
	VxGg==
X-Gm-Message-State: AOUpUlHBElpGafqvTR20L7c10ETx7EDA/iiUwCXJWGRcHfNpw/RJ0GWc
	i6GclsVfSwbjAASZoRwvClJmEnAI
X-Google-Smtp-Source: AAOMgpewueSXMa+BDXE7P4IkimKBdNvn0TBliteAYvISEw+MPOrmVVy34XEw+qUKPRpoDIb8G4xLYg==
X-Received: by 2002:a17:902:1682:: with SMTP id
	h2-v6mr15564800plh.327.1533596264301; 
	Mon, 06 Aug 2018 15:57:44 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::1d00])
	by smtp.gmail.com with ESMTPSA id
	x1-v6sm11993137pgr.59.2018.08.06.15.57.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 Aug 2018 15:57:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Aug 2018 15:57:13 -0700
Message-Id: <72fb0632bf135adce312be8b9c1c8813bf967372.1533595822.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1533595822.git.raj.khem@gmail.com>
References: <cover.1533595822.git.raj.khem@gmail.com>
Subject: [PATCH 16/18] cross-localedef-native: Update to build with glibc 2.28
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
X-List-Received-Date: Mon, 06 Aug 2018 22:57:43 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/glibc/cross-localedef-native_2.28.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/cross-localedef-native_2.28.bb b/meta/recipes-core/glibc/cross-localedef-native_2.28.bb
index 0992e0285d..a05b94e3b3 100644
--- a/meta/recipes-core/glibc/cross-localedef-native_2.28.bb
+++ b/meta/recipes-core/glibc/cross-localedef-native_2.28.bb
@@ -22,7 +22,7 @@ GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+(\.(?!90)\d+)*)"
 
 SRCREV_glibc ?= "3c03baca37fdcb52c3881e653ca392bba7a99c2b"
-SRCREV_localedef ?= "de5bdbd5e76b5403a4151b9b9f958b6cca36b3e7"
+SRCREV_localedef ?= "c328777219ccc480be3112cf807217ca6b570b64"
 
 SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            git://github.com/kraj/localedef;branch=master;name=localedef;destsuffix=git/localedef \
-- 
2.18.0


