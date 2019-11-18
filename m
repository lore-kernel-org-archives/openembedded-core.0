Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id B02707FAAD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 14:32:10 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id e6so19781732wrw.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 06:32:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=zed2BWW3DupylO1otunMf02UeqIzHg0Mc43uRegaq6w=;
	b=lxQch5mL2lLn4eQdqSoWW6D2zVZ/kwdLoWdwbCNjL0tk4AyagNGwCNJzvhJSPOUBlO
	ePPVetTpxE3NJQSWsIhBNHZ5YGMHFQ6eTG6IUzckPjp1DbgEkrQPW/eOssnoDvie/wae
	Ue3L4/9iSdfzAO8UnZEfb/eJmF/ie8tdfpXakE+itd1gE8do4+XKNAElWJcnpLgYyUSg
	NXHz+qZSvVgGoDNd9Ze56/etOfaL8tvGO/X8D9oPdpiqaQg165PuOIVjzfpv25XpqWGa
	GCH0lbGwWLT+L1U4xuqp5NXNbJ1LXesK6r2TX8hIw/9CdHtm//PLaaanL6cr769JARvb
	I1Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=zed2BWW3DupylO1otunMf02UeqIzHg0Mc43uRegaq6w=;
	b=MXBVx8Yi2c1G0ya8E0VbchZR9dgPYxegmUY9yye3miSg2MHLxNHQvU3SjEB0cB1O2B
	luzrC1pqTywdzz6BtAtNLaB641QRnBT+gd0992h26Y45nN9G1p+2XZyWkM07HsE+iKwY
	cRqbw2Nb6RJ2UdXYlxSCw1up7RkUHE5pQIF4bRkzdbtktDDGHcxaxCjpMtXVgDfNUYty
	LaAl3ei3nMNb2fcXVuly81o1rvW9o6lIKw39Klj2LrsPBOGqstwlK3Ljkk2I/q/smBhv
	MGYyPv20UZN4KoFbbixSG2ZOvRTgT8S0QTr22x4C/0j/F0xFisXDZCDRJ2o44FhHak3N
	UtXQ==
X-Gm-Message-State: APjAAAWe/LoHBh2UC9yOOwBJMQoCJfeVlaMOk/Rshuez2hxdfa/5YQxl
	4saaAw2ar0keEVYOU/1NeJo3EAZb
X-Google-Smtp-Source: APXvYqw5h9R0lnnpx4x1TOAonlVyuuE1HgNo1sZ2KLgVRvbyDNHWrABZFREEHU1dA2q+ks1OseuWkw==
X-Received: by 2002:adf:c402:: with SMTP id v2mr4777978wrf.323.1574087531201; 
	Mon, 18 Nov 2019 06:32:11 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	f24sm20097324wmb.37.2019.11.18.06.32.10
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 18 Nov 2019 06:32:10 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Nov 2019 15:28:51 +0100
Message-Id: <20191118142852.22981-12-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191118142852.22981-1-alex.kanavin@gmail.com>
References: <20191118142852.22981-1-alex.kanavin@gmail.com>
Subject: [PATCH 12/13] sysstat: upstream version check is working again
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
X-List-Received-Date: Mon, 18 Nov 2019 14:32:11 -0000

As upstream has released a new stable version,
the exception is no longer needed.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-extended/sysstat/sysstat.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-extended/sysstat/sysstat.inc b/meta/recipes-extended/sysstat/sysstat.inc
index 62de36b44bf..77cc6f2cf2a 100644
--- a/meta/recipes-extended/sysstat/sysstat.inc
+++ b/meta/recipes-extended/sysstat/sysstat.inc
@@ -10,7 +10,6 @@ SRC_URI = "http://pagesperso-orange.fr/sebastien.godard/${BP}.tar.xz \
           "
 
 UPSTREAM_CHECK_URI = "http://sebastien.godard.pagesperso-orange.fr/download.html"
-UPSTREAM_VERSION_UNKNOWN = "1"
 
 DEPENDS += "base-passwd"
 
-- 
2.17.1


