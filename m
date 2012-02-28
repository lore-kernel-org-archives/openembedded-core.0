Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1S2Oi0-0004Qv-PM
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Feb 2012 16:11:20 +0100
Received: by ghbz2 with SMTP id z2so1132597ghb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2012 07:02:52 -0800 (PST)
Received-SPF: pass (google.com: domain of otavio.salvador@gmail.com designates
	10.236.128.173 as permitted sender) client-ip=10.236.128.173; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	otavio.salvador@gmail.com designates 10.236.128.173 as
	permitted sender) smtp.mail=otavio.salvador@gmail.com;
	dkim=pass header.i=otavio.salvador@gmail.com
Received: from mr.google.com ([10.236.128.173])
	by 10.236.128.173 with SMTP id f33mr28512429yhi.107.1330441372721
	(num_hops = 1); Tue, 28 Feb 2012 07:02:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=OJfNeEBL+RaK44GLWKb3GCA/gL/EdjrSd4nJIS6xkdA=;
	b=b+pDi62u1KAU7zsEf/tjnFGUUNquZpNXztA5HzGJLEutq64w0ImKhZzj64fxyQ6Z/d
	qAmS2GT6fqwvz1rpQqVrRCLK9CYuiWbhKLQYy1Wh9Jjk5Ph478fuH0vj4EffftCrn4nr
	imaZpFAc0/Q6iOsUdq4CbQvpn0MgQiV2xd428=
Received: by 10.236.128.173 with SMTP id f33mr21502387yhi.107.1330441372671;
	Tue, 28 Feb 2012 07:02:52 -0800 (PST)
Received: from localhost.localdomain ([186.218.100.214])
	by mx.google.com with ESMTPS id d66sm47739826yhh.12.2012.02.28.07.02.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 28 Feb 2012 07:02:52 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Feb 2012 15:02:45 +0000
Message-Id: <069c73ea80c568c07f893f084b5bf5c2259e5a59.1330441351.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1330441351.git.otavio@ossystems.com.br>
References: <cover.1330441351.git.otavio@ossystems.com.br>
Subject: [PATCH 1/1] licenses.conf: fix quotting of SRC_DISTRIBUTE_LICENSES
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
X-List-Received-Date: Tue, 28 Feb 2012 15:11:21 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/conf/licenses.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/conf/licenses.conf b/meta/conf/licenses.conf
index e2f6149..6ed4dfe 100644
--- a/meta/conf/licenses.conf
+++ b/meta/conf/licenses.conf
@@ -35,7 +35,7 @@ SRC_DISTRIBUTE_LICENSES += "OFL-1.1 OGTSL OLDAP-2.8 OpenSSL OSL-1.0 OSL-2.0"
 SRC_DISTRIBUTE_LICENSES += "OSL-3.0 PD PHP-3.0 PostgreSQL Proprietary"
 SRC_DISTRIBUTE_LICENSES += "Python-2.0 QPL-1.0 RHeCos-1 RHeCos-1.1 RPL-1.5"
 SRC_DISTRIBUTE_LICENSES += "RPSL-1.0 RSCPL Ruby SAX-PD Simple-2.0 Sleepycat"
-SRC_DISTRIBUTE_LICENSES += "SPL-1.0 SugarCRM-1 SugarCRM-1.1.3 UCB VSL-1.0 W3C
+SRC_DISTRIBUTE_LICENSES += "SPL-1.0 SugarCRM-1 SugarCRM-1.1.3 UCB VSL-1.0 W3C"
 SRC_DISTRIBUTE_LICENSES += "Watcom-1.0 WXwindows XFree86-1.1 Xnet YPL-1.1"
 SRC_DISTRIBUTE_LICENSES += "Zimbra-1.3 Zlib ZPL-1.1 ZPL-2.0 ZPL-2.1"
 
-- 
1.7.2.5



