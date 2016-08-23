Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 025AB7318E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 19:13:50 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id u25so4128166qtb.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 12:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:organization;
	bh=ysfPaBujJIytiU74K4tFRMUJxiW0N4NmSTuoDUGFyEo=;
	b=fv2u0k1kliumX53jns3s7wy3L/eXTiMvTksFoXhcL1pXb5B4gbRSWBrUtQLgOktekQ
	GAfbj2FFkcKdXFex3GltmytqQm/FJoABZDb8umCqBTOoqEvbN8m6HovHoxgt06uNrXv1
	MIr2EZrQbaf19lptIEWu1H1wfU+gcwLuDR56muVjk+t2kMZvAbdeNvHoUXdS5SuQfM1r
	axrQaz+OCgkCywHrL9gWMknthsxSYJ4WQBKHukAlKuJ9/Ki3m5JCUNHoF8WLEuncFCDQ
	pbXQxCMKHQ4Takug1iYAl1ovJz51aqzdMm+yk1xQ+CIHTcUvPIVK+kPmCfkaYCaL/814
	1BvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=ysfPaBujJIytiU74K4tFRMUJxiW0N4NmSTuoDUGFyEo=;
	b=jaGhPTKVvYBojqPgT3QwoH2TF7vW2KAh+Dgv56NRkX4qhTUGrlRBanIvkHQViiSZTL
	98NKK3f0YvH8MT6hfrmkIH73bbfneEB2FLwbHgkmJpDW4EDZDIfwU28wQyRN50jb5F5q
	Y0tI/dlZyWvoz9L7ihTTGEUYg3KhltkJuUWhcsfCiTAyg4Hqj4In52bNRYtcK0jk2Eyn
	p811X8O9GSdtJOhtVVTIfY4p+NJDNxewPv9COfp5rUbcYG8Dad7ve/q3BamCUD8CgjyR
	jeYx47eSnD6XFB/Sp9RSg+A6NMGpOD/B2VbdNnhCEYUMw+pSFhPRKPunji+SwxfD+Puk
	H79Q==
X-Gm-Message-State: AEkoouv3EBOHjtD4U10PrknwezSaSDde9Y3C4Pwrkc248dbXjwC0qLrQLDC67BaKRpKn7g==
X-Received: by 10.237.47.225 with SMTP id m88mr32564245qtd.106.1471979630717; 
	Tue, 23 Aug 2016 12:13:50 -0700 (PDT)
Received: from berton.lab.ossystems.com.br ([177.127.4.56])
	by smtp.gmail.com with ESMTPSA id p70sm2577983qke.1.2016.08.23.12.13.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 23 Aug 2016 12:13:49 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Aug 2016 16:13:37 -0300
Message-Id: <1471979617-9800-1-git-send-email-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
Organization: O.S. Systems Software LTDA.
Subject: [PATCH] piglit: Add python3-argparse module to RDEPENDS
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
X-List-Received-Date: Tue, 23 Aug 2016 19:13:53 -0000

Python module argparse was removed from python3-misc package, so we
need to add new python3-argparse package to RDEPENDS.

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 meta/recipes-graphics/piglit/piglit_git.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index df90c4d..b2ca553 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -46,7 +46,8 @@ do_install() {
 RDEPENDS_${PN} = "waffle python3 python3-mako python3-json \
 	python3-subprocess python3-misc python3-importlib \
 	python3-unixadmin python3-xml python3-multiprocessing \
-	python3-six python3-shell python3-io mesa-demos bash \
+	python3-six python3-shell python3-io python3-argparse \
+	mesa-demos bash \
 	"
 
 INSANE_SKIP_${PN} += "dev-so already-stripped"
-- 
2.1.4


