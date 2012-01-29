Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1RrIHz-0001SE-ET
	for openembedded-core@lists.openembedded.org;
	Sun, 29 Jan 2012 01:06:35 +0100
Received: by eekd41 with SMTP id d41so818809eek.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Jan 2012 15:58:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=a/ejbug/Zd9FocxLw/PArXpDoYchdNJYSkAt4nJWQPg=;
	b=OCo2H4ZS4dYuW2edj267XRpUa3pfsYH08THV4rpVe0Kd73b8XUbsiVLkVu2BVYaajy
	bsWQ/IzHX41IxqcRzgEUey16oA6XB6aOytfk9DE5CjGw+JAydahpBgsvX2MTGahg4G2O
	jq6TKT8aChAYqE6ouYurO+kdhtg/79Lb0Rt3g=
Received: by 10.14.13.129 with SMTP id b1mr895757eeb.41.1327795124538;
	Sat, 28 Jan 2012 15:58:44 -0800 (PST)
Received: from localhost.localdomain (p4FDF1D8B.dip.t-dialin.net.
	[79.223.29.139])
	by mx.google.com with ESMTPS id c16sm50597043eei.1.2012.01.28.15.58.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 28 Jan 2012 15:58:44 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 29 Jan 2012 01:00:52 +0100
Message-Id: <1327795253-24794-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
Subject: [PATCH v2 0/1] atk: add native / disable introspection / merge atk.inc->recipe / change license
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
X-List-Received-Date: Sun, 29 Jan 2012 00:06:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

v1 -> v2: Licenses changed
Following license-informations were found:

* COPYING:
		  GNU LIBRARY GENERAL PUBLIC LICENSE
		       Version 2, June 1991
* atk/atkutil.h
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Library General Public
  * License as published by the Free Software Foundation; either
  * version 2 of the License, or (at your option) any later version.
* atk/atkutil.c
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
  * version 2 of the License, or (at your option) any later version.

Andreas Müller (1):
  atk: add native / disable introspection / merge atk.inc->recipe /
    change license

 meta/recipes-support/atk/atk.inc      |   13 -------------
 meta/recipes-support/atk/atk_2.2.0.bb |   17 +++++++++++++----
 2 files changed, 13 insertions(+), 17 deletions(-)
 delete mode 100644 meta/recipes-support/atk/atk.inc

-- 
1.7.4.4



