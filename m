Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3F0E978A50
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Mar 2018 17:21:13 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id 188so17025134wme.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Mar 2018 09:21:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=a6icK6ZtzyW98aG7ox82TeV5qSWzZvtIpdCNS070PMw=;
	b=del8JuLofSK51nYLOBc+Kx2TBobe4uES+nWHQR1M2ZDaKqYRBCzb68pJ28JkYBdGLl
	LXC3kYSHwji9bbnp+RJlQ8n+YEQbKsJQ8BRl6Gar1NQ5UHBImmGJm8YGm6X58S0pooJu
	yv1t9cCkrYjGDaxXwB1Q2T8I3ZeS0Z7i0ZSFBeU7hJfFk7CBynJIqi+B/1VoJSCA4o7y
	HqoEyLx0atLtB8QsS7bKjlPdUwkOjRZQFP9vHW7T8JC9eHtmeV2DO4aEnQcv16sh/VVN
	OI+l0uPK4Rdi/f76qBMaN9s1rp2pXCxH6ertPJjl1mYuO2qrRl43i1jOWWs7gHgZyeGU
	p4pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=a6icK6ZtzyW98aG7ox82TeV5qSWzZvtIpdCNS070PMw=;
	b=W1BnJSYeHVzgKXvpz02lSGrOVbp0y4z7ITvuHnmoEle59GfeEGFcfqQ/9qm+tyA7IY
	Sr0wAMGoK6uRu5k3CbHD/5icMsdTDN3wfEGtadOm6N+FFSOAT2gmMsCUpuubEt7ZpdB8
	JHoa+tmdgR/NspgV9GhLgdJtmjgSnd28py1MB0t38qA1QNC6wkO17X3XgG5HV0UMd7m3
	JvfHM0loUae3Z7/7grg1UG82FOQQ14CbjEJM9+pPzmFK6Fj59X7jh4VemJ6tsx4/HECV
	w3sfvL+/As2c6ws7IzcJjIKpKHSYqTOaE1YxyNnh6VWvichrRFjT2GecApnVypDTyXne
	zkpg==
X-Gm-Message-State: AElRT7HFycapGtWmKHDFNM/SOtSWu9K3yGTC3PmzPlY9Hc+tLpWN+2zx
	GwUXVlLJgdWb/kJVC/gKmYvsLJqf
X-Google-Smtp-Source: AG47ELsl3EtfrGdApxXVcyWRPqa9rbGTVf8VnMPqW6kb94lzhVemA5fdC1Apdsbt42EQ6QEKzcPDGg==
X-Received: by 10.28.169.79 with SMTP id s76mr8749833wme.48.1520270474032;
	Mon, 05 Mar 2018 09:21:14 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	m190sm10082047wmb.6.2018.03.05.09.21.13
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Mar 2018 09:21:13 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Mar 2018 17:20:39 +0000
Message-Id: <20180305172046.21729-22-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180305172046.21729-1-ross.burton@intel.com>
References: <20180305172046.21729-1-ross.burton@intel.com>
Subject: [PATCH 22/29] screen: refresh patches
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
X-List-Received-Date: Mon, 05 Mar 2018 17:21:13 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../screen/0002-comm.h-now-depends-on-term.h.patch    | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-extended/screen/screen/0002-comm.h-now-depends-on-term.h.patch b/meta/recipes-extended/screen/screen/0002-comm.h-now-depends-on-term.h.patch
index b5d71cc1b41..a01dc247511 100644
--- a/meta/recipes-extended/screen/screen/0002-comm.h-now-depends-on-term.h.patch
+++ b/meta/recipes-extended/screen/screen/0002-comm.h-now-depends-on-term.h.patch
@@ -15,19 +15,16 @@ Subject: [PATCH] comm.h now depends on term.h
  src/Makefile.in | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/src/Makefile.in b/src/Makefile.in
-index e791e79..d4f7c0b 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -113,7 +113,7 @@ term.h: term.c term.sh
- 
- kmapdef.c: term.h
+Index: screen-4.6.1/Makefile.in
+===================================================================
+--- screen-4.6.1.orig/Makefile.in
++++ screen-4.6.1/Makefile.in
+@@ -133,7 +133,7 @@ kmapdef.c: term.h
+ tty.c:	tty.sh 
+ 	sh $(srcdir)/tty.sh tty.c
  
 -comm.h: comm.c comm.sh config.h
 +comm.h: comm.c comm.sh config.h term.h
  	AWK=$(AWK) CC="$(CC) $(CFLAGS)" srcdir=${srcdir} sh $(srcdir)/comm.sh
  
- docs:
--- 
-2.4.1
-
+ osdef.h: osdef.sh config.h osdef.h.in
-- 
2.11.0


