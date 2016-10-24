Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 168C371A21
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Oct 2016 03:00:17 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id r16so15069874pfg.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Oct 2016 20:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=TYv0elVxG4W0tyl2busCetkPOBRDvCOFAroFr7JMMcU=;
	b=e3DvsUiF9CHmwr6g8PSUGGEWUPq/4xIAMBioI16d5W2yoZpjdow4Wr4O5SpqsBCP31
	HBbhxxV35qicZlBQ27DgKvWD9oApHHE/kWEn8+juzORYu021o9PdikAj7LUrIPeID2CO
	AtaHN97izgbGKluq+seiEdCa7TTwip8GdRAiVpzFGNvAM8+r7EE5V+lc0ptTgn66CFH0
	cUL8kZjD27+Tmp9joAdCaOd9EltmwfRLjmjibMpwbmmgOM9xUyzlyOEgRe6Ly3wf2oeB
	NVXfTc6l+PyC0ZRj/7LN9i5NMqUg1IH5FFSuSNvKPqRok+xShNV+nEZ/LecCuxC8Cw3o
	b/8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=TYv0elVxG4W0tyl2busCetkPOBRDvCOFAroFr7JMMcU=;
	b=NvEA1Sd2Q+8mlcPbJgysCkU7xM/3MLTJiWHXpaSNk7ROcGhLrvSx8rrqPAhkX1sphc
	8Oxzyw2CgkMwvVXnGK/Xpo6jSvSPQzG3S8+fVmry5Wri7JJH2VppOQ4Fmsd5plJIk5V1
	T9ZosHu0DVjKbC00f9kS293+f4O6xW4ndkmolER5ShvalNQtud9feiX2ukCbXIOi0GvK
	3IXXJlN0X7oulWjKtRnGIR/OKJCntcEd6MZfaHf4848UFTK5E71KNhii8IyewVnfWvde
	b235Lagx49DxrMFGGJlwAV6hOELY2azu5SDZoSY44SLNc7pwRncjzbxMv1oBcHDJMD3X
	9pyg==
X-Gm-Message-State: ABUngvfezxJSaUtM3Up8jkmeEz5Z05BE35Psc2d0QoshQAZsjTdyB1owC6dOTufYkisa1w==
X-Received: by 10.98.12.208 with SMTP id 77mr24214680pfm.14.1477278019293;
	Sun, 23 Oct 2016 20:00:19 -0700 (PDT)
Received: from akuster-ThinkPad-X240.hsd1.ca.comcast.net
	([2601:202:4001:9ea0:2c34:ed1b:8260:837d])
	by smtp.gmail.com with ESMTPSA id
	p88sm20537560pfi.51.2016.10.23.20.00.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 23 Oct 2016 20:00:18 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Sun, 23 Oct 2016 20:00:16 -0700
Message-Id: <1477278016-2481-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1477278016-2481-1-git-send-email-akuster808@gmail.com>
References: <1477278016-2481-1-git-send-email-akuster808@gmail.com>
MIME-Version: 1.0
Subject: [Master][morty][PATCH 2/2] tzdata: Update to 2016h
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
X-List-Received-Date: Mon, 24 Oct 2016 03:00:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Armin Kuster <akuster@mvista.com>

Changes to future time stamps

    Asia/Gaza and Asia/Hebron end DST on 2016-10-29 at 01:00, not
    2016-10-21 at 00:00.  (Thanks to Sharef Mustafa.)  Predict that
    future fall transitions will be on the last Saturday of October
    at 01:00, which is consistent with predicted spring transitions
    on the last Saturday of March.  (Thanks to Tim Parenti.)

Changes to past time stamps

    In Turkey, transitions in 1986-1990 were at 01:00 standard time
    not at 02:00, and the spring 1994 transition was on March 20, not
    March 27.  (Thanks to Kıvanç Yazan.)

Changes to past and future time zone abbreviations

    Asia/Colombo now uses numeric time zone abbreviations like "+0530"
    instead of alphabetic ones like "IST" and "LKT".  Various
    English-language sources use "IST", "LKT" and "SLST", with no
    working consensus.  (Usage of "SLST" mentioned by Sadika
    Sumanapala.)

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-extended/tzdata/{tzdata_2016g.bb => tzdata_2016h.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/tzdata/{tzdata_2016g.bb => tzdata_2016h.bb} (98%)

diff --git a/meta/recipes-extended/tzdata/tzdata_2016g.bb b/meta/recipes-extended/tzdata/tzdata_2016h.bb
similarity index 98%
rename from meta/recipes-extended/tzdata/tzdata_2016g.bb
rename to meta/recipes-extended/tzdata/tzdata_2016h.bb
index 3ee4b5a..00b0f5f 100644
--- a/meta/recipes-extended/tzdata/tzdata_2016g.bb
+++ b/meta/recipes-extended/tzdata/tzdata_2016h.bb
@@ -9,8 +9,8 @@ DEPENDS = "tzcode-native"
 SRC_URI = "http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata"
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzdata.md5sum] = "3c7e97ec8527211104d27cc1d97a23de"
-SRC_URI[tzdata.sha256sum] = "3c7137b2bc47323b0de47b77786bacf81ed503d4b2c693ff8ada2fbd1281ebd1"
+SRC_URI[tzdata.md5sum] = "878f0ec3fd9e4026ea11dd1b649a315a"
+SRC_URI[tzdata.sha256sum] = "da1b74fc2dec2ce8b64948dafb0bfc2f923c830d421a7ae4d016226135697a64"
 
 inherit allarch
 
-- 
2.7.4


