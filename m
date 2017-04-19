Return-Path: <Gabriel.Ionescu@enea.com>
X-Greylist: delayed 866 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 19 Apr 2017 09:40:02 UTC
Received: from smtp-out10.electric.net (smtp-out10.electric.net
	[185.38.180.36])
	by mail.openembedded.org (Postfix) with ESMTP id 01E2571B13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Apr 2017 09:40:02 +0000 (UTC)
Received: from 1d0lrk-000868-Uj by out10a.electric.net with emc1-ok (Exim 4.87)
	(envelope-from <Gabriel.Ionescu@enea.com>) id 1d0lrk-00086i-VQ
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Apr 2017 02:25:36 -0700
Received: by emcmailer; Wed, 19 Apr 2017 02:25:36 -0700
Received: from [192.36.1.72] (helo=mx-3.enea.com)
	by out10a.electric.net with esmtps (TLSv1:ECDHE-RSA-AES256-SHA:256)
	(Exim 4.87) (envelope-from <Gabriel.Ionescu@enea.com>)
	id 1d0lrk-000868-Uj for openembedded-core@lists.openembedded.org;
	Wed, 19 Apr 2017 02:25:36 -0700
Received: from sestofb11.enea.se (172.21.3.152) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.319.2;
	Wed, 19 Apr 2017 11:25:27 +0200
Received: by sestofb11.enea.se (Postfix, from userid 4567)	id 40E8C44041B;
	Wed, 19 Apr 2017 11:25:27 +0200 (CEST)
From: Gabriel Ionescu <gabriel.ionescu@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 19 Apr 2017 11:25:19 +0200
Message-ID: <1492593919-35164-1-git-send-email-gabriel.ionescu@enea.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: gabriel.ionescu@enea.com does not
	designate permitted sender hosts)
X-Outbound-IP: 192.36.1.72
X-Env-From: Gabriel.Ionescu@enea.com
X-Proto: esmtps
X-Revdns: mx-3.enea.com
X-HELO: mx-3.enea.com
X-TLS: TLSv1:ECDHE-RSA-AES256-SHA:256
X-Authenticated_ID: 
X-PolicySMART: 6551647
X-Virus-Status: Scanned by VirusSMART (c)
X-Virus-Status: Scanned by VirusSMART (s)
Subject: [meta-oe][PATCH 1/1] autogen-native: Set POSIX_SHELL to /bin/sh
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
X-List-Received-Date: Wed, 19 Apr 2017 09:40:04 -0000
Content-Type: text/plain

Setting POSIX_SHELL to "/usr/bin/env sh" fails when tested in
libopts.m4 with test -x "$POSIX_SHELL".

This patch sets the POSIX_SHELL variable to "/bin/sh".

Signed-off-by: Gabriel Ionescu <gabriel.ionescu@enea.com>
---
 meta/recipes-devtools/autogen/autogen-native_5.18.12.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/autogen/autogen-native_5.18.12.bb b/meta/recipes-devtools/autogen/autogen-native_5.18.12.bb
index 853477c..9be03fc 100644
--- a/meta/recipes-devtools/autogen/autogen-native_5.18.12.bb
+++ b/meta/recipes-devtools/autogen/autogen-native_5.18.12.bb
@@ -31,7 +31,7 @@ inherit autotools texinfo native pkgconfig
 export GUILE_LOAD_PATH = "${STAGING_DATADIR_NATIVE}/guile/2.0"
 export GUILE_LOAD_COMPILED_PATH = "${STAGING_LIBDIR_NATIVE}/guile/2.0/ccache"

-export POSIX_SHELL = "/usr/bin/env sh"
+export POSIX_SHELL = "/bin/sh"

 do_install_append () {
 	create_wrapper ${D}/${bindir}/autogen \
--
2.7.4


