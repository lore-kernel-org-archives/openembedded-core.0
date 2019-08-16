Return-Path: <wesley.lindauer@gmail.com>
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
	[209.85.210.182])
	by mail.openembedded.org (Postfix) with ESMTP id D10697F378
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2019 19:45:12 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id w26so3596549pfq.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2019 12:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=7CtDnSpettIMq64P41VTmGKHp6fBrhyOXdlBxf4gs0o=;
	b=DrR3JQYwxiv2s1odDTWBWsLJorlTbs0/MBJ+kSzwWu/a6AhoM3aW7JE8y/nmRURtHP
	pjH38cEv0eWX62vMVxjudAXeEqo6Bis0VltZpEhS76fOhf28gaGVrJZIsXxgHnVUXW36
	/NsWK61i5DnOHPNKGgyOwCxm0ysGnfqlnBt7Z7gG14hekVCsxaweLrLLjSjx2e5rjyqj
	AL9a7YKjYWxtKJVXNqDVT1QTGd3wdS7OHZD2nKVzx6besSMhdDu1wE6sbluse7VHODXH
	ByRftu1HwmVrFAw96If1oo/SzacyC8GugX3nNUrL1fGKPittL7TU27dAoU6xwSM6eFPu
	CFFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=7CtDnSpettIMq64P41VTmGKHp6fBrhyOXdlBxf4gs0o=;
	b=gbu1SNJ6X0msEqYVIW8XQHZkkR+nT009+p5pTNd+MsPomgQHk/bKXuI7BM4GsGjdPA
	zWUR1OfkzJR4fH/4qTuDsHfBUeJZXAhzhN0MFPlx4gokWQQpmH5j6M69gwbz+7bmaCuU
	obAvpiv3rMSXp3xQm1QiEOyt4vhsjVdUZvb4BICbjHaEn9g0W3HADNlNm1xsMxadN9QJ
	Z097ZmPIy1u+8IuP8is+xEqRS8fKFqCVKGAb74bIKaYqApL5BsdA5aIa6Stm2Tv78YDz
	/Q2QhOE+442E76hGQMRrnXy9O78O1tNPIkY6MgfhbIF/+QnJvQUqbuUZo+R0xJKDn7yt
	iTzA==
X-Gm-Message-State: APjAAAW8/tskn7SCPuTO/81XI280lqO8OgchdnImw+mMAbRLJnnpS3NV
	AIz+Ex8csJdEtVrQtM+N+oedYnly
X-Google-Smtp-Source: APXvYqxJVjA6Dwk+rcerZfWyS7ikIODYlVxTM+/A6N0mt3SWjREbWk4qsCuodiMoECrOtdTdypi15A==
X-Received: by 2002:aa7:818b:: with SMTP id g11mr12533504pfi.122.1565984713901;
	Fri, 16 Aug 2019 12:45:13 -0700 (PDT)
Received: from camaro.lpdev.prtdev.lexmark.com ([192.146.101.90])
	by smtp.gmail.com with ESMTPSA id
	o35sm5537333pgm.29.2019.08.16.12.45.11
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 16 Aug 2019 12:45:13 -0700 (PDT)
From: Wes Lindauer <wesley.lindauer@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Aug 2019 15:44:01 -0400
Message-Id: <20190816194405.12751-2-wesley.lindauer@gmail.com>
X-Mailer: git-send-email 2.14.5
In-Reply-To: <20190816194405.12751-1-wesley.lindauer@gmail.com>
References: <20190816194405.12751-1-wesley.lindauer@gmail.com>
Subject: [PATCH 2/6] openssh: Update LICENSE field with missing values
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
X-List-Received-Date: Fri, 16 Aug 2019 19:45:12 -0000

The LICENSE file states that some code is licensed under BSD, some under
ISC, and some under MIT. The LICENSE field should reflect all of these.
---
 meta/recipes-connectivity/openssh/openssh_8.0p1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssh/openssh_8.0p1.bb b/meta/recipes-connectivity/openssh/openssh_8.0p1.bb
index 35cdf71eb3..01eaecd4ec 100644
--- a/meta/recipes-connectivity/openssh/openssh_8.0p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_8.0p1.bb
@@ -5,7 +5,7 @@ Ssh (Secure Shell) is a program for logging into a remote machine \
 and for executing commands on a remote machine."
 HOMEPAGE = "http://www.openssh.com/"
 SECTION = "console/network"
-LICENSE = "BSD"
+LICENSE = "BSD & ISC & MIT"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=429658c6612f3a9b1293782366ab29d8"
 
 DEPENDS = "zlib openssl virtual/crypt"
-- 
2.14.5


