Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id D5A85605B3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2018 12:08:46 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id r82so3033351wme.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2018 05:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=KJd0CrvdsSTZj+spc6W5Rjh8ZavQpMVz+xfL7rd0dDY=;
	b=KC2fYlWrD0n4je81RH0nYIueFNJxDsSZYmjlbGY/ib2rMMngDPYjnUE/qWZWb1gI29
	1s1llG0t70gIg2EW1+sc8oTfmXhCJ88TttlnP+K3oPJKuXVquqRHOfVKrH34O5XLcRfT
	OqOzn94n5HQ3j93aUVnwK4QISA8as//WnkPliKxLVKT1GtLBg7eJ4GZJw1jdjzjhQRAq
	d7VvIqQP929EExaMpF2D2GTXYL8uwkcGFl3QAudBYT91fSw0cQgpvhBDGZRgC9+MPT6Q
	6iIShBoUvlrFAb/cHClN+d0K4nQZEsZRuTh6hkIJ2R2y1Y/ekqVrYeofYfrC3TPOFbgL
	N12Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=KJd0CrvdsSTZj+spc6W5Rjh8ZavQpMVz+xfL7rd0dDY=;
	b=j0zww1v3ldjMSCGUbg7DnLvWp94l5UGl+1tHO0UsyKlzVHNvxklYq8x99vZpNTbssC
	jAC8gRa0mInKdzOG+6d/3268Yq2Jwzg9bn8enWNKhVOWl4PN17jETk52zn5Jg0faWs9j
	59wjAeu+kBv50NHNGzWApsAkNx6scMpyIhzm8eqqOwA9FTTZCuSRzg0b+y91lXE3U29D
	1u2ZiuEDzzdO8lsjq0jLL1mvoYAMM8PkzmV6JN2mqYfuHLG7BGnUGAbIYAuFBsinnsJj
	5bOlUSpNJEDvrjpzupnFpuZkHIjVAkXsmQzIPCNjM6bHun8CWzzmG9cpTnqQqL4mmCsE
	JC+A==
X-Gm-Message-State: AElRT7EFfbu90Z1wPudW/oe9q4GGW8VssNn8Eb9elBTVF+DDgnTcVIBv
	v0su/iCydK3fNRVUXLaay5bQkg==
X-Google-Smtp-Source: AG47ELvF/oj8RSz/B38YkWL0dXFYxVBnMTmY6A8KVIx8U3IJ35WbpGOgXK88cMdkHGa4exiI8NvpTg==
X-Received: by 10.28.198.2 with SMTP id w2mr1861914wmf.75.1521547727428;
	Tue, 20 Mar 2018 05:08:47 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	m35sm4152583wrm.59.2018.03.20.05.08.46
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 20 Mar 2018 05:08:46 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Mar 2018 12:08:49 +0000
Message-Id: <20180320120849.586-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <CAJTo0LayEiw3bpXB7a-mKiGbi3uOJhFhYt=+4aV84dTSuVoJ3w@mail.gmail.com>
References: <CAJTo0LayEiw3bpXB7a-mKiGbi3uOJhFhYt=+4aV84dTSuVoJ3w@mail.gmail.com>
Subject: [PATCH] iputils: change default PACKAGECONFIG to disable libidn
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
X-List-Received-Date: Tue, 20 Mar 2018 12:08:47 -0000

* wrong revision of this patch, where the commit message didn't match
  with the default PACKAGECONFIG value, was merged to master, update
  it to avoid confusion

* it got enabled by default, but without the dependency on libidn in:
  commit 5997981fa2c22609a88b8cbb595dbf7758b2f7c2
  Author: Alexander Kanavin <alexander.kanavin@linux.intel.com>
  AuthorDate: Thu Feb 1 20:02:08 2018 +0200
  Subject: iputils: update to 20161105

* https://github.com/iputils/iputils/blob/master/RELNOTES.old
  mentiones that IDN was enabled by default in:
  [s20160308] and surprisingly the same in [s20150815]
  but there are no release notes for s20151218 version we were using until
  now, don't know how it really relates to [s20150815].

* but there are some issues with libidn as described in:
  https://github.com/iputils/iputils/commit/f3a461603ef4fb7512ade3bdb73fe1824e294547
  so disable it by default.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-extended/iputils/iputils_s20161105.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/iputils/iputils_s20161105.bb b/meta/recipes-extended/iputils/iputils_s20161105.bb
index dda891c7f7..0125739b03 100644
--- a/meta/recipes-extended/iputils/iputils_s20161105.bb
+++ b/meta/recipes-extended/iputils/iputils_s20161105.bb
@@ -23,7 +23,7 @@ UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>s\d+)"
 
 EXTRA_OEMAKE = "-e MAKEFLAGS="
 
-PACKAGECONFIG ?= "libidn"
+PACKAGECONFIG ?= ""
 PACKAGECONFIG[libidn] = "USE_IDN=yes,USE_IDN=no,libidn"
 
 do_compile () {
-- 
2.15.1


