Received: from sender4-op-o14.zoho.com (sender4-op-o14.zoho.com [136.143.188.14])
 by mx.groups.io with SMTP id smtpd.web09.53.1627386554653806437
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jul 2021 04:49:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=dwrobel@ertelnet.rybnik.pl header.s=ertelnet header.b=JBVdAMg1;
 spf=pass (domain: ertelnet.rybnik.pl, ip: 136.143.188.14, mailfrom: dwrobel@ertelnet.rybnik.pl)
ARC-Seal: i=1; a=rsa-sha256; t=1627386553; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=IHbq6XnXsPqVCFiV/YqdUC/ngfxwnKnPojT6zy9jHiYO19dKe3jz8rfyO+LcWchFQ2S1HHUNUZD9GLOZm1gRC7UvJCkh2wB92XE9rZFM7pxAfBxyMktJCdzyV++7ZqgqFszNo88uNLjCnm1sEycDKcaJvFB/wyIAGWlSK/mt5II=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1627386553; h=Content-Transfer-Encoding:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=HqfOTya1SAN7QTb7tKN36GTKnw+k6qOfMAF0JQF1gZ0=; 
	b=now2P4fO48Q+9IZzt4nok8W41kkRvwxHz3rHDOUHUzXJDuAFMNb9MJnW5SyHo19VSuiksCxycAfSU4gEQjgZ9qkiRL4FAoEmnLg5KAMmN2JOqRdG4EhTHYSAp0l7rgYryRqEUS53lLBFVeSWb1FrkaGON6x+HaEgtg6v8k9Dc6E=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ertelnet.rybnik.pl;
	spf=pass  smtp.mailfrom=dwrobel@ertelnet.rybnik.pl;
	dmarc=pass header.from=<dwrobel@ertelnet.rybnik.pl>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1627386553;
	s=ertelnet; d=ertelnet.rybnik.pl; i=dwrobel@ertelnet.rybnik.pl;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=HqfOTya1SAN7QTb7tKN36GTKnw+k6qOfMAF0JQF1gZ0=;
	b=JBVdAMg1XNQkpcq0bvs4j1lOyhRC3tz3S0+amLF3ZjZIu30tq+gnjCaikc7WUCVe
	YpV0VW8EDCBRHB/OraN5xP8Icsdts0SZ9w2oUlcAhFG6viVyVC8sDYHUNBuTY6GFHdB
	CcAVwIwRA1oB/bQrLueUxoEKnLKV2xJGKRzvXZhs=
Received: from localhost.localdomain.pl (91.230.58.69 [91.230.58.69]) by mx.zohomail.com
	with SMTPS id 1627386552382978.7614457977276; Tue, 27 Jul 2021 04:49:12 -0700 (PDT)
From: "Damian Wrobel" <dwrobel@ertelnet.rybnik.pl>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH pseudo 3/4] Use -pthread instead of -lpthread
Date: Tue, 27 Jul 2021 13:49:05 +0200
Message-Id: <20210727114906.191837-3-dwrobel@ertelnet.rybnik.pl>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210727114906.191837-1-dwrobel@ertelnet.rybnik.pl>
References: <20210727114906.191837-1-dwrobel@ertelnet.rybnik.pl>
MIME-Version: 1.0
X-ZohoMailClient: External
Content-Transfer-Encoding: 8bit

Signed-off-by: Damian Wrobel <dwrobel@ertelnet.rybnik.pl>
---
 Makefile.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile.in b/Makefile.in
index 1ad8836..162e729 100644
--- a/Makefile.in
+++ b/Makefile.in
@@ -61,8 +61,8 @@ DBOBJS=pseudo_db.o
 WRAPOBJS=pseudo_wrappers.o
 
 # needed for anything that links with pseduo_client.o, pretty much
-CLIENT_LDFLAGS=-ldl -lpthread
-DB_LDFLAGS=@SQLITE_LDARG@ -lpthread
+CLIENT_LDFLAGS=-ldl -pthread
+DB_LDFLAGS=@SQLITE_LDARG@ -pthread
 
 PSEUDO=$(BIN)/pseudo
 PSEUDODB=$(BIN)/pseudodb
-- 
2.31.1

