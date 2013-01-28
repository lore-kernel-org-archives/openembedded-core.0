Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TzxMW-0004qw-9K
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Jan 2013 23:39:52 +0100
Received: by mail-ea0-f175.google.com with SMTP id d1so1348730eab.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2013 14:23:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	bh=jNBuqqY5V6W+/vKvu4DsD7/HcpdEh7/6tXXRxtOUNcA=;
	b=yMuQiGQS9Odn4DmERqdHFj7NeiC25AdUuGtURgBXjtaJVj1DhtYOSZWmIWk5IyUwli
	XuDQpEAZMNs/fPMQuBIkS8fTKOSXiE4JyfSwBF0OTdG1CQuCinw59qpMpLdU6nZASFi4
	EdnR+Zi0wFMFTfbQxjr/9uSF8+wGt49/R0u6PP1uIC3qyITw+Et8CF2Yj1NM1rHH3uGe
	V4Gj8pqchxaoXOXVCQ/e9S0pk+S4fmvUf9sttcIBvP9simJesdB+n0eRcW9P9ajbdqPx
	fHxMF3xtkK/RKBMoIIq6/V5/fK7gUbcLm93ZlXUAfggb5ZqLKYtMWMcCJcNf7ARU9Lqk
	7T5A==
X-Received: by 10.14.215.6 with SMTP id d6mr55923576eep.40.1359411837441;
	Mon, 28 Jan 2013 14:23:57 -0800 (PST)
Received: from localhost.localdomain (p4FDF0BC2.dip.t-dialin.net.
	[79.223.11.194])
	by mx.google.com with ESMTPS id f6sm17785438eeo.7.2013.01.28.14.23.56
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 28 Jan 2013 14:23:56 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Jan 2013 23:23:44 +0100
Message-Id: <1359411826-5264-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
Subject: [PATCH 0/2] minor for systemd-197
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 28 Jan 2013 22:40:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit e11fdc145255c8b97c6c7ac6c5f7ce8aa50bdf0d:

  mtools : upgrade to 4.0.18 (2013-01-28 12:46:59 +0000)

are available in the git repository at:
  git://gitorious.org/schnitzeltony-oe-meta/oe-core.git patches

Andreas Müller (2):
      systemd: systemd-analyse has moved to base_bindir
      systemd: systemd-analyze remove python runtime dependencies

 meta/recipes-core/systemd/systemd_197.bb |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)

-- 
1.7.4.4



