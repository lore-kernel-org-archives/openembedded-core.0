Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f48.google.com (mail-it0-f48.google.com
	[209.85.214.48])
	by mail.openembedded.org (Postfix) with ESMTP id 86FD0771EE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jan 2017 12:51:00 +0000 (UTC)
Received: by mail-it0-f48.google.com with SMTP id r185so124443361ita.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jan 2017 04:51:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=T6QkqYRIOxxQC+CiAEO+vNboMS/K/lTnNxNCHidpIhE=;
	b=ZYfBqbilrGh/uO+lYQMHB9d/dbU03sJKzQ9a8OHXVtodol7Vcb2HZRBiKbSTUDLaqE
	HdYyv3jgbBZhTrGhFfeecvVviYN3pUGFZbpO7ynVZ8r8HWRgzIS6PYiJZjUUQnaUWKA7
	qCDmb3R9mxiaTVTBAC33+zMDkYmjO0dOyhqaWWLysm7i6gxj9KSdlJM8U9yjQYdn3tDW
	qNVric8RMAYuU2qzk0zRJrDpJ9jU4pwGFP2hDUHxgOgLbq6+JtGdyZipKH+AmYq0XI9E
	SD0lHdHyFoZV5jO5TG7XnrYTaW1wBQtH9R8f9E5PEbyU+hS3dTepvfYGpXoGRHYC4RuS
	HYdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=T6QkqYRIOxxQC+CiAEO+vNboMS/K/lTnNxNCHidpIhE=;
	b=Eqqdatun1ZxIPeQUeK6ZZGVduX7zhtJMhqL7LesWIE7jldFraQ4Sgrmcx+fD0ye9Mh
	tRFjCaaYL7PYA9mxZev8YHvlhpbC6tlg4GDnmEVFIdxSj4GLldTc5MBOEp6oN6Mae8GP
	hqsp2k9yZpcXY4dBCPEwcj14hYPY/DtzmtCvLUL84131TtCyWYgWpSY3tKCXEdxansDR
	1NX7B99h3p+6HkUlpRhHkeViADV8stOHfAylM6ZBy8axxB7A1ikDpnDObX9LZJ02NXed
	lxm6uKSXtIdg8et2/cchfvkeAM1TKVncnVh1CR5g3kzhmG9oC5w/e+fHvzh+9jaIKnLf
	7kYQ==
X-Gm-Message-State: AIkVDXJ1orhgiL0M3yUoFIgLribDKS2wV8Qaf3duW3FjR5qympQzbqUO9yGECMpPzArMZaXG
X-Received: by 10.36.10.3 with SMTP id 3mr20031400itw.93.1485867060794;
	Tue, 31 Jan 2017 04:51:00 -0800 (PST)
Received: from pohly-desktop.fritz.box (p5DE8DFEB.dip0.t-ipconnect.de.
	[93.232.223.235]) by smtp.gmail.com with ESMTPSA id
	l31sm10051399iod.17.2017.01.31.04.50.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 31 Jan 2017 04:50:59 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 Jan 2017 13:50:32 +0100
Message-Id: <24a99e13afec60c858194b2ef1026670434ed6e2.1485867027.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.55ff1fc2ce63597ab9f5324450132e786a996ac5.1485867027.git-series.patrick.ohly@intel.com>
References: <cover.55ff1fc2ce63597ab9f5324450132e786a996ac5.1485867027.git-series.patrick.ohly@intel.com>
Subject: [PATCH 7/8] populate_sdk_ext: fix == bashism
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
X-List-Received-Date: Tue, 31 Jan 2017 12:51:01 -0000

Found via verify-bashisms.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/classes/populate_sdk_ext.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index 39e0c83..9517111 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -512,7 +512,7 @@ install_tools() {
 	# We can't use the same method as above because files in the sysroot won't exist at this point
 	# (they get populated from sstate on installation)
 	unfsd_path="${SDK_OUTPUT}/${SDKPATHNATIVE}${bindir_nativesdk}/unfsd"
-	if [ "${SDK_INCLUDE_TOOLCHAIN}" == "1" -a ! -e $unfsd_path ] ; then
+	if [ "${SDK_INCLUDE_TOOLCHAIN}" = "1" -a ! -e $unfsd_path ] ; then
 		binrelpath=${@os.path.relpath(d.getVar('STAGING_BINDIR_NATIVE'), d.getVar('TMPDIR'))}
 		lnr ${SDK_OUTPUT}/${SDKPATH}/tmp/$binrelpath/unfsd $unfsd_path
 	fi
-- 
git-series 0.9.1

