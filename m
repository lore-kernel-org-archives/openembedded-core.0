Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [193.158.56.148])
	by mail.openembedded.org (Postfix) with ESMTP id 4373D77E44
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Sep 2017 17:33:22 +0000 (UTC)
Received: from mail-mta-0.intern.sigma-chemnitz.de
	(mail-mta-0.intern.sigma-chemnitz.de [192.168.12.76])
	by mailout-1.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	v88HXMAD029876
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK) for <openembedded-core@lists.openembedded.org>;
	Fri, 8 Sep 2017 19:33:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1504892003;
	bh=KmER8Bc8otlcIsxn8CFTBJFyMIZP8MwEd1Nc58zzgrA=;
	h=From:To:Cc:Subject:Date:Message-Id:Sender;
	b=HgMVKNCzw71mueBeowZd7VeuQ/m488gnqt/sLsV631JY1odtfVPz6gzj9DS6fwzMZ
	cH1AHHtVEwSHJrhAAfrW86kenl3FP1h9qkvzYrcZ6w1DXKccAM+9QaEFmxjaL/f0ty
	THzVy0UZ0DaudwjCqYfRBgJ2YLIvE8Q51onshZtw=
Received: from reddoxx.intern.sigma-chemnitz.de
	(reddoxx.intern.sigma-chemnitz.de [192.168.0.193])
	by mail-mta-0.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	v88HXGYA002435 for <openembedded-core@lists.openembedded.org> from
	enrico.scholz@sigma-chemnitz.de; Fri, 8 Sep 2017 19:33:17 +0200
Received: from mail-msa-0.intern.sigma-chemnitz.de ( [192.168.12.77]) by
	reddoxx.intern.sigma-chemnitz.de
	(Reddoxx engine) with SMTP id 58D65C7FF55;
	Fri, 8 Sep 2017 19:28:18 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail-msa-0.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	v88HXEbT002432
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 8 Sep 2017 19:33:14 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.87) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1dqN9W-0007j2-3Y; Fri, 08 Sep 2017 19:33:14 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Sep 2017 19:33:00 +0200
Message-Id: <20170908173303.29634-1-enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 2.9.5
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 0.99
X-Spam-Score: -4.6
X-Spam-Level: ----
X-Spam-Tests: AWL, BAYES_00, DKIM_ADSP_ALL, RP_MATCHES_RCVD, SPF_NEUTRAL,
	DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.79
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: [PATCH 0/3] wic: enhanced bootimage + squashfs support
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
X-List-Received-Date: Fri, 08 Sep 2017 17:33:23 -0000

Patchset allows to use different bootimage sources and to reserve more
space for squashfs partitions.

Enrico Scholz (3):
  wic: accept '-' in bitbake variables
  wic: allow multiple /boot partitions with different content
  wic: apply --extra-space + --overhead to squashfs

 scripts/lib/wic/misc.py                             |  2 +-
 scripts/lib/wic/partition.py                        | 13 +++++++++++++
 scripts/lib/wic/plugins/source/bootimg-partition.py | 17 +++++++++++++----
 3 files changed, 27 insertions(+), 5 deletions(-)

-- 
2.9.5


