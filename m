Return-Path: <enrico.scholz@sigma-chemnitz.de>
X-Greylist: delayed 1035 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 23 Jun 2017 11:36:36 UTC
Received: from mail.cvg.de (mail.cvg.de [193.158.56.148])
	by mail.openembedded.org (Postfix) with ESMTP id 8EA58780A1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Jun 2017 11:36:36 +0000 (UTC)
Received: from mail-mta-0.intern.sigma-chemnitz.de
	(mail-mta-0.intern.sigma-chemnitz.de [192.168.12.76])
	by mailout-1.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	v5NBJLgY007556
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK) for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Jun 2017 13:19:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1498216762;
	bh=ZEdIVqwpjZGBWjASDpOQcupiPwpqAbCGIloxm454eR0=;
	h=From:To:Cc:Subject:Date:Message-Id:Sender;
	b=kqGL5i8uLXhYxRqROW4zxDNGDrWy68+W6UwfXONm3Zxp8EOdWdmbR586GWI4SwFvB
	UJcs8QtQ1F0/oz0OSkaL/cRxY6IpI7D2odbRd9DoipcS0qewZBXhW/6qUpcXl3q225
	1pOPagaYSXIsC6/Si084pmtWkblFhLtZ+cFkgcuU=
Received: from reddoxx.intern.sigma-chemnitz.de
	(reddoxx.intern.sigma-chemnitz.de [192.168.0.193])
	by mail-mta-0.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	v5NBJFQL012621 for <openembedded-core@lists.openembedded.org> from
	enrico.scholz@sigma-chemnitz.de; Fri, 23 Jun 2017 13:19:15 +0200
Received: from mail-msa-0.intern.sigma-chemnitz.de ( [192.168.12.77]) by
	reddoxx.intern.sigma-chemnitz.de
	(Reddoxx engine) with SMTP id 30925F9FB75;
	Fri, 23 Jun 2017 13:16:04 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail-msa-0.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	v5NBJCg0012618
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 23 Jun 2017 13:19:13 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.87) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1dOMcK-0005x7-R7; Fri, 23 Jun 2017 13:19:12 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Jun 2017 13:19:12 +0200
Message-Id: <20170623111912.22840-1-enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 2.9.4
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-Spam-Score: -0.5
X-Spam-Tests: AWL,BAYES_00,DKIM_ADSP_ALL,SPF_NEUTRAL,T_RP_MATCHES_RCVD
X-Scanned-By: MIMEDefang 2.79
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: [PATCH] tzcode-native: quote ${CC}
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
X-List-Received-Date: Fri, 23 Jun 2017 11:36:38 -0000

build fails else with

| + make -j 8 -l 6 cc=ccache gcc
| make: *** No rule to make target 'gcc'.  Stop.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 meta/recipes-extended/tzcode/tzcode-native_2017b.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/tzcode/tzcode-native_2017b.bb b/meta/recipes-extended/tzcode/tzcode-native_2017b.bb
index 2084f79..165d2c6 100644
--- a/meta/recipes-extended/tzcode/tzcode-native_2017b.bb
+++ b/meta/recipes-extended/tzcode/tzcode-native_2017b.bb
@@ -18,7 +18,7 @@ S = "${WORKDIR}"
 
 inherit native
 
-EXTRA_OEMAKE += "cc=${CC}"
+EXTRA_OEMAKE += "cc='${CC}'"
 
 do_install () {
         install -d ${D}${bindir}/
-- 
2.9.4


