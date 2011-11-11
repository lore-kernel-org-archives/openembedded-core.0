Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1ROu6g-0005YU-0y
	for openembedded-core@lists.openembedded.org;
	Fri, 11 Nov 2011 17:37:34 +0100
Received: by mail-bw0-f47.google.com with SMTP id zs2so3543817bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Nov 2011 08:31:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=6Xg7187gAdLIHRdIMDtw0gbfq63ltLjG8tAVGlA9GVo=;
	b=EfTUJk9X6mTZU0T39uIQodwBtV6ZMsMxZvZRiqNv6MlEsu35mQusmtiTTITazf3g8+
	7yfLQ3pgLCsbwiop73w8sOx1lA18WA8j9Adv03iIMlxa58wOg18jC3efhtKJCmuiX7RO
	/QlShOto9l6icm/KaF8OlT15Jlts6aYAGY2ng=
Received: by 10.205.120.20 with SMTP id fw20mr9270556bkc.39.1321029078376;
	Fri, 11 Nov 2011 08:31:18 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id dq2sm11124258bkb.11.2011.11.11.08.31.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 11 Nov 2011 08:31:17 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Nov 2011 17:28:52 +0100
Message-Id: <83ee8988208ee98d2972df4a10384757c739ca6a.1321028799.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.rc1
In-Reply-To: <d99edd412e58edeb79c64112f7eb6ba522342bf9.1321028799.git.Martin.Jansa@gmail.com>
References: <d99edd412e58edeb79c64112f7eb6ba522342bf9.1321028799.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1321028799.git.Martin.Jansa@gmail.com>
References: <cover.1321028799.git.Martin.Jansa@gmail.com>
Subject: [PATCH][oe-core 16/22] time: rename files dir to time-1.7 for faster lookup
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 11 Nov 2011 16:42:04 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../time/{files => time-1.7}/debian.patch          |    0
 1 files changed, 0 insertions(+), 0 deletions(-)
 rename meta/recipes-extended/time/{files => time-1.7}/debian.patch (100%)

diff --git a/meta/recipes-extended/time/files/debian.patch b/meta/recipes-extended/time/time-1.7/debian.patch
similarity index 100%
rename from meta/recipes-extended/time/files/debian.patch
rename to meta/recipes-extended/time/time-1.7/debian.patch
-- 
1.7.8.rc1



