Return-Path: <patrick.ohly@intel.com>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id 95B11759C7
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Aug 2015 16:24:07 +0000 (UTC)
Received: by iggf3 with SMTP id f3so14756084igg.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Aug 2015 09:24:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=dbMfDALtG68ggyQZzgMz9aVdFiefi0Ur8/jg0TrR8+c=;
	b=MVI3GusUmldc9jyY9qfzYh/a3nAGcp6HEzcgpYEKbf7keywW5GW4K1ZB9Wyd9MMpas
	JK68TEK1cKcqjEhJJUfZD3A+HirBpdJfh4ly5belwYj2dZdJDixykR4hTHo5cvoz6REm
	3dhPWrMjVR1dUgqGEbon2q1/jnMyiJqabijXO0Y+vZrtKwBovAfzQIZ6PuWN8uMrlMaL
	5YO2E0QXWMgE/EiI/13jgzcQRMb+8uL3USv0Uk+f1/Q5sQTrwXFIRJAKUMThk/GgyacN
	EJ0hAGjiMnbb9CkS5LxAiGamjyiMa8FWOzAGZlAtT24URsmgbL4hupCoikfhptVXUKOS
	lq+g==
X-Gm-Message-State: ALoCoQlTlqN2qqEspaUVkZGhbvbd9vgHeuke27OvN1lyUcbeMJ05QhLQ2DIucceVpRqYpf/TH4xB
X-Received: by 10.50.72.6 with SMTP id z6mr4945447igu.65.1438705447311;
	Tue, 04 Aug 2015 09:24:07 -0700 (PDT)
Received: from pohly-mobl1.ger.corp.intel.com (p5DE8CA2B.dip0.t-ipconnect.de.
	[93.232.202.43]) by smtp.gmail.com with ESMTPSA id
	ii1sm1400785igb.10.2015.08.04.09.24.05
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 04 Aug 2015 09:24:06 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Aug 2015 18:23:58 +0200
Message-Id: <cover.1438705086.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/2] enhance action_pull
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
X-List-Received-Date: Tue, 04 Aug 2015 16:24:07 -0000

action_pull can fail when the branch is not yet in the existing
component repo. Both error reporting and handling need to be enhanced.

The following changes since commit 288c76a41aebaf54c7fca3782160830df462b9e4:

  builder: Fix multilib compile failure (2015-08-03 07:15:47 +0100)

are available in the git repository at:

  git://github.com/pohly/openembedded-core action-pull
  https://github.com/pohly/openembedded-core/tree/action-pull

Patrick Ohly (2):
  combo-layer: enhance output in action_pull
  combo-layer: fix action_pull for unknown branch

 scripts/combo-layer | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

-- 
2.1.4


