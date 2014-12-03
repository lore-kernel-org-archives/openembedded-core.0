Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f173.google.com (mail-pd0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id 260E460169
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Dec 2014 19:38:10 +0000 (UTC)
Received: by mail-pd0-f173.google.com with SMTP id ft15so16050152pdb.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Dec 2014 11:38:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=IUtm+lr2Zg6bZFe4cvgsOisBqWs2pK9dtFJKUNKW0FE=;
	b=UdruVV9uI80XaE6iQhoyIk3cTuhPz0VJBnxRn/bCw1lA5sLMX2h+AwkdRp3149PLY2
	JgeCi19BCCuykGjmWosLmHO4qNdevn3X6b4ZdzFMSXJoEwHKYfvHhLFn9gSt1x6oJgUJ
	2HF6xPII4ejY6W5ExJeFaI0KXDhCa14SVz9mWO5mcU8I0A4J2qEL5rIMYgmleA6lHKi2
	z0sj3fCetts0ajvULOe+pc6chI9v6urZbbQWC5mem6Zz5BFzzcsM2Hooa6b4epNHwP/e
	o+ItVojxk/Z7RKPmjm/TR49Ara14r4iMI4VGLU4pPsh6djD69bZ8PJvMBcP2RiElCUzy
	qsrg==
X-Received: by 10.70.95.230 with SMTP id dn6mr11721168pdb.98.1417635490511;
	Wed, 03 Dec 2014 11:38:10 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by mx.google.com with ESMTPSA id
	wv1sm23968619pab.37.2014.12.03.11.38.08
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 03 Dec 2014 11:38:09 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Dec 2014 11:38:01 -0800
Message-Id: <cover.1417635272.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/1] Dizzy-next merge request
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
X-List-Received-Date: Wed, 03 Dec 2014 19:38:15 -0000

one more merge

The following changes since commit be128c799489b95b740f2803c16e047a1f307781:

  gst-ffmpeg: fixes for CVE-2014-8548 and CVE-2014-8541 (2014-12-03 08:01:28 -0800)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib akuster/dizzy-next
  http://git.yoctoproject.org/cgit.cgi//log/?h=akuster/dizzy-next

He Zhe (1):
  kernel.bbclass: Create modules directory even if there is no modules
    installed

 meta/classes/kernel.bbclass | 1 +
 1 file changed, 1 insertion(+)

-- 
1.9.1


