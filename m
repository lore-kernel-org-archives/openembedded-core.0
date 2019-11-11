Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 7DA2E7FAA3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 18:30:20 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id n13so11253834pff.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 10:30:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=duxQDG8OK/jynCSpyBfTGHs7wKcqkXYCfCD9PLM05Gk=;
	b=C6YikR3lDgReV4Npw1u0tzI78bLlcukTa1W3UHx1Ue1OPodaQj3CfyQNFLV8XJ5SFZ
	PB+B8ft1fSMSvUvrmV+3H9/8WN6UV20v25CbTdwH6VD43Iaedd/+enh5/IRwbLwOi1hr
	+un/QA6PjRxRAEa0saAoUEN0NL4ouGofeKl7tqYnShQq5yxB8Ka6IEjuBU6hWznzYMTP
	G4c1WbTPI92f5n7CHnYRuL4B2/yPAp1spr81qMwZTw51hdid0lovyetGY+DEJCKakGuZ
	wBwqIIEtxyXso0w/KpJIdyELiCZmkye7GuBHJlKcT5nDmeAr3ulcCYxubanqX1T+BB7+
	uz/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=duxQDG8OK/jynCSpyBfTGHs7wKcqkXYCfCD9PLM05Gk=;
	b=eT4sYc0lBgae/fhwY9BCaFC+z8aeyJHfLh8O5gICvxMGfx57vAJU49fpOy9Q38D7z6
	8J8E7H6kzX/95jQr9F+w1iZJAH9Ij4F3Th6+DbrtwIOStPcJRsz2g6oIxFCNYAW27TFN
	0CRRIOdXiJKwhZxwfsli3SdMdr86Lbq/ie09gG6t93GUHuaEkl3T/Zh+mVR3i0aZXz5O
	irOth6DCfFXscGEPdFYVvpBxnfQYiObjjn2LXLgJBv/uSrHHga7y+lqtWqz5ojas5c8a
	U0p7m5w5lRue6Lx3mP2EHm3zQcPppKcgGKhJl/6j4tMrgzv/KgWGCYOKOehi48V8+VEo
	OAnw==
X-Gm-Message-State: APjAAAXBMWQ2Sw1gru0zRqRwrHcMIRpw4O16S5GEFq0edIW4LEzWnf3Z
	r2rMMYcTQbpwE9vY09MgwLF4KfiP
X-Google-Smtp-Source: APXvYqyweE9RatFY9CoBXNv37zJzKxSWMtWQXhFZTQ2jsKINHKB7v3dXYixD+FecUylKYrR+Cz5Myw==
X-Received: by 2002:aa7:96f3:: with SMTP id i19mr32101634pfq.173.1573497021545;
	Mon, 11 Nov 2019 10:30:21 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:604a:b703:29ca:5c7d])
	by smtp.gmail.com with ESMTPSA id
	l62sm17731698pgl.24.2019.11.11.10.30.20
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 11 Nov 2019 10:30:21 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Nov 2019 10:29:55 -0800
Message-Id: <6b5cadd1a5822641285946f7e2ad56e294658621.1573496794.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1573496794.git.akuster808@gmail.com>
References: <cover.1573496794.git.akuster808@gmail.com>
Subject: [zeus 13/21] cve-check: failure to parse versions should be more visible
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
X-List-Received-Date: Mon, 11 Nov 2019 18:30:20 -0000

From: Ross Burton <ross.burton@intel.com>

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/cve-check.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index f87bcc9..1c8b222 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -222,7 +222,7 @@ def check_cves(d, patched_cves):
                             to_append_start =  (operator_start == '>=' and LooseVersion(pv) >= LooseVersion(version_start))
                             to_append_start |= (operator_start == '>' and LooseVersion(pv) > LooseVersion(version_start))
                         except:
-                            bb.note("%s: Failed to compare %s %s %s for %s" %
+                            bb.warn("%s: Failed to compare %s %s %s for %s" %
                                     (product, pv, operator_start, version_start, cve))
                             to_append_start = False
                     else:
@@ -233,7 +233,7 @@ def check_cves(d, patched_cves):
                             to_append_end  = (operator_end == '<=' and LooseVersion(pv) <= LooseVersion(version_end))
                             to_append_end |= (operator_end == '<' and LooseVersion(pv) < LooseVersion(version_end))
                         except:
-                            bb.note("%s: Failed to compare %s %s %s for %s" %
+                            bb.warn("%s: Failed to compare %s %s %s for %s" %
                                     (product, pv, operator_end, version_end, cve))
                             to_append_end = False
                     else:
-- 
2.7.4


