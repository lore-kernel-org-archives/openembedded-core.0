Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Raf6d-0002Dz-AA
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Dec 2011 04:02:07 +0100
Received: by yenm12 with SMTP id m12so322029yen.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2011 18:55:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=AacBiKhuCDiENkDniS2qOeF3D8kUZOYM/UwJoiXJgSw=;
	b=CKFLQY9BcGjX+G8y6ylOu6PZABaem5+SrGh7r87oHVOh19eh0lKvqVuRDQ+m3LeRq7
	X1KLwtmQZGhyFT+L4h5JD+H65E/C3/yTbW/qJqdXLxuj/lfJYegMUVltYF6FzjKfyO0q
	mfKk6yWcvm1jA05p3cXcLuvgbBZNr3KvsIyD8=
Received: by 10.236.187.97 with SMTP id x61mr8199643yhm.97.1323831310454;
	Tue, 13 Dec 2011 18:55:10 -0800 (PST)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id 1sm3108097anp.15.2011.12.13.18.55.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 13 Dec 2011 18:55:09 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Dec 2011 18:54:58 -0800
Message-Id: <cover.1323831034.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 0/2] Introduce cross testing driver for gcc-cross
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
X-List-Received-Date: Wed, 14 Dec 2011 03:02:07 -0000

Hi

One patch makes the eglibc testing driver a bit more informative
and cleans the tests before running

Second patch introduces generating a script which will drive
cross testing of gcc. This script is generated as part of do_compile
task and virtually one can test bootstrapping versions of gcc as
well if need be but mostly gcc-cross makes most sense since thats
the one we use all the time.

The following changes since commit b9dfccc018f32a47fc045f35d5f53d7269d791ed:

  gdk-pixbuf: Ensure the binaries can be relocated (2011-12-13 18:00:18 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib kraj/gcc-cross-testing
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/gcc-cross-testing

Khem Raj (2):
  eglibc-testing: Clean the test before running them
  gcc-cross: Add cross testing driver for running regression testsuites

 meta/recipes-core/eglibc/eglibc-testing.inc |   36 ++++++++++-
 meta/recipes-devtools/gcc/gcc-cross.inc     |   91 ++++++++++++++++++++++++++-
 2 files changed, 125 insertions(+), 2 deletions(-)

-- 
1.7.5.4



