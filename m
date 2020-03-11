Return-Path: <jpuhlman@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 0530D61BAF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2020 22:22:54 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id 2so2134584pfg.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2020 15:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=kBGW3X9DDIDIRx8coeaCLM6g7RLh/ouioy2R1niNLog=;
	b=Ga3kd7++QTBkT2NBzVzRcO0rffeYp70MX7tYi0yG+9YiUZRDUGMrlqTSbpe43Wwukx
	Sgi6uTyfvEWIkFVLzEVsNka2O8/cH7ikD3CmZE81QeK91nT1qQ3M5hdH4MjayFfGMLiZ
	TKN/dt55Cb/2y/vHg8qXNGigGzbvr72LLpJ1PKVYw8h6xxGhdUtb0f5MAncBKhqkS5No
	Nsiwg5nDz+gWlC6xhbUxngDIHit9uQsNGuzRCTpbRqB6AK2JnwJeJrK6E8ZwwgnCVyvq
	T7DGe4Mt1jLf6DEhqw0sgB0k67YfXAu7Ad0FnbifkvM1QyrJBNTrOyJdFQmm1+vnNskx
	P4KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=kBGW3X9DDIDIRx8coeaCLM6g7RLh/ouioy2R1niNLog=;
	b=XfkKxqxi6MeWbWdze3GaDu51Pvu8/Lnsblm8Q0h0rx9msjtzZ3ABd/5/YJo2+fkOWL
	XYUnnjsbmmT1IdhUqJrYro2ZgUxKMO5qXN3JwlE6vhFI+rvyJIitRFuwkV8HYZnW/H0O
	DWCOf0R8z/INmFr8dOTnhxjAt0uJBgND3IUgjASKKrwx9T6P0nywWULz3MI7PWXWZley
	wPb/Bos+Lx4TGs9PGJLHqTwLN+bfqQGKyuVme1mvt5X22lT7jU/O3i0VFO1vJowmlFxC
	ZEiXnmmjI9UikH0vzx+W2hnJ0NOGSsQXnN8EpB2rq/HVPmGra79DTXJp6/9enGxLB2G9
	OZyg==
X-Gm-Message-State: ANhLgQ1/Nwrp3tk121F/oP4wsdQSErTtaAYIlypAjrKqwTllJM2CEs6u
	OT/f2LIca8H3SYsHD+WVUGLBj2VW9vA=
X-Google-Smtp-Source: ADFU+vuyc8J59aPgTcl+w7WCPRnYM7GqmKDhB0Jd1JgHBL8xp+HPLAaFdqh+6l94h+8THVpwmgPBMw==
X-Received: by 2002:a63:350:: with SMTP id 77mr4907019pgd.215.1583965375575;
	Wed, 11 Mar 2020 15:22:55 -0700 (PDT)
Received: from workhorse.localdomain
	(99-14-97-149.lightspeed.frokca.sbcglobal.net. [99.14.97.149])
	by smtp.gmail.com with ESMTPSA id i21sm6812202pgn.5.2020.03.11.15.22.54
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 11 Mar 2020 15:22:55 -0700 (PDT)
Sender: Jeremy Puhlman <jpuhlman@gmail.com>
Received: by workhorse.localdomain (Postfix, from userid 1000)
	id 16BE42A05EB; Wed, 11 Mar 2020 15:22:54 -0700 (PDT)
From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Mar 2020 15:22:49 -0700
Message-Id: <20200311222249.29880-2-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20200311222249.29880-1-jpuhlman@mvista.com>
References: <20200311222249.29880-1-jpuhlman@mvista.com>
Subject: [PATCH 2/2] glib-2.0: Correct multilib conflict
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
X-List-Received-Date: Wed, 11 Mar 2020 22:22:55 -0000

From: Jeremy Puhlman <jpuhlman@mvista.com>

Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
---
 meta/recipes-core/glib-2.0/glib.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 23c347dbf7..edecc51fdb 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -128,6 +128,9 @@ do_install_append_class-target () {
 			rm ${D}${datadir}/installed-tests/glib/gdbus-serialization.test
 		fi
 	fi
+        if test "x${MLPREFIX}" != "x"; then
+                mv ${D}${datadir}/installed-tests/glib/static-link.test ${D}${datadir}/installed-tests/glib/${MLPREFIX}static-link.test
+        fi
 }
 
 # As we do not build python3 for windows, makes no sense to ship the script that's using it
-- 
2.13.3


