Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 8D30C797E4
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Sep 2018 16:03:50 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id k19-v6so7250330pfi.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Sep 2018 09:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=azDOI8pqZ3O+GpPYswFOFeODqQy8CVmm9A+hZzlO7MU=;
	b=k/vSjRDgQmjGk4KnjaajxE4gv45JphmYHy5ZFSDxvDKMK7whCY1DNJ/cxjpBQ38zd1
	W2ZokixPfthIVYI3gkYxQ367ZrSue+hojORfFZHXeDfJssilXwiEWBYd8UonKwySgy2s
	jiO2orLVePqDei7VDuOxMmsPqlfbr3ogovI1E2kTazURywgd37Gen0AXCId3/BeJFprP
	P4oKuJ8JyT3iTpZq+qx0xdynkPPOljX9Uc4KuTq8siTfEJd23UfvdfCe+rLx+3o+cydT
	m49N/84G9yjNqlQf57XwdLPoKx+kdn59WydQDHBqYohSAAI/8a61/NBiZSd/iiX66XUV
	hq9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=azDOI8pqZ3O+GpPYswFOFeODqQy8CVmm9A+hZzlO7MU=;
	b=kyg94+Nj6YmtBGJuUliR/BZgeAO1V3F7w6t7qUT7YxqCT/3lmWcf588uueGf4LdA9G
	P5kWZpWFGdQW7Z2lGP1gzBcYI6qiTAhB9aoYRmczmjD+HDL4QpmSEV6nC5mIkNs3hG9x
	sK04ONjNROu6DWmPiWuVuVaeGfFOm4rnwgl+QzlQtFlCA3b0QljuSAIUZ/bEbGWLz+0J
	jsJi6YmLZoMLapgyzfkBSr68KD96HZHRIJL0HFdQgJzIU8qSA8zWz+s4/kMfOc50A3/n
	8AdaYqP52mIq2bg/wrgg87lpJGU9wSwc1fhyW9SfVcvtm/2vZjYpSiX8OnK5aHWWuMWx
	hRHw==
X-Gm-Message-State: APzg51DiEImqrEThk48kqkcL1SyPZigGEZ6gwNQ0pfmOXmO0B6dH53UT
	XWsXL8E/ZpVJVW8ENDV3Uaeb8OzH
X-Google-Smtp-Source: ANB0VdZNysnmrGoEnAFGkCLU63uoyO+ZWTlSTVh6PXc+G3FZw/kgBfc+qlusVxgkVlYlls1SoTPEMg==
X-Received: by 2002:a63:5e45:: with SMTP id
	s66-v6mr8884037pgb.151.1536336230915; 
	Fri, 07 Sep 2018 09:03:50 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::71e7])
	by smtp.gmail.com with ESMTPSA id
	y7-v6sm10438048pge.8.2018.09.07.09.03.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 07 Sep 2018 09:03:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Sep 2018 09:03:35 -0700
Message-Id: <cover.1536336171.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
Subject: [PATCH 0/1] sysprof: Fix build with clang
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
X-List-Received-Date: Fri, 07 Sep 2018 16:03:50 -0000

The following changes since commit 9084818dfc5cdf22ed9fb4d13d08941460380267:

  busybox/packagegroups: Break out the busybox-syslog dependency (2018-09-07 12:48:00 +0100)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib kraj/master
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=kraj/master

Khem Raj (1):
  sysprof: Fix build with clang

 ...fix-non-literal-format-string-issues.patch | 34 +++++++++++++++++++
 meta/recipes-kernel/sysprof/sysprof_3.30.0.bb |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-kernel/sysprof/files/0001-fix-non-literal-format-string-issues.patch

-- 
2.18.0


