Return-Path: <erik.boto@gmail.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id EF2A47E94C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jul 2019 05:52:19 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id a21so15569101ljh.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Jul 2019 22:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=S5PJ4L6OV/cRBIWCi82FDVC+ZllNzf+ixJnqS3TdsHQ=;
	b=YtnjphANNzQUe8NSvESArA8cUwHRwdK7OXdxkfoJVtaq4h5ebcN3N4X1M7mVv627Dv
	40sruqfDuf7RZtNBJJHwo5UIImhWSjUmAR1lSls2+eT+ahpmswg9eDAO1IIUbH1eJCR3
	VAOljCyJeWxozMWlvwJNqqrxMdXkVQqleFowh0OBW8jmoUjaqVWop0nQVi+vPqui8m0b
	pciJp2vCmipwVoaL3KIBplTKfJqKbS51MZZCTiw95sWB2ibnqsQQx1dLFzojmHsZjcyp
	tL2wcaSV/QnDFTHMIAe0spHK0ZAOfPvMQR84erSJ8/JK/n4jIeN0ii7nr/ANzb7bAa7x
	f7Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=S5PJ4L6OV/cRBIWCi82FDVC+ZllNzf+ixJnqS3TdsHQ=;
	b=RujT2ytIgjGbxRuZcWyv+eI/DoDHY+qoo/i0NdJfnZtJp+vVF37WFM3wFw97WT1RBg
	V4zpsOT888LvtvQM4BWvMzzYexEazYgtKKBjOtGUxDzVrfuzgbFPDvMhiTINtADs4A0c
	AU6FMg6UaZrJtRKoHYTtG8oD0Ccurfpf+TpwvXFJWQThLZOs8wOnF24+iSmFOcEYCf1w
	SQOtg44y4ssGsNMcjIl2GX2uMUiC6/RavagySuJqs2OLSS/d9pmkMaDJoxEGjadej7zA
	+Ib+pE28HDgrWmLgEammMmmtdIyl3bJ15hFMI77fO30cs3pAvFp6g0mopme+T2z70NtS
	xS2w==
X-Gm-Message-State: APjAAAXnZCpXlRu7gFrmw4qA0gam82D9rtbrKlwSsGDY5Me3NIFOuRQj
	U2xnaVwL9t913EXNTez1uYCHtJCHby8=
X-Google-Smtp-Source: APXvYqyeKeXKtD8PFh5+toh3xaFz+V+s10aTKhxQv+GVlum+goeCmyCbxZzdQEqGSCNWJ+SxYnRcBA==
X-Received: by 2002:a2e:124c:: with SMTP id t73mr16004970lje.190.1562046739543;
	Mon, 01 Jul 2019 22:52:19 -0700 (PDT)
Received: from localhost.localdomain (90-231-37-116-no154.tbcn.telia.com.
	[90.231.37.116])
	by smtp.gmail.com with ESMTPSA id p5sm3572760ljb.91.2019.07.01.22.52.18
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 01 Jul 2019 22:52:18 -0700 (PDT)
From: =?UTF-8?q?Erik=20Bot=C3=B6?= <erik.boto@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Jul 2019 07:52:08 +0200
Message-Id: <20190702055208.119106-1-erik.boto@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] paho-mqtt-c: enable SSL
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
X-List-Received-Date: Tue, 02 Jul 2019 05:52:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Pass the option PAHO_WITH_SSL=ON when invoking cmake in order to enable
the build of the SSL variants of the libraries.

Signed-off-by: Erik Botö <erik.boto@gmail.com>
---
 meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.0.bb b/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.0.bb
index 79a8f43d7..f3086315d 100644
--- a/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.0.bb
+++ b/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.0.bb
@@ -26,3 +26,5 @@ do_install_append() {
     rm -rf ${D}${prefix}/samples
     find ${D}${prefix} -maxdepth 1 -type f -delete
 }
+
+EXTRA_OECMAKE = "-DPAHO_WITH_SSL=ON"
-- 
2.20.1


