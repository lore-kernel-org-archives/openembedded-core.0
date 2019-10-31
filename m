Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by mail.openembedded.org (Postfix) with ESMTP id 2CAD57FA9E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2019 18:35:53 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id v2so7728390lji.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2019 11:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=b9xWJoN7uR4bX3sVS1ntY4kxLr2+Jlo+ZCZHVTfWUgI=;
	b=exPtAYUi6LfdmVTRkWSF0OEwaQKhA8a09t0tcyH1p1pHg/lmYIFQjqqL6lp1+uzNv1
	IGtwrIYcr/1o4VTklGXG/VQtSfpJodSLxiRTvtQuZjZ/UdxDeSFdYQCxrBvhtcBpI9xI
	owwCtSgbeFw2pBl51BjKq49n9a+ht8C0Aa6x1XBjPt5JgsLA5eWUpB4sszav6pUxF01q
	/0KDMgctiNJQ9fEsJ+Q4L5dZqsayGVlJXx0IRp4qf7YoIXpRlU24qvHFF2M/4csQVB+O
	eBGmlDqmi+kMDmoX+drcwqnGO6YRiumqREfppa/CE49vd1higNf94tWbjtUMlcSVpkmU
	KSFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=b9xWJoN7uR4bX3sVS1ntY4kxLr2+Jlo+ZCZHVTfWUgI=;
	b=jY7orm17/IjcA4BLkWFtu/pbzwMKxPkMw3tBYEdIK/TeeiQMyT+UgqWmmtKPIsrqX6
	JxN8+wGJ/pUpwmg3E3pZ7iqMAEHdkhkRZ1pcAk9h3TyM2dJk9B0WkFdxzdUXGj273YX+
	unL4I6i4v8lblHY1AhOiZkzf07+9AKx7ParQAnBJtmoctPP19CsbGfOdXw3lq7nQuKtI
	LtqFVSRSmVAkK/3hS5hbtViPwAdt6wqukhpK4aPQQG9ivw0UerDTiUCMPatXu9WCp0LH
	U8Ldu96QcNnyc4Izc43oNmacbwsxa66abBJCJj4HdR6jZcmxxJ75HobRBHf05sKjg6AQ
	QjUQ==
X-Gm-Message-State: APjAAAUct/wVReSUUirWUEqwqLO6adcz+zpL1oljJ6dAfFAgbtmOUvFZ
	OwNTEZxAiePAdKL8hLsx1RZdl+a7h7I=
X-Google-Smtp-Source: APXvYqzfpeZy+TGF/IUxVAQdCekL8MBSRj3QSM0NJWtwIB5J6FZWn0euj7g2DQ7hyK9oBFD+bnY7sA==
X-Received: by 2002:a2e:481a:: with SMTP id v26mr5070310lja.41.1572546954145; 
	Thu, 31 Oct 2019 11:35:54 -0700 (PDT)
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se.
	[213.89.0.115])
	by smtp.gmail.com with ESMTPSA id e2sm1834344lfc.2.2019.10.31.11.35.53
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 31 Oct 2019 11:35:53 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 Oct 2019 19:35:48 +0100
Message-Id: <20191031183548.6179-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH v2] ofono: update to 1.31
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
X-List-Received-Date: Thu, 31 Oct 2019 18:35:54 -0000

Changelog:
- Fix issue with handling CID 0 context identifier
- Fix issue with handling detach state and running LTE
- Fix issue with handling SIM states and Quectel modems

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../ofono/{ofono_1.30.bb => ofono_1.31.bb}                    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/ofono/{ofono_1.30.bb => ofono_1.31.bb} (92%)

diff --git a/meta/recipes-connectivity/ofono/ofono_1.30.bb b/meta/recipes-connectivity/ofono/ofono_1.31.bb
similarity index 92%
rename from meta/recipes-connectivity/ofono/ofono_1.30.bb
rename to meta/recipes-connectivity/ofono/ofono_1.31.bb
index 10d5c90979..7d0976ad7f 100644
--- a/meta/recipes-connectivity/ofono/ofono_1.30.bb
+++ b/meta/recipes-connectivity/ofono/ofono_1.31.bb
@@ -12,8 +12,8 @@ SRC_URI = "\
     file://ofono \
     file://0001-mbim-add-an-optional-TEMP_FAILURE_RETRY-macro-copy.patch \
 "
-SRC_URI[md5sum] = "2b1ce11a4db1f4b5c8cd96eb7e96ba0c"
-SRC_URI[sha256sum] = "8079735efc5d7f33be9e792e791f2f7ff75c31ce67d477b994673e32319eec5c"
+SRC_URI[md5sum] = "1c26340e3c6ed132cc812595081bb3dc"
+SRC_URI[sha256sum] = "a15c5d28096c10eb30e47a68b6dc2e7c4a5a99d7f4cfedf0b69624f33d859e9b"
 
 inherit autotools pkgconfig update-rc.d systemd gobject-introspection-data
 
-- 
2.17.1


