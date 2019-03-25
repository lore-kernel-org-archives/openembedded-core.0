Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
	[209.85.221.45])
	by mail.openembedded.org (Postfix) with ESMTP id 272C46C3A3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Mar 2019 09:34:51 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id q1so9262083wrp.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Mar 2019 02:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=TIKrDos2jPEjliWhCNffs8TIZ3C66TdahlwTZFHJ5xs=;
	b=keihT8tctbX1kPVs7MBNIwOGUmOC4Q+JfC8GzNC7jDARsSuyKdYKlWVYiSvhDkr95m
	uAdcaJyllRTNj4Pgznul41SlEnncq7psjm3UTwW2u+dhebA5VBidjCXE2+ngJATI56xA
	3VaMqh4UsP3iYbLXihBbL5OGMVXQ956o8ZvYqLWCDwh1pu9RJfgyEROclkVBVPe4CiF9
	CpPlxXkGJWX0VHCVZ90LR1DCblYQCu4zrFmWQmI75ayzkVrLUy4PrkPLFNbKeZSbp/xg
	0dkn/wqlnGu6ig2cUqwaF1y6rLfuFetkP1eUCUSnxisn17NoeODJftPGG05KNk3BfMKr
	pJ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=TIKrDos2jPEjliWhCNffs8TIZ3C66TdahlwTZFHJ5xs=;
	b=qOy89sHvCXZ6xgua9V/mH31DQZAYPnHJjlwSirWLSrbAYr69aiR9WPc8seemTiCOlF
	OLxGikQBSn7/ZHs8mRnfhaVLFS9XVIUDR45sAJZsb2h3tqpS7FKTF4itgjqmgg4CxJUg
	inccwHOO4/rcJJn1C7rTFbPbwbsTe55205mFUdOp+vMGVlgO52qLYq0XALw4tHraeVrg
	jQGBS9YVduhwtaYpPntIkx5GgIh6cX/VT2mUzhrxLeza1XI4Tj8pdivDVBTY4HiKEF0o
	dFkAd987sIPID8akqqZTcXb78J7bI1jGT0K3KSta5IaBmZvDC1pS8mXXoZRMQAXQT0SV
	80kg==
X-Gm-Message-State: APjAAAUxbTS3wqIzCRkXu1gESPcXSq0DWS8L5Z8sKQCKsUGgeMp1R29n
	A5M6zr9BRYCSbqlAolKDAb0KKuW0C3Q=
X-Google-Smtp-Source: APXvYqxy8TJ65QERTFMB+wr8ogkp6iYl28Q3+KDQt+s2ni85ATVFjnc5M8wW0o9fWt/2pNlw9iXZ6A==
X-Received: by 2002:adf:e443:: with SMTP id t3mr15868602wrm.257.1553506492289; 
	Mon, 25 Mar 2019 02:34:52 -0700 (PDT)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
	[91.135.6.246]) by smtp.gmail.com with ESMTPSA id
	f11sm20387266wrm.30.2019.03.25.02.34.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 25 Mar 2019 02:34:51 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Mar 2019 09:34:49 +0000
Message-Id: <1553506489-11218-1-git-send-email-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] systemd: Add PACKAGECONFIG for openssl
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
X-List-Received-Date: Mon, 25 Mar 2019 09:34:52 -0000

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 meta/recipes-core/systemd/systemd_241.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd_241.bb b/meta/recipes-core/systemd/systemd_241.bb
index 6532a58cf8c5..a12b9abee8b8 100644
--- a/meta/recipes-core/systemd/systemd_241.bb
+++ b/meta/recipes-core/systemd/systemd_241.bb
@@ -149,6 +149,7 @@ PACKAGECONFIG[networkd] = "-Dnetworkd=true,-Dnetworkd=false"
 PACKAGECONFIG[nss] = "-Dnss-systemd=true,-Dnss-systemd=false"
 PACKAGECONFIG[nss-mymachines] = "-Dnss-mymachines=true,-Dnss-mymachines=false"
 PACKAGECONFIG[nss-resolve] = "-Dnss-resolve=true,-Dnss-resolve=false"
+PACKAGECONFIG[openssl] = "-Dopenssl=true,-Dopenssl=false,openssl"
 PACKAGECONFIG[pam] = "-Dpam=true,-Dpam=false,libpam,${PAM_PLUGINS}"
 PACKAGECONFIG[polkit] = "-Dpolkit=true,-Dpolkit=false"
 PACKAGECONFIG[portabled] = "-Dportabled=true,-Dportabled=false"
-- 
2.7.4


