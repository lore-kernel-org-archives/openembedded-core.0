Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
	[209.85.221.42])
	by mail.openembedded.org (Postfix) with ESMTP id 10AEB7E94E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 13:24:58 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id x4so3389102wrt.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 06:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Yc8wnsbyYasW3UFf5WbbCpQYDJO5Z31OY0b0npXSz+Q=;
	b=ZXiQTovQwIEihLl2aYZtLZqv53hpQT0zn3eiVVs5cnjFdOtv2DwA25xOT3nDtWDIW9
	J1NsyX20XsT6x9dULa9GsYJ5yGYQglIH7o4GTqn/QxlU980UrORHbgHC1doRynj5XoDe
	1c9yM47nh+dDQBnlAQzxzVswxVbpuZKntc1jx7xNhWrss//NhEJ+d4yXCcpCVxbV6WGJ
	x96gBnAQtiPRtVI1s8mLYYrMCeUy0dNXCsdoaJnra9qI/HcPc7Qa5F/DNXISqlfIK0r7
	nsNA5v7jEw8XgjclRHmFjsucclaCHLYKaMw8fSQy1/awqwMf6zC/XEKlUAzmXCPfCtPT
	tY5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Yc8wnsbyYasW3UFf5WbbCpQYDJO5Z31OY0b0npXSz+Q=;
	b=r7h3u2P2xfmzW9uAFsgTxkOQhY5rgj2aAB5PNTRGNYQArN0ciyn8jftpItTVvi3zGO
	3M6cqkeOGpgOG2xarXXtCmgLXf9WfDYB7QMKAsGYsnFxzJmxMTVjDNy/8p9atN5g1hTX
	SyX9BRBeVCZTGiUG/OKKoQL0aBZTVkPE/GFgpmIvdzyIfcEQicfoM6LBVJs2Gcl22Be0
	g3Ertk1Ky3EOvnPJKFRNEbJVr6uTF9O/y5v2wD5JufXv513CFKTMza67I5EqamrPWCfl
	pHUh9lwxoOfFZfu3cPrzUBOheH4y4KeSuzblZ3PzqCabKwrb0i/mwVzXtRJIOQgF583v
	bScg==
X-Gm-Message-State: APjAAAUNinJBtnj0mO3TjVo9HY5nSEre0g4rEWnvqqkEwcNw2ThDjJDD
	XeJvMgxnXePjeAwcOh85vyDnGnI9AH8=
X-Google-Smtp-Source: APXvYqw99IluiiSbFcWrrsztRxBHqbVJeaPpK2DpsLIlkm4zW2375kntAvpUUGuU/iHV1kSjZxBMVw==
X-Received: by 2002:adf:8b83:: with SMTP id o3mr81536276wra.278.1560950699438; 
	Wed, 19 Jun 2019 06:24:59 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id q1sm1588953wmq.25.2019.06.19.06.24.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Jun 2019 06:24:58 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Jun 2019 15:24:42 +0200
Message-Id: <20190619132450.130226-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/9] createrepo-c: upgrade 0.14.0 -> 0.14.2
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
X-List-Received-Date: Wed, 19 Jun 2019 13:24:59 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../{createrepo-c_0.14.0.bb => createrepo-c_0.14.2.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/createrepo-c/{createrepo-c_0.14.0.bb => createrepo-c_0.14.2.bb} (95%)

diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c_0.14.0.bb b/meta/recipes-devtools/createrepo-c/createrepo-c_0.14.2.bb
similarity index 95%
rename from meta/recipes-devtools/createrepo-c/createrepo-c_0.14.0.bb
rename to meta/recipes-devtools/createrepo-c/createrepo-c_0.14.2.bb
index 2a3007c38df..80c559fefb8 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c_0.14.0.bb
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c_0.14.2.bb
@@ -8,7 +8,7 @@ SRC_URI = "git://github.com/rpm-software-management/createrepo_c \
            file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
            "
 
-SRCREV = "8cffea9751b14366a7f6f3664f5d39fe4f0f9253"
+SRCREV = "f390af98c8f1bb04010e293ea864eae160f75879"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


