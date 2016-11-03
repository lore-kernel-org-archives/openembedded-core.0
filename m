Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-pf0-f180.google.com (mail-pf0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id E9549719E4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Nov 2016 18:05:05 +0000 (UTC)
Received: by mail-pf0-f180.google.com with SMTP id n85so35517207pfi.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Nov 2016 11:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=hh2CiFk2nHqU7Ov31w8FhJpNPn9MSqlZk1oTtsmF3f0=;
	b=StbkgDeSViYHgR7x4zecq8G1hjp22mcPPfkW14WuKfcIzBZIFbzSJVokREsps9Lqtm
	/o0gWsTcDgn/Yicr0ggRu8QjcJyufhrpLHp+pmX6OKZIBolV0jr+u6ksRZXapyQXc6g2
	xQxT70Vk9OX+eqzekRg5Q18xNOVShXflDPx7sgnfoB5g6ExQhqUW4AePt/Xd6Fzez29s
	Kn3DZwWmpVQ+R1G5aEFzpqlQWHbmokWpFeffBgD6rNlW2MY/QeRR3vWOJvjtDSLbb4Lv
	cQ3JyGmJQDCI9JL9+45qgjJnntj9GIho0AfF7Ctrjruoz5MKOYJLH4lCsJWj8WhAPt0k
	udVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=hh2CiFk2nHqU7Ov31w8FhJpNPn9MSqlZk1oTtsmF3f0=;
	b=nBQj4D4MrsaDW4f5YJynU3pohRUwec91ahmEzhN6kOLIsMWcNisbTL2wptVbeph4go
	N0/lsrnbnUVsJ4iebOZP9ZBEuK7DPU0mm/naDOHGh/FkocOg27CwjgwEz2FNDbZgxtbH
	gnQffova+yw8NPB/sambwgP/OQDrCZ1GMo/h3UlgC2usC4xT4Gb2JFz9LnRzy2XHJzPa
	30HY5uaq2m/GXPoRQTlNZUGXmup16LpEuWUmCBuMC8wvCTB3HudTwNgwqh0MuqOD7nqG
	jgB9fvoAyO5DWBJdTyeoJessJWtuboenLU4cP0juvn+JM6H1JKhVMIdg+qTT/iHL6tQM
	y6SA==
X-Gm-Message-State: ABUngvfq1sj+CQsTKwwk8X9vMatE9XGuKKrF4yH3aK/FAMKM4Mv5N5i6WZ9o7dLrEyJjekUm
X-Received: by 10.98.133.9 with SMTP id u9mr17371549pfd.137.1478196306722;
	Thu, 03 Nov 2016 11:05:06 -0700 (PDT)
Received: from localhost.mvista.com ([111.93.218.67])
	by smtp.gmail.com with ESMTPSA id
	d197sm14307390pfd.38.2016.11.03.11.05.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 03 Nov 2016 11:05:05 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Nov 2016 23:34:53 +0530
Message-Id: <1478196294-7594-1-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
Subject: [master][morty][PATCH 1/2] ltp: Fix QA warning
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
X-List-Received-Date: Thu, 03 Nov 2016 18:05:07 -0000

It solves below QA issue WARNING while building ltp, when
LICENSE_CREATE_PACKAGE is set to "1"

-- snip --
WARNING: ltp-20160126-r0 do_package_qa: QA Issue: /opt/ltp/share/licenses/ltp/run_freezer.sh contained in package ltp-lic requires /bin/bash, but no providers found in RDEPENDS_ltp-lic? [file-rdeps]
-- snip --

Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
 meta/recipes-extended/ltp/ltp_20160126.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/ltp/ltp_20160126.bb b/meta/recipes-extended/ltp/ltp_20160126.bb
index 7631e0e..c731f42 100644
--- a/meta/recipes-extended/ltp/ltp_20160126.bb
+++ b/meta/recipes-extended/ltp/ltp_20160126.bb
@@ -105,6 +105,7 @@ do_install(){
 }
 
 RDEPENDS_${PN} = "perl e2fsprogs-mke2fs python-core libaio bash gawk expect ldd"
+RDEPENDS_${PN}-lic = "bash"
 
 FILES_${PN}-staticdev += "/opt/ltp/lib/libmem.a"
 
-- 
2.7.4


