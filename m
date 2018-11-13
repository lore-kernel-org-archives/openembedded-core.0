Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
	[209.85.128.47])
	by mail.openembedded.org (Postfix) with ESMTP id 560A26C27B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Nov 2018 10:17:49 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id r11-v6so11278239wmb.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Nov 2018 02:17:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=Dsuts024UTG7gqyfv19P3THjdJpsq+10aU5CNnlrTEg=;
	b=Jsk8NEcfGmsXxcNSmz8JZF0h93d98OSvLih6azsMI4yjsSgdjQSo2rOr3didRGimuj
	W7ciwpWAlMc/9/smw9yWrE/xx9QG5MUTqabmrgf/l8maevks4HfGZ21QRxIEhLAZrRSj
	Qbsf6qOMB5Pa8saff4AgWPX2UcVu4b6QDRgsR7la7/S+f2Zj8s0mKeFvT+kE+nahPXtc
	tzXAP4PQiRkcY+4ZxNFTl0K2tPCfqESHa7idUWayCnTfZJOK42q5IAeC0cZJlqk8G/Oa
	AqbRe+vyB44XV6kdyaA6mMYcLToCH7Xgo3dvMAl2h3oX2JUlYlh/OLWz2VjCaFmd/JAw
	k70A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Dsuts024UTG7gqyfv19P3THjdJpsq+10aU5CNnlrTEg=;
	b=mCXURAo+ACmHAbcPTvMj3lYnXis1Sevt3ImNvQ0LE/HKxs6AwAcgft3cMysm7+NfZQ
	TKwTXtmVdbtUV2nchbkJYAZpQ6ufRj0wLW0F/PkkbtepVVMczw+fIiXEd0bardXzFT1o
	JjU1gUs4RJNu5ILfK2p2g+M1YyexqV3qdniTwT2tZVLP3MWCcUIRWRGTxbjT1Hr45uUC
	hpoWRtTunt6wS+agqhYE5rDxCdBTZgKXlGqWQA4KRwNcefWDWflNU9NLFqe5ybbYbQg0
	nHoGX9mB1IDOpl7oKeogJigUta8cgkJry+WicbA2MrQGzNxZCSlkj25QamvT5CQ3ulhJ
	Kk7w==
X-Gm-Message-State: AGRZ1gK21auTnbFQX7flEeIKwoHLFFXNPRnv8S28lTAXpcLvkex2hfFb
	+Dfskhx92CLbOdHJ+R+oyXRziKdh
X-Google-Smtp-Source: AJdET5c3LTOe1qTkQxKqvrN0MmhWIP6i1Nl7DMv8sF+QIVk8oKckZLr8Wwd0R28Z19IBYUQ4wr5YKg==
X-Received: by 2002:a7b:cd14:: with SMTP id
	f20-v6mr1133367wmj.79.1542104269605; 
	Tue, 13 Nov 2018 02:17:49 -0800 (PST)
Received: from localhost.localdomain (p509737a3.dip0.t-ipconnect.de.
	[80.151.55.163]) by smtp.gmail.com with ESMTPSA id
	r64-v6sm10030812wmd.43.2018.11.13.02.17.48
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 13 Nov 2018 02:17:48 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Nov 2018 11:17:29 +0100
Message-Id: <20181113101729.19289-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.5
In-Reply-To: <20181113101729.19289-1-schnitzeltony@gmail.com>
References: <20181113101729.19289-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] scons.bbclass: fix indention
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
X-List-Received-Date: Tue, 13 Nov 2018 10:17:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta/classes/scons.bbclass | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/scons.bbclass b/meta/classes/scons.bbclass
index 286843f74c..9ee7d1587d 100644
--- a/meta/classes/scons.bbclass
+++ b/meta/classes/scons.bbclass
@@ -14,13 +14,13 @@ do_configure() {
 }
 
 scons_do_compile() {
-        ${STAGING_BINDIR_NATIVE}/scons ${PARALLEL_MAKE} PREFIX=${prefix} prefix=${prefix} ${EXTRA_OESCONS} || \
-        die "scons build execution failed."
+	${STAGING_BINDIR_NATIVE}/scons ${PARALLEL_MAKE} PREFIX=${prefix} prefix=${prefix} ${EXTRA_OESCONS} || \
+	die "scons build execution failed."
 }
 
 scons_do_install() {
-        ${STAGING_BINDIR_NATIVE}/scons install_root=${D}${prefix} PREFIX=${prefix} prefix=${prefix} ${EXTRA_OESCONS} install || \
-        die "scons install execution failed."
+	${STAGING_BINDIR_NATIVE}/scons install_root=${D}${prefix} PREFIX=${prefix} prefix=${prefix} ${EXTRA_OESCONS} install || \
+	die "scons install execution failed."
 }
 
 EXPORT_FUNCTIONS do_compile do_install
-- 
2.14.5


