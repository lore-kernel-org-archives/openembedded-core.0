Return-Path: <alex.kanavin@gmail.com>
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by mail.openembedded.org (Postfix) with ESMTP id 640877F741
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2019 14:45:15 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id l21so2092303lje.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2019 07:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=U9O28oLJxnE8m49zHA8pRUmt3Czfc2Zb/V/B/nP1vgM=;
	b=l2QoAzrdisznIBFDXZLqbhAWYxOyeeEGNSPPIQwbMFWwizqpaDYwlyjopzFljeI8zT
	REoB9Rj6SrebGtRScsSKRrmOBjCuYDI8tp90XRxIuRCwXry8EysRJPoNvKOz+dFT8l2M
	DNht9aaQSSrJL9Ub6WRMFLzmIOlTCwQ9iWZsyuRusBqgB64p9MpwhtJIUG7fhH6w7dZi
	nWCuSds0/0EssOKlr40qqT804/4XNCXew18VGNRQ7QzPRSW3ducLoKGWduB4EaIRgrPQ
	BF98HRhrMzvsvzrrkindF2EiOyLHvvzRLaXNhZJX7mCrtW5ih8s3D7DR2+7sQn/qRN+B
	U1tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=U9O28oLJxnE8m49zHA8pRUmt3Czfc2Zb/V/B/nP1vgM=;
	b=TxNbqWslisPI2G3E5ZHsDvWDnoNJ0RTNizqY//HnJ1bJMHWWJgR3iRgiRNVE81CM5M
	BsMlQW9HjSDQ2Xsyh5cO5oZ7MlLxjsJ7FlQg+TK85fl/yC71jAK9f38CcuqxMy3/1DLa
	XH9Hr2eaGjV+wVEkfCEOmrWt1ZzQ7PqOhVdW9GTgu1gD0FweAMlYTvbt+Xwu/8Kyosye
	qNDWktSiZR7jG4ggADBR96+ssntrN6fTns04NuquPOAp6duwrNGdrnxz8HmKxfqYlJW6
	aABRosKZ8RysN0r4Yt3iGxIbuOxY6zO6OLXRL5BT+p6J3MM1xO9iDM0LEzzNuyacQ/mb
	S3+g==
X-Gm-Message-State: APjAAAU3oOmWKqEu2SeAyOJNVnZFdXPRf1VQnZsfNG0PxL8jtlsAfbUh
	WNla6Yc9XLUfFZgxexedajCTbgYP
X-Google-Smtp-Source: APXvYqwqGSljl2xs2cRgssBC9BBSsLXg0gXg7p0rRP/EnJ0WAt50Pv0vbX3vZFOitb9r2PCDPPU2RQ==
X-Received: by 2002:a2e:8656:: with SMTP id i22mr2212736ljj.32.1568731515761; 
	Tue, 17 Sep 2019 07:45:15 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id a14sm479022lfg.74.2019.09.17.07.45.14
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 17 Sep 2019 07:45:15 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Sep 2019 16:45:05 +0200
Message-Id: <20190917144506.43003-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190917144506.43003-1-alex.kanavin@gmail.com>
References: <20190917144506.43003-1-alex.kanavin@gmail.com>
Subject: [PATCH 3/4] runqemu: unset another environment variable for 'egl-headless'
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
X-List-Received-Date: Tue, 17 Sep 2019 14:45:15 -0000

Some host distributions (opensuse for example) are using 'pkgconf',
which, unlike the original pkg-config, appends PKG_CONFIG_SYSROOT_DIR
to every directory from the .pc file.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 scripts/runqemu | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/runqemu b/scripts/runqemu
index 18091a29c3b..3ebe9d66ff8 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -461,6 +461,7 @@ class BaseConfig(object):
                     del os.environ['PKG_CONFIG_PATH']
                     del os.environ['PKG_CONFIG_DIR']
                     del os.environ['PKG_CONFIG_LIBDIR']
+                    del os.environ['PKG_CONFIG_SYSROOT_DIR']
                 except KeyError:
                     pass
                 try:
-- 
2.17.1


