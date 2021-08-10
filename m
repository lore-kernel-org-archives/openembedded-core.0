Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
 by mx.groups.io with SMTP id smtpd.web12.6447.1628593436221321173
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Aug 2021 04:03:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=Nrylmb+p;
 spf=pass (domain: pbarker.dev, ip: 66.111.4.29, mailfrom: paul@pbarker.dev)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 62AFB5C0098;
	Tue, 10 Aug 2021 07:03:55 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Tue, 10 Aug 2021 07:03:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=fm1; bh=GyjE7eFoY4vNi9G5IR3CL6ICPF
	A4Ik2uQ1Rh1ls6pik=; b=Nrylmb+pnVoUhCUDc4Gb5eN6StYfoxopoTVCtAOh4S
	e245RynB5Px8D7uBYDBPcs0leyckx3hdN7nhgCAFzAyOj2WBNnVfHn0P8L+QOVOv
	yG6/7j2rV7u7f7XsAaQlP6DFK2rDLBGJBbWPrZF/AjJ71MjdfZ6J1UZV25McF4hm
	x7/Ekb48U40wekpH6wIgS7JtCPCmgVR3PAbQX0vz46Z7jnzMMHVtm32elgE5xHws
	IRqsZnpxLBg0VXOpqZORea1fKEfAyOt6XPCRbNV2Yxgxt4my8H+Jbd9r3thOYzpE
	UATUvnwmD19P+SGp84+D+OCBNhpqdYkvnlNlgSzK3Q4w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=GyjE7eFoY4vNi9G5I
	R3CL6ICPFA4Ik2uQ1Rh1ls6pik=; b=i4WjPBJ2dm7eOz5GSP1/eVNYBMVxf1IyA
	ageOY6CAEgQ0+xyATuFt+i0wy1Oxla4hX4pmi3XG9h0DtdqxvG8uNQTkx7o0ShgI
	PJxp7QB0iuIeDYJBZNMs6OSYlSYXLIU+2Lr7D/fgLIDFNtwkFpSZO+RuHhwxoRRS
	6Be/vIn+oh8sRmx8gxzW9mkOrcaut6aef9u9WmAU8kZZiK8qLMdvQKV1Xvxj1TXb
	0DYzbgV5C3VPT3AJt8hrkx5N/fRVOD6atMgzrDFpTu5UlbOLJIIlWpg68IuvgBPv
	aLIiwJmGJ1i+p3zzWYnqn1v737EQ4TkSRMF5bnwj+qyYO7lHZNpwg==
X-ME-Sender: <xms:G10SYejkT2pvOmdc2PjCq99HHuIRJL4NeR8m8qCZzzOHLnEFubctSA>
    <xme:G10SYfACg4k6XXgLsSp3qlc24blEFeyaN4YJ-BPOd4UMXYMljQe6Q_ORrL5tssOx4
    pXIgib_p8uVn5GJwSY>
X-ME-Received: <xmr:G10SYWE4DA7HvW0B9Hf3YiXfCPQtCHWr235OZovKZwLmOPfGlGBaSOIewfF17tFQRPPruou6uNP39INv53yx9ipLZt0_NpKmAsdFTtJjhQ8yRxnUF5LI0tgGDv0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrjeelgdefiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
    dtnecuhfhrohhmpefrrghulhcuuegrrhhkvghruceophgruhhlsehpsggrrhhkvghrrdgu
    vghvqeenucggtffrrghtthgvrhhnpefhffffvdehvdeufeetgeeggfegvddvheeijeeuie
    fhtdehieevheduieekhfekveenucffohhmrghinhepphihthhhohhnhhhoshhtvggurdho
    rhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepph
    gruhhlsehpsggrrhhkvghrrdguvghv
X-ME-Proxy: <xmx:G10SYXSTKlLfFOBCB7K265ERwgAuJqpN_epXour0qnGd3y3nXlSxjQ>
    <xmx:G10SYbzEzv_zHudHN0SRdH8I2AOCbdjHeFAXINADf8wkYVXeMznRlg>
    <xmx:G10SYV5IAZb8p2ja_z6pGOh5w7-CBxvpgBigntmJkkEGJTa8J94hfQ>
    <xmx:G10SYZag6fMdcdoL5vJ-tcndaUoTAkHRqSaDpFIssDngAYErw2O8eQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 10 Aug 2021 07:03:54 -0400 (EDT)
From: "Paul Barker" <paul@pbarker.dev>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
Subject: [PATCH] pypi: Allow override of PyPI archive name
Date: Tue, 10 Aug 2021 12:03:50 +0100
Message-Id: <20210810110350.7078-1-paul@pbarker.dev>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some packages on PyPI don't follow the usual expectations for archive
naming. For example, the archive for asyncio-mqtt 0.10.0 is named
asyncio_mqtt-0.10.0.tar.gz (with an underscore instead of the dash used
in the package name).

To handle these edge cases a new PYPI_ARCHIVE_NAME variable is
introduced. By default this is set to the expected archive name based on
the PyPI package name, version and extension but it can be set to a
different value if needed in a recipe which inherits the pypi class.

Signed-off-by: Paul Barker <paul@pbarker.dev>
---
 meta/classes/pypi.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/pypi.bbclass b/meta/classes/pypi.bbclass
index 272c220bca..9405d58601 100644
--- a/meta/classes/pypi.bbclass
+++ b/meta/classes/pypi.bbclass
@@ -8,12 +8,12 @@ def pypi_package(d):
 
 PYPI_PACKAGE ?= "${@pypi_package(d)}"
 PYPI_PACKAGE_EXT ?= "tar.gz"
+PYPI_ARCHIVE_NAME ?= "${PYPI_PACKAGE}-${PV}.${PYPI_PACKAGE_EXT}"
 
 def pypi_src_uri(d):
     package = d.getVar('PYPI_PACKAGE')
-    package_ext = d.getVar('PYPI_PACKAGE_EXT')
-    pv = d.getVar('PV')
-    return 'https://files.pythonhosted.org/packages/source/%s/%s/%s-%s.%s' % (package[0], package, package, pv, package_ext)
+    archive_name = d.getVar('PYPI_ARCHIVE_NAME')
+    return 'https://files.pythonhosted.org/packages/source/%s/%s/%s' % (package[0], package, archive_name)
 
 PYPI_SRC_URI ?= "${@pypi_src_uri(d)}"
 
-- 
2.31.1

