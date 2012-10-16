Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TO7Py-0007N2-V8
	for openembedded-core@lists.openembedded.org;
	Tue, 16 Oct 2012 15:42:47 +0200
Received: by mail-wi0-f177.google.com with SMTP id hj13so3027821wib.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Oct 2012 06:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=3bs91IocCQxE50HfNJmd7xWUkfknqvUCzGqXrcQlvzc=;
	b=EAY0R9Ft0TzVu39Ij+i5sDJ1WcEXWPheUnwqTkxnHVQJq0X3Sp2HiicuLoH8OMR6fW
	V4VIBdGULxLJrU01k4SRfjY7Up/qTEOEqRIW8BHI8K2BC6xIXkLrD0ztdfJEiAPHLyhV
	g0WpcZOfZX7u7sV3wyPPkWn2h3US/YK725BHYON5vaTk9yW4OPSI9EL75mdR74bovNVB
	o4P75sjZx+Zv0gY64praqpJuQebD1GMWwcqXWVd85f+4FryWTLzr4Z3pi5tA8Yxx6OwG
	v78sm3rrPfpONvh6kGQx1NW+bdpjkxnhQ6ij73gsPI7KfiA2unbcEK3y0PkSArjLRd7A
	xkGQ==
Received: by 10.180.19.71 with SMTP id c7mr32027302wie.2.1350394170233;
	Tue, 16 Oct 2012 06:29:30 -0700 (PDT)
Received: from localhost.localdomain (ip-109-91-251-94.unitymediagroup.de.
	[109.91.251.94])
	by mx.google.com with ESMTPS id v3sm19172402wiw.7.2012.10.16.06.29.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 16 Oct 2012 06:29:29 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Oct 2012 15:28:19 +0200
Message-Id: <1350394101-15120-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
MIME-Version: 1.0
Subject: [PATCH 0/2] gnome-icon-them bugfixes
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
X-List-Received-Date: Tue, 16 Oct 2012 13:42:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It caused me a lot headache to load gtk-stock-icons...

Andreas Müller (2):
  gnome-icon-theme: fix icon mapping
  gnome-icon-theme: remove unused configure variable

 .../recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

-- 
1.7.6.5



