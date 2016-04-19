Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f171.google.com (mail-pf0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id E6B3F6013D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2016 23:51:04 +0000 (UTC)
Received: by mail-pf0-f171.google.com with SMTP id 184so11701701pff.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2016 16:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=nTYDQwLt4JXzkOAaTMxGJlrnxQQ6/XoxizwRhEkRT1k=;
	b=fW+l5sOwFv1Jopg1sQFcHIwxZ0oLURxUNLoR2IGrA49RfIrlUFbIT22Ji6+9N3Eh6E
	ekjBnB84j4cYFrSlPMWxClwng89o8lM+qKe9N7B5bTCaztvokjHD3/IR97deT9nBx536
	tm/YcsLN0W0meAeC2zivUT+viN20ejQIXnzv6zsoIKw8CZTpha/T+zRV3MBv6Q0gGoBu
	hByCmB6XWZgKaWNcg1Qe3JYjNpaJWs3DQcMbGrRhA970UDx02GSY1TunsYBKKrDjT/qT
	/aJP89Np7QL8UcekPrH/cu07EBJg0O+dt8oNTaELIuREOA5Ct1WCTH300LSj+HCEOtTW
	5ptQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=nTYDQwLt4JXzkOAaTMxGJlrnxQQ6/XoxizwRhEkRT1k=;
	b=ZJGiYABdLCfTzU6ZzUqZ8Va5EwSyk9aZxqh6LiVZzHWHhexzbqfmri3IDPQKCU6r8E
	uuMR1GTEzYfrf6WZV1y9WkC859zunvrl6ts/VVkhf2Z76DoALtMX7sr+J4qW7nUzZvXD
	E26SQ9MW2ze3IgCXD0RjwyV0bCMyJw2Bt5QfDsYt1/WzfEi45rVQUdmnA6mwoalhbv25
	SEuqvQ5kyxHpYUkgWkmZjgWdFsF4eB/DWO6Zdoh14vaEsA5ZJvEjCErOTmSEg5XvPjj8
	wEfGgLNqifF8yICrOAXlY8UZ+EEMXFK1mNwCkcNV++wyyYn24/nkeODg7reh7c4Fx26H
	Hqgg==
X-Gm-Message-State: AOPr4FWBlq4at85HjSnssOP/Nq7LUcQDcwn16dWoURwzProvWlLKszLm6yUMbgtX5kctAw==
X-Received: by 10.98.20.150 with SMTP id 144mr8027543pfu.144.1461109865217;
	Tue, 19 Apr 2016 16:51:05 -0700 (PDT)
Received: from Pahoa2.mvista.com ([64.2.3.194])
	by smtp.gmail.com with ESMTPSA id
	d2sm53393632pfd.80.2016.04.19.16.51.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 19 Apr 2016 16:51:03 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	akuster@mvista.com
Date: Tue, 19 Apr 2016 16:51:01 -0700
Message-Id: <1461109862-23840-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [PATCH][master][krogoth][jethro][fido 1/2] tzcode: update to 2016d
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
X-List-Received-Date: Tue, 19 Apr 2016 23:51:06 -0000

From: Armin Kuster <akuster@mvista.com>

they keep the versions in-sync. changes are all in data.

Changes affecting future time stamps

America/Caracas switches from -0430 to -04 on 2016-05-01 at 02:30.
(Thanks to Alexander Krivenyshev for the heads-up.)

Asia/Magadan switches from +10 to +11 on 2016-04-24 at 02:00.
(Thanks to Alexander Krivenyshev and Matt Johnson.)

New zone Asia/Tomsk, split off from Asia/Novosibirsk. It covers
Tomsk Oblast, Russia, which switches from +06 to +07 on 2016-05-29
at 02:00.  (Thanks to Stepan Golosunov.)

Changes affecting past time stamps

New zone Europe/Kirov, split off from Europe/Volgograd.  It covers
Kirov Oblast, Russia, which switched from +04/+05 to +03/+04 on
1989-03-26 at 02:00, roughly a year after Europe/Volgograd made
the same change.  (Thanks to Stepan Golosunov.)

Russia and nearby locations had daylight-saving transitions on
1992-03-29 at 02:00 and 1992-09-27 at 03:00, instead of on
1992-03-28 at 23:00 and 1992-09-26 at 23:00.  (Thanks to Stepan
Golosunov.)

Many corrections to historical time in Kazakhstan from 1991
through 2005.  (Thanks to Stepan Golosunov.)  Replace Kazakhstan's
invented time zone abbreviations with numeric abbreviations.

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../tzcode/{tzcode-native_2016c.bb => tzcode-native_2016d.bb}     | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/tzcode/{tzcode-native_2016c.bb => tzcode-native_2016d.bb} (68%)

diff --git a/meta/recipes-extended/tzcode/tzcode-native_2016c.bb b/meta/recipes-extended/tzcode/tzcode-native_2016d.bb
similarity index 68%
rename from meta/recipes-extended/tzcode/tzcode-native_2016c.bb
rename to meta/recipes-extended/tzcode/tzcode-native_2016d.bb
index 06b92ea..647ce2d 100644
--- a/meta/recipes-extended/tzcode/tzcode-native_2016c.bb
+++ b/meta/recipes-extended/tzcode/tzcode-native_2016d.bb
@@ -8,10 +8,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=76ae2becfcb9a685041c6f166b44c2c2"
 SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata"
 
-SRC_URI[tzcode.md5sum] = "ffb82ab0b588138759902b4627a6a80d"
-SRC_URI[tzcode.sha256sum] = "344b1bd486935bca2b7baa47db3b99b32211c45f31ec0d1ead8bacd103c5a416"
-SRC_URI[tzdata.md5sum] = "0330ccd16140d3b6438a18dae9b34b93"
-SRC_URI[tzdata.sha256sum] = "8700d981e6f2007ac037dabb5d2b12f390e8629bbc30e564bc21cf0c069a2d48"
+SRC_URI[tzcode.md5sum] = "06fc6fc111cd8dd681abdc5326529afd"
+SRC_URI[tzcode.sha256sum] = "a8f33d6f87aef7e109e4769fc7f6e63637d52d07ddf6440a1a50df3d9a34e0ca"
+SRC_URI[tzdata.md5sum] = "14bf84b6c2cdab0a9428991e0150ebe6"
+SRC_URI[tzdata.sha256sum] = "d9554dfba0efd76053582bd89e8c7036ef12eee14fdd506675b08a5b59f0a1b4"
 
 S = "${WORKDIR}"
 
-- 
2.3.5


