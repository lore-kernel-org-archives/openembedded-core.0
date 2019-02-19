Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
	[209.85.221.41])
	by mail.openembedded.org (Postfix) with ESMTP id 8DD817C9CC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2019 17:47:31 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id d17so8530305wre.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2019 09:47:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=xSImxq5QQSGvOPfJaWqGkJ49wOgUieVRluN5yGC3SDo=;
	b=OuQs77/idAd/fzmV9T4RNYTBcRcDFbDmQ6r+1t+mrJew2sQpXL1kGMjtDt5HRckqJe
	fOuEJBTLP2z1mQS5sLOD6SDzVy22x8hw2HFsyDJm6XzEFADQO1fHtHNmkTlkOuWDgvRE
	m7NUVrMsRH9WgtfU5x6g8bEKHTjBWz5Y3kNBAxp63zYU/N23BIuSx9v89X5rtwEHIEvN
	/x0CTvD/9Ips2r1FuK+WPn/GP8ptYyj6LnqeBBY9znGMzTZkVL1Lwx0VDJUeyvk1klXT
	BwgnMf2g8nUBUUE2XuygRIFu8Tl1Dp0bE9kNlJD1WbDR+2WcNmzNYWmsHPpS3Tep/UWS
	uApQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=xSImxq5QQSGvOPfJaWqGkJ49wOgUieVRluN5yGC3SDo=;
	b=i3MOgPRzPgfhf4OySzPADnYFshxoWK6tBnr+kVFl0rgvm2mOcmmJGYXvnlRcyIINEv
	zyOdM2QEfRPQWOgxOyjosxcjdCx13gpvUkdK+/METcrU8aKWALZI2T4kjh9OZG8ly4/M
	3Ra4qDvXF4N9xrDbY3npz19c/3Y+iegjyT0Y4O5+xtc6/3LB+7eJieIVybLT665aUbxq
	WeJpOqPJ9fVFlid4UsysaYymXHp9AmlRWGLCQfgaLXyoOPsfJBIzTq7xOQlWaSEJFXDs
	P2nV8+BHbyg5+iJRUP4yAjbkrU3EyLZPypduccu4OVHJnHTUQdKvsNKJ6UAP51959Eao
	zDhQ==
X-Gm-Message-State: AHQUAub7Th01HxwVAudSmvDGPyVC55xz/PSw4JX6CPIgl0++W+y6R2ej
	/1JZ955DoqopRhPYHM1LUbMsgMhc
X-Google-Smtp-Source: AHgI3IZW63OZ01DvI4J/HKOrxVJ0SS0qRTjuUCEOmnOlgeVI3aahQOjOFm0OW+fFjXvUs0lCMkzc3Q==
X-Received: by 2002:adf:ba8d:: with SMTP id p13mr22644583wrg.53.1550598451939; 
	Tue, 19 Feb 2019 09:47:31 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	z15sm2006684wmi.46.2019.02.19.09.47.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Feb 2019 09:47:31 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Feb 2019 18:47:03 +0100
Message-Id: <20190219174712.60694-11-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190219174712.60694-1-alex.kanavin@gmail.com>
References: <20190219174712.60694-1-alex.kanavin@gmail.com>
Subject: [PATCH 11/20] createrepo-c: upgrade 0.12.0 -> 0.12.1
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
X-List-Received-Date: Tue, 19 Feb 2019 17:47:31 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/createrepo-c/createrepo-c_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c_git.bb b/meta/recipes-devtools/createrepo-c/createrepo-c_git.bb
index 3a4cfb7b021..9aa8d2ae73b 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c_git.bb
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c_git.bb
@@ -8,8 +8,8 @@ SRC_URI = "git://github.com/rpm-software-management/createrepo_c \
            file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
            "
 
-PV = "0.12.0"
-SRCREV = "8884a469680b7fb4a10fcbd49dbfef99b035c44b"
+PV = "0.12.1"
+SRCREV = "7744554ddef7c5be2cd7fbcac49c8b24ce60ef88"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


