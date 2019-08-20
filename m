Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
	[209.85.221.44])
	by mail.openembedded.org (Postfix) with ESMTP id D3D987ECB9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2019 15:32:33 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id s18so12880302wrn.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2019 08:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=doAjCqLm/AYYO4CzjsqvBYlcDzynmJKhzs9jnuRL1jk=;
	b=gP8Ol5TutbMsOaVdSefSjmPOmXraUCS+m23K1YrARWLKuXWksy2tS4n7VBiliIjrKo
	1UaBBEb5JSG/hAY3RqVd29buNBrFRiGhVMglT31N9iyPbIx0bqgAZS6lo9TVbpOqIZvr
	VDIZ//i205esT+6BztbfwbhELyGK7MLm4WjH2I0gmZlj6MQsPg5vjZEt73VsejFB9NqU
	+SE+g8BQvCfecxjkFrDzlo4YavU0jl9n3FhalQZlUazM8X8aBCv8QTyRE+VXeHrm8vzN
	TBqxTzkvlQBGi5o+/vta0jybeyYAJt1hWq4ktKt6nvP1j6WTjSJ0ZoZmc3UFj1jNkaBJ
	iidg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=doAjCqLm/AYYO4CzjsqvBYlcDzynmJKhzs9jnuRL1jk=;
	b=rMJRlAKWPaS8o0+8xEE1WVSbMxGNekZCXCgLAgcPNp7JHm3ICXNCrflV+H9VgHjCS4
	zcKeD5T9OXrD9vDJjTT/E6CN+1S4PWSYZlsoiZzswCjRS1IXBsfx49+lyf4fZo8D3/mu
	ge4RIo2XF7r6OxkaWdifR92H3aafIX1dS+ejI/J+PlhSA/jpOKUcMtlMz6srgYgZKS2p
	yeeRMUQ+FPZYYp92ysRZu22xtErrGudJtngWu/utEEEu42oBUbIJvUKkHCM08HMjjgfM
	GjUjoCpJbq5VxHBglTcKJogaCi221NWtKn//S2/Ef6BJAvRYFZ3wbBm0VkUQEocM72HT
	kpZA==
X-Gm-Message-State: APjAAAX1Sexw5p12taDnT5Gbin6OSw25RN6EwUjNOASJnwhOzFCVm4yN
	xpWMe2ligwiCxJMcB8GzIjITon4fHwA=
X-Google-Smtp-Source: APXvYqz4Cu88YguQ5LPy+xV6u+3vr8IOJ5dD8J2GSP5V1Gml0PCSQGQwVr70td9Sg+3K2BgTB8xPPQ==
X-Received: by 2002:a5d:44cf:: with SMTP id z15mr22781768wrr.324.1566315154292;
	Tue, 20 Aug 2019 08:32:34 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id 6sm466700wmf.23.2019.08.20.08.32.33
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 20 Aug 2019 08:32:33 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Aug 2019 17:32:17 +0200
Message-Id: <20190820153219.62435-10-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190820153219.62435-1-alex.kanavin@gmail.com>
References: <20190820153219.62435-1-alex.kanavin@gmail.com>
Subject: [PATCH 10/12] vala: upgrade 0.44.5 -> 0.44.7
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
X-List-Received-Date: Tue, 20 Aug 2019 15:32:34 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/vala/{vala_0.44.5.bb => vala_0.44.7.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/vala/{vala_0.44.5.bb => vala_0.44.7.bb} (57%)

diff --git a/meta/recipes-devtools/vala/vala_0.44.5.bb b/meta/recipes-devtools/vala/vala_0.44.7.bb
similarity index 57%
rename from meta/recipes-devtools/vala/vala_0.44.5.bb
rename to meta/recipes-devtools/vala/vala_0.44.7.bb
index 518c9ebdae8..807ca7a2139 100644
--- a/meta/recipes-devtools/vala/vala_0.44.5.bb
+++ b/meta/recipes-devtools/vala/vala_0.44.7.bb
@@ -4,5 +4,5 @@ SRC_URI += "file://0001-git-version-gen-don-t-append-dirty-if-we-re-not-in-g.pat
            file://0001-vapigen.m4-use-PKG_CONFIG_SYSROOT_DIR.patch \
            "
 
-SRC_URI[md5sum] = "1e8b8595168446c529b11236cf75e328"
-SRC_URI[sha256sum] = "bb8f8185b805411511786733c4b769c3ee6af8bc879609bffb6c46b8999bc27f"
+SRC_URI[md5sum] = "27fd30535c51af5b87b0e7ffdbd906ef"
+SRC_URI[sha256sum] = "bf1ff4f59d5de2d626e98e98ef81cb75dc1e6a27610a7de4133597c430f1bd7c"
-- 
2.17.1


