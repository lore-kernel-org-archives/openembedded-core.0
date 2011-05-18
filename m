Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1QMnw3-0001nw-ID
	for openembedded-core@lists.openembedded.org;
	Wed, 18 May 2011 23:05:40 +0200
Received: by pzk36 with SMTP id 36so925619pzk.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2011 14:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=gKf7M35tS5N1h7hbnbRUa74axludNrom8TBJSMkCfwE=;
	b=MdK6eavl/0Yeq+xWK59o9E5JaKaa0QX5fb8UKTsdUD6jmiVag7h/MIJ+UrLYxAWlyF
	J8T8VWOQqyKKOCX6PVLy2FTOj7EzUnlf6lOuKHs9bvWOQHD8peKi6/3Qb+sDK3jBXa7b
	BvlQ8/U24GqHzew4pjfDB88zEsbv1KllBHLyY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=m6U2ToeocwToD18It4BX/ZEGcTBPD25pZw4ADVb3bnAew6zrrpWOd9t1rvTSF/8ism
	Kmirq/MTHyvgmsaM7CA2/4I4OWUlAo1mARdrkBoPi/dZZqe5kzb/cOqJV51Qs6yg8j2x
	i6ZtzdqOXsY5JoiAXvprlaN+X8HtPWKj695c4=
Received: by 10.142.161.19 with SMTP id j19mr1384455wfe.420.1305752560332;
	Wed, 18 May 2011 14:02:40 -0700 (PDT)
Received: from localhost.localdomain (ip24-251-173-232.ph.ph.cox.net
	[24.251.173.232])
	by mx.google.com with ESMTPS id k6sm1690201wfa.5.2011.05.18.14.02.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 18 May 2011 14:02:39 -0700 (PDT)
From: Chris Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 May 2011 14:02:28 -0700
Message-Id: <cover.1305752502.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.7.1
Cc: Chris Larson <chris_larson@mentor.com>
Subject: [PATCH 0/5] Variable typing & reworked imports handling
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 May 2011 21:05:40 -0000

From: Chris Larson <chris_larson@mentor.com>

Pull URL: git://git.openembedded.org/openembedded-core-contrib
  Branch: kergoth/oe-sync-base
  Browse: http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kergoth/oe-sync-base

Thanks,
    Chris Larson <chris_larson@mentor.com>
---


Chris Larson (5):
  Implement variable typing (sync from OE)
  oe.data: expand the flags
  base.bbclass: switch to current OE's imports handling
  Shift oe import logic out of the event handler
  base.bbclass: use oe.data for OE_IMPORTS

 meta/classes/base.bbclass      |   46 +++++++++--------
 meta/classes/typecheck.bbclass |   12 +++++
 meta/lib/oe/data.py            |   18 +++++++
 meta/lib/oe/maketype.py        |  100 ++++++++++++++++++++++++++++++++++++++
 meta/lib/oe/test_types.py      |   62 ++++++++++++++++++++++++
 meta/lib/oe/types.py           |  104 ++++++++++++++++++++++++++++++++++++++++
 6 files changed, 320 insertions(+), 22 deletions(-)
 create mode 100644 meta/classes/typecheck.bbclass
 create mode 100644 meta/lib/oe/data.py
 create mode 100644 meta/lib/oe/maketype.py
 create mode 100644 meta/lib/oe/test_types.py
 create mode 100644 meta/lib/oe/types.py



