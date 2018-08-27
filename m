Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id A3E5178F78
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Aug 2018 09:55:13 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id s12-v6so7491927wmc.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Aug 2018 02:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=BP9nyLjlhndE2lqIfepEbq7BRxkQwRoUBnANjX6v93E=;
	b=DeKgs6y7UaSzkIQhaE21ilEzB94jYNp/nIDWv7xxqrT0xRB5CfbikA/oMXjm9nfbHr
	lV28BWAxHQlcTLHD9JzQ+kmgXdt2TwiVrIPsJV9kIzS8KrZRD4mMXs/xcDPYvNaw3eVw
	hU4amxMqd1NQJWsblyn8N4n0WtH5YRomMcNpzws8r0EdPZqycH5JO7DtOgPmkMUm8rtn
	xAEWOwoNMzgsxJ3HkGwzwX0auXVRo7Q6s/nsxeMYWeScfVSY34oKQQ+T/iZs3Pqj7z2w
	kO9Cn7G4hYGayNx2cDuPFOaBSndoNMWoS0UwGT891YGPCWaQ45a92ieCxyGnzmezbdex
	71FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=BP9nyLjlhndE2lqIfepEbq7BRxkQwRoUBnANjX6v93E=;
	b=Nkz6RTjdZAOa6jqc1rvO4dWHJq0htgK5Zf/VR0RlyedMDiZDgR1WG1pR2OsYqAd3sy
	bFNrjS8DvUJXhD1m2a6f05/ZcJS5Hb7p830dNmB/RrcDEW2KNqWfsU8LTdtZNhFbm4G5
	YKj2zIjCyK9UykuGFhOJBupGyORA00aACqA8lhHBYHO+zj7ePPzBRBh+Yv5h5LRYqcNF
	hwjk35WI0vj1oaJ0wCWtLBfDsLO9YJ9IxcouDmMvmAsFYXvolqiGad69txS2uAYWavxj
	tQqVeyISHDUlfxprhTpEgqpts2tnWIETjI9d9CCun/3kxG/4Ym/1f5hxNEbLmudgggjb
	CJ4A==
X-Gm-Message-State: APzg51Dk8b97Pg7DDDH6IKZXfPM5yR5lk+vfgYuf4h0ciYgsEHTwbKB9
	73vjqKh9GPbupJ/pxDPCbjbVosfx
X-Google-Smtp-Source: ANB0VdZBiGPw6N2B+i4pX8i0GdeEgQ4Bl1zsqaSRcnkh5RF9kv/XB72WmD9m1c0veUrjziK/KgEvig==
X-Received: by 2002:a1c:1351:: with SMTP id
	78-v6mr4865102wmt.127.1535363714233; 
	Mon, 27 Aug 2018 02:55:14 -0700 (PDT)
Received: from beaker.muppets.liwing.de (b2b-78-94-80-58.unitymedia.biz.
	[78.94.80.58]) by smtp.gmail.com with ESMTPSA id
	b124-v6sm8114318wmh.17.2018.08.27.02.55.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 27 Aug 2018 02:55:13 -0700 (PDT)
Sender: Jens Rehsack <rehsack@gmail.com>
From: Jens Rehsack <sno@netbsd.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Aug 2018 11:54:29 +0200
Message-Id: <20180827095429.4949-1-sno@netbsd.org>
X-Mailer: git-send-email 2.17.1
Cc: Jens Rehsack <sno@netbsd.org>
Subject: [PATCH] distutils3.bbclass: improve error messages
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
X-List-Received-Date: Mon, 27 Aug 2018 09:55:13 -0000

For non-python developers it's difficult to identify where start
searching in case of errors. Fixing and marking the string to
grep for might help finding some root causes of issues slightly
quicker.

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 meta/classes/distutils3.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/distutils3.bbclass b/meta/classes/distutils3.bbclass
index 1d0c54a513..9e31505f0c 100644
--- a/meta/classes/distutils3.bbclass
+++ b/meta/classes/distutils3.bbclass
@@ -23,14 +23,14 @@ distutils3_do_compile() {
         STAGING_LIBDIR=${STAGING_LIBDIR} \
         ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py \
         build ${DISTUTILS_BUILD_ARGS} || \
-        bbfatal_log "${PYTHON_PN} setup.py build_ext execution failed."
+        bbfatal_log "'${PYTHON_PN} setup.py build ${DISTUTILS_BUILD_ARGS}' execution failed."
 }
 distutils3_do_compile[vardepsexclude] = "MACHINE"
 
 distutils3_stage_headers() {
         install -d ${STAGING_DIR_HOST}${PYTHON_SITEPACKAGES_DIR}
         ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py install_headers ${DISTUTILS_STAGE_HEADERS_ARGS} || \
-        bbfatal_log "${PYTHON_PN} setup.py install_headers execution failed."
+        bbfatal_log "'${PYTHON_PN} setup.py install_headers' execution failed."
 }
 distutils3_stage_headers[vardepsexclude] = "MACHINE"
 
-- 
2.17.1


