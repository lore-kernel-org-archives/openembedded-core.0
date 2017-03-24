Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id B3A8B77BC6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 16:01:15 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id o126so1065905pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 09:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=quvuInj6vYNTQERLdWK1e7q3DgUBgLwFaymQg7jFlRs=;
	b=OfEyi3BhNJ71GRu9jwZLbKDGS+VG8wp1UUVgwz5V2FtADiVS3wlDix7Mq1kq9xyFvf
	kx2PRrtRRhjj7/wBj39cp5B6wX6uGg1oJM7WtZPU/QKKrmFUY7tpnP92ayNk3lQgBGL6
	3/7tqlzKKs6uMtIhbUACAYhVDRO9FSsvjKNOo4hB/D3S/I11KNJTqshGJWjAIKaHTNzk
	0RdX6joxkDhQG9pp5dTwm9aKusEWuDM7wN/+wqokmoF0nLGQzP4nN3zCCndfEKuSOPsR
	RyGwSW7PCTXPfSRHk0uThwd8ZWBRF6hkyjNhhBhPmHEBY7aYwnlZPDuE7tA4PD2eFtm/
	bTiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=quvuInj6vYNTQERLdWK1e7q3DgUBgLwFaymQg7jFlRs=;
	b=HgH5Bux3U7X4mI3UXwcRzKaSFO+CJzw8UQCpuRwZ/pjnwlrGAck/ed98XjrufjTtx1
	ayBK1z9TaWKQCCOeC/4OYhFrTHdm/7ForkMclWTD+tHvQfqvJxGF0eKClOkiGVZtPygc
	1sbuFxSmfbwDWphfevWaOqRMH5rb2qEwIl3aKovGjj9TbUOSQg408EmWKsBP+T39cE6O
	fjff4JWmcQOc+Rs6erNpQdqjohFamUjBbS26K6J+j9fn48B2KwwN16V4CdcQwj2cjNeD
	p62EDAIq0EvlhTMYK8vU0lfr98+rziZcXixCp55bhcQBR2bpDZBuqKuGShIEi8N6iMND
	Nv8g==
X-Gm-Message-State: AFeK/H1/TNRxOR8I1nhYVRHHes6AiX0wxf3pajY8zBjUUMYxMJQUaZxqKzE+MpFijjfq4A==
X-Received: by 10.84.176.129 with SMTP id v1mr11653448plb.192.1490371277399;
	Fri, 24 Mar 2017 09:01:17 -0700 (PDT)
Received: from akuster-ThinkPad-X240.mvista.com
	([2601:202:4001:9ea0:e3df:bf0a:9f90:498e])
	by smtp.gmail.com with ESMTPSA id
	h25sm5568800pfk.119.2017.03.24.09.01.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 24 Mar 2017 09:01:16 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Fri, 24 Mar 2017 09:01:13 -0700
Message-Id: <1490371274-20416-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/2] tzcode: update to 2017b
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
X-List-Received-Date: Fri, 24 Mar 2017 16:01:17 -0000

From: Armin Kuster <akuster@mvista.com>

 Briefly: Haiti has resumed DST.

  Changes to past and future time stamps

    Haiti resumed observance of DST in 2017.  (Thanks to Steffen Thorsen.)

  Changes to past time stamps

    Liberia changed from -004430 to +00 on 1972-01-07, not 1972-05-01.

    Use "MMT" to abbreviate Liberia's time zone before 1972, as "-004430"
    is one byte over the POSIX limit.  (Problem reported by Derick Rethans.)

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../tzcode/{tzcode-native_2017a.bb => tzcode-native_2017b.bb}     | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/tzcode/{tzcode-native_2017a.bb => tzcode-native_2017b.bb} (70%)

diff --git a/meta/recipes-extended/tzcode/tzcode-native_2017a.bb b/meta/recipes-extended/tzcode/tzcode-native_2017b.bb
similarity index 70%
rename from meta/recipes-extended/tzcode/tzcode-native_2017a.bb
rename to meta/recipes-extended/tzcode/tzcode-native_2017b.bb
index 2c26744f..2084f79 100644
--- a/meta/recipes-extended/tzcode/tzcode-native_2017a.bb
+++ b/meta/recipes-extended/tzcode/tzcode-native_2017b.bb
@@ -9,10 +9,10 @@ SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata"
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.md5sum] = "eef0bfac7a52dce6989a7d8b40d86fe0"
-SRC_URI[tzcode.sha256sum] = "02f2c6b58b99edd0d47f0cad34075b359fd1a4dab71850f493b0404ded3b38ac"
-SRC_URI[tzdata.md5sum] = "cb8274cd175f8a4d9d1b89895df876dc"
-SRC_URI[tzdata.sha256sum] = "df3a5c4d0a2cf0cde0b3f35796ccf6c9acfd598b8e70f8dece5404cd7626bbd6"
+SRC_URI[tzcode.md5sum] = "afaf15deb13759e8b543d86350385b16"
+SRC_URI[tzcode.sha256sum] = "4d1735bb54e22b8d7443d4d1f1a13d007ae11be79a35e51f8e8322fb8e292d40"
+SRC_URI[tzdata.md5sum] = "50dc0dc50c68644c1f70804f2e7a1625"
+SRC_URI[tzdata.sha256sum] = "f8242a522ea3496b0ce4ff4f2e75a049178da21001a08b8e666d8cbe07d18086"
 
 S = "${WORKDIR}"
 
-- 
2.7.4


