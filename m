Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
	[209.85.128.42])
	by mail.openembedded.org (Postfix) with ESMTP id E1F817C89C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2019 00:08:52 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id q187so748132wme.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2019 16:08:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=9PuTXBV4kvuJQ3ZzGf7wqbB1z5WFNn2kYcnyy+/u9dw=;
	b=KcSGXO4Leu/5PPAhE1MD5MJKtU0n48BoFau9RfH2559vKaOehMEJjOrdJ0bArmw/mo
	V6uII4GWTf8DYnXOCLJdKAEoOyvPL84mVtKRT3Tr+1aUVeV8enBxMqJqVA3nT9W3htAQ
	Jr9+PE6/2TxOPfzO31jZi9VRg3h5Nqp5mj7Ek=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=9PuTXBV4kvuJQ3ZzGf7wqbB1z5WFNn2kYcnyy+/u9dw=;
	b=IO4FBEQqLn9V7Knj2mvi6BjlPy4MJLqaWin3ewctgm2wJaPln+20nVCfkvKJBlzkrY
	1oEvx4Pz1Iff0j8GKjj58hcro488x29I8AZ4xUNYqW+dAVSC53j8QVMvN92YTMuePlUp
	tJoFnDIIZuU7Syo0fSR3b2pkVuubQTTUg3RsbFMWHEDqR7yKjf5LPGmZ0QEnroklLl0s
	NDCANq2rOFmgdROUj7xcp7GMWtaK8HFXAd53YPbi3rHspjet0ouVimU6neHtohmsgVMr
	iINLA0cWMHpahROeYJ243bHo8d7fur4oT5bhnWUv2lX18gOyLGf+pDdoYgUrvbgSjvRR
	9uAg==
X-Gm-Message-State: AHQUAuYbvDeXbr6V4KHadQXN1XXVqb38FwNb2mJ6Cmu8b9uspn0ied+w
	3TfHlrH0WubaVTBhN6rtxHkqzIiC6UI=
X-Google-Smtp-Source: AHgI3IYqnkJjLfm1ViWKNLFMvWK68LXTk5kaBNy9ZAvL8dh3B9ePpLsknVLihvBUrOObTwo/Stt+Qw==
X-Received: by 2002:a7b:c315:: with SMTP id k21mr716513wmj.145.1550534933046; 
	Mon, 18 Feb 2019 16:08:53 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	t18sm1626860wmt.8.2019.02.18.16.08.51
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Feb 2019 16:08:52 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Feb 2019 00:08:47 +0000
Message-Id: <20190219000849.6177-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190219000849.6177-1-richard.purdie@linuxfoundation.org>
References: <20190219000849.6177-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 3/5] gtk+3: upgrade 3.24.1 -> 3.24.5
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
X-List-Received-Date: Tue, 19 Feb 2019 00:08:53 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-gnome/gtk+/{gtk+3_3.24.1.bb => gtk+3_3.24.5.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/gtk+/{gtk+3_3.24.1.bb => gtk+3_3.24.5.bb} (83%)

diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.24.1.bb b/meta/recipes-gnome/gtk+/gtk+3_3.24.5.bb
similarity index 83%
rename from meta/recipes-gnome/gtk+/gtk+3_3.24.1.bb
rename to meta/recipes-gnome/gtk+/gtk+3_3.24.5.bb
index 6de3e73f2f0..799cbd4707e 100644
--- a/meta/recipes-gnome/gtk+/gtk+3_3.24.1.bb
+++ b/meta/recipes-gnome/gtk+/gtk+3_3.24.5.bb
@@ -7,8 +7,8 @@ SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk+/${MAJ_VER}/gtk+-${PV}.tar
            file://0002-Do-not-try-to-initialize-GL-without-libGL.patch \
            file://0003-Add-disable-opengl-configure-option.patch \
           "
-SRC_URI[md5sum] = "9dfe16f486573815f242fa400763feb7"
-SRC_URI[sha256sum] = "68387be307b99aadcdc653561d7a2a7f0113b93561fb18ded7075ec9ced5b02f"
+SRC_URI[md5sum] = "32862355c08f6af3e7848c695cd4081b"
+SRC_URI[sha256sum] = "0be5fb0d302bc3de26ab58c32990d895831e2b7c7418d0ffea1206d6a3ddb02f"
 
 S = "${WORKDIR}/gtk+-${PV}"
 
-- 
2.20.1


