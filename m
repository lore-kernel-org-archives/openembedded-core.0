Return-Path: <matt@madison.systems>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id A240F78A17
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Mar 2018 20:33:48 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id l4so4223135pgp.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Mar 2018 12:33:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=V8JTJKe3s+g4y1kAfTZn+Wo4yxRy63bBGNuOi+Fq5QU=;
	b=oXesOanxkaNWRJd9bn06WjLWmv57XBlc7ofdB+whddyatpoHb4EDaD/hJ9uTNjRu2E
	kKOkoc8JNGzIRFkNGP35rjD5zrv1RL85QCk68GSH1cgszjMH22d/XR3pCtJHXhWob2AX
	yKsgYariCvRNWW4vQzQej5id5xQqooYAXIuA5ZZVo3i3Aq6ERrzSBZcUkW6d+UPMVIYU
	/AXZC8JECmGMW2qcL+KQae8seV9RAf7lauz8F164nQSSLx3yKKqLWqnksBHmWTCmzLzA
	lrQr/viiKJlN/U9s/R1moMM+zh50m5t2w7x43aJ0N0/jPCioHBgtn7FsJz1I+2CVYLne
	13CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=V8JTJKe3s+g4y1kAfTZn+Wo4yxRy63bBGNuOi+Fq5QU=;
	b=gxcwXEYO+afZMp4DC0l8w/aTdPWLbv0Zk/eDDvL2ijHKx1qc3pDVDC3PPjSGXdtzO1
	UyQdVHJBgwKHZEyZFzuKmqjl0vKCNJ5rMsTzanb8UKO8y98RZ+OH++aIqX02ljDymjAB
	dMI2gW3Sdn3hA1/i2DCklaLXZCULJ2cBqlcYAZNZIF/oqD3tYUhAlnH1M73hE8sGxQj5
	q5spF1B0AmNzavzlWtqTJxh1TsJD3iXcjF7BNbjUCOkhUfbano3f42v8qpjZI3SzlLgk
	v0glaYX4x8lQm5W3CzpXK+12VW5EQiEDMyDcVMLNqfla2aIdcKKKpDiJQ92yySnHIzw6
	oHmw==
X-Gm-Message-State: APf1xPCdWDf0VXZLrsNOLy3WBXh1A+Fq06vYnzol6FeASFyu4ON0x9i7
	bIIR2O6WD7xpE9BTV6BxHvAq6ncJ
X-Google-Smtp-Source: AG47ELulrLf9x4ZGNINtKewHKZZQHP2/YjIuUqJH84B3qwcJr6x1qgqG7C7mQkI2VyQMeFeaxgzTlg==
X-Received: by 10.98.73.89 with SMTP id w86mr6779247pfa.227.1520022829545;
	Fri, 02 Mar 2018 12:33:49 -0800 (PST)
Received: from workhorse.athrat.org (c-67-170-200-185.hsd1.ca.comcast.net.
	[67.170.200.185]) by smtp.gmail.com with ESMTPSA id
	m12sm11193338pgr.35.2018.03.02.12.33.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 02 Mar 2018 12:33:48 -0800 (PST)
From: Matt Madison <matt@madison.systems>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Mar 2018 12:33:12 -0800
Message-Id: <20180302203314.32737-12-matt@madison.systems>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180302203314.32737-1-matt@madison.systems>
References: <20180302203314.32737-1-matt@madison.systems>
Subject: [PATCH v4 11/13] packagegroup-go-sdk-target: add go-runtime-staticdev
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
X-List-Received-Date: Fri, 02 Mar 2018 20:33:49 -0000

to allow go programs to be linked either statically or
dynamically when cross-compiling with the SDK.

Signed-off-by: Matt Madison <matt@madison.systems>
---
 meta/recipes-core/packagegroups/packagegroup-go-sdk-target.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/packagegroups/packagegroup-go-sdk-target.bb b/meta/recipes-core/packagegroups/packagegroup-go-sdk-target.bb
index 3e190770a7..7d2ccbda22 100644
--- a/meta/recipes-core/packagegroups/packagegroup-go-sdk-target.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-go-sdk-target.bb
@@ -5,4 +5,5 @@ inherit packagegroup goarch
 RDEPENDS_${PN} = " \
     go-runtime \
     go-runtime-dev \
+    go-runtime-staticdev \
 "
-- 
2.14.1


