Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1QMnzV-0001x7-9P
	for openembedded-core@lists.openembedded.org;
	Wed, 18 May 2011 23:09:14 +0200
Received: by pwj9 with SMTP id 9so972480pwj.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2011 14:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=6UsnK0HMlrX3jbKmF4GyzJNmRNkG1i37pxqPIELa05s=;
	b=U6eT6b2ZcAbmNYa4aNWav9iZAoVKHQYGyaTlP8LarNgh8GK0BWQbVQqejQoXlbczP+
	G5D96ifXbpB6N3YXd1gOIS2SCStYBhmcyk8ZlI1NBZjhywAwK3o/WfdZAScingDdbcy4
	kt905SllVTpoYA5quWXqFotRpPpZVarb7enGc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=pSsC5qQqE24rdFZBh7FhZkahWUzboH51xDDY7XTRaPMNAr1WikxhqLWTZcregVLJ/S
	8zzMc+RY6zlLhPaqxfrChHOqRYtFD+hWuRKDXRvNdYmp+Frnde/c7qyQEy2irXsOrSOz
	/1VHYBYLP+u8HNAjcoJbZjhNkNaTr1tCY6V5w=
Received: by 10.68.65.78 with SMTP id v14mr3528021pbs.204.1305752773411;
	Wed, 18 May 2011 14:06:13 -0700 (PDT)
Received: from localhost.localdomain (ip24-251-173-232.ph.ph.cox.net
	[24.251.173.232])
	by mx.google.com with ESMTPS id y7sm1278411pbg.43.2011.05.18.14.06.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 18 May 2011 14:06:12 -0700 (PDT)
From: Chris Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 May 2011 14:06:01 -0700
Message-Id: <cover.1305752660.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.7.1
Cc: Chris Larson <chris_larson@mentor.com>
Subject: [PATCH 0/5] Switch to OE's implementation of IMAGE_FEATURES
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
X-List-Received-Date: Wed, 18 May 2011 21:09:14 -0000

From: Chris Larson <chris_larson@mentor.com>

This version uses variables to define the groups of packages rather than calls to base_contains.

Note: this applies on top of kergoth/oe-sync-base.

Example:

PACKAGE_GROUP_stuff_i_like = "openssh nano foo"
IMAGE_FEATURES += "stuff_i_like"

Pull URL: git://git.openembedded.org/openembedded-core-contrib
  Branch: kergoth/oe-sync-image-features
  Browse: http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kergoth/oe-sync-image-features

Thanks,
    Chris Larson <chris_larson@mentor.com>
---


Chris Larson (5):
  oe.packagegroup: add code for package groups (sync from OE)
  Move packagedata code into oe.packagedata (sync from OE)
  packagedata: don't choke on empty PACKAGES
  image.bbclass: switch to OE's IMAGE_FEATURES
  Use oe.data for IMAGE_FEATURES

 meta/classes/base.bbclass        |    2 +-
 meta/classes/core-image.bbclass  |  112 +++++++++++++-------------------------
 meta/classes/image.bbclass       |   41 +++++++++++++-
 meta/classes/package.bbclass     |    4 +-
 meta/classes/package_rpm.bbclass |    3 +-
 meta/classes/packagedata.bbclass |   68 ++----------------------
 meta/conf/bitbake.conf           |    1 +
 meta/lib/oe/packagedata.py       |  107 ++++++++++++++++++++++++++++++++++++
 meta/lib/oe/packagegroup.py      |   29 ++++++++++
 9 files changed, 225 insertions(+), 142 deletions(-)
 create mode 100644 meta/lib/oe/packagedata.py
 create mode 100644 meta/lib/oe/packagegroup.py



