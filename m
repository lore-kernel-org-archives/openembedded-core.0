Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
 by mx.groups.io with SMTP id smtpd.web08.2771.1628649588735151855
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Aug 2021 19:39:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stwcx.xyz header.s=fm2 header.b=kDg+NMj6;
 spf=pass (domain: stwcx.xyz, ip: 64.147.123.24, mailfrom: patrick@stwcx.xyz)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.west.internal (Postfix) with ESMTP id 21FA8320092E;
	Tue, 10 Aug 2021 22:39:48 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Tue, 10 Aug 2021 22:39:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=fm2; bh=CPT8KpB4bPVM4
	NDEkuVI6JcrkjFm7DVKffKkOsDPIpY=; b=kDg+NMj69VQp8FB+zDkJvgVY7kI5s
	3id84UkXB/ZkwOv70QtPna/eML33J4w3hTA7JRTkKWMvPuDYtIN2XsWo/VYMRUoH
	vBqutijsOlScE+qdRTL1+Y54ru2SUtgPDnEF7S4fxQyZlqc9PPSM4C9vid7tZdXY
	JlWEld2uy004W/sAtrPfpIhoZ5DSK/ER4f5O0nfA3lzBNvB7gCDZCZrq2GlfTtA3
	7JUlvpEsPEBjlP5Y3FzaZy52WjkrFzxzNReKvKh9xNit6/gOEWt+ykk7VTn69WRb
	0DdS/2+54ZKKiQW3Yq82sweQG/qaecpL88izZLmIlOOkVFqwGqU9WXpfg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:in-reply-to:message-id:mime-version:references:subject:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; bh=CPT8KpB4bPVM4NDEkuVI6JcrkjFm7DVKffKkOsDPIpY=; b=Q2S5u1Do
	8e2LCxoUAJOmUQ11SOzMKqdbhjkzc7tWuMUW7GfMYSmkTiTDOYQdgItVD4hi69lQ
	g4Hedz+9iPkLLx3o79/juNjfhsXdNK1kU7d4Nq+nfVE/G6x9H/KCTy6ZruZNs0v7
	8QZ8mX0x0hx1ShcPN5HDT4/GycoXvJaLJKaiJaNfW77vmQcXZiEcutoAi9/fUGls
	UueKrA1oxph/wYxtBbw6YAAiVcKuLqqxHEz+VBtCAtDgBKuc33k+9qP+k/voH5Cb
	xLSZ0NAGHv4LOfRf3DB+3aVkc1vaJrRuwQ/cz46B2J8wsJNjUsPCYxwVzfNowTlz
	c1oXfRLN/oOs4w==
X-ME-Sender: <xms:czgTYcqdUyQ7RYda5aRK7KZ90TE6grVd6V49yJTGWUGN2Bz4mxCbZg>
    <xme:czgTYSrHi4FnnEnG4gqJpjRuZ-7IosVb2gjQFepe13JwHwJI4gbt78e-2k7l7R9Oj
    e39w9q7qgcV7oaPjWs>
X-ME-Received: <xmr:czgTYRPhi7v1nwVQ__TOrS6l85orLlVNQcaWXMYwjoUObVVAjb_rZpRQrzw34kI-v0DV3tfBBGR8WwYMMM2gdGzPGE-KmfnN8kyQq44V5-2pZg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrkedtgdehlecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecufghrlhcuvffnffculdejtddmnecujfgurhephffvuf
    ffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefrrghtrhhitghkucghihhllhhi
    rghmshcuoehprghtrhhitghksehsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpe
    duhfdvieejffeuvedvveetkeeltedvffeuhffhgeduhfdvieetudfgheeivedvieenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitg
    hksehsthiftgigrdighiii
X-ME-Proxy: <xmx:czgTYT5TLcPDijvd-UlTmh9sE08I-lha8F-guZGL9Z_8w3njzvxH6A>
    <xmx:czgTYb7pgZAPAi0tLxpj0SdZKHQCq1R28vMsNlQN3Fa1e5ZSC54LMA>
    <xmx:czgTYTjWX_-phcijH70oQeE9xy4EKgws9oG82rg9qwrKOIMCU7aQZA>
    <xmx:czgTYYjt3opEcdvMweePmq54AfXvOBEYhdb9xpsUFUBM-7TptOnMPg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 10 Aug 2021 22:39:47 -0400 (EDT)
From: "Patrick Williams" <patrick@stwcx.xyz>
To: openembedded-core@lists.openembedded.org
Cc: Patrick Williams <patrick@stwcx.xyz>
Subject: [PATCH 2/2] systemd: set zstd as default PACKAGECONFIG
Date: Tue, 10 Aug 2021 21:39:38 -0500
Message-Id: <20210811023938.2800001-2-patrick@stwcx.xyz>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210811023938.2800001-1-patrick@stwcx.xyz>
References: <20210811023938.2800001-1-patrick@stwcx.xyz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Switch the default PACKAGECONFIG for compression feature from xz
to zstd.  zstd is significantly faster than xz with only slightly
worse compression ratios.  It is therefore much better suited for
activities like systemd-journald.

Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
---
 meta/recipes-core/systemd/systemd_249.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_249.1.bb b/meta/recipes-core/systemd/systemd_249.1.bb
index b305092935..a6759c7a35 100644
--- a/meta/recipes-core/systemd/systemd_249.1.bb
+++ b/meta/recipes-core/systemd/systemd_249.1.bb
@@ -93,7 +93,7 @@ PACKAGECONFIG ??= " \
     userdb \
     utmp \
     vconsole \
-    xz \
+    zstd \
 "
 
 PACKAGECONFIG:remove:libc-musl = " \
-- 
2.31.1

