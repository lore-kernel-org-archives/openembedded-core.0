Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 351667317F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jan 2016 10:23:41 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id u188so249298551wmu.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jan 2016 02:23:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=dA2BPMAlcHjbyneWn7/5/OE1pLmWY4Bzv9Gx9d8cX14=;
	b=sMQS4NUZudNkUoD2kHnLTe/jBxH/b0Zy5s8K7WwZo6PwO6ktSyz3GGL0YxuzYRFlkn
	pzgrOzEAXtvrtO32ANfw6m4VUB84EMxB+m4peD3PgctdEE+pQGoJBeKC2+XBFVVXYRO9
	0tv1L4E3FKA6lYIBDkVvp216zBun3FtEh6syC1B/X0uq8TdIwIHhdChyqSvDh2SvN++V
	ZfTY92+K1ZTSeuwCMGEMX5qONCGATG3Z320nKZ/MQqfpXBYSCTFw9JUzvnW08HW58/2c
	NUTN4ylctpfbW6mcX0GMYh7w/5EsCBea4V1s1yO+rvMnmghPwpjYIe2VonnjZCRU4S+O
	IIXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=dA2BPMAlcHjbyneWn7/5/OE1pLmWY4Bzv9Gx9d8cX14=;
	b=Y+FrPiGRygRUJh0D0rTiieyxYIUbyQbu5TNMTgWpvV/0vTNi4Yx/x9zmMwXYS+O/kN
	Q0MOIFwXbTzXedQPnR6MbLJdd2f3/xE6dQsbVqsWDXH6DgkwWfxklj0PpHm8fhIUhLG2
	gHHQ+jhrkirbXBSDACW0BUJBfjy1A3fTYTQGyaAWydTsOWkP7gCoolXSgh1LVmVwQ5a5
	iaR2kHwvipDEvEvpbZwg71WfyTZ2w1WelmMP3E092bjZNlAX5adLuJgNR7oDGcrHy7mA
	qRHRFgnmMdbAOrggbQp9u+yatb2IJv2prXSUMMfkfhNVqlh8DUwIVpaejGhwuO6UrEJq
	UAqQ==
X-Gm-Message-State: ALoCoQlQN7y+80eN3Tq2q7hPRWU2SAJubxy3HktI3GULazeQXxLGr3QaOnXc4xUqyThWyx9adtMdAz+JxS8Ubcm1MPv2jmaHWA==
X-Received: by 10.194.158.73 with SMTP id ws9mr156745781wjb.40.1452594222035; 
	Tue, 12 Jan 2016 02:23:42 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	yz5sm71619470wjc.36.2016.01.12.02.23.41
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 12 Jan 2016 02:23:41 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Jan 2016 10:23:39 +0000
Message-Id: <1452594219-6803-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.6.4
Subject: [PATCH] tzdata: remove bashism
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
X-List-Received-Date: Tue, 12 Jan 2016 10:23:45 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-extended/tzdata/tzdata_2015g.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/tzdata/tzdata_2015g.bb b/meta/recipes-extended/tzdata/tzdata_2015g.bb
index a6faa1d..ec6e236 100644
--- a/meta/recipes-extended/tzdata/tzdata_2015g.bb
+++ b/meta/recipes-extended/tzdata/tzdata_2015g.bb
@@ -49,7 +49,7 @@ do_install () {
         # Install default timezone
         if [ -e ${D}${datadir}/zoneinfo/${DEFAULT_TIMEZONE} ]; then
             install -d ${D}${sysconfdir}
-            if [ "${INSTALL_TIMEZONE_FILE}" == "1" ]; then
+            if [ "${INSTALL_TIMEZONE_FILE}" = "1" ]; then
                 echo ${DEFAULT_TIMEZONE} > ${D}${sysconfdir}/timezone
             fi
             ln -s ${datadir}/zoneinfo/${DEFAULT_TIMEZONE} ${D}${sysconfdir}/localtime
-- 
2.6.4


