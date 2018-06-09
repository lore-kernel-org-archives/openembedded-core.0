Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 0AA52787E1
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Jun 2018 20:00:47 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id q4-v6so6828920pgr.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Jun 2018 13:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=cCeFqNLHtU8sQ/zCcvRmOl+0Qj6M2VUna/Smd6SrcoE=;
	b=LbRc91YV+kKOdKbca8nH/yb7h1K7WtkD/sTYYApgezzg2REDZnGnMTb15/cd8R0uIS
	cXUJ6XioR5XrrlNEJPiW0ck7qkMGa5t7lTd4aDRwetKji6/Nebx1MoSEH2unEDwX+yEV
	4maJz0YJAzC38W+3Ih7VWPS1oZ6myrJYvtSHjl3CxZMbGBqoqZ8GWAV1oAdd1uz9QL0h
	60e9Ill/Cape8pOeU0orfTKHkFfJPPjzfbBW7UOHcp5BftIKFZznsAuKU4G2QiC79vcX
	Pcx0KBM0VuJNeKaio3aLeUGsXckPZ3XIn3DwjVntYHX7amTXOK4S4KkdacnMzMbQdxvg
	kRbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=cCeFqNLHtU8sQ/zCcvRmOl+0Qj6M2VUna/Smd6SrcoE=;
	b=BaGfVW09CUSJndiSnkHmaJkFqpu2q/qzvvfe/3fxdQ0aXDR+k8v8rZ/eZ+7kFkx2i1
	GWMSM74/KVwMmgoVfITujtbqOmyLHaFK43mLd3o7PKoVRb4zBRvprnOg8zugptn5Qu9c
	iInBL2NUSWBFr0KEhSYKAh09JzU4CnWwbhL4CO4Y36OtlRMsiE3BNScwWC2Bgzq/yeoF
	NmmRLb5cLBZJMupPe1wW7JMrmoVrkq8H/72gNY/RwodTM4Dm0sLMV2RuRP5cwhNdpAEI
	dIlxMB+1x2xpc1uZKXDvMbAWbb+uXzn3HDIdqwb1jxv+Mbk1xEWwRh5cfhL3utoDiKvw
	nkcw==
X-Gm-Message-State: APt69E3mVQEwGSPtJXSDkjSgf6SIAK3PAK615P8Pg5M2f0Fk94ynmAHG
	AIgDxNVUaSNjF2kZ5BxIfFk=
X-Google-Smtp-Source: ADUXVKKvnHriYYyrxHhVh0zE+76u8cNk6CyZZwn6ErpYTYmgH9w+YT2o/Z3IzoXH9J12DUK1N4AGxQ==
X-Received: by 2002:a62:e401:: with SMTP id
	r1-v6mr11303085pfh.172.1528574449177; 
	Sat, 09 Jun 2018 13:00:49 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:34b1:53bf:ee45:2976])
	by smtp.gmail.com with ESMTPSA id
	68-v6sm102469622pfk.46.2018.06.09.13.00.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 09 Jun 2018 13:00:48 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-core@lists.openembedded.org
Date: Sat,  9 Jun 2018 13:00:45 -0700
Message-Id: <1528574447-21755-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 0/2] Adding cmake selftest
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
X-List-Received-Date: Sat, 09 Jun 2018 20:00:48 -0000

This is my first selftest so any feedback is welcome.

This selftest should help catch regressions when boost is updated and cmake is not. It appears cmake may be version sensitive to some packages so we may want to expand these selftests for other packages that live in core.  I got the testcase from Dennis Menschel via Yocto bug 12762 so many thanks.
 

Armin Kuster (2):
  selftest: add cmake test
  selftest: add cmake oeqa portion

 .../recipes-test/cmake/cmake-boost-version-test.bb | 20 ++++++++++
 .../recipes-test/cmake/files/CMakeLists.txt        | 24 ++++++++++++
 .../recipes-test/cmake/files/helloworld.cpp        |  7 ++++
 meta/lib/oeqa/selftest/cases/cmake.py              | 43 ++++++++++++++++++++++
 4 files changed, 94 insertions(+)
 create mode 100644 meta-selftest/recipes-test/cmake/cmake-boost-version-test.bb
 create mode 100644 meta-selftest/recipes-test/cmake/files/CMakeLists.txt
 create mode 100644 meta-selftest/recipes-test/cmake/files/helloworld.cpp
 create mode 100644 meta/lib/oeqa/selftest/cases/cmake.py

-- 
2.7.4


