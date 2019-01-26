Return-Path: <tomasz.dziendzielski@gmail.com>
Received: from mail-it1-f195.google.com (mail-it1-f195.google.com
	[209.85.166.195])
	by mail.openembedded.org (Postfix) with ESMTP id 0EAF47C3F5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Jan 2019 11:40:26 +0000 (UTC)
Received: by mail-it1-f195.google.com with SMTP id g85so14393046ita.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Jan 2019 03:40:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=TdnMgdblWK/i6zJz5BAoZGkQSyyMmLwVV+GqVsxJiZk=;
	b=lnAGm3jIDGIbuol9gehrq98UTkn+RS/NR6pHUWl2+jUHO4jaRdBb1eiuEBfb1lcuLf
	kerAKH4FqJYNOsNinU/qoCEWBDBmCk5DYn9pTuOycdxws/qh0KbPNrI2FVqdTlILhKyB
	0wL8SBxYv20bMej+JXjtxPQ1tzjSp3IWqc6viRM9/cPfV2SwCM+6swdamRswBY/a9Hy8
	aHzPKjXzmJKVHB5fV0Wb9YZMxYQ7xj494bbT9zJxPcKoMAYIQ8n5avpirDrbPOm+5p1I
	mANHYiMrr/Lkri2+6z0UZ9XT2MQbIJAg8PozkEZ255fbhwe7xvh6RWPaIPY+kE/DYJvy
	lM0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=TdnMgdblWK/i6zJz5BAoZGkQSyyMmLwVV+GqVsxJiZk=;
	b=RP4/jhqrUPxBVkYtTz0e2hnFr4fp0Yv/o49sRkUTw9ib2XkerX6JnQHmuyFOcAwH1D
	wJiAN3Nwq/vgEjAIUek6RQyFurzK+TSxnSfSsWcTkHdllVv8gRNDog5tHVtOrAsnFJRY
	jnQom3uew6ziTZUrhF1b3WAGNdeGGWTDSm5j2oVnIq2Ek0a/hm+JHaRfuLEuowraGUVD
	NiHHIXeD6V++/upVz5Ot+/5A0f1i/S5Zm5W6pk/xul50Jw76tpHwDxN41xGr8bdhhV9O
	Xvshw07GQVWos7dbbXIKebeDz446QY/uX/RUXO3z+4J2nLn6c4quKOI8PWhXu9N5bz4D
	VyTw==
X-Gm-Message-State: AJcUukdFohiQNnCdgHuc9o41LFDF/jUGGKihsrN2NNoU40O2SvH5i4ft
	3iCfZGrEztuCiFi6VEsUYylQ2K1chVB5CBRKQGHGOv4OwmQ=
X-Google-Smtp-Source: ALg8bN4H7nh8c/9Y4p5prBCwOblU2OOOKG4h0OPo/RH6ZSVBOxstmeQF3VIZINBWK0vRu1TU0Z7uYbTSi/r0dlLbrHU=
X-Received: by 2002:a02:3003:: with SMTP id q3mr9473230jaq.16.1548502827822;
	Sat, 26 Jan 2019 03:40:27 -0800 (PST)
MIME-Version: 1.0
From: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
Date: Sat, 26 Jan 2019 12:36:10 +0100
Message-ID: <CAJkqNs1=dkY5UMK3hGh6n5yGYyR=qEOasNiSANxWgWkSCjfS1g@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/1] lib/oe/patch.py: Fix the function comment
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
X-List-Received-Date: Sat, 26 Jan 2019 11:40:27 -0000
Content-Type: text/plain; charset="UTF-8"

If it's not a patch the function returns nothing.

Signed-off-by: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
---
 meta/lib/oe/patch.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index 07a40fc50e..8c8e96a2dc 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -790,7 +790,7 @@ class UserResolver(Resolver):


 def patch_path(url, fetch, workdir, expand=True):
-    """Return the local path of a patch, or None if this isn't a patch"""
+    """Return the local path of a patch, or return nothing if this
isn't a patch"""

     local = fetch.localpath(url)
     base, ext = os.path.splitext(os.path.basename(local))
-- 
2.20.1

