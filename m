Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
	[209.85.214.181])
	by mail.openembedded.org (Postfix) with ESMTP id E1F267D2E5
	for <openembedded-core@openembedded.org>;
	Tue,  7 Jan 2020 02:34:42 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id az3so22562249plb.11
	for <openembedded-core@openembedded.org>;
	Mon, 06 Jan 2020 18:34:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=q2rRXwGkv+8Zubgohigs5Exc0Nxhya7VJ1Oc7Z4LrtA=;
	b=ZOPo+2qh6X/ZwzkHdn76ZimE84kU2ptuN3Cl7WPqRpE7BiRGXj1XdI6ykAvleywVo4
	wD5r4s2UsC4KCpN8XpMOetqksKD862KQJDaSoL3ktD2vjw1+joJsMy7bXbCnEe2S039X
	JTdTo9L7znr//bVy+ywnateGQRiZ4VKNlOvs7f+2MnMfBRfmS2DitPu3eYCTzfYJ8hV9
	Eh4uTptRkNiQge6shn4LzXtpAhiUmWf8QzmVNCrpWf3IJapEhpxlqiL7klyJasAPb6EX
	rVGrxPdr+8SmCQL6/De69V81Gw/5X/3Rj/vGzdTrVUoxjstF8b5NNhWx12+bG1AdBJot
	xbvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=q2rRXwGkv+8Zubgohigs5Exc0Nxhya7VJ1Oc7Z4LrtA=;
	b=lm8DC5woJFPDAdXKRBiTVI+d6tTG0u8LX1gxs/ex0SJwptOY9l4Kcc2vbtCy+46dOS
	JfxmBN0JTVnYp77k67HDOeMm77MKrbbVNAU3ZWsZq7E8V8LlfLRDRu8ld99vUrnYmmD2
	2s6xj0BR4Ko40jD4/gCu2USz7pyueN9ZnFJLC/rXINTXIgBDqAwBB1AjQ5b7WNNh0Dm2
	0CAESrzkXU5WxxUbBbP9dORTdAU3NiV523pEDSoaKQo2agLFW/adAZzYqaUnCVV3xvA7
	mCBiRdjw9qrsjhrjB+I/x6DglgE8qJbnMN4b9KgUrbWKPag3BIGt2GMCoBYVp8Avop2Y
	UVHA==
X-Gm-Message-State: APjAAAUQMVSkZVDNBJV/v+nYEGeloqvujprrB6cyFHi4kCkakNJi66fx
	tHeNOYpQCartKRom3Rks/uq3SJNF
X-Google-Smtp-Source: APXvYqyNDOqIG5udpvOLLo0yqpljlfFMOvv1UgdvkpaB0N4XCNcteo0F6E/DEvOD9l9suMGjiMZ9xQ==
X-Received: by 2002:a17:90a:c697:: with SMTP id
	n23mr44904680pjt.37.1578364483817; 
	Mon, 06 Jan 2020 18:34:43 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:6832:e19c:36b9:d5e])
	by smtp.gmail.com with ESMTPSA id
	d23sm77806193pfo.176.2020.01.06.18.34.42
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 06 Jan 2020 18:34:43 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Mon,  6 Jan 2020 18:34:10 -0800
Message-Id: <c5f285f83ea1e322d5124847904adf488d3e790a.1578364301.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578364301.git.akuster808@gmail.com>
References: <cover.1578364301.git.akuster808@gmail.com>
Subject: [zeus 05/28] sstate: Ensure mkdir happens before mktemp
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
X-List-Received-Date: Tue, 07 Jan 2020 02:34:43 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

This avoids a directory not present error.

Fix a comment typo whilst here.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1360d8d7d99b70a80c8cdbc1fc6d9e6752483139)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/sstate.bbclass | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 79ae392116..b5267f00be 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -747,14 +747,13 @@ sstate_task_postfunc[dirs] = "${WORKDIR}"
 # set as SSTATE_BUILDDIR. Will be run from within SSTATE_BUILDDIR.
 #
 sstate_create_package () {
-	TFILE=`mktemp ${SSTATE_PKG}.XXXXXXXX`
-
-	# Exit earlu if it already exists
+	# Exit early if it already exists
 	if [ -e ${SSTATE_PKG} ]; then
 		return
 	fi
 
         mkdir -p `dirname ${SSTATE_PKG}`
+	TFILE=`mktemp ${SSTATE_PKG}.XXXXXXXX`
 
         # Use pigz if available
         OPT="-czS"
-- 
2.17.1


