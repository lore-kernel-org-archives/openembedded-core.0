Return-Path: <fahad.usman@gmail.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id 2DB8E71191
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Aug 2014 07:36:46 +0000 (UTC)
Received: by mail-pa0-f51.google.com with SMTP id rd3so1451170pab.38
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Aug 2014 00:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=WcuF6mwYmJa9tJcScED7VpsHTXJyBk6PubHKL8awR68=;
	b=0Z8acHezZ+PZPVRMHQxqFrRSlVRNPJz9mrpfL/yZ41+y5ahEuuXcgFnfoa8CAP4Wa6
	34bSAWJVMz6TosSHj7oHPvWycFCkQVgzTTQKf21e8Z+Nnnn8lAcyc/HHSBjAK9B1H+0V
	rPjJKiFD6CLhNRK80hFv0+WQPnsCOSQ/pfFwg5Iys4q0lbXrV97mHAuIK63foGPlcxfb
	WC00qEDE2C+aOmYYDh1iBfbmNQAWKH9EUpDKwAHtb4Rx56OXfTMs6I4IJ8Qk++gcluPz
	TrEBOdBwNoYTmf+AOtgqPYrVw2b626bzByH2UX/jV5O0OGcUl3lDqrFJC3kN+QP/Q6rP
	NAqg==
X-Received: by 10.69.18.65 with SMTP id gk1mr3120915pbd.68.1409211406229;
	Thu, 28 Aug 2014 00:36:46 -0700 (PDT)
Received: from fahad-M4700.pkl.mentorg.com ([110.93.212.98])
	by mx.google.com with ESMTPSA id aj3sm2568522pbc.92.2014.08.28.00.36.43
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 28 Aug 2014 00:36:45 -0700 (PDT)
From: Fahad Usman <fahad.usman@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Aug 2014 12:36:17 +0500
Message-Id: <1409211377-6437-2-git-send-email-fahad.usman@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1409211377-6437-1-git-send-email-fahad.usman@gmail.com>
References: <1409211377-6437-1-git-send-email-fahad.usman@gmail.com>
Subject: [PATCH 2/2] buildtools-tarball: export GIT_SSL_CAINFO
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
X-List-Received-Date: Thu, 28 Aug 2014 07:36:49 -0000

export GIT_SSL_CAINFO so git can find the certs

Signed-off-by: Fahad Usman <fahad.usman@gmail.com>
Signed-off-by: Christopher Larson <kergoth@gmail.com>
---
 meta/recipes-core/meta/buildtools-tarball.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-core/meta/buildtools-tarball.bb
index 07e8e37..283312c 100644
--- a/meta/recipes-core/meta/buildtools-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-tarball.bb
@@ -69,4 +69,6 @@ create_sdk_files_append () {
 	# so instead of exporting the variable, we use a comment here.
 	echo '#OECORE_NATIVE_SYSROOT="${SDKPATHNATIVE}"' >> $script
 	toolchain_create_sdk_version ${SDK_OUTPUT}/${SDKPATH}/version-${SDK_SYS}
+
+	echo 'export GIT_SSL_CAINFO="${SDKPATHNATIVE}${sysconfdir}/ssl/certs/ca-certificates.crt"' >>$script
 }
-- 
1.9.1


