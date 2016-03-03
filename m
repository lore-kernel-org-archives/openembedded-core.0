Return-Path: <h4nn35.work@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 6FD32738AE
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Mar 2016 20:31:32 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id n186so6755262wmn.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Mar 2016 12:31:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=mC3QbaRJD+nW5du4dn2kTmvs+M52eLxM/l3Tvlxvj0Y=;
	b=bZKz1eyNLzh2Mrlu1l0mBjwDLIODgnBBpU/m8HwAkTk4st+hmF+2CbJnQ6+HvK/kpR
	YLJrr199Cb/pyUCquEnq8+Budi5kvsEGmspwll1qIEe/6tzxLXEdes9UaExngqlnI5TU
	kDPjxGS9eLPRvK3oRmPFKKmdUvzJIpAITx01k+N2VZSUvTltlN/lUwGE7UJXEKkfJW6t
	clA3FlVlJond/wnWqjgFfyOHO1tORD/GXphu+hD+pceI9nz/5V1GBxlz4VyASKAfD6Mp
	ToXxOhXTGIOSYhNgcCiUHouDcCAv0YysqbpXN8hgZyKFBc7ivCLucuP2MR6elq10kQAs
	/zmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=mC3QbaRJD+nW5du4dn2kTmvs+M52eLxM/l3Tvlxvj0Y=;
	b=h1krdG2jUZ9OY/0jQIppI8anVFIy5Mfs8lEzwNTL/N3Ah3ClHy95eey5ItPxqDyijf
	D+sLlEHM8Y7OnB0nsR9LGkLFNAfzt1aJRt5jxPcOuIGyYckKbQWIeL3/PSYoVUpWErjH
	al6n0u3VyEFDPhQiUe0xnNaGQ8bL6y5EgXUAEX9TVWkU4mi7Y+TDowxjxCy//M79E9wJ
	GpVHbk6dLIEcEm9zdF6T5jtXgUFuiwMEitu5kBJMfOLJuQueNzg2DWqFlFeZqfzLVnhU
	guyInU9iQB0/LrVxu4DpgzH3lRC1IW/M7knh/kJzapwTVTezlWWT0jWpj7KzmSoU5gMf
	8d5w==
X-Gm-Message-State: AD7BkJJPFyfgO/Afl1Jr6JPJBw9bu0GkEHm9erJKCg5DJm7eI2mlsBRjodGHTT86qjfBIw==
X-Received: by 10.28.10.149 with SMTP id 143mr979441wmk.38.1457037093205;
	Thu, 03 Mar 2016 12:31:33 -0800 (PST)
Received: from lenovobook.localdomain
	(ipbcc1bda1.dynamic.kabel-deutschland.de. [188.193.189.161])
	by smtp.googlemail.com with ESMTPSA id
	y62sm162930wmg.12.2016.03.03.12.31.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 Mar 2016 12:31:32 -0800 (PST)
From: Johannes Pointner <h4nn35.work@gmail.com>
X-Google-Original-From: Johannes Pointner <johannes.pointner@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Mar 2016 21:31:25 +0100
Message-Id: <1457037087-13715-1-git-send-email-johannes.pointner@gmail.com>
X-Mailer: git-send-email 2.7.2
Subject: [yocto][xcursor-transparent-theme][Patch 0/2] Convert recipe to git
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
X-List-Received-Date: Thu, 03 Mar 2016 20:31:33 -0000

This patchset converts xcursor-transparent-theme recipe to git

Johannes Pointner (2):
  xcursor-transparent-theme: Add new recipe for git repo
  xcursor-transparent-theme: Remove old recipe and related patches

 .../fix_watch_cursor.patch                         | 17 ---------------
 .../use-relative-symlinks.patch                    | 25 ----------------------
 ...e_0.1.1.bb => xcursor-transparent-theme_git.bb} | 15 +++++++------
 3 files changed, 8 insertions(+), 49 deletions(-)
 delete mode 100644 meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme-0.1.1/fix_watch_cursor.patch
 delete mode 100644 meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme-0.1.1/use-relative-symlinks.patch
 rename meta/recipes-graphics/xcursor-transparent-theme/{xcursor-transparent-theme_0.1.1.bb => xcursor-transparent-theme_git.bb} (51%)

-- 
2.7.2


