Return-Path: <matt@madison.systems>
Received: from mail-pf0-f169.google.com (mail-pf0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id 0F8657199E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Oct 2017 11:05:40 +0000 (UTC)
Received: by mail-pf0-f169.google.com with SMTP id d28so2137738pfe.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Oct 2017 04:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=51lPc9fOB8dzq7OCrXdWGP8iH0Q9xybzPLtvT/DfUws=;
	b=epU5UsoEsvudYBnvLSaanRx5H1AEK5E/j3c7TQtamM2xw58HTgI2hOJ5nYxTStZiFL
	7+OCe9Sh0bIItbfFhcWsecIe2Nh9HdBuflsQ/PjQ57ZvPT57DWSOeWxvM6Yrz0SJlEUf
	BoeEfLBRqMwvXiPHAdmlRmLumhlgFtT2wBXemhx55ixT5Q6TCTplSTCq5n8lSKPRchaZ
	50Qpav8mRTqrNseePXSSKAltBHKoKIydtchmDXXr332W6Pd8unWhCayK6uaBIGlq9Jh2
	MP58KNinq01releCnlAs1JqfTnDeXdiupnBd6I3WKRMx8vxhN3VBaKKTvIy7aIBUoK+P
	3yIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=51lPc9fOB8dzq7OCrXdWGP8iH0Q9xybzPLtvT/DfUws=;
	b=kWad38uCtN8XG4syrqm5BZS6BzHIvyosJ5MxcZmQa/DM2ltWg23oYoROPZ1guM7S2k
	5yhj5fQ2ijR+CMmRCppukH8rImNNsx+HBSkFOvfnAsN9/698enSfgX8dOnCAh21qYY1M
	EM2IUqxSlYYDraN3j56bpciQo6pwC8xGwXMwrkD8M1cQPzI4JVLi/anc0uEmqRVfQViD
	AAYXLF0Qgnj1DguhoSV3e/8vwvsJyPcVwynZ7QlerIrt8ItnZewDq8yVOmYSexcDEg3S
	3RFOu1UFMTeoCPX/bDiswnclxlQR9LAJGBoq36nXcW3+bJLxtay1BnkD/qwg7NPLjnf8
	zc7g==
X-Gm-Message-State: AMCzsaVC1ZL2zUxxAkOoTGckyFdrxWXdubX9EStvB9YElyIfOcEaRrYA
	1ks4qDacZufL8iWYX4Q7bErFpBWt
X-Google-Smtp-Source: AOwi7QBhdyHywDCvyk027BdNA4BFERhOdGdyBbgDUP458LYYS3AlVi6MWDk6iv367vXC3g/XIS86YQ==
X-Received: by 10.84.244.203 with SMTP id f11mr2526790plt.187.1507633541563;
	Tue, 10 Oct 2017 04:05:41 -0700 (PDT)
Received: from workhorse.madison.systems
	(c-67-170-200-185.hsd1.ca.comcast.net. [67.170.200.185])
	by smtp.gmail.com with ESMTPSA id
	n18sm19523281pfg.44.2017.10.10.04.05.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 10 Oct 2017 04:05:39 -0700 (PDT)
From: Matt Madison <matt@madison.systems>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Oct 2017 04:05:12 -0700
Message-Id: <1507633512-30719-1-git-send-email-matt@madison.systems>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] go: update to go1.9.1
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
X-List-Received-Date: Tue, 10 Oct 2017 11:05:41 -0000

Addresses two security issues, including CVE-2017-15041

Reference:
http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2017-15041

Signed-off-by: Matt Madison <matt@madison.systems>
---
 meta/recipes-devtools/go/go-1.9.inc | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/go/go-1.9.inc b/meta/recipes-devtools/go/go-1.9.inc
index 65adaa8..a2f2b2f 100644
--- a/meta/recipes-devtools/go/go-1.9.inc
+++ b/meta/recipes-devtools/go/go-1.9.inc
@@ -1,5 +1,7 @@
 require go-common.inc
 
+PV = "1.9.1"
+
 GO_BASEVERSION = "1.9"
 FILESEXTRAPATHS_prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
 
@@ -16,5 +18,5 @@ SRC_URI += "\
         file://0008-make.bash-add-GOHOSTxx-indirection-for-cross-canadia.patch \
         file://0009-cmd-go-buildmode-pie-forces-external-linking-mode-on.patch \
 "
-SRC_URI[main.md5sum] = "da2d44ea384076efec43ee1f8b7d45d2"
-SRC_URI[main.sha256sum] = "a4ab229028ed167ba1986825751463605264e44868362ca8e7accc8be057e993"
+SRC_URI[main.md5sum] = "27bce1ffb05f4f6bd90d90081e5d4169"
+SRC_URI[main.sha256sum] = "a84afc9dc7d64fe0fa84d4d735e2ece23831a22117b50dafc75c1484f1cb550e"
-- 
2.7.4


