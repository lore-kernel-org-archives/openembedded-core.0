Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <darren@apps.dvhart.com>) id 1SKX99-0004nO-MK
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Apr 2012 17:50:19 +0200
Received: by pbcum15 with SMTP id um15so7728720pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Apr 2012 08:40:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=OllozMYdrBw+p8/G05d2+Ml3u95MxNPSJHUtYwVc8AM=;
	b=dltVGB+eteQmZsudmmc2Qm57mT/DmOmbOYeEi8X2mq+eomnUcfF+weO4Kn98waB4G0
	A3XqcGqvVfEyEvIKUS+nBsMJ3Vr0Q9gvyXmNz0v/A10DLiYJLoQcdjR+fBwkIlWKLviX
	7NroDLnKrhlZRk+Y1dPImfqidHoykHmzlDUZJXWiIIL0tqwE08/afL82h3yBD1cwf+Q7
	x89z5bfl8nek9z/psWE5DtTkEQlRJ9Y7wmQEvHoxSdUTL1LC7DRXsvdtM+cmL99tbhzu
	00J53CklNKaNmtjt9rK+0u49MpG4Dcxa4DxdhJy98skZGyjIx4gdiLrwemqnWqLweb/E
	QA/Q==
Received: by 10.68.222.38 with SMTP id qj6mr7124877pbc.69.1334763651236;
	Wed, 18 Apr 2012 08:40:51 -0700 (PDT)
Received: from localhost (static-50-53-99-101.bvtn.or.frontiernet.net.
	[50.53.99.101])
	by mx.google.com with ESMTPS id i1sm24012043pbj.70.2012.04.18.08.40.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 18 Apr 2012 08:40:49 -0700 (PDT)
Sender: Darren Hart <darren@apps.dvhart.com>
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Apr 2012 08:40:44 -0700
Message-Id: <cover.1334763599.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
X-Gm-Message-State: ALoCoQkEaj47+zenUREtilEy5GR7hV51pW3jDsoe7FB0Jfb4wd6LGd1/WrJQ3djYTHIg6XNUABWr
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH 0/1] gthumb: Disable parallel make for gthumb install
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
X-List-Received-Date: Wed, 18 Apr 2012 15:50:19 -0000

The following changes since commit 00256125873ff6f1630743a712e882e5f473a9d2:

  self-hosted-image: Update poky revision to point at the 1.2 release branch (2012-04-18 15:59:20 +0100)

are available in the git repository at:
  git://git.yoctoproject.org/user-contrib/dvhart/oe-core gthumb
  http://git.yoctoproject.org/cgit.cgi/user-contrib/dvhart/oe-core/log/?h=dvhart/gthumb

Darren Hart (1):
  gthumb: Disable parallel make for gthumb install

 meta/recipes-gnome/gthumb/gthumb_2.12.4.bb |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

-- 
1.7.5.4



