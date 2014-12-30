Return-Path: <otavio.salvador@gmail.com>
Received: from mail-vc0-f181.google.com (mail-vc0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id 9CB8060167
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Dec 2014 16:25:56 +0000 (UTC)
Received: by mail-vc0-f181.google.com with SMTP id le20so5881688vcb.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Dec 2014 08:25:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=n6NqYxSAkeZvvKjAg4mS2FZW4jE6u+LmoAtEajkvv2I=;
	b=zva3lbeOURA17k6aw0Zy/7lpDMNJVoA3s7tb+JwlOEw2lbywCGZ2nrkKW9aluA1BvH
	iAb4ivGivRjCjMzWi5kzg2ArYd13qxL6Mb1d3RQZHFVI3ae60LTvggI0GL7ye+dHdh7F
	5Hucraonznn9ECO5g2J7kJ+LFZJ4OyNJxyH575lFRjXm0/6WIjEIe+bMzemV5nVauZTr
	719CMQ6pTBoMU86n+Nfx87MR/wJZW2udQsGtSg1lE+Pk7sZN3g8VvObJMRzwFNWyRRV9
	mDd51CYUS03mEtct0hOBokHZh8aTv06SEVceQV5s0oc8Q1GLa7PIadCkj3G+cafM00ns
	rEEw==
X-Received: by 10.220.161.200 with SMTP id s8mr11961250vcx.43.1419956756734;
	Tue, 30 Dec 2014 08:25:56 -0800 (PST)
Received: from nano.lab.ossystems.com.br ([177.100.225.47])
	by mx.google.com with ESMTPSA id
	at12sm11105242vdc.15.2014.12.30.08.25.54
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 Dec 2014 08:25:55 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by nano.lab.ossystems.com.br (Postfix, from userid 1000)
	id 4C1FC1C9F1E45; Tue, 30 Dec 2014 14:25:52 -0200 (BRST)
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue, 30 Dec 2014 14:25:51 -0200
Message-Id: <1419956751-12552-3-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1419956751-12552-1-git-send-email-otavio@ossystems.com.br>
References: <1419956751-12552-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 3/3] lttng-ust: Update to 2.5.2 version
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
X-List-Received-Date: Tue, 30 Dec 2014 16:26:00 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-kernel/lttng/{lttng-ust_2.5.0.bb => lttng-ust_2.5.2.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-kernel/lttng/{lttng-ust_2.5.0.bb => lttng-ust_2.5.2.bb} (94%)

diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.5.0.bb b/meta/recipes-kernel/lttng/lttng-ust_2.5.2.bb
similarity index 94%
rename from meta/recipes-kernel/lttng/lttng-ust_2.5.0.bb
rename to meta/recipes-kernel/lttng/lttng-ust_2.5.2.bb
index e07d3c7..eda52bb 100644
--- a/meta/recipes-kernel/lttng/lttng-ust_2.5.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-ust_2.5.2.bb
@@ -18,8 +18,7 @@ RPROVIDES_${PN} = "lttng2-ust"
 RREPLACES_${PN} = "lttng2-ust"
 RCONFLICTS_${PN} = "lttng2-ust"
 
-SRCREV = "ce59a997afdb7dc8af02b464430bb7e35549fa66"
-PV = "2.5.0"
+SRCREV = "85d1d2791f3cebfd741a821261bf2924928a90e7"
 PE = "2"
 
 SRC_URI = "git://git.lttng.org/lttng-ust.git;branch=stable-2.5 \
-- 
2.1.4


