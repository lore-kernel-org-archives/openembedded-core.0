Return-Path: <philn@igalia.com>
Received: from fanzine.igalia.com (fanzine.igalia.com [91.117.99.155])
	by mail.openembedded.org (Postfix) with ESMTP id 25CD57E225
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jun 2019 13:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; 
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:Date:To:From:Subject:Message-ID;
	bh=qWAyk0LXQ4ltBNokOnOds+Lzk5Q3HcOz4QYRBiPGoHI=; 
	b=TOqTew2oYl9pB1y76/LadgnpydCEqg6rC4bsIP2fWsPs3HYud6u1C0iRwo+PhGD3UyFRdImW97G408pU4bQZ/gsb18GPSwoKnOxQXZtOvaCGPBdnD8242PR19gf8oylMXFrAiZozXST/6YapPNHlJ0mrD6VsjCl4LI60RiBmqizc+8n4dp7N/w47EJx3U04zoKXMijIVB2A0HyqKLGho/HwGy3mgm465gHnv8359xX/gWK52XrYjFvlJjjfhYCSyzKkHX6dQR6ikyCwD19srV3dUw4AEiTezrXxQbtCp2eEFKS3x4ITnO1w6XE1Pq38+UojwRDHCENTcLfWBfGd/DQ==;
Received: from 216.red-88-16-195.dynamicip.rima-tde.net ([88.16.195.216]
	helo=[192.168.1.41]) by fanzine.igalia.com with esmtpsa 
	(Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
	id 1hXnIo-0000AG-Aa for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Jun 2019 15:47:06 +0200
Message-ID: <c716be4355dd149975d466b2d9b4c47ea38f0002.camel@igalia.com>
From: Philippe Normand <philn@igalia.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 03 Jun 2019 14:46:56 +0100
User-Agent: Evolution 3.30.5-1 
MIME-Version: 1.0
Subject: GStreamer recipes migration to Meson and _git.bb recipes?
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
X-List-Received-Date: Mon, 03 Jun 2019 13:47:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi folks,

It would be convenient to have _git.bb GStreamer recipes, for
development purposes. There were some in the past but they were not
very well maintained and they had outdated SRCREVs. Would it be
acceptable to include _git.bb recipes relying on ${AUTOREV} in the
tree?

We also plan to migrate the recipes to Meson, especially because the
autotools build will be removed from GStreamer upstream, most probably
before the 1.18 stable release.

Philippe


