Return-Path: <patrick.ohly@intel.com>
Received: from mail-pf0-f169.google.com (mail-pf0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id D5EA4784A1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jul 2017 14:50:00 +0000 (UTC)
Received: by mail-pf0-f169.google.com with SMTP id q85so96770807pfq.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jul 2017 07:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=zIz/Qp0KgXYUdFDZWg+K0C5gEH2rR2sGdsogHNLPHHg=;
	b=0Ogcb+Zt64eQWTnSE1cbFYUkEZTM66OpnYtJhhmLpbDb9cAuzwLn397dhiCZOcMv8N
	wUlRK/19R5b5xsEOelpH0nDWy8wGv4a3jc4o4V068Oq+f1V1/21YI9jyHV2AQf5bqeGp
	KAl3cvTv+vdDnJAjb9UsuXAFrRYIyvOOSFXv8JfYVBuFW4oEAlgIZ6sHAquZ5Pzsrad5
	xXQJBrbNPuNih7X8LVD9BDvBmugp9GrG/BrRuEepzItYLxK/o5a9L4ySewokevD1FGLj
	pkQ7MkgkTufGEnSdu9l+tEucp2avirlJuLP6ajVH8vGQTY1l4Aoj6Aj/PECsWN9HVtxR
	nWcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=zIz/Qp0KgXYUdFDZWg+K0C5gEH2rR2sGdsogHNLPHHg=;
	b=DTIs7ESi/dnAJR0uI2zjIF+bOehhISkYAuBjgQF5zL2CLWtR2nAmxQgl1Sy30Fq8H/
	TNruXcUgC5OGHILkZpmB3lDoDkbgvRU94tU6hzUV6rcE6PhNs8TGNqpXLhc3bBtrQKRN
	jJqo0Et/9dSzA+7iHAo3J/bvvrV+YLlHstlMRvi9kDzqenLQcFiHEDvWzEno7DLA6ZSA
	/tRWl1kWqfgVaqsXh61JL87B6qDoHOlWuW9HdmOYw1gXRUq9a7x8EjqYPgIwD+S250nk
	pevjB8nNOVyTz+25Pf1Hg6IhUPTOmgl6efXhrXi8PTUTqqmlJkQx+t9ig3ZdIwpz6xo1
	cYpA==
X-Gm-Message-State: AIVw111SExUibZT4ZQBwAYFYNjOFdI+R1V9YisUJcf05WlTzZrB3A01G
	JPPwQwnp+cgY6tLhUcE=
X-Received: by 10.98.69.91 with SMTP id s88mr7579349pfa.183.1501253401536;
	Fri, 28 Jul 2017 07:50:01 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p57A5633D.dip0.t-ipconnect.de.
	[87.165.99.61]) by smtp.gmail.com with ESMTPSA id
	b13sm38730381pfj.141.2017.07.28.07.49.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 28 Jul 2017 07:50:00 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Jul 2017 16:49:51 +0200
Message-Id: <cover.1afd007ce6c93979d7d4cc2eb225b84710ca1a65.1501253351.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH v2 0/2] move autoconf-archive into OE-core
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
X-List-Received-Date: Fri, 28 Jul 2017 14:50:01 -0000

V2:
 - removed the gnome-common dependency that was still in V1
 - merged the .inc file into the .bb file and cleaned up the recipe

Patrick Ohly (2):
  autoconf-archive: move from meta-oe to OE-core
  autoconf-archive: simplify and fix recipe

 meta/recipes-devtools/autoconf-archive/autoconf-archive_2016.09.16.bb | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta/recipes-devtools/autoconf-archive/autoconf-archive_2016.09.16.bb

base-commit: d3a41fbd94462efc8c6f1b55f6fb54001b447c45
-- 
git-series 0.9.1

