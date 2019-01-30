Return-Path: <jpewhacker@gmail.com>
Received: from mail-it1-f195.google.com (mail-it1-f195.google.com
	[209.85.166.195])
	by mail.openembedded.org (Postfix) with ESMTP id D87D57C31B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 19:29:29 +0000 (UTC)
Received: by mail-it1-f195.google.com with SMTP id g85so98493ita.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 11:29:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=yGhy1fBJMqGKxrX2xdyqylRwruXJS2LeCvxqbvV+WLY=;
	b=XQ1pjy/04OY010/93CIpBWzgeKR2Db2n8NltkuJpof2leOfxv8fayXXCD12kGcyTzN
	3KTJ0HnPX4WlDZ3cRJAWgy75YglVmwagkWi2swK1iW5/ILC0AKE/+z6V4jpNaSZ1o7tS
	mAmVu/DpN6gkDhN6mJgzO1QsZ5u/6IN52iEy+D9/8Cu1aZoirmtWcc+W1QMVkyehzd/B
	iA4RA9DeJ026chc0be1QeThq8bqyRa/1Kdaa+BsKo6v1rzcXR8ycnImawwgIxNjrGx5M
	HwS7rxYhrQLgBgUABFSi1WqP4nmOjUKeh2z+90jLQKE1qujDTELgm2VRkE1af5WfpME7
	DkYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=yGhy1fBJMqGKxrX2xdyqylRwruXJS2LeCvxqbvV+WLY=;
	b=HMgFlxY4gpvUPXgBNpVN+as/5dRO9FkrXkvjP+fP59D05HhtR/CLcN/U1QumKlvoO1
	mJAC2PAAeACN04CCSK25TfzkTqaxlTuYCPT8kewwVXfZ2B3d4Z3kRnquiO/kDtm/NqIs
	gQfchVPo4c9yQfdfDSW9dT2D1t4SLiJUxEcN/NOj5JpB2/hV0q+Wq0H538DfcmEjZTbg
	44A1U1n+kZXJs4OAkmyV/RI+LR4dmH32969ZcMb7thkLpOC/V+6ZPkKiXQCPkIPCTSgI
	eoxobAQCy5LJyDp1qWjsotSFzZvpEWieOjqES5ZICd4Iy/gu42mQmyWqwKM5IxoLSceD
	z59Q==
X-Gm-Message-State: AJcUukdH7tFZwpJNs+ZGhuTwkbcXjntBxPgQ4pycVn6fz+0EdQjccMNF
	8kua3UCjBBpNK/INns7Z8z//FnPpfdo=
X-Google-Smtp-Source: ALg8bN6g2UWRn5E+TReu3POSiISkhk2aDFKO4R11vG3XF+bstK8P9uiQGTdAFn00GVtZlbu2Zvh8ZA==
X-Received: by 2002:a24:80cc:: with SMTP id
	g195mr13777819itd.178.1548876570482; 
	Wed, 30 Jan 2019 11:29:30 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	y13sm1009437ioa.56.2019.01.30.11.29.29
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 30 Jan 2019 11:29:29 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Jan 2019 13:29:17 -0600
Message-Id: <20190130192917.19882-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [master][PATCH] ref-manual: Update the default value for PACKAGE_DEBUG_PACKAGE_SPLIT
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
X-List-Received-Date: Wed, 30 Jan 2019 19:29:30 -0000
Content-Transfer-Encoding: 8bit

The new default is "debug-with-srcpkg"

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 documentation/ref-manual/ref-variables.xml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/ref-manual/ref-variables.xml b/documentation/ref-manual/ref-variables.xml
index 4b243a12dd6..8e30f47bafd 100644
--- a/documentation/ref-manual/ref-variables.xml
+++ b/documentation/ref-manual/ref-variables.xml
@@ -9976,7 +9976,6 @@ recipes-graphics/xorg-font/font-alias_1.0.3.bb:PR = "${INC_PR}.3"
                             <filename>/bin/.debug</filename>.
                             Source files are placed in
                             <filename>/usr/src/debug</filename>.
-                            This is the default behavior.
                             </para></listitem>
                         <listitem><para>
                             "debug-file-directory": Debug symbol files are
@@ -10000,6 +9999,7 @@ recipes-graphics/xorg-font/font-alias_1.0.3.bb:PR = "${INC_PR}.3"
                             ".debug" previously described with the exception
                             that all source files are placed in a separate
                             <filename>*-src</filename> pkg.
+                            This is the default behavior.
                             </para></listitem>
                     </itemizedlist>
                 </para>
-- 
2.20.1


