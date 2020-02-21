Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
	[209.85.216.49])
	by mail.openembedded.org (Postfix) with ESMTP id 2BB0761603
	for <openembedded-core@openembedded.org>;
	Fri, 21 Feb 2020 02:54:04 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id n96so87415pjc.3
	for <openembedded-core@openembedded.org>;
	Thu, 20 Feb 2020 18:54:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=CUSEQwCy9dc1D0hmQbUvcCFwEsghisFfBcJ1YvUE754=;
	b=UT78gcR6bmsyqbGpA47HbJiHBcC/itk6nuFRL1xN/C2Ljh6txoYaBzCzJS8IBv1gvi
	uuUDe7V9G+ChCdK5M7gbLdEXzJ1f51ZDNJBu2OY4p/AJnyK3CvBjtIDDTsbcZW7c07Js
	2pXgFVzZapFzx6ln88Hl0vacmJ/IEDygMzBGxtSr3uHHOqD65UfnhvP/vchfRAcd3j54
	V5rHy+gtqXNxHG5jGKpenrxp0JqK7f8doDyIA6nrpj4fQHS/Bi/5JAzFkesm94OO9qdj
	BkjGkOfT7ylp5FVw6CccRnQ+Y8yqqL3bkC0aq+gejSi2POoqEoKgPLDcbPhIicO9E9Kz
	pPDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=CUSEQwCy9dc1D0hmQbUvcCFwEsghisFfBcJ1YvUE754=;
	b=s+1jGpM8v0vGN7f2ehsV1uFdpBugkAnHb4PV4fsMww6gIP9ub14AKAHI+3U89U8PdT
	cYw7GRKF86snkrS25TUdspPu1DQNXCceENGJIVfQI1tjPJy2wcOhE/0Ms4ECzGkLtFIp
	7S2YDbCAZ9XX58gjfcpAjFRWw0DPSOyA0miAx0KS2Eqhv1cGyDsHsJ/dAVCE5mXY3pKN
	FyGWuaNdL/FZfzt0wUrnNMJh3ChJu++2G40BOqiPpCQO1g+HlrN1DbhqFJt5uXkfTNdp
	wuyWLVtotzvb7flLUeXzjEfBJafzlDIVHrXUQeTwe6R7/DmC4WIJ43uM2ymFCaMQW7Vl
	2j7A==
X-Gm-Message-State: APjAAAUoit4//AIxi715OUo4mwLA7ZI7CHOsGEibS/WU+f81bDm2Fbh2
	jdsqNny4URjejXIyMzcXiQQS/1kP
X-Google-Smtp-Source: APXvYqxlZ8vDOTcu27aPhgQl2EAX6zg1T5q/d6sX2vpjqRv2qj+YARU9qoGyFYCbsbiRuSuhQNPDJg==
X-Received: by 2002:a17:90a:c592:: with SMTP id
	l18mr311326pjt.105.1582253644966; 
	Thu, 20 Feb 2020 18:54:04 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:88be:17f0:935c:9e35])
	by smtp.gmail.com with ESMTPSA id
	y10sm925320pfq.110.2020.02.20.18.54.04
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 20 Feb 2020 18:54:04 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Thu, 20 Feb 2020 18:53:27 -0800
Message-Id: <3e69681857b88be44797d1d302b9e44a46a7634d.1582253544.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1582253544.git.akuster808@gmail.com>
References: <cover.1582253544.git.akuster808@gmail.com>
Subject: [warrior 08/14] python2: add ntpath
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
X-List-Received-Date: Fri, 21 Feb 2020 02:54:04 -0000

python3 has this but python is missing this.
[Yocto #13740]

Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit af41a2238beec0c34c1c1e5f25eed55f2a214643)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/python/python/python2-manifest.json | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python/python2-manifest.json b/meta/recipes-devtools/python/python/python2-manifest.json
index eb52e862ab..fd98774d00 100644
--- a/meta/recipes-devtools/python/python/python2-manifest.json
+++ b/meta/recipes-devtools/python/python/python2-manifest.json
@@ -267,6 +267,7 @@
             "${libdir}/python2.7/lib-dynload/xreadlines.so", 
             "${libdir}/python2.7/linecache.py", 
             "${libdir}/python2.7/new.py", 
+            "${libdir}/python2.7/ntpath.py",
             "${libdir}/python2.7/os.py", 
             "${libdir}/python2.7/platform.py", 
             "${libdir}/python2.7/posixpath.py", 
-- 
2.17.1


