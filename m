Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1T78sz-0005W5-Hd
	for openembedded-core@lists.openembedded.org;
	Thu, 30 Aug 2012 19:50:33 +0200
Received: by pbcwy7 with SMTP id wy7so3594108pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2012 10:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=p6nx+zGVB86VzZ1QeF05BLTd7aRq0nbUX1jdzx24W+8=;
	b=fzZp6H9ZrAl4KfWAYPLwLXJWBCwyERWmwZy72A1VNsyjum26+9MlKICqs49e5Ngy1a
	SxWBaD6wV/d072NmREI6G5iQriFDR6bGOmxI5x9FqBQVX+UVrYOx/uPwHnKkQqrRQiWk
	2JqgnQWuDayPNTthzNO+rbDa57Vr1SEfbZ76EFlA94oLSs8O/kpShsaJMr146L3FZj6s
	TBTwzUG1xUpKUjgk1d5R3qIOUggIDcwUre9lGfyPweMn6gu6RTYQLB7LOIm6AigYbCUj
	4IhcGxvtRyKjF4hBhUqXL48qq2ZAS4a2bHWBXq4hvGaXVahSPoTHuzA1R7ZnAKmeo+ue
	g8tw==
Received: by 10.66.88.5 with SMTP id bc5mr10663864pab.83.1346348297164;
	Thu, 30 Aug 2012 10:38:17 -0700 (PDT)
Received: from precise64.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPS id pq7sm1918367pbb.25.2012.08.30.10.38.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 30 Aug 2012 10:38:15 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Aug 2012 10:38:09 -0700
Message-Id: <1346348289-28470-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH] Update lttng-2.0 versions
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 30 Aug 2012 17:50:33 -0000

From: Christopher Larson <chris_larson@mentor.com>

lttng-modules: 2.0.pre11 -> 2.0.5
lttng-tools: 2.0.1 -> 2.0.4
lttng2-ust: 2.0.2 -> 2.0.5

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 ...modules_2.0.pre11.bb => lttng-modules_2.0.5.bb} |    0
 .../{lttng-tools_2.0.1.bb => lttng-tools_2.0.4.bb} |    0
 .../{lttng2-ust_2.0.2.bb => lttng2-ust_2.0.5.bb}   |    0
 3 files changed, 0 insertions(+), 0 deletions(-)
 rename meta/recipes-kernel/lttng-2.0/{lttng-modules_2.0.pre11.bb => lttng-modules_2.0.5.bb} (100%)
 rename meta/recipes-kernel/lttng-2.0/{lttng-tools_2.0.1.bb => lttng-tools_2.0.4.bb} (100%)
 rename meta/recipes-kernel/lttng-2.0/{lttng2-ust_2.0.2.bb => lttng2-ust_2.0.5.bb} (100%)

diff --git a/meta/recipes-kernel/lttng-2.0/lttng-modules_2.0.pre11.bb b/meta/recipes-kernel/lttng-2.0/lttng-modules_2.0.5.bb
similarity index 100%
rename from meta/recipes-kernel/lttng-2.0/lttng-modules_2.0.pre11.bb
rename to meta/recipes-kernel/lttng-2.0/lttng-modules_2.0.5.bb
diff --git a/meta/recipes-kernel/lttng-2.0/lttng-tools_2.0.1.bb b/meta/recipes-kernel/lttng-2.0/lttng-tools_2.0.4.bb
similarity index 100%
rename from meta/recipes-kernel/lttng-2.0/lttng-tools_2.0.1.bb
rename to meta/recipes-kernel/lttng-2.0/lttng-tools_2.0.4.bb
diff --git a/meta/recipes-kernel/lttng-2.0/lttng2-ust_2.0.2.bb b/meta/recipes-kernel/lttng-2.0/lttng2-ust_2.0.5.bb
similarity index 100%
rename from meta/recipes-kernel/lttng-2.0/lttng2-ust_2.0.2.bb
rename to meta/recipes-kernel/lttng-2.0/lttng2-ust_2.0.5.bb
-- 
1.7.9.5



