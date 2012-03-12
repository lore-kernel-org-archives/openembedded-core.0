Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S74Ho-0004Bu-Ox for openembedded-core@lists.openembedded.org;
	Mon, 12 Mar 2012 13:23:36 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2CCEsZk013537
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Mar 2012 12:14:54 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 10995-09 for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Mar 2012 12:14:50 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2CCEk2m013531
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Mar 2012 12:14:47 GMT
Message-ID: <1331554485.15192.18.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 12 Mar 2012 12:14:45 +0000
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH 1/2] mesa-dri-glsl-native: Avoid error when running configure a second time
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 12 Mar 2012 12:23:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This avoids the error:

ln: creating symbolic link `/media/data1/build1/poky/build/tmp/work/x86_64-linux/mesa-dri-glsl-native-7.11-r0/Mesa-7.11/src/glsl//../../configs/current': File exists

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../mesa/mesa-dri-glsl-native_7.11.bb              |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa-dri-glsl-native_7.11.bb b/meta/recipes-graphics/mesa/mesa-dri-glsl-native_7.11.bb
index 07b0761..9194595 100644
--- a/meta/recipes-graphics/mesa/mesa-dri-glsl-native_7.11.bb
+++ b/meta/recipes-graphics/mesa/mesa-dri-glsl-native_7.11.bb
@@ -17,7 +17,7 @@ inherit native
 
 # use default config for native build
 do_configure_prepend() {
-	ln -s ${S}/../../configs/default ${S}/../../configs/current
+	ln -sf ${S}/../../configs/default ${S}/../../configs/current
 }
 
 do_install() {




