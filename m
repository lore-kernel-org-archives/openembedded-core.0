Return-Path: <douglas.royds@taitradio.com>
Received: from smtp1.taitradio.net (unknown [202.37.96.23])
	by mail.openembedded.org (Postfix) with SMTP id 6C62679CEE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 23:58:57 +0000 (UTC)
Received: from acheron.taitradio.net (unknown [172.16.169.141])
	by smtp1.taitradio.net (Postfix) with ESMTP id 161111C002B;
	Fri, 14 Dec 2018 12:58:56 +1300 (NZDT)
From: Douglas Royds <douglas.royds@taitradio.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Dec 2018 12:58:52 +1300
Message-Id: <20181213235853.11206-2-douglas.royds@taitradio.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181213235853.11206-1-douglas.royds@taitradio.com>
References: <20181213235853.11206-1-douglas.royds@taitradio.com>
Subject: [PATCH 2/3] attr: Move unique-to-attr run-ptest into attr/ subdir
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
X-List-Received-Date: Thu, 13 Dec 2018 23:58:57 -0000

There is a separate, wildly different run-ptest for acl.
This is not a shared script.

Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
---
 meta/recipes-support/attr/{files => attr}/run-ptest | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta/recipes-support/attr/{files => attr}/run-ptest (100%)

diff --git a/meta/recipes-support/attr/files/run-ptest b/meta/recipes-support/attr/attr/run-ptest
similarity index 100%
rename from meta/recipes-support/attr/files/run-ptest
rename to meta/recipes-support/attr/attr/run-ptest
-- 
2.17.1


