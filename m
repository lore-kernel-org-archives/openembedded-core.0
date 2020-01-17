Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
	[209.85.221.41])
	by mail.openembedded.org (Postfix) with ESMTP id CD7577FC09
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 21:29:22 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id y17so24069624wrh.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 13:29:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=WW4gCLztUghaOXrQAerYvgK8lVCgah5qZicQlizG9S8=;
	b=KJ0tWuNiovYzpft6o6adzPs5S77bq/x1MoD5aTx5G3YjhLxLFjPvOAIRJZ0LBeX8F3
	uEYbNzFOccoG9hYVXV2LSbqpdtMdJhQk1Xl4ZkPpW+K0p3hRQNHUEDzc/i1PQITjyWes
	7ce3MozLHeSqqENLXh7yNtVD0kdrKOOxogfX9+uVsb8Iicptg2bBydTB8CS3NzfJfARR
	wYZMUkRMJghWWNfZxBhhV/fv6OyqUup3xMZF+FsND4YQW9CeUui4cQsXuWXlRh3hKove
	tEkUkk/nxBr/5ZXAg4/BkwOLCdaZiHcSNeZHahC/gVx/QZgzM+0lduokvVWK5OsplXYj
	AyKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=WW4gCLztUghaOXrQAerYvgK8lVCgah5qZicQlizG9S8=;
	b=ZNo79wGmIhpcXQmSJ9kCMunYfpsXZxbmWN3LFKNc7XC4f3NY1o5mhtP5fUXv08VNRp
	3JCzkSjZGsRfTeXX9pWJlaVoVGMVvTE08MS9RWAlsQod9u1me3ZeNcPEzoagjgBFmeg7
	CdD0Ush1R3qLiqixcI+VjrOzzySDs+gdtG/Ui8TPvEZ3iY3gH8JgeSBbNyvDwALy3Sms
	BeTH6O/+l27IjNXTFz/uxms/Gv4WVE8hg3GzoW9vDyfKBYr2Wk86ZeDLuRQuhP5OPAYB
	BIhC3YvOVSEAyML+mwiSAL7j3d+TpoKV1XOJveApoyhHpkxBMVSQUWcuJpWVIVt47m0T
	Ztlw==
X-Gm-Message-State: APjAAAXaVaw8m0mjhr4jzyK7a1xzfE6T3KB+H7wkgNq7MWr3DS6e+oRR
	3w+iuUtHTt1/Queb/nrsUc0EmYjt/ck=
X-Google-Smtp-Source: APXvYqyItxvtTUIzEX7oQ005wih54iHzX7gfYO5zrUN28/OxYFhpFeua+H7EM/VIxnyocO1POLch6A==
X-Received: by 2002:adf:d183:: with SMTP id v3mr5351123wrc.180.1579296563307; 
	Fri, 17 Jan 2020 13:29:23 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F0BBB19EA1F5BE194E084E5.dip0.t-ipconnect.de.
	[2003:f0:7f0b:bb19:ea1f:5be1:94e0:84e5])
	by smtp.gmail.com with ESMTPSA id
	l7sm36094689wrq.61.2020.01.17.13.29.22
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 17 Jan 2020 13:29:22 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Jan 2020 22:29:04 +0100
Message-Id: <20200117212908.32647-7-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200117212908.32647-1-schnitzeltony@gmail.com>
References: <20200117212908.32647-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH][v2 06/10] shared-mime-info: add mime to inherit
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
X-List-Received-Date: Fri, 17 Jan 2020 21:29:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

shared-mime-info-data: is the base for mime database

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta/recipes-support/shared-mime-info/shared-mime-info_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb b/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb
index bf48e453a0..b2d562157b 100644
--- a/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb
+++ b/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb
@@ -12,7 +12,7 @@ SRCREV = "829b26d85e7d89a0caee03046c3bce373f04c80a"
 PV = "1.15"
 S = "${WORKDIR}/git"
 
-inherit autotools pkgconfig gettext python3native
+inherit autotools pkgconfig gettext python3native mime
 
 EXTRA_OECONF = "--disable-update-mimedb"
 
-- 
2.21.0


