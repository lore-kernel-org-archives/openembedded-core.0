Return-Path: <philip.balister@gmail.com>
Received: from mail-yh0-f48.google.com (mail-yh0-f48.google.com
	[209.85.213.48])
	by mail.openembedded.org (Postfix) with ESMTP id 77969726E6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Dec 2014 14:14:08 +0000 (UTC)
Received: by mail-yh0-f48.google.com with SMTP id i57so3170527yha.35
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Dec 2014 06:14:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=EhSQwvBZBrnxfdhfM4h6Aw60aKpk9lJB2IXv7lhkoTg=;
	b=pJiXjgn6yfABu6oLa1WGbpnkbF//IXKRFrTkxZR1olUm9Say9yY4twP656O+h06Lgi
	GjcTBcsyHYJCSwa1UfQk/vVCraMwlJoJShy8HJQELxuD3MpGSA6PPRd2+03u1nbqe+DH
	TwMSo2TNxJZHOIoMCggIRuR196hvAgZoMLchDp2Y2v9WvttY3bwlFKuIF94Qw39Q8/S/
	HrME/pBnDs+u3gNqF0GfhsGvS9+lqtri4Z0/vP0N7G4QqlQTqPOb7l9V5xKI11ycLuV2
	KRc72S8nSKDc2DA2ucoUqgVsRKzOku/ykhTDv58VvXnu3N9UWEJzwpuh7ealwDelVSVk
	R7cw==
X-Received: by 10.170.190.8 with SMTP id h8mr7627175yke.13.1419344048954;
	Tue, 23 Dec 2014 06:14:08 -0800 (PST)
Received: from thuvia.localdomain (pool-71-171-45-99.ronkva.east.verizon.net.
	[71.171.45.99])
	by mx.google.com with ESMTPSA id o6sm13987844yhd.52.2014.12.23.06.14.07
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Dec 2014 06:14:07 -0800 (PST)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Dec 2014 09:14:03 -0500
Message-Id: <1419344043-7468-1-git-send-email-philip@balister.org>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH] boost : Add the atomic and chrono libraries to the build.
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
X-List-Received-Date: Tue, 23 Dec 2014 14:14:12 -0000

Inspection of buildhistory shows no existing libraries changed and
the atmoic and chrono libraries are packaged individually.

Signed-off-by: Philip Balister <philip@balister.org>
---
 meta/recipes-support/boost/boost.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
index d34ca7c..bf22c95 100644
--- a/meta/recipes-support/boost/boost.inc
+++ b/meta/recipes-support/boost/boost.inc
@@ -5,6 +5,8 @@ DEPENDS = "bjam-native zlib bzip2"
 ARM_INSTRUCTION_SET = "arm"
 
 BOOST_LIBS = "\
+	atomic \
+	chrono \
 	date_time \
 	filesystem \
 	graph \
-- 
2.1.0


