Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
	[209.85.221.45])
	by mail.openembedded.org (Postfix) with ESMTP id 8E3EA7F27E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2019 16:11:56 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id c2so92267046wrm.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Aug 2019 09:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=MYcEQD/h4uadGcSJXIIhFf3q7AIa99SoZkF2h3E3COQ=;
	b=WvpEt5hZbGUmmr7U959hmox4YsMJ9otEgvYRYqvSRvugMhPHzz3VGW6O5lLK0uHpIO
	3X52y8QQWmxciII2fGNvk4QWfXzmQ2H54R7gQ8DuHAz/SKR/1J1DgbUrXJkUw8Hhe0xT
	tfsVY1gIhKXTB1FpSNex0/nyjE9yo3N1Ct5fnVEOTAxV4gxKOMN04+ylIUIxcgkzGKjt
	HV9XxhvyBsurJfEfJtb0L1owbhWRNTIvOQCmilbOyl9qsndoSZ8DnCqLImejn7Y+Nxpy
	q9otgQYdfFKFVg4Ly1fKGnDt7oNnqGBRL8eUlwnlcm5plprcIMSdWlNNxQj6Czn/FDHa
	NVrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=MYcEQD/h4uadGcSJXIIhFf3q7AIa99SoZkF2h3E3COQ=;
	b=t8iG+tUdY/zjdiHSBnA0Kr9RXlGEdCFkz2Dod0TAEany2az98wuDYz9kqs4dpDzKdy
	jgflD+0FAK9hEZFXsdKj7tpTy72qL4I8pj65C+H9OvEEVI/UezHXjAxEstZWgbr0gGWT
	PyohuDFjWNxKyO4JQ76ej/xQwbBRwsWXN5ST/+Q2Mlo8Zwkg/SOFNHiAI4jJX/xrf3h3
	p8qc90daT3wpyMN2Yg2W04TjCObfQwIrtwMMR35vDH9dcGqZRuja5I6KjAnfKYTG9QJ7
	/lEgopW8G+Dv6h8AAi6r6q/JlbwztPZdnyh701+eqJZmzxKaAH+KYNk03E91AeYUrzTq
	lrNA==
X-Gm-Message-State: APjAAAVDlw4zdRcT65lWJFLRhTN1JpVyen2mMra2LSWuFepAAWSHdn0K
	IRQaAlAViQ5QSP7mm/elQQP9eCYVmo4=
X-Google-Smtp-Source: APXvYqyx5erVfwOS1V/YGMkXpk2HRLIvK4A0oaypd5fIzpAtlovZ4wjxSHzyHxP3KRcWuu3bw5dCgg==
X-Received: by 2002:adf:a348:: with SMTP id d8mr5778028wrb.235.1565280717178; 
	Thu, 08 Aug 2019 09:11:57 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	i66sm5499876wmi.11.2019.08.08.09.11.56
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 08 Aug 2019 09:11:56 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Aug 2019 18:11:46 +0200
Message-Id: <20190808161150.44877-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190808161150.44877-1-alex.kanavin@gmail.com>
References: <20190808161150.44877-1-alex.kanavin@gmail.com>
Subject: [PATCH 3/7] maintainers.inc: give python recipes to Oleksandr Kravchuk
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
X-List-Received-Date: Thu, 08 Aug 2019 16:11:56 -0000

Derek Straka has been inactive for about a year; Oleksandr
has been the de facto maintainer meanwhile.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/conf/distro/include/maintainers.inc | 60 ++++++++++++------------
 1 file changed, 30 insertions(+), 30 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 4c4446b3b63..5cf9c7a8e80 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -585,38 +585,38 @@ RECIPE_MAINTAINER_pn-ptest-runner = "Ross Burton <ross.burton@intel.com>"
 RECIPE_MAINTAINER_pn-pulseaudio = "Tanu Kaskinen <tanuk@iki.fi>"
 RECIPE_MAINTAINER_pn-pulseaudio-client-conf-sato = "Tanu Kaskinen <tanuk@iki.fi>"
 RECIPE_MAINTAINER_pn-puzzles = "Anuj Mittal <anuj.mittal@intel.com>"
