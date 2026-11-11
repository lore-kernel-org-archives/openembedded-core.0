Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5609.1794387832046817120
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2026 01:03:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=R5DeJ5Mu;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so34887275e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 01:03:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1794387830; x=1794992630; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OtSpbWACKe+WGV2pJKXTIetJE4+SH29LioSZ7zrwyd0=;
        b=R5DeJ5MusMrGk2IN1oki43i32hUmCYiMjlfvbwrqx+bSwXeC2326lwiZJeQgjE1ywa
         lwTT7ZxJySh2CIa+tlfCHH+qcj2n/xMqalrt/bFF9HVniUjJmC3o13mo2RXiuczAXsOs
         7vGqVeUd1Hhcz13ZpTsGi6M1MYr+PHbWNCGRJnfABHrlWCWjg3qJxlyj8J6x9fJreVqq
         HG2ZAFajq6n3zpXkszpWGdaIpkzJkkJfNKb9nUsdT5BwoWa0KaISGBTXIWcw90IFthds
         4KSLUybjreRROUG8C26KGeIrUQSqU1cM9zKxKr0EEil3Z5YJwY/BGqVkPxxKLeKqRoHa
         lPdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794387830; x=1794992630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=OtSpbWACKe+WGV2pJKXTIetJE4+SH29LioSZ7zrwyd0=;
        b=pkelHmPzx/xl1+REMot+OI20wg3MAbYAE4H50wNUvipskeW/wX4DiRwQM4Ac0UHCcq
         4cJJzCpb1WxVKHdevXgYI4kTX+Vp5L3lAjLYQS8lr87TmGD92Tgw462XCoB0VfezhRDN
         H66T23bwT9uYvpof6/hs+ljPhYsp0+1Dxn+l43yxNUY+5B/YnHhfjd+qDJHAKz7K6gmz
         b8z4ELlwNLaa6JMNnVZCGqUE+6o0QtHWdkM08CQ0LZYV6jGLgav8JE+mbBgPWZunQpBq
         rlEs4wDRj/GTdLeVgCysEkDG4duFmGcO/44l+IhNDSdgPP6n1cP+CwEbjPXtmX1hEgJd
         Iz3g==
X-Gm-Message-State: APuU4Z8dlmQ2SUbzbIKlp3g23dIbO6YFFk0wTO+qWAQPpKfKXNLDeAKU
	xpYpsYpr0q7M/Yd8MCTl4xb0OXRjxYmAvVLAI5zSLTnp8bGaRTt6UcBQvk5jOo5dVndSeq7c7j/
	kZBDa2u0=
X-Gm-Gg: AYBFou1vo/tIuHoy556l4jdxOVCy5ABn0wKO4HrE0PjIoYv3C37CZkabuZi7BtZTZWo
	4BdQ9fZF6F0QlD9uci2fsmL7NQn06+6MwsnxM75SkoyHlz2GBEWY8AlmlSy1WXE0MWBsKSymDzO
	QIT8bJZu8JKvLrHijfCRCxgpRdbJAY3xyV00l9runQlP/A9UdOC5mwIXp1Hs7yujQPKnmK1s6rO
	g4/oDer0a8o/VRhcWJ1taFTuyAO+1LqavW0V8fqWy7aJEaEGdTAH96r0byIZLC8K4rczVNhKu2S
	ebqW44o+yqXVFQW36sR8RY5GPoXOHZidk2PHk7poSqT20zgl4PRO2zxEzok0xzqkGw911FkDM5f
	JQf2QX4ccHlIh9aIdGzn/U70Q6umT/ym8ynEsaK7m2IM///Fb4bD360AitLVpnELvPOFLAjv+32
	fHQ/iZyngWXo9WJBJrTjj+i8IVcCY4oRNK2wzl0fZJk6TMHA3NbvXTUqhrdq5ckl8JvtkDcwP/P
	NgpVb8HwlqYlxW2byC0/mNv4W+JYocM5lwKXqj3tEOWZWB/75zuTPVyYy/K2jV6rmMCUDJGkjth
	s1kHzt7JhO5CXBQURHty3HD+ojIkAbh8zyAb9F6+gjxGjU/mooJ7hsf273AJwH2Tib5eMaYjg9p
	bJi4jTXhVePPpzhwHGyPrN/OOp6g/0cLEvn+IRf/2rS0jEjEMKg==
