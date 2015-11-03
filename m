Return-Path: <danismostlikely@gmail.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id 3B22E73D46
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Nov 2015 22:54:47 +0000 (UTC)
Received: by pabfh17 with SMTP id fh17so31275084pab.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Nov 2015 14:54:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=09p1aWBagjEX3bObNeUzF7pTP9S/EgJ8PIXtzd6rrRg=;
	b=02zNeRL+dNJa1DODooboTx4EW97UgNtzBU9/0HAHGM/nz37Sy2Y/X54XNl71Cxx9fw
	GYjqgD2BidzosRE7iWwD9OBmwDIxetTYe9uztHUOLyg9MoK/27e/1o7QLmqbEz5Wq8WX
	LQH//qbSWAIqfIqD1TTDMPO+GWlNfMzvki8euKjoOeBm7FH8uGpQFsZt21SdSBDxHKML
	hOWpJWT0zsYJFpfAEH+uZDxlFqau5umKNBLS14C6railqH2xg/7UzB0SFJeouDWtlyX8
	B9CE+UOZTd6a3Wb3at9gb2Xtk4zMLSjUpYVCZsZRTSMC7MSPWqEW5/WhDZsyXolcXGlR
	oVtg==
X-Received: by 10.66.149.105 with SMTP id tz9mr37134692pab.143.1446591288093; 
	Tue, 03 Nov 2015 14:54:48 -0800 (PST)
Received: from mediabox.local (71-17-233-74.sktn.hsdb.sasknet.sk.ca.
	[71.17.233.74]) by smtp.gmail.com with ESMTPSA id
	ha3sm31427036pbb.28.2015.11.03.14.54.47
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 03 Nov 2015 14:54:47 -0800 (PST)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Nov 2015 16:54:32 -0600
Message-Id: <1446591276-28139-1-git-send-email-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.6.2.11.gb05c2f9
Subject: [PATCH 0/4] systemd improvements
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
X-List-Received-Date: Tue, 03 Nov 2015 22:54:48 -0000

From: Dan McGregor <dan.mcgregor@usask.ca>

These four patches include three bug fixes, and one new feature.

os-release is improved to handle variables with spaces
don't stomp on machine-id on systemd upgrade
don't complain about manpages with .so in their names
coredumpctl is added as a new systemd PACKAGECONFIG value

 meta/recipes-core/os-release/os-release.bb | 2 +-
 meta/recipes-core/systemd/systemd_225.bb   | 9 +++++++--
 2 files changed, 8 insertions(+), 3 deletions(-)

-- 
2.6.2.11.gb05c2f9


