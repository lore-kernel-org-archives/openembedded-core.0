Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RDz39-00016O-Hw for openembedded-core@lists.openembedded.org;
	Wed, 12 Oct 2011 15:40:47 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9CDfgUx005670 for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2011 14:41:42 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id g-0vk7foPD4w
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2011 14:41:42 +0100 (BST)
Received: from [192.168.1.66] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9CDfdXb005655
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2011 14:41:41 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 12 Oct 2011 14:34:57 +0100
X-Mailer: Evolution 3.1.91- 
Message-ID: <1318426506.23801.158.camel@ted>
Mime-Version: 1.0
Subject: [PATCH] flac: Add missing gettext dependency (requires iconv)
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
X-List-Received-Date: Wed, 12 Oct 2011 13:40:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

diff --git a/meta/recipes-multimedia/flac/flac_1.2.1.bb b/meta/recipes-multimedia/flac/flac_1.2.1.bb
index 652d69a..5a9c66f 100644
--- a/meta/recipes-multimedia/flac/flac_1.2.1.bb
+++ b/meta/recipes-multimedia/flac/flac_1.2.1.bb
@@ -27,7 +27,7 @@ SRC_URI[sha256sum] = "9635a44bceb478bbf2ee8a785cf6986fba525afb5fad1fd4bba73cf71f
 
 S = "${WORKDIR}/flac-${PV}"
 
-inherit autotools
+inherit autotools gettext
 
 EXTRA_OECONF = "--disable-oggtest --disable-id3libtest \
                 --with-ogg-libraries=${STAGING_LIBDIR} \