X-Received: by 2002:a05:600c:4e45:b0:4a4:7a8d:c436 with SMTP id 5b1f17b1804b1-4ba0936c0c7mr30790955e9.11.1794387830252;
        Wed, 11 Nov 2026 01:03:50 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fe9357sm147623675e9.9.2026.11.11.01.03.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 01:03:47 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 23/35] recipe_sanity: Drop rename overwrite detection
Date: Wed, 11 Nov 2026 10:02:49 +0100
Message-ID: <8e87f72f501cc1845a90cdb1c2b351a6cb63aee8.1794387482.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1794387482.git.yoann.congal@smile.fr>
References: <cover.1794387482.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 09:03:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249995
Content-Type: text/plain; charset="utf-8"

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Bitbake itself checks for probelmatic renames now during key expansion so this
check shouldn't be needed anymore (it dates from pre 2011).

(https://git.openembedded.org/bitbake/tree/lib/bb/data.py#n96 in expandKeys())

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7944665886cb0bf881807a5d849ebdf42a33d1bf)

The corresponding bitbake change was merged in 2.18: 4986a548e (data: Fix
expandKeys recursion issue). Include this in wrynose as well so layers
using this class continue to work.

Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/classes/recipe_sanity.bbclass | 21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/meta/classes/recipe_sanity.bbclass b/meta/classes/recipe_sanity.bbclass
index a5cc4315fb8..3c763de1f20 100644
--- a/meta/classes/recipe_sanity.bbclass
+++ b/meta/classes/recipe_sanity.bbclass
@@ -34,13 +34,6 @@ def req_vars(cfgdata, d):
         elif val == cfgval:
             __note("%s should be defined to something other than default (%s)" % (var, cfgval), d)
 
-def var_renames_overwrite(cfgdata, d):
-    renames = d.getVar("__recipe_sanity_renames", False)
-    if renames:
-        for (key, newkey, oldvalue, newvalue) in renames:
-            if oldvalue != newvalue and oldvalue != cfgdata.get(newkey):
-                __note("rename of variable '%s' to '%s' overwrote existing value '%s' with '%s'." % (key, newkey, oldvalue, newvalue), d)
-
 def incorrect_nonempty_PACKAGES(cfgdata, d):
     if bb.data.inherits_class("native", d) or \
             bb.data.inherits_class("cross", d):
@@ -113,7 +106,6 @@ python do_recipe_sanity () {
             __note(msg, d)
 
     can_delete_others(p, cfgdata, d)
-    var_renames_overwrite(cfgdata, d)
     req_vars(cfgdata, d)
     bad_runtime_vars(cfgdata, d)
 }
@@ -137,19 +129,6 @@ python recipe_sanity_eh () {
 
     d.setVar("__recipe_sanity_cfgdata", cfgdata)
     #d.setVar("__recipe_sanity_cfgdata", d)
-
-    # Sick, very sick..
-    from bb.data_smart import DataSmart
-    old = DataSmart.renameVar
-    def myrename(self, key, newkey):
-        oldvalue = self.getVar(newkey, 0)
-        old(self, key, newkey)
-        newvalue = self.getVar(newkey, 0)
-        if oldvalue:
-            renames = self.getVar("__recipe_sanity_renames", 0) or set()
-            renames.add((key, newkey, oldvalue, newvalue))
-            self.setVar("__recipe_sanity_renames", renames)
-    DataSmart.renameVar = myrename
 }
 addhandler recipe_sanity_eh
 recipe_sanity_eh[eventmask] = "bb.event.ConfigParsed"
