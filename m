Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id 00BC17692B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Aug 2015 05:41:10 +0000 (UTC)
Received: by pacrr5 with SMTP id rr5so119734381pac.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Aug 2015 22:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=h4tvdTFetYLvVreepcJnfkhqU/eRPwDdqr204kNRpkY=;
	b=oFIuoDnCcBCBwDnhotB4UIrDQ77Hgh+2DKG0tgK5i1fkhB2R3x6q6UzHbyDlBu1WlW
	/X+38ollnLzmkhrVWOgj41AL5rhBLv7pu1FVFFs+kvSP/458YJXhC12rBdm+bDL6mUGT
	Aoaevr2bBfMVjog/E6+QYiY4jDbIFRlDVJi7amqKfHZAkthnuuV6mjANPftUBxqXd2vW
	ClppFEBhi6bxF7SoHYHf+XIK8/3SYrFp6n7i7y/MbTQz0Nr7W7XdslNmlX/cVSnVyHS1
	iw85Op5X+QRrpvG9aUPxqlcMrZ1o0llHiIyNZD8fNM+HMixY55Oasc9UjysSV658YeCi
	u1KQ==
X-Received: by 10.68.232.234 with SMTP id tr10mr53467590pbc.134.1439271670594; 
	Mon, 10 Aug 2015 22:41:10 -0700 (PDT)
Received: from Pahoa2.caveonetworks.com ([111.93.218.67])
	by smtp.gmail.com with ESMTPSA id qp5sm962384pbc.0.2015.08.10.22.41.08
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 10 Aug 2015 22:41:09 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Aug 2015 11:11:03 +0530
Message-Id: <1439271664-22049-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [PATCH 1/2] tzcode-native: update to 2015f
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
X-List-Received-Date: Tue, 11 Aug 2015 05:41:14 -0000

Changes affecting code

zdump and zic no longer warn about valid time zone abbreviations
like '-05'.

Some Visual Studio 2013 warnings have been suppressed.
(Thanks to Kees Dekker.)

'date' no longer sets the time of day and its -a, -d, -n and -t
options have been removed.  Long obsolescent, the implementation
of these features had porting problems.  Builders no longer need
to configure HAVE_ADJTIME, HAVE_SETTIMEOFDAY, or HAVE_UTMPX_H.
(Thanks to Kees Dekker for pointing out the problem.)

Changes affecting documentation
The Theory file mentions naming issues earlier, as these seem to be
poorly publicized (thanks to Gilmore Davidson for reporting the problem).

tz-link.htm mentions Time Zone Database Parser (thanks to Howard Hinnant).

Mention that Herbert Samuel introduced the term "Summer Time".

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../tzcode/{tzcode-native_2015e.bb => tzcode-native_2015f.bb}  | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-extended/tzcode/{tzcode-native_2015e.bb => tzcode-native_2015f.bb} (59%)

diff --git a/meta/recipes-extended/tzcode/tzcode-native_2015e.bb b/meta/recipes-extended/tzcode/tzcode-native_2015f.bb
similarity index 59%
rename from meta/recipes-extended/tzcode/tzcode-native_2015e.bb
rename to meta/recipes-extended/tzcode/tzcode-native_2015f.bb
index 30dba7a..a8865a3 100644
--- a/meta/recipes-extended/tzcode/tzcode-native_2015e.bb
+++ b/meta/recipes-extended/tzcode/tzcode-native_2015f.bb
@@ -6,12 +6,12 @@ LICENSE = "PD & BSD"
 LIC_FILES_CHKSUM = "file://${WORKDIR}/README;md5=d0ff93a73dd5bc3c6e724bb4343760f6"
 
 SRC_URI =" ftp://ftp.iana.org/tz/releases/tzcode${PV}.tar.gz;name=tzcode \
-           ftp://ftp.iana.org/tz/releases/tzdata2015e.tar.gz;name=tzdata"
+           ftp://ftp.iana.org/tz/releases/tzdata2015f.tar.gz;name=tzdata"
 
-SRC_URI[tzcode.md5sum] = "fb62eb6daf3ddb8c41fd40be05ec657e"
-SRC_URI[tzcode.sha256sum] = "b5a217b55847fb56f470a7738939c36f3a520d6cc12342d965cfcf848e59ada0"
-SRC_URI[tzdata.md5sum] = "36f9056efb432ca945c73397acfce0d4"
-SRC_URI[tzdata.sha256sum] = "ffc9b5d38abda8277aa479e3f75aa7668819d0977cd1a0c8ef3b09128334ba6f"
+SRC_URI[tzcode.md5sum] = "19578d432ba8b92f73406a17a9bc268d"
+SRC_URI[tzcode.sha256sum] = "0c95e0a42bb61141f790f4f5f204b954d7654c894aa54a594a215d6f38de84ae"
+SRC_URI[tzdata.md5sum] = "e3b82732d20e973e48af1c6f13df9a1d"
+SRC_URI[tzdata.sha256sum] = "959f81b541e042ecb13c50097d264ae92ff03a57979c478dbcf24d5da242531d"
 
 S = "${WORKDIR}"
 
-- 
2.3.5


