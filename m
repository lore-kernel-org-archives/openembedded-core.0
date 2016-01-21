Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f193.google.com (mail-ob0-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id 40B72731EC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 05:37:07 +0000 (UTC)
Received: by mail-ob0-f193.google.com with SMTP id x5so2016909obg.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 21:37:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=3myAksiwr2kVN9kq59BkA3htlEuQig/uGFa4jevhMhs=;
	b=ZOOSREZtvE7gTg+h6cyFxl93JtfgRZ1DPeTe14Vbljw2Uuw/moRdi3Vau53CaxuEz3
	eM1yAhpU61SKioXq7+Zt3OM8As2t3nB+0G06DE0LMmoOLJhuCV3YaVhtE9I+WwLIQGa/
	MvidPiqGniZOWROZmSltfvnfL2X59aYBHyTgyMRqVkqELE2WnupjaRzfCcLO3fBJJxE/
	n6z9okI3tvV9s54vf616SYVwx8l6GNWlg92LgGnKBBekvTvfj/C5NM5ZpTDVHWH7mkEX
	mfcsGxmCFTQVBgFbEMUF0ODlzUzuv7DQCvLRX1uk4IhHscFsSpgUIvmtLmzHw82sdOHK
	D3oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=3myAksiwr2kVN9kq59BkA3htlEuQig/uGFa4jevhMhs=;
	b=bqMOIDocFe5XzVpPzvj+kqRVQ8CgqpuGJKzkHQHtSINrFQvZffWbVuQAskdZRQuobg
	+QFS82t6LbTsoRowQil2VN54vPQezHlKPFoY+yu/81QW9Ay0dRcZhC4glRPpGkJPIR28
	V+/9gsK9qA0Loj5vBnMmBeQS6cEMFUiub9J4F8QdApSFjz134l/O1K5Id53Dc3mnzENQ
	9p7uzPIWWimqYTONQXufwpASqQZnxiVL/K+/SsgQBoKRGMDN7ldsi2bjLt3cXPIQym+K
	gMVoIa1d4+kSIcj98Ukau8l1XVYrOZom+SOgpQOVX9nTPSOQu4/qsPxJ7UZeyecSC9xq
	1qwQ==
X-Gm-Message-State: ALoCoQlMFaE2GU2ZDidOfHCU1QRfIoVD6O34bgizjgzENYRSUgQxEMzaZ2OEEKC81jasXum6dER6HqYrZls4CGCP202HSySClg==
X-Received: by 10.60.117.3 with SMTP id ka3mr32692590oeb.9.1453354628870;
	Wed, 20 Jan 2016 21:37:08 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	w143sm19735990oiw.16.2016.01.20.21.37.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 20 Jan 2016 21:37:07 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jan 2016 21:36:20 -0800
Message-Id: <1453354610-19218-3-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453354610-19218-1-git-send-email-armccurdy@gmail.com>
References: <1453354610-19218-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH v2 02/32] gst-plugins-package.inc: minor formatting improvements
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
X-List-Received-Date: Thu, 21 Jan 2016 05:37:10 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-multimedia/gstreamer/gst-plugins-package.inc | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc b/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
index 6441b35..4201113 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
@@ -47,11 +47,10 @@ ALLOW_EMPTY_${PN}-dev = "1"
 ALLOW_EMPTY_${PN}-staticdev = "1"
 
 PACKAGES += "${PN}-apps ${PN}-meta ${PN}-glib"
-FILES_${PN}-apps = "${bindir}"
-
-RDEPENDS_${PN}-apps += "perl"
-RRECOMMENDS_${PN} += "${PN}-meta"
 
 FILES_${PN} = ""
+FILES_${PN}-apps = "${bindir}"
 FILES_${PN}-glib = "${datadir}/glib-2.0"
 
+RDEPENDS_${PN}-apps += "perl"
+RRECOMMENDS_${PN} += "${PN}-meta"
-- 
1.9.1


