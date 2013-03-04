Received: from mail-wi0-f178.google.com ([209.85.212.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UCVBD-00078g-8a
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Mar 2013 14:11:48 +0100
Received: by mail-wi0-f178.google.com with SMTP id hq4so1971357wib.17
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Mar 2013 04:55:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=Xe0T4DPKjn6+DCUnsaQtvRPJJeV8z0s2B/tK3Xhb2fQ=;
	b=R3UcUi25K5oMtQlaHbHik1Rqu8rHTPoNma0K6rwRtxDvTg0uAqzM2yqVEkzHJyfy3G
	JX4biHATx2iRtuXal0hKgva+dnGBpo9eiUaq9hMWCPVXVe1SHN+Ch3nmtLU23Zqj/aLP
	QU7Hgdqni77ntGjBjDjl6rwxGJyN83XM/6gvWVBFZ9hbLD7XzvO1q0di1B5n/nY2Lq/k
	EbDVOsnllsZfLnNkmkV6a3uBxz0KufzGIzWjHdzdMeCmBYeZc3EA2ngTOo+Ez9/a7Zw5
	c5H3PquZb6Ewgw7PJH4DBpbM5yKYDzuvYeoftNVBPFkJGMDLSgGT0t7Bbz9KcAnaVvJa
	IY/g==
X-Received: by 10.194.235.196 with SMTP id uo4mr31394679wjc.30.1362401719603; 
	Mon, 04 Mar 2013 04:55:19 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id fx5sm15460507wib.11.2013.03.04.04.55.18
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 04 Mar 2013 04:55:18 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Mar 2013 12:52:47 +0000
Message-Id: <1c10f4983ce9470f80083d3f943a095df6bbc9bb.1362401323.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1362401323.git.ross.burton@intel.com>
References: <cover.1362401323.git.ross.burton@intel.com>
In-Reply-To: <cover.1362401323.git.ross.burton@intel.com>
References: <cover.1362401323.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQl4j+q9h7SY5TrNqsm/IVYyc6sku7Vhu5FUsdfKCt5zLALZXz7smLYyWZqpwOZdewqn2+3k
Subject: [PATCH 4/4] gtk-icon-cache: use virtual/gtk-update-icon-cache-native instead of gtk+-native
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 04 Mar 2013 13:11:52 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/gtk-icon-cache.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/gtk-icon-cache.bbclass b/meta/classes/gtk-icon-cache.bbclass
index 223a280..a5d642c 100644
--- a/meta/classes/gtk-icon-cache.bbclass
+++ b/meta/classes/gtk-icon-cache.bbclass
@@ -1,6 +1,6 @@
 FILES_${PN} += "${datadir}/icons/hicolor"
 
-DEPENDS += "${@['hicolor-icon-theme', '']['${BPN}' == 'hicolor-icon-theme']} gtk+-native"
+DEPENDS += "${@['hicolor-icon-theme', '']['${BPN}' == 'hicolor-icon-theme']} virtual/gtk-update-icon-cache-native"
 
 #
 # On host, the postinstall MUST return 1 because we do not know if the intercept
-- 
1.7.10.4



