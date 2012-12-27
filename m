Received: from mail-ee0-f46.google.com ([74.125.83.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eren@hambedded.org>) id 1ToMfJ-0002dT-Bu
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Dec 2012 00:15:05 +0100
Received: by mail-ee0-f46.google.com with SMTP id e53so5045039eek.33
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Dec 2012 15:00:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:mime-version
	:content-type:content-transfer-encoding:x-gm-message-state;
	bh=UZ+cGlV26f1bgxSkfN94pMDJ112MrJaagENOTeh3eqs=;
	b=iu562mQIdexxXVKTyaJZGfJBxvHsv30aChANFEDlAlVufXoFpltVVR/Yu6mvqw6ULJ
	flWg6pSWqhmEO4WtAcDw9WFaQ2jek3EwZtHZvsfwRsjbTsXudtcNuLPuxTxBBOuR4PN0
	KL2UTv5DLWD4j+TbuNOJtdnL7Mvz6fssdF7Dg248NHy+cEl70fQG/cOghMpiV1fQXTtS
	LE8luVSSZFJcB9Zu75X79CfVEMjtcLBSNQ5lQ5WyMDXxriB6T7ndWaoG0Wwd6x8lvB9z
	Xy5kfnd63Hm21+uDyj+KopBBtVIBQwE5QCIdBEKFm1ztJ8V/6XH49aKm1tCfInfGR0nc
	nq3A==
X-Received: by 10.14.225.72 with SMTP id y48mr80386750eep.46.1356649210678;
	Thu, 27 Dec 2012 15:00:10 -0800 (PST)
Received: from localhost.localdomain ([46.196.117.99])
	by mx.google.com with ESMTPS id b49sm62333792eem.16.2012.12.27.15.00.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 27 Dec 2012 15:00:09 -0800 (PST)
From: =?UTF-8?q?Eren=20T=C3=BCrkay?= <eren@hambedded.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Dec 2012 00:59:59 +0200
Message-Id: <1356649200-5192-1-git-send-email-eren@hambedded.org>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Gm-Message-State: ALoCoQnCwstqEJulw12elNw+2VBjzbFgT5hqtsdsPZ5i3p7umjzL3Ws25FBY/EVgKWJJqaFTaopq
Subject: [PATCH V2] freetype: update to 2.4.11 which includes
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
X-List-Received-Date: Thu, 27 Dec 2012 23:15:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

After I sent the first patch, freetype was updated with commit
"23e643168" [0]. This patch is rebased on current HEAD (69bbce017)

[0]:
http://cgit.openembedded.org/openembedded-core/commit/?id=23e6431687

Eren Türkay (1):
  freetype: update to 2.4.11 which includes fixes for
    CVE-2012-{5668,5669,5670}

 .../no-hardcode.patch                              |    0
 .../{freetype_2.4.10.bb => freetype_2.4.11.bb}     |    4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/freetype/{freetype-2.4.10 => freetype-2.4.11}/no-hardcode.patch (100%)
 rename meta/recipes-graphics/freetype/{freetype_2.4.10.bb => freetype_2.4.11.bb} (91%)

-- 
1.7.9.5



