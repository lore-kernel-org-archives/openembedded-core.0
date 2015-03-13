Return-Path: <patrick.ohly@intel.com>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id 49578738A5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Mar 2015 13:30:13 +0000 (UTC)
Received: by igdh15 with SMTP id h15so822422igd.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Mar 2015 06:30:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=eguWWfpICfd/z7digaoF0KavjdTA5xpBevWAfm1uh2I=;
	b=R/GCQgv3YgC3jdLo51RlSde/oGuPWmODnItDkdOvdyAMwuIOLB8k+SL9jGVKJWya1f
	H/Uwe1V2CjmlByYQ4OMhM2iaz59y0v3A7WWFaJtWCLdiw45wddmKZIuot4SRxypalRNq
	zK/eHQ1WZjXy5DM3r4j8o0XjQFXtxW7azjQOE9LTgyYy0PSZHUahsHPPNx90i6/teq7p
	gXzoAO9gGJ+wtSjCge+zXsM2iypFXA0e5AMrrlui/BRGHI+WcUyqSIxQVZ3cUYfDvAbm
	eXYqYQq+s8g4VwNCOo5GEVLmwwmJMDb5rgXmM6WURugtpxJtMjde+kDg4oNgQ6GXes1G
	iy2A==
X-Gm-Message-State: ALoCoQl2YYniwx0C3tVHOkTiVVIkYWFaVLFweNazw7LJvFm0KtWnTXsvWw9PxjBjWZnudmEWMgRK
X-Received: by 10.107.5.211 with SMTP id 202mr49499658iof.88.1426253415202;
	Fri, 13 Mar 2015 06:30:15 -0700 (PDT)
Received: from pohly-mobl1.ger.corp.intel.com (p5DE8C8C2.dip0.t-ipconnect.de.
	[93.232.200.194])
	by mx.google.com with ESMTPSA id h15sm1257487ioh.27.2015.03.13.06.30.13
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 13 Mar 2015 06:30:14 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org,
	Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Fri, 13 Mar 2015 14:29:34 +0100
Message-Id: <0240a5c9d990c6bf9490116ff8bf49f37269551c.1426252888.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <a9fe203d338f966d5afe631bd7956ee8232a6bf4.1426252888.git.patrick.ohly@intel.com>
References: <a9fe203d338f966d5afe631bd7956ee8232a6bf4.1426252888.git.patrick.ohly@intel.com>
In-Reply-To: <cover.1426252888.git.patrick.ohly@intel.com>
References: <cover.1426252888.git.patrick.ohly@intel.com>
Subject: [PATCH 05/11] combo-layer: update() also instance property
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
X-List-Received-Date: Fri, 13 Mar 2015 13:30:14 -0000

The Configuration class mirrors all properties in local hashes.
When updating the configuration, also update these properties
to remain consistent.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 scripts/combo-layer | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/combo-layer b/scripts/combo-layer
index 8db5d7e..8ed9be8 100755
--- a/scripts/combo-layer
+++ b/scripts/combo-layer
@@ -130,6 +130,7 @@ class Configuration(object):
         parser.set(section, option, value)
         with open(conffile, "w") as f:
             parser.write(f)
+        self.repos[repo][option] = value
 
     def sanity_check(self, initmode=False):
         required_options=["src_uri", "local_repo_dir", "dest_dir", "last_revision"]
-- 
2.1.4


