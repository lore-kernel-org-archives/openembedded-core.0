Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
	[209.85.221.42])
	by mail.openembedded.org (Postfix) with ESMTP id C79707FC4F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 21:29:18 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id q10so24050436wrm.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 13:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=T2SVfuPy4aSTVjBUkYLVzFWAa/2l8VnUR44YJVDylLA=;
	b=aN+ck8yW56Ag4+DTkpo1/rko+RfK21kqjt4kVqZl+cdTWUhf+hWnk8zPqc2eX9pTMv
	I9Okjp/iUTz8uQV+D0XUA0oiNqQ6XseKSUFlmE1no2WjuROODYuKodRFRh9KycZMttDU
	W6tmBAthvU79Ck9psbXMlVtflDqZ62Qs9mxVStVuQgdzCepk0hIJtpxlYUl7Iy/86Oc4
	8XjtoGofiaei+UM+jg2URVmw7ZNdxvF9NlzrMUZtA541W+/e72GkCHI835heYhOt6mGf
	iC6b26aSdMoZplbLEM2spp+Yy+orfepX4uU95RqlvaWbwOR+rPta8C3UfDFNBd0Exih8
	cGpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=T2SVfuPy4aSTVjBUkYLVzFWAa/2l8VnUR44YJVDylLA=;
	b=f+mC9R1nKS8jLXgrb3npnoV7IgCqJzUxNKop5fF/IkPjSYb07b2yOB75zGG9F64FLw
	WMZVwkjzrehoyf2f4hYsBQmN/nzdp6kYBCyarFDitZCnnyblqDKHel+CJO70e3+HuJLH
	dWHA8ZS6MyQ3jyUyxFoXRnGTFu9ZkRlD2M0Gzwl6gi09ejnXYe8UQIoxvphL3D7syo6U
	34aCXFVn+pQ3cfRs7xBx4sYMGGa1T7E8HSLDji5DcaRDkKN7gp8eBATE15ugcxthPDxG
	FtEPZh2z2RY2X+tIWqUqrn6WnB1YJUW9vYiyevP9sfztmJ3aWbTpO+RVhOe5H1/xdcc4
	W47g==
X-Gm-Message-State: APjAAAWEpNnZKwrorIQIinG+pSjEu0uBxbEZ0s2PUbftYu6L+ZMrj59i
	JrkBLSJHs1NoaMvpTpoEZrjlK14TTls=
X-Google-Smtp-Source: APXvYqxZcT4/52l9yHzSO/wySR0Q27ZprL0+R9gn2IM7sQHqk8m72FVwf85rDNIexm5Lw23wsum/6w==
X-Received: by 2002:adf:fe12:: with SMTP id n18mr5528462wrr.158.1579296559451; 
	Fri, 17 Jan 2020 13:29:19 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F0BBB19EA1F5BE194E084E5.dip0.t-ipconnect.de.
	[2003:f0:7f0b:bb19:ea1f:5be1:94e0:84e5])
	by smtp.gmail.com with ESMTPSA id
	l7sm36094689wrq.61.2020.01.17.13.29.18
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 17 Jan 2020 13:29:18 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Jan 2020 22:29:00 +0100
Message-Id: <20200117212908.32647-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200117212908.32647-1-schnitzeltony@gmail.com>
References: <20200117212908.32647-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH][v2 02/10] itstool: extend to nativesdk
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
X-List-Received-Date: Fri, 17 Jan 2020 21:29:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This was not done in meta-oe but shared-mime-info extends to nativesdk either.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta/recipes-support/itstool/itstool_2.0.6.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/itstool/itstool_2.0.6.bb b/meta/recipes-support/itstool/itstool_2.0.6.bb
index 8290c5e581..5f358f463d 100644
--- a/meta/recipes-support/itstool/itstool_2.0.6.bb
+++ b/meta/recipes-support/itstool/itstool_2.0.6.bb
@@ -9,12 +9,13 @@ DEPENDS = "libxml2-native"
 
 SRC_URI = "http://files.itstool.org/${BPN}/${BPN}-${PV}.tar.bz2"
 SRC_URI_append_class-native = " file://0001-Native-Don-t-use-build-time-hardcoded-python-binary-.patch"
+SRC_URI_append_class-nativesdk = " file://0001-Native-Don-t-use-build-time-hardcoded-python-binary-.patch"
 SRC_URI_append_class-target = " file://0002-Don-t-use-build-time-hardcoded-python-binary-path.patch"
 
 SRC_URI[md5sum] = "4306eeba4f4aee6b393d14f9c3c57ca1"
 SRC_URI[sha256sum] = "6233cc22726a9a5a83664bf67d1af79549a298c23185d926c3677afa917b92a9"
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
 
 RDEPENDS_${PN} += "libxml2-python"
 RDEPENDS_${PN}_class-native = ""
-- 
2.21.0