-RECIPE_MAINTAINER_pn-python = "Derek Straka <derek@asterius.io>"
-RECIPE_MAINTAINER_pn-python-native = "Derek Straka <derek@asterius.io>"
-RECIPE_MAINTAINER_pn-python-nose = "Derek Straka <derek@asterius.io>"
-RECIPE_MAINTAINER_pn-python-numpy = "Derek Straka <derek@asterius.io>"
-RECIPE_MAINTAINER_pn-python-scons = "Derek Straka <derek@asterius.io>"
-RECIPE_MAINTAINER_pn-python-scons-native = "Derek Straka <derek@asterius.io>"
-RECIPE_MAINTAINER_pn-python-setuptools = "Derek Straka <derek@asterius.io>"
-RECIPE_MAINTAINER_pn-python3 = "Derek Straka <derek@asterius.io>"
-RECIPE_MAINTAINER_pn-python3-async = "Derek Straka <derek@asterius.io>"
-RECIPE_MAINTAINER_pn-python3-dbus = "Derek Straka <derek@asterius.io>"
-RECIPE_MAINTAINER_pn-python3-docutils = "Derek Straka <derek@asterius.io>"
-RECIPE_MAINTAINER_pn-python3-extras = "Derek Straka <derek@asterius.io>"
-RECIPE_MAINTAINER_pn-python3-file-utils = "Derek Straka <derek@asterius.io>"
-RECIPE_MAINTAINER_pn-python3-git = "Derek Straka <derek@asterius.io>"
-RECIPE_MAINTAINER_pn-python3-gitdb = "Derek Straka <derek@asterius.io>"
-RECIPE_MAINTAINER_pn-python3-iniparse = "Derek Straka <derek@asterius.io>"
-RECIPE_MAINTAINER_pn-python3-mako = "Derek Straka <derek@asterius.io>"
-RECIPE_MAINTAINER_pn-python3-native = "Derek Straka <derek@asterius.io>"
-RECIPE_MAINTAINER_pn-python3-nose = "Derek Straka <derek@asterius.io>"
-RECIPE_MAINTAINER_pn-python3-numpy = "Derek Straka <derek@asterius.io>"
-RECIPE_MAINTAINER_pn-python3-pbr = "Derek Straka <derek@asterius.io>"
-RECIPE_MAINTAINER_pn-python3-pip = "Derek Straka <derek@asterius.io>"
-RECIPE_MAINTAINER_pn-python3-pycairo = "Derek Straka <derek@asterius.io>"
-RECIPE_MAINTAINER_pn-python3-pygments = "Derek Straka <derek@asterius.io>"
-RECIPE_MAINTAINER_pn-python3-pygobject = "Derek Straka <derek@asterius.io>"
+RECIPE_MAINTAINER_pn-python = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
+RECIPE_MAINTAINER_pn-python-native = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
+RECIPE_MAINTAINER_pn-python-nose = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
+RECIPE_MAINTAINER_pn-python-numpy = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
+RECIPE_MAINTAINER_pn-python-scons = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
+RECIPE_MAINTAINER_pn-python-scons-native = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
+RECIPE_MAINTAINER_pn-python-setuptools = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
+RECIPE_MAINTAINER_pn-python3 = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
+RECIPE_MAINTAINER_pn-python3-async = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
+RECIPE_MAINTAINER_pn-python3-dbus = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
+RECIPE_MAINTAINER_pn-python3-docutils = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
+RECIPE_MAINTAINER_pn-python3-extras = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
+RECIPE_MAINTAINER_pn-python3-file-utils = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
+RECIPE_MAINTAINER_pn-python3-git = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
+RECIPE_MAINTAINER_pn-python3-gitdb = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
+RECIPE_MAINTAINER_pn-python3-iniparse = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
+RECIPE_MAINTAINER_pn-python3-mako = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
+RECIPE_MAINTAINER_pn-python3-native = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
+RECIPE_MAINTAINER_pn-python3-nose = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
+RECIPE_MAINTAINER_pn-python3-numpy = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
+RECIPE_MAINTAINER_pn-python3-pbr = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
+RECIPE_MAINTAINER_pn-python3-pip = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
+RECIPE_MAINTAINER_pn-python3-pycairo = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
+RECIPE_MAINTAINER_pn-python3-pygments = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
+RECIPE_MAINTAINER_pn-python3-pygobject = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3-scons = "Tim Orling <timothy.t.orling@linux.intel.com>"
 RECIPE_MAINTAINER_pn-python3-scons-native = "Tim Orling <timothy.t.orling@linux.intel.com>"
-RECIPE_MAINTAINER_pn-python3-setuptools = "Derek Straka <derek@asterius.io>"
-RECIPE_MAINTAINER_pn-python3-six = "Derek Straka <derek@asterius.io>"
-RECIPE_MAINTAINER_pn-python3-smmap = "Derek Straka <derek@asterius.io>"
-RECIPE_MAINTAINER_pn-python3-subunit = "Derek Straka <derek@asterius.io>"
-RECIPE_MAINTAINER_pn-python3-testtools = "Derek Straka <derek@asterius.io>"
+RECIPE_MAINTAINER_pn-python3-setuptools = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
+RECIPE_MAINTAINER_pn-python3-six = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
+RECIPE_MAINTAINER_pn-python3-smmap = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
+RECIPE_MAINTAINER_pn-python3-subunit = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
+RECIPE_MAINTAINER_pn-python3-testtools = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-qemu = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER_pn-qemu-helper-native = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER_pn-qemu-native = "Richard Purdie <richard.purdie@linuxfoundation.org>"
-- 
2.17.1


