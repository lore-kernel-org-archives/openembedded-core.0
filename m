Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
	[209.85.208.41])
	by mail.openembedded.org (Postfix) with ESMTP id CBD6C79600
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Sep 2018 10:40:49 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id s10-v6so8469311edb.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Sep 2018 03:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=6Wdr6mHG7rl9kRJeT4YqK9t6vv6feRyHYQoh5B26Xfk=;
	b=FYRjCQpHqzVEGtzYW3+9DGSwihGsKuHCvr7Rog9TVjXJ6OISy3kebus16U6vpzSBmx
	7r7v5R2+O8R15H6ftGw93bFU6svbxURtdFopeR6YZFhtf9nWxosmLPiDjMp2VecUw7Fi
	fU5J6gKvRjQhGKehqojzqAj8iOZg9HtTyIZK4Qc0kShRIQxfPI3ZwCJ/SIrmGSzWv0KS
	IEr9CxVRtSfBJ+62y5bewk9vVzF9FqJVSgQoI+E10RjdveDD6go2alyYjWBrcZqytx9I
	CCxEh38HN6wrI8Lgh1yHlhKYTUigsBD5Gz5O7U1gzILUgWmaLPWCGle/yDrutBsAsOXq
	FSSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=6Wdr6mHG7rl9kRJeT4YqK9t6vv6feRyHYQoh5B26Xfk=;
	b=E3G2cRgKizUgFESJc8AyeoTRC9fKN/ODZJz1eNRj8NONpRSqHTBZT5zGCsDbs5COXD
	rtlofrE8++V6bkdOU5Bi/11kjBPuvl1Y+kw4iAmy3le+fR/cS1H2ObsI2OwnGydStR4I
	w0sMkptEW9s3lF0Hv4ueX/poxS8m1Xcac99lO6K9aPCppJmqoWlVJZfjW86FjaaDR2DE
	QWb4uhnMBeHnDRq9oCOCfoPS5O4mdORo6SaDUJ8j7AenADnEgZq+3wptNx1iHYT9fd+M
	1fQ6QLcoKzgaBSMoM9IujOc9HzkCHo80L4W/k+Y6UKcnaAJGFaT83nc/j0FSnb00OKRB
	4mXA==
X-Gm-Message-State: APzg51BZsfFRVpAEy10DrcBmaIfwDqvDfwzZjrj76yfqs6dxX0muenki
	yl/kpSNzz/f9WmRzM1nr0JCNyn6TyUo=
X-Google-Smtp-Source: ANB0VdYR5PS+dxjK3rKWe5UEr2vThumJu0kn5HWmnUjQjo8KcT3KCjcH405EAenYFNzkOwlB6ISiTw==
X-Received: by 2002:a50:fb8f:: with SMTP id
	e15-v6mr2733310edq.153.1536230450312; 
	Thu, 06 Sep 2018 03:40:50 -0700 (PDT)
Received: from localhost.localdomain ([79.140.126.226])
	by smtp.gmail.com with ESMTPSA id
	k28-v6sm2256506ede.11.2018.09.06.03.40.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 06 Sep 2018 03:40:49 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Sep 2018 12:40:27 +0200
Message-Id: <1536230436-30342-12-git-send-email-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1536230436-30342-1-git-send-email-alex.kanavin@gmail.com>
References: <1536230436-30342-1-git-send-email-alex.kanavin@gmail.com>
Subject: [PATCHv2 12/21] cantarell-fonts: update to 0.0.25
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
X-List-Received-Date: Thu, 06 Sep 2018 10:40:50 -0000

See here for the "reconstruct" explanation:
https://gitlab.gnome.org/GNOME/cantarell-fonts/commit/e28a9096da43984212b5b4002b949bcb8c7527f9

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-graphics/cantarell-fonts/cantarell-fonts_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_git.bb b/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_git.bb
index 9d8fb28..db480bd 100644
--- a/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_git.bb
+++ b/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_git.bb
@@ -10,10 +10,10 @@ SECTION = "fonts"
 LICENSE = "OFL-1.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=df91e3ffcab8cfb972a66bf11255188d"
 
-PV = "0.0.24"
+PV = "0.0.25"
 
-SRCREV = "07b6ea2cbbebfc360aa4668612a376be5e214eaa"
-SRC_URI = "git://gitlab.gnome.org/GNOME/cantarell-fonts;protocol=https;branch=master"
+SRCREV = "e28a9096da43984212b5b4002b949bcb8c7527f9"
+SRC_URI = "git://gitlab.gnome.org/GNOME/cantarell-fonts.git;protocol=https;branch=reconstruction-0.0.25"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(?!0\.13)(?!0\.10\.1)\d+\.\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.7.4


