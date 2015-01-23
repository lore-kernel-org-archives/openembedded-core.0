Return-Path: <patrick.ohly@intel.com>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id 045A772718
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Jan 2015 14:48:34 +0000 (UTC)
Received: by mail-ig0-f170.google.com with SMTP id l13so2521447iga.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Jan 2015 06:48:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=13PBGcxovrKbu1ZJUrj3ExcowR5qkdVUWqUwX2x1A+I=;
	b=Tr7Pd3Hm7c/CXVWkikrJunFKWcSia7YaIrHP7ilg34H8BbBTDcHH8El0JrOXzKpRo4
	x57McBJ7pyrBpzq1wytXu50LfHeFUWlFcwbVf1PU0CGOoJzuOBXfDvVBjSPr3wAozPAP
	SX1Of4keKdxBnptFhfdydgFgu9LUNR41TeTi+fDAR7kq8haSoQFvF68BNIxt3yyEU4dJ
	HQlzBsOVYQwfa91hOqKmTj0BChrcUhrCxCKS8eB6oqllvsuPkQRAHk/zB6wRkYiNLYuV
	M0h0GTshBfJ7kt2fMJBdS6yBBLhgglQFQNNO3XXiAA9gfPmy4BdtdQcSjz/7YYNcPjSH
	vcBA==
X-Gm-Message-State: ALoCoQn6UqR8CoJhreGVx2trxdtDk2785ty9QKTP7Bhv6KyB53rn79J0/3Yq2qjJz4PhhA1oYDk1
X-Received: by 10.42.64.193 with SMTP id h1mr9321767ici.32.1422024515257;
	Fri, 23 Jan 2015 06:48:35 -0800 (PST)
Received: from syncev.vlan14.01.org ([198.145.21.8])
	by mx.google.com with ESMTPSA id qj3sm748363igc.17.2015.01.23.06.48.33
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 23 Jan 2015 06:48:34 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Jan 2015 06:48:16 -0800
Message-Id: <1422024498-18778-1-git-send-email-patrick.ohly@intel.com>
X-Mailer: git-send-email 1.8.4.5
Subject: [master][dizzy][PATCH 0/2] swig + pcre-config
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
X-List-Received-Date: Fri, 23 Jan 2015 14:48:48 -0000

The reason for the patch series is the observation that swig from
meta-openembedded requires pcre-config to be installed on the host
system, even though it does not actually get used.

While that can be fixed in the swig recipe, investigating the situation
led to the conclusion that the current handling of obsolete config
scripts is sub-optimal and does not actually cause undesired usage
of the patched scripts to fail.

These two patches address that. They apply to master and dizzy.
Applying also to dizzy would have the desirable effect of removing
swig's host dependency without having to modify swig, but might also
be a bit too intrusive for the stable series.

Patrick Ohly (2):
  binconfig-disabled: try harder to prevent usage of config scripts
  binconfig-disabled: install config scripts in sysroot

 meta/classes/binconfig-disabled.bbclass | 13 +++++++++++++
 1 file changed, 13 insertions(+)

-- 
1.8.4.5


