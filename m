Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 7B3EA7F815
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Dec 2019 11:24:06 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id c14so6790961wrn.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Dec 2019 03:24:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=XNIJDWsT4z9N1xPiLgSxGTojMex0zCXIUj/fqCEzPUY=;
	b=r9WfXWVkHoD8gV74u49LobUMVycVXw8OvE36jMT7rBgQM09g9jo16CcQwuuCsxBUu5
	jdP0fnwjnDyg5zYcey5lxH7swvzKVUi6oGTOc/F5iHp+oz9dLlqlP/4uW/A05tClILuj
	TekMmoN6BlikYSE/G2/XE8jfU69UEOnNqBbd43nhBqdVx9Pz11x4zGX8lWeO13udFJGr
	c/1+OamB5f8OQCTBzL78iMbz93Dplv+7cwBdE/Y7y24+9iUjVQElqxV17ZCNHdMSSPtk
	q3X0bBvPeeG//z95D9jn8j5zh7pzAtYKq2+9MT5OHTq4KKexqSmiY/q8w3IsIudult8Q
	zFlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=XNIJDWsT4z9N1xPiLgSxGTojMex0zCXIUj/fqCEzPUY=;
	b=IpfvIiJi6/lVhZ7ruE5xhjjYz+itYa69JReb7Y61eUaVDICty+amuLnSHLWIW6WKGe
	hdPnN+5DiKyseFigdmHYoMoNyFCo8arXfqeNBCV0oIYyl24cqd2n0ij0f621UoAbofDJ
	PnqaX7+abvHcRv9uM2Rh1uWS0cVeQAbUCK5/qRkSPSIIL+LN8iAAt/FCIn8aO6Gm9/yz
	rhtnSWfVrlqkqR3ZZSQps29sCDLXi7+X1IhCa90GeksHm4gaetsFWOT5zqxBXYno4f69
	IbJD0rhjCw30wX8dzE319l055jQE7fYV3nfH0dSUaBun4Oiy2tV1saaCCrEbVMA5kwoF
	dscw==
X-Gm-Message-State: APjAAAUJcLQ36zWUdd7N/R5Q03A32pgN3wWz/a0SAuIFGplnFZt0YL6P
	Bs0YXdBiM4aNk5VQVy0rK/uLGVNqiww=
X-Google-Smtp-Source: APXvYqyIUNFHs/hhu+00fI8ZZ5n3bESYiY3Zw0rtg4ZjMzz0191mH7OEmsj9+FdmDVyENiea7jfxaQ==
X-Received: by 2002:adf:eb89:: with SMTP id t9mr30104706wrn.5.1576495446733;
	Mon, 16 Dec 2019 03:24:06 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	b17sm21198537wrp.49.2019.12.16.03.24.04
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 16 Dec 2019 03:24:05 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Dec 2019 11:24:02 +0000
Message-Id: <20191216112402.2538-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] podfix: only alter normal files
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
X-List-Received-Date: Mon, 16 Dec 2019 11:24:06 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/podfix.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/podfix.bbclass b/meta/classes/podfix.bbclass
index 54fff6a0a23..cc8210a27e2 100644
--- a/meta/classes/podfix.bbclass
+++ b/meta/classes/podfix.bbclass
@@ -16,6 +16,9 @@ python pod_strip_version() {
     for root, dirs, files in os.walk(d.expand("${D}${mandir}")):
         for filename in files:
             filename = os.path.join(root, filename)
+            if not os.path.isfile(filename):
+                continue
+
             with opener(filename, "rb") as manfile:
                 manpage = manfile.read()
                 m = bad_re.search(manpage)
-- 
2.20.1


