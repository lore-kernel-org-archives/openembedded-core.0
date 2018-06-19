Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f43.google.com (mail-pl0-f43.google.com
	[209.85.160.43])
	by mail.openembedded.org (Postfix) with ESMTP id 6F0327526F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2018 04:10:16 +0000 (UTC)
Received: by mail-pl0-f43.google.com with SMTP id f1-v6so10194367plt.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jun 2018 21:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Rdia0wBMJGxscil311/hyxXNaH21z35qNpq7jKTANws=;
	b=vfnL919sn+QuS0R2fvfUBI13lfVznlsOC+hEceE9RnodB43EH2C3Zo3WEKE8v7wUjJ
	cZgwGHLjnznKVxrAIIXe/0kiZzhLwle9IzmQP1CSkqe+TfCLs24xzjFzGOdDaS5VvDR1
	VvhL4ODKNDFC2B8HDC2qY/eIo1W4TsgMqB4+nup2cVvVQB+UhSINZuw7wHV/hnNawR+i
	rzm+ETQOOjTMOaxyeUF22OMKrbJnN63HEIkgIf05HO2cwDM/HAsotc5U0MDQ/VPSEMB4
	FsNKu7V8aA1iZ6tBQ+ffsvV0i4eHR4EvvUgYCU+aH9IIJGeLKhgn2EE2btkNSABfIDBx
	ufNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Rdia0wBMJGxscil311/hyxXNaH21z35qNpq7jKTANws=;
	b=tNRHhtraLAJxWBcl8zGxUUm96hKOhPzoaGO8ZG3VS8irmd0W6Eb9WiGNlDGZCYBeEc
	BPR9Ylv1ILHqice6mbhQdWLC+2UHl50w6PIOPaRZX9wmR24nIa0Na+tscF8o6BbmlS2l
	kghoNf6mivObZiPvOLzARd9+1HBQUxWho2337qTZbmPb8H0pgpi97Fjjf3QsDFV4dYVG
	jCGFYPrS11qA+HCe5p2vvdsCflfnfph0wjoB3SChGA9kQ74hDASurYzNwvfQYN78EdTW
	7VP5kfsPCaUanBHNk3Qcq882VE8MKF/vCnBBmVamYnZOlY62fTw/g3rE5MBy+v6as8rb
	KFtg==
X-Gm-Message-State: APt69E1gCFEjhC5wHsx5qYRCeepCh+4TIog1yVHiJ4fFkroRUoGydDwA
	IMDL2fz98yM0hJXgGN52LcU=
X-Google-Smtp-Source: ADUXVKI8lsCw8aieZ1Y8gfDzRVihT6TgVE3kac0v6XaXo0Nvh0yAiyBmSDwvYivbIL9TulQ7v05Xng==
X-Received: by 2002:a17:902:aa83:: with SMTP id
	d3-v6mr16868392plr.323.1529381417596; 
	Mon, 18 Jun 2018 21:10:17 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:59dc:e6d2:872c:4e7f])
	by smtp.gmail.com with ESMTPSA id
	f3-v6sm23326731pfn.149.2018.06.18.21.10.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 18 Jun 2018 21:10:16 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-core@lists.openembedded.org
Date: Mon, 18 Jun 2018 21:10:10 -0700
Message-Id: <1529381411-5045-5-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1529381411-5045-1-git-send-email-akuster808@gmail.com>
References: <1529381411-5045-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH 5/6] xkbcomp: update to 1.4.2
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
X-List-Received-Date: Tue, 19 Jun 2018 04:10:16 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-graphics/xorg-app/{xkbcomp_1.4.1.bb => xkbcomp_1.4.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-app/{xkbcomp_1.4.1.bb => xkbcomp_1.4.2.bb} (77%)

diff --git a/meta/recipes-graphics/xorg-app/xkbcomp_1.4.1.bb b/meta/recipes-graphics/xorg-app/xkbcomp_1.4.2.bb
similarity index 77%
rename from meta/recipes-graphics/xorg-app/xkbcomp_1.4.1.bb
rename to meta/recipes-graphics/xorg-app/xkbcomp_1.4.2.bb
index c35d5d7..eaf8eaa 100644
--- a/meta/recipes-graphics/xorg-app/xkbcomp_1.4.1.bb
+++ b/meta/recipes-graphics/xorg-app/xkbcomp_1.4.2.bb
@@ -13,5 +13,5 @@ DEPENDS += "libxkbfile"
 
 BBCLASSEXTEND = "native"
 
-SRC_URI[md5sum] = "07df9790d30f9a369d20a418af784de0"
-SRC_URI[sha256sum] = "748dc4cf58ac95684106bd9cf163ac6ab7de9a236faec02a6f4d4006d63a5736"
+SRC_URI[md5sum] = "12610df19df2af3797f2c130ee2bce97"
+SRC_URI[sha256sum] = "6dd8bcb9be7e85bd7294abe261b8c7b0539d2fc93e41b80fb8bd013767ce8424"
-- 
2.7.4


