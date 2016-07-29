Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 36F77607A4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jul 2016 15:37:08 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id h186so5620904pfg.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jul 2016 08:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=ltfWEJ0aU8qu3hrRlQySeDNPf5bNMfGE+TpRQkvjY68=;
	b=MmP59XwhViXAPx/TxUyQg3Z+glO9Ig4fEia7PnSTdK50HVc7Pm9tEjelfMVtLmEhkt
	YSmi/DxMl4QmY2mGF6J8Srl/tiNu4FNimlXtFw5f38PL+jngKLJfR896ZSDmbdY/3/il
	tsCY08+Gv9fAL2KM1+ZZHwxpHk/nAtKeYtqPB+FpJIeBegt3S8OAWMLDk8HxTTIx2N55
	OP3RmvBo2VAPB6mKlUhKxw5Npt3VzNtbFaZI3F+NCUF4KkcRHsPNcwv06T4kMZA3YSkv
	FSwLhtDxGLxGXRvRIQ6ynVNTp6cqeCRCRh0iIR4FwgwKD6kIb5o7MBK0LV/Von0T7i9+
	PR4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=ltfWEJ0aU8qu3hrRlQySeDNPf5bNMfGE+TpRQkvjY68=;
	b=CXlEKRHKqWptxD18R89eEuYLbHNzTglz/E3DRY1LDa35IIXLFPS4e3JAZ1BRJeBHZO
	pKQB1PJFzXP9Dzu6PnB044kCwHT7iR4iABlxKzRcLmSyWi9ww3AGXafK9TnZGtkGH/JD
	4iCCw7o6AkBNEmmKL9QFvi7L6p6YZmXdDGR2KH+AVudSyrWkOCZtLMxFFaaxU8FObSg0
	jRoPkJmIkVJAF0o4o+0Ddlq6S/HG6vUwHicTenqXFFr7KZZHmgvGSmgMfTnxFn4MgvZe
	dMCcyxZKO3d46mH7yW6oMtaQoZxgjM8j6lpojGdOETs0Ab427T1itj7/dnmfmdzMX9dK
	8gww==
X-Gm-Message-State: AEkoousuStEJhzSJ8cPzvF9EiQ5YcUpZbGrYTw3lXUZgXzu3+F8twonpoBz2uFk2XwVgjg==
X-Received: by 10.98.103.70 with SMTP id b67mr69990648pfc.30.1469806629417;
	Fri, 29 Jul 2016 08:37:09 -0700 (PDT)
Received: from Pahoa2.hsd1.ca.comcast.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	n69sm25902838pfa.77.2016.07.29.08.37.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 29 Jul 2016 08:37:08 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Fri, 29 Jul 2016 08:36:52 -0700
Message-Id: <cover.1469806475.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [PATCH 00/12] Krogoth-next pull request
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
X-List-Received-Date: Fri, 29 Jul 2016 15:37:09 -0000

Please consider these for Krogoth-next. These fixed checkuri and host gcc 6 build issues.

The following changes since commit f73006031ef8bca7b8851724832c6f37ed63ec89:

  oeqa/recipetool: update recipe test to pass SHA (2016-07-27 14:10:51 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib akuster/krogoth-next
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akuster/krogoth-next

Maxin B. John (10):
  apmd: use snapshot.debian.org for SRC_URI
  ossp-uuid: use snapshot.debian.org for SRC_URI
  serf: use snapshot.debian.org for SRC_URI
  netbase: use snapshot.debian.org for SRC_URI
  docbook-xml-dtd4: use snapshot.debian.org for SRC_URI
  linuxdoc-tools: use snapshot.debian.org for SRC_URI
  blktool: use snapshot.debian.org for SRC_URI
  libaio: use snapshot.debian.org for SRC_URI
  mailx: use snapshot.debian.org for SRC_URI
  libproxy: use snapshot.debian.org for SRC_URI

Tim Orling (2):
  dpkg: use snapshot.debian.org for SRC_URI
  at: use snapshot.debian.org for SRC_URI

 meta/recipes-bsp/apmd/apmd_3.2.2-15.bb                               | 3 ++-
 meta/recipes-core/netbase/netbase_5.3.bb                             | 3 ++-
 meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb            | 4 +++-
 meta/recipes-devtools/dpkg/dpkg.inc                                  | 4 ++--
 meta/recipes-devtools/dpkg/dpkg_1.18.4.bb                            | 5 +++--
 meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native_0.9.69.bb | 3 ++-
 meta/recipes-devtools/ossp-uuid/ossp-uuid_1.6.2.bb                   | 3 ++-
 meta/recipes-extended/at/at_3.1.18.bb                                | 4 +++-
 meta/recipes-extended/blktool/blktool_4-7.bb                         | 3 ++-
 meta/recipes-extended/libaio/libaio_0.3.110.bb                       | 4 +++-
 meta/recipes-extended/mailx/mailx_12.5-5.bb                          | 3 ++-
 meta/recipes-support/libproxy/libproxy_0.4.11.bb                     | 4 +++-
 meta/recipes-support/serf/serf_1.3.8.bb                              | 4 +++-
 13 files changed, 32 insertions(+), 15 deletions(-)

-- 
2.3.5


