Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f172.google.com (mail-wr0-f172.google.com
	[209.85.128.172])
	by mail.openembedded.org (Postfix) with ESMTP id 656B975036
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 May 2018 09:51:32 +0000 (UTC)
Received: by mail-wr0-f172.google.com with SMTP id y15-v6so15275389wrg.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 May 2018 02:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=fj2Eg7ULIK0ly1ZoeG9UwUExXVSwdOGYgIPP+mhpzqs=;
	b=oGS/hfw0MtWd1NkEs3ks289+LBM8cBY5YD2vGHBaVQN7oUbZXnDkqXmPOclt2wLWcn
	sOpR1eMf+hBpqu9D+ZYQhFpRxiH6b0M31JWUvtc8+uZjc9bS/EE0UcupwrJAeRxGQ6IM
	wqOZDiCvevUxk6purknxIOezPtqJI5C3TrDt5uZQAdxB38lvd3/VGPzCCRz7GZ+wS9Kq
	K+TBA4s7Y6hjpzlnXAyg+IdW0eizSxvrvjwy60NNu3YX9aOo3nlkQ71NVipo3KRFHP2I
	z61dSZzm3OuZpb+A11nB5985no8Ys3BQHtpPb5IBQxx/L6EU3LbCKhoczcR+devuGGnd
	ZoRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=fj2Eg7ULIK0ly1ZoeG9UwUExXVSwdOGYgIPP+mhpzqs=;
	b=hhKEdo+wAtj2qYidex9lN/DDg9aBnmHL24MoTWmVZVyTZSEMCN05Qbvyp+JpnfuBE+
	tRbic+R5HWnKE4ppGIO5CAerTmxOBweZiCxUANQHBS5bWllruRoVsvkqB6beCGv3m2YW
	D/aDV8MKfe8cwfIc0WR/S4vRQpwIEbVe6MfEMb6P83jwvi/NJZ9jva0HtFM7ScsDihH8
	kgNVvWZ89NZwkp6QrBzvGmmfA6gqYi5NFRUKX5N+5PqJ3y0wolJa7VB9LhyF4Lj59vX7
	NgQCDb9ukXCLOAjwSlqa61FO21M/15kivpqYuTgWDdiCQr9Zl+XWAtSDTXfejx5mIoZi
	Zm7A==
X-Gm-Message-State: ALKqPwfUJUUZY4MBuoBhtx+qg1BCDMduGL2vlRJ3ZFsn+L24o5PsZQOy
	MfyNtfTpagbXOfStwVzwnI5PC2tr
X-Google-Smtp-Source: AB8JxZpR9ywTucCLZDei5K6lm954EEZd8YuOorI8Afol46qC8a2wQWg9PvZfWjgDT9o7YcRR2Cayiw==
X-Received: by 2002:adf:8186:: with SMTP id
	6-v6mr10646613wra.160.1526377892536; 
	Tue, 15 May 2018 02:51:32 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	x16-v6sm8047693wmc.2.2018.05.15.02.51.31
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 May 2018 02:51:31 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 May 2018 10:51:28 +0100
Message-Id: <20180515095129.3107-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 1/2] packagegroup-self-hosted: remove libsdl
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
X-List-Received-Date: Tue, 15 May 2018 09:51:32 -0000

By default we now build our own libSDL, so don't ship libsdl in the self-hosted group.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/packagegroups/packagegroup-self-hosted.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
index f1273e8a171..28f06d9c5aa 100644
--- a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
@@ -188,8 +188,6 @@ RDEPENDS_packagegroup-self-hosted-graphics = "\
     libgl-dev \
     libglu \
     libglu-dev \
-    libsdl \
-    libsdl-dev \
     libx11-dev \
     adwaita-icon-theme \
     xdg-utils \
-- 
2.11.0


