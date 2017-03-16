Return-Path: <lnowak.tyco@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id CA07E65D35
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Mar 2017 14:46:24 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id l37so6191108wrc.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Mar 2017 07:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=RYvFjKaf3t4sztEoVHLziFHUH3/eayneBsy8P6M+Buo=;
	b=t+vMRla6Mg0z8rKr4PiB/uP0UK8nasEYJt+p6f9X4e+Ue9OiHMNTvCSFTD5IEFFlZO
	lkfNBpAtSqzaEaPTADw45v9k8k1wxcHDZNLDT3RE56LbGni+QY0/ycr74qGQ/TlK3Bne
	jZLPJjDFB7ugXQAhDJZ2/NN6VRSsAaWqie0hJAoXFWpVPZYqtoOz6AbjytTK6U6DwOnK
	v+QmJM78Yttq0SDqHxdFC6nvhJ+2aZ4mHltk7Ju9o5pyGofsSbN9A8jprz6NyUjt5+WI
	opo/Ws3ikUqUJOepMKfC35Masm8UftH0ujfI48J2WRY8yJRdHbYyehaZzzYnhIGCi2H/
	PBbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=RYvFjKaf3t4sztEoVHLziFHUH3/eayneBsy8P6M+Buo=;
	b=knCBGtw5K3bR93kckiLLhRfhuzWBPfXH9/LbekiB3l8+wHvupo0lFlR2X4KIepsrxE
	h01Fs5firYPXFWizzrcKZWwGig0jqmqq++dYZk74q7l7Fw4jWRKhnoNVKZr7SIWJDZd2
	iI3+sWSRaPukF9s4/Gvx5LjIX58sdiVWeb12cQRj4qF1hp+Czwi6jy1/QRaOeW/ZR2hQ
	7Oq3I6iZg3LGVExvdwPN7cj72bFFzoapWjSbdtb8wuW4iuIgatEv8sQqpgbjPDAG6aUr
	FheeDqcUor0be1LSh2qKZyVSozqIXrzteWw5OeJfAO3u2vtQVkim09BZIF9aKxQg+ihu
	TgOg==
X-Gm-Message-State: AFeK/H310MZiICogCh2jDAYf78eV6qwCVOBPn/GgXNBk8Ivf0RU6f91QoXUeTjMTv8LytA==
X-Received: by 10.223.164.201 with SMTP id h9mr8020735wrb.175.1489675585162;
	Thu, 16 Mar 2017 07:46:25 -0700 (PDT)
Received: from ln-xu1604.TYCOFS.COM ([109.77.49.214])
	by smtp.gmail.com with ESMTPSA id
	g45sm6440537wrd.11.2017.03.16.07.46.24
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 16 Mar 2017 07:46:24 -0700 (PDT)
From: Lukasz Nowak <lnowak.tyco@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Mar 2017 14:46:18 +0000
Message-Id: <1489675578-20399-1-git-send-email-lnowak.tyco@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] ofono: Update ofono_git recipe to latest
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
X-List-Received-Date: Thu, 16 Mar 2017 14:46:25 -0000

From: Lukasz Nowak <lnowak@tycoint.com>

Tested with ofono master branch after 1.19.

Recipe disabled by default with:
DEFAULT_PREFERENCE = "-1"

Signed-off-by: Lukasz Nowak <lnowak@tycoint.com>
---
 meta/recipes-connectivity/ofono/ofono_git.bb | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-connectivity/ofono/ofono_git.bb b/meta/recipes-connectivity/ofono/ofono_git.bb
index beafb77..a1e320c 100644
--- a/meta/recipes-connectivity/ofono/ofono_git.bb
+++ b/meta/recipes-connectivity/ofono/ofono_git.bb
@@ -1,14 +1,10 @@
 require ofono.inc
 
 S	 = "${WORKDIR}/git"
-SRCREV = "14544d5996836f628613c2ce544380ee6fc8f514"
-PV	 = "0.12-git${SRCPV}"
-PR = "r5"
+SRCREV = "149002c1100d0ff5e8c7ee4a096e34012853cc88"
+PV	 = "1.19-git0+${SRCPV}"
 
 SRC_URI  = "git://git.kernel.org/pub/scm/network/ofono/ofono.git \
 	    file://ofono"
 
-do_configure_prepend () {
-  ${S}/bootstrap
-}
-
+DEFAULT_PREFERENCE = "-1"
-- 
2.7.4


