Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
	[209.85.210.169])
	by mail.openembedded.org (Postfix) with ESMTP id 89F977E138
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 01:43:31 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id s11so8131286pfm.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 18:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=e8viqatV1XILVibamkzGDgzFkJSZVWzO0eFgf4VlP84=;
	b=oSZq24IwVrzccMVtxpxo5ubYuTbVEMMg2G1D/lCn4NbptJiYmkzpVevs9O2ra77EhD
	QJmj+bnXsMxKj73ICrVKpRhOl4yJzIhReMVVdGnyXnJtf1lINx+DByCZNPIjP39bGBVp
	mfEQhMBvR1APygj5nmOsvvrXm+TsdYjbVbUJnK67QkK4VyIE3Ducav7n+7bd89IC8b9V
	vsTPFEnhH+QpNZoulQNZwzZRHNTxtLnUHmecj4rPvQqsENkB1iSCrvh9Z2tBjMVQ3s3Q
	elY7j/x9v4APBRFXI0qJqh5ecEp2bsIcCY/bZWavr58dIGotC6ynPnPkxd0Eh5sr4R2j
	/y1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=e8viqatV1XILVibamkzGDgzFkJSZVWzO0eFgf4VlP84=;
	b=X8fSlJL4GEWW59G4JHW0b7jUldPwyGruKuJbhbA4z1POH5vksKwFolEcSPVLqzSuGb
	LC1Pw4ji0J83Tt0mesrKpPlmku6l2HzqWUc1tK9fi1gw+OcnCKxctggnZItH+HQ6OsI6
	0C+mNxBpnsOyCqefnOZa6crYEKjQxzHhw6kranWCru+wpoQaPwKHuiQT4CW6och/N14g
	o/RTezntboMUSEiZLqICVG9IkarWPr72S89mwytVZiM5TXluvExK0kv+ws6u6EdQfZbL
	/yc6RRb8HMO9oYXK+xtjUDb2ow8dZgCRdyDQjWNkh4LV9I7W3CnWIt7i1WMLfq8QXKaB
	69bA==
X-Gm-Message-State: APjAAAWoLl96MrHbWXReq6HQ1RHqJyCDBZmtyxG6zVdL1yxctv4c7rAW
	BNMGWzNsMiibe6R15n0FsRS8DJgN
X-Google-Smtp-Source: APXvYqxG+OuLXEJOd185YBO0igi+aG6x0VBgU1htdIPV5fwGppSl2PsMrPlBizuBvpK2KFWXzOoQgQ==
X-Received: by 2002:a63:c046:: with SMTP id z6mr78858839pgi.387.1558403012307; 
	Mon, 20 May 2019 18:43:32 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:503:adbf:6ea3:61d2])
	by smtp.gmail.com with ESMTPSA id
	q5sm23079547pfb.51.2019.05.20.18.43.31
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 20 May 2019 18:43:31 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 May 2019 18:43:14 -0700
Message-Id: <65ee4f853aeeec6e8232985e37bd5d0accdb0fa8.1558402534.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1558402534.git.akuster808@gmail.com>
References: <cover.1558402534.git.akuster808@gmail.com>
Subject: [PATCH 12/15] glib-networking: add PACKAGECONFIG for openssl
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
X-List-Received-Date: Tue, 21 May 2019 01:43:31 -0000

From: Martin Jansa <martin.jansa@gmail.com>

* gnutls from meta-gplv2 isn't new enough for this version of glib-networking:
  meson.build:74:0: ERROR:  Invalid version of dependency, need 'gnutls' ['>= 3.4.6'] found '3.3.30'

* disabling gnutls PACKAGECONFIG isn't an option either:
  meson.build:131:2: ERROR:  Problem encountered: No TLS backends enabled. Please enable at least one TLS backend

* add an option to replace gnutls with openssl

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-core/glib-networking/glib-networking_2.60.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/glib-networking/glib-networking_2.60.1.bb b/meta/recipes-core/glib-networking/glib-networking_2.60.1.bb
index 09af229..e2b4cff 100644
--- a/meta/recipes-core/glib-networking/glib-networking_2.60.1.bb
+++ b/meta/recipes-core/glib-networking/glib-networking_2.60.1.bb
@@ -15,6 +15,7 @@ SRC_URI[archive.sha256sum] = "d71c6b2faa5ac29100314f08a1be020a2afd0291f025614c0a
 PACKAGECONFIG ??= "gnutls"
 
 PACKAGECONFIG[gnutls] = "-Dgnutls=enabled,-Dgnutls=disabled,gnutls"
+PACKAGECONFIG[openssl] = "-Dopenssl=enabled,-Dopenssl=disabled,openssl"
 PACKAGECONFIG[libproxy] = "-Dlibproxy=enabled,-Dlibproxy=disabled,libproxy"
 
 EXTRA_OEMESON = "-Dgnome_proxy=disabled"
-- 
2.7.4


