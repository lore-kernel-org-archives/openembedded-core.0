Return-Path: <sstncr@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id B6BD375556
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2018 14:11:17 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id n5-v6so702507wmc.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2018 07:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=BCYxUS6S+VKbMtB96iI3a8Utebu8sBc62+ZUFW4O4KI=;
	b=ainxr+Qo26gJ5YU/aXDbx93yschqxaZH8RSYbDogop7pE1tLCs35HJZxh99Su2VULQ
	7yKgqrQs1vnvKw1QrYXNgH5gx9zUre6hlNZAWpM+pJarKOkwbGjOn7bGJ7mYkRHdEldH
	Xyq9siQpM1Jbjh+F+wGkA3iRYX9fHz6MUNThm8HBFBerGNLJeSW+LZm5tpXE+c+0opi5
	E22QkiS1nkms4Ml22uPYvd3WMsHees46q6LUPh0lnoKNPu4mRQH8nwmjcQNtNkJZvlCM
	faNIEcUTZynTmPwZr1mEggY/B1vaa+IeXHFabOJrsLdarSHzLdtl8/Ze8aIYTJDexbAv
	P+dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=BCYxUS6S+VKbMtB96iI3a8Utebu8sBc62+ZUFW4O4KI=;
	b=tXV8Vb6z9i+Ks+B6EG8PhDysSee2Q+ZL3CgMEPO68urQwRP8A0FblfdINhfbVqSrck
	DMWB9Hpc+VabeoNad7CWQpgQXVXBPFGWy3qJzscDG6kd6ZCuKE48lUqzCxyj5usKp0S5
	FGCF6d1OebzNYyXewkY90c0XdBRpY7Ak+WUnen9B6dfbwIlSD+LrwkOACZEewn7e+Fey
	hlSjFrNYGOJxdDyKethGno7XaAURY5PqMa6FeJC70oUCN8PBpED4hdw92FdiSYZcoMYZ
	GINI+GYhM3avE1ppKcGRW/0/hny8emxBIFdI+XtqsOC9qlJeik20wPLMw9YuPvOqBem1
	6Fag==
X-Gm-Message-State: APt69E1fk/vA56T/kq6WOAX1FETfiV4hOPhTTn8joLYP/tPeNIg+pJMi
	uet+hTW+2cH+dzVqsJ5wmi1L0NZD
X-Google-Smtp-Source: ADUXVKIZfa5+dXyOqtnY7b5GZMAnwRnVfa8aSrUlhi+fZVGL0lPIwNz3awwBJLfUZ9rsM2OZMJCukQ==
X-Received: by 2002:a1c:4108:: with SMTP id
	o8-v6mr12848179wma.50.1529417478283; 
	Tue, 19 Jun 2018 07:11:18 -0700 (PDT)
Received: from ubuntu-xenial.corp.fitbit.com ([86.120.134.70])
	by smtp.gmail.com with ESMTPSA id
	f81-v6sm276112wmh.32.2018.06.19.07.11.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 19 Jun 2018 07:11:17 -0700 (PDT)
From: Stefan Stanacar <sstncr@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jun 2018 14:09:26 +0000
Message-Id: <20180619140926.17032-1-sstncr@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [rocko][PATCH] default-versions.inc: use weak assignments to allow overwrite
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
X-List-Received-Date: Tue, 19 Jun 2018 14:11:18 -0000

default-versions.inc is included by defaultsetup.conf which in bitbake.conf
is included after local/machine/distro.conf.
If these are hard assignments distros can's overwrite them.

Signed-off-by: Stefan Stanacar <sstncr@gmail.com>
---
 meta/conf/distro/include/default-versions.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/default-versions.inc b/meta/conf/distro/include/default-versions.inc
index 868073843a..3d88e8f656 100644
--- a/meta/conf/distro/include/default-versions.inc
+++ b/meta/conf/distro/include/default-versions.inc
@@ -2,6 +2,6 @@
 # Default preferred versions
 #
 
-PREFERRED_VERSION_openssl = "1.0.%"
-PREFERRED_VERSION_openssl-native = "1.0.%"
-PREFERRED_VERSION_nativesdk-openssl = "1.0.%"
+PREFERRED_VERSION_openssl ?= "1.0.%"
+PREFERRED_VERSION_openssl-native ?= "1.0.%"
+PREFERRED_VERSION_nativesdk-openssl ?= "1.0.%"
-- 
2.17.1


