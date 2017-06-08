Return-Path: <tanuk@iki.fi>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
	[66.111.4.25])
	by mail.openembedded.org (Postfix) with ESMTP id 6C31478257
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jun 2017 13:19:36 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id DA196208C7
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jun 2017 09:19:37 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
	by compute5.internal (MEProxy); Thu, 08 Jun 2017 09:19:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=date:from:in-reply-to:message-id
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
	:x-sasl-enc; s=fm1; bh=ocmf/Nk0tivCSmwbzg1skB6fXnRWR5OVWoWnzyyDn
	Ls=; b=WmDuWUqGp9UJ8E5+Uy+vjwvAG3LAYebofnvFzB2P5DcQ6jdP+ll5h209G
	1O/VnrWa7zYflZ/bBFKY3wv1VyMD4mHGWUaYOp8JEvpzBhCB4HR9Ree28SFERLxU
	Ayus8PTE0ZUQeoDFC3Hc3eH7BcDP7dW01sZRQHrBvc5a3h4wdzu1lloDtIZEM5DD
	xTMf34Stv5HE6mR9zL5E0bYrKGTIwX0c7yqdtPNnKczWB9t3tC8QyROR8f8ZWodo
	AAaRCEQQdAeRas7pSDvrzs3MwUsOhg7uSFuehD9D28Izk1FtQxDlOJBRsXindAhD
	j8g+ydZkcecru5E4qtk/8Cobzpq7Q==
X-ME-Sender: <xms:6U45WXjQGOGKy0w53hQAYSVpM5wkpSu0FYWXf_IhCwJn0lhpQQzWww>
X-Sasl-enc: 0QbL8CueK28InyGXGuwAlMSi+z6+kcK4N424x6C4ltuY 1496927977
Received: from localhost.localdomain (unknown [192.40.95.39])
	by mail.messagingengine.com (Postfix) with ESMTPA id 40BD07E7B1
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jun 2017 09:19:37 -0400 (EDT)
From: Tanu Kaskinen <tanuk@iki.fi>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Jun 2017 16:19:28 +0300
Message-Id: <fb9849e3f0e8af78cc58ab20da82db0e87d27e92.1496927857.git.tanuk@iki.fi>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1496927857.git.tanuk@iki.fi>
References: <cover.1496927857.git.tanuk@iki.fi>
Subject: [PATCH 2/3] alsa-utils: 1.1.3 -> 1.1.4
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
X-List-Received-Date: Thu, 08 Jun 2017 13:19:36 -0000

Changelog: http://alsa-project.org/main/index.php/Changes_v1.1.3_v1.1.4

Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
---
 .../alsa/{alsa-utils-scripts_1.1.3.bb => alsa-utils-scripts_1.1.4.bb} | 0
 .../alsa/{alsa-utils_1.1.3.bb => alsa-utils_1.1.4.bb}                 | 4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/alsa/{alsa-utils-scripts_1.1.3.bb => alsa-utils-scripts_1.1.4.bb} (100%)
 rename meta/recipes-multimedia/alsa/{alsa-utils_1.1.3.bb => alsa-utils_1.1.4.bb} (97%)

diff --git a/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.1.3.bb b/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.1.4.bb
similarity index 100%
rename from meta/recipes-multimedia/alsa/alsa-utils-scripts_1.1.3.bb
rename to meta/recipes-multimedia/alsa/alsa-utils-scripts_1.1.4.bb
diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.1.3.bb b/meta/recipes-multimedia/alsa/alsa-utils_1.1.4.bb
similarity index 97%
rename from meta/recipes-multimedia/alsa/alsa-utils_1.1.3.bb
rename to meta/recipes-multimedia/alsa/alsa-utils_1.1.4.bb
index e6dd5b0a87..c749f32120 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils_1.1.3.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils_1.1.4.bb
@@ -23,8 +23,8 @@ SRC_URI = "ftp://ftp.alsa-project.org/pub/utils/alsa-utils-${PV}.tar.bz2 \
            file://0001-alsactl-don-t-let-systemd-unit-restore-the-volume-wh.patch \
           "
 
-SRC_URI[md5sum] = "2bf94d3e3410dcc74bb0dae10d46a979"
-SRC_URI[sha256sum] = "127217a54eea0f9a49700a2f239a2d4f5384aa094d68df04a8eb80132eb6167c"
+SRC_URI[md5sum] = "01e3934ca5bd22a80c27289d1b0adcdc"
+SRC_URI[sha256sum] = "a7831044de92c5bf33bf3365a3f36e49397f4191e934df460ae1ca15138c9d9d"
 
 # On build machines with python-docutils (not python3-docutils !!) installed
 # rst2man (not rst2man.py) is detected and compile fails with
-- 
2.11.0


