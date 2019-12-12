Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
	[209.85.221.46])
	by mail.openembedded.org (Postfix) with ESMTP id CA26A7FA0E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Dec 2019 18:14:46 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id b6so3837311wrq.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Dec 2019 10:14:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=fW08CZ6H42yYyPzH6elpLs1ChcahlbRV1hb8XGE3trc=;
	b=F7G6VzFsdBzc/dGdNlr9U6PiYO10bdlrO84ONuY41Z3K7yK0UGbUtlfySuyDgrvqe5
	1yd6TsoanZfmsGe5ua+9PnLDaz4mb/jPYbZyyx+b2sGawwTUb+Eu7GZr0rDiZuW3apBY
	sZToIk2+PVOlPKnYwKZMJDfgTO+714dUEU821/Db2gckW6S1rVzJVQAUYszG4pJD66AO
	VznvGPg8I5vMRQ2JxGrDEWt5XPbWlerPi+8cE2MXj22ApwnqOcEK/xq/bq3DWymV2GYx
	c4/tyMhyXf986vEuu9LphoS0I83bANcwCjA3mWNmB6jZxKbVBbFuu1Vn/ipRIwsSASVA
	VzEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=fW08CZ6H42yYyPzH6elpLs1ChcahlbRV1hb8XGE3trc=;
	b=RzsV0rM5AUj4l60g5rb/DIvQznNvi+4V7F5gCDjeY6sHqdpQzLknMhSLag0CAljNta
	fb2e7ySsWADxAOT/zERsrv8MZa1WviNXRquXEW5m0m60a+PRZNeNNoCBMm+T/uljqX7+
	ltyX9UAmMHGzEiSvA5Jfmg4K+3lbnEzeAViQzku/EXyyreE6PojdNbhz5VlEa7IrqqT4
	vTV+5wsgcYtr5oZY1FNgNk/mfcSdyI7ADD92wDpsT623iy9T376eQIDB+ESpyT44iFt8
	CHLjDjyk/B5vy6F0M8FrEz1jgNqWqXK0a+tzdF0cwnK8jtpYd/ljDzdfdDNu8CUbUnul
	7k5A==
X-Gm-Message-State: APjAAAWgrn/2Iqb7aCpREXvx9LebVMyyu9oEAVDxMHY/NyKlZ7bU+Ff5
	H0RWCVrbA1yWuEMnti9S4J19Bang
X-Google-Smtp-Source: APXvYqziZeNKnGMx+/5g9bJAoZujp/8IPuXpwzveK+QqD91guaayLSHToMwugkwzFQ4SK0ORVcfpCg==
X-Received: by 2002:a5d:4204:: with SMTP id n4mr7844835wrq.123.1576174486385; 
	Thu, 12 Dec 2019 10:14:46 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	o66sm3147571wmo.20.2019.12.12.10.14.45
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 12 Dec 2019 10:14:46 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Dec 2019 19:14:10 +0100
Message-Id: <20191212181436.1322-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191212181436.1322-1-alex.kanavin@gmail.com>
References: <20191212181436.1322-1-alex.kanavin@gmail.com>
Subject: [PATCH 04/30] psmisc: revert to default autopoint exclusion
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
X-List-Received-Date: Thu, 12 Dec 2019 18:14:47 -0000

Otherwise, builds break with latest gettext.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-extended/psmisc/psmisc.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-extended/psmisc/psmisc.inc b/meta/recipes-extended/psmisc/psmisc.inc
index 594a10cf222..a75b04702c3 100644
--- a/meta/recipes-extended/psmisc/psmisc.inc
+++ b/meta/recipes-extended/psmisc/psmisc.inc
@@ -19,7 +19,6 @@ inherit autotools gettext
 # Upstream has a custom autogen.sh which invokes po/update-potfiles as they 
 # don't ship a po/POTFILES.in (which is silly).  Without that file gettext 
 # doesn't believe po/ is a gettext directory and won't generate po/Makefile.
-EXTRA_AUTORECONF_remove = "--exclude=autopoint"
 do_configure_prepend() {
     ( cd ${S} && po/update-potfiles )
 }
-- 
2.17.1


