Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TQYlY-0006qe-Vg
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Oct 2012 09:19:09 +0200
Received: by mail-wi0-f177.google.com with SMTP id hj13so2845460wib.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Oct 2012 00:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=CW80x7hYDU7PLbWNfXvs8HsuS8BvAymTq0NcFT0nl+8=;
	b=iLAYh8tJI7z86g/zggcRCLS8uB+nNIOj488GrjtSxvMdPhiFY/ywUWKMYGy3Xo0OzB
	t+lHXWdQaFI8LHIqAicXax/6aae9UshlGfZy1gc3T17TCX6IoBke/nrwN3SWZ8kh9wwj
	VS0HW6ggO4C4L4DEpJc281m+FXqO0qYe1QuTIx0JGCg9ziL7E+C8uxUFBQZTIuiGHVX0
	UqDJk7zaoI7eM/5QICIY+eZ0YnIhoOzFa0sbma7O5tlPhFIWyV14wU+jYj2mbWMZyp2P
	Tjxqv8VRrfugU2vwrWzQTMoZhxB2ITIZ+dNaeq72WkoF8D0mOKkFzV+8PUBIT3wn3vlR
	FNkw==
Received: by 10.216.140.73 with SMTP id d51mr6769059wej.217.1350975943187;
	Tue, 23 Oct 2012 00:05:43 -0700 (PDT)
Received: from localhost.localdomain (ip-109-91-251-94.unitymediagroup.de.
	[109.91.251.94])
	by mx.google.com with ESMTPS id cn6sm26296766wib.9.2012.10.23.00.05.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 23 Oct 2012 00:05:42 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Oct 2012 09:04:28 +0200
Message-Id: <1350975871-26719-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
MIME-Version: 1.0
Subject: icon-themes fixes
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
X-List-Received-Date: Tue, 23 Oct 2012 07:19:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 06d27cf0fbcc4004e6f456880eca49893c9290bf:

  xorg: remove XF86 BigFont extension (2012-10-22 14:57:26 +0100)

are available in the git repository at:
  git://gitorious.org/schnitzeltony-oe-meta/oe-core.git icon-themes

Andreas Müller (3):
      gnome-icon-theme: fix icon mapping
      gnome-icon-theme: remove unused configure variable
      sato-icon-theme: fix build

 .../recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb |    8 +++-----
 .../sato-icon-theme/sato-icon-theme.inc            |    2 +-
 .../sato-icon-theme/sato-icon-theme_0.4.1.bb       |    2 +-
 3 files changed, 5 insertions(+), 7 deletions(-)

-- 
1.7.6.5



