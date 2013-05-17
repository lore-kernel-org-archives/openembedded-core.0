Received: from mail-ea0-f177.google.com ([209.85.215.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UdHV4-00018O-Ii
	for openembedded-core@lists.openembedded.org;
	Fri, 17 May 2013 12:03:03 +0200
Received: by mail-ea0-f177.google.com with SMTP id q14so2203560eaj.22
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2013 02:44:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=/zdGof3JkuBFNOxk5vECLGMy7qnZSvkMEbbozwZ5V/M=;
	b=jmvL/UpSMA2qn0OpiOuvbBwo8+p5800vHc9jYpB7o3O6JVgQY7FSXU+oaanFuCweoc
	XelpCUmxMvrqv7RUbrawLsXLWCfhuFeGk/fu01h8zSZPAQYpA4LKTVwwbc6p3Uje5VaD
	o3czLWH6IHy8zke5YLGtBIsuUuSVm66F3pd38i4HNPBLehQ7/g0djUEWeHnG9KPrZFf0
	aTUpTAiBXiO7AjRqpOVRGM/U4mw2ag02i45dhgyEdJGvqfBvWH+hmadq8WyP4mYEfvw1
	M4hIty6BI5VCpkxwOtWR6YnkVY7g0mrBx8F5AzkkLU+dIXCeSwyVRw1+2Uau5VZFuSc5
	2dNg==
X-Received: by 10.14.3.137 with SMTP id 9mr128297622eeh.0.1368783882978;
	Fri, 17 May 2013 02:44:42 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id y10sm17473904eev.3.2013.05.17.02.44.41
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 17 May 2013 02:44:42 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 May 2013 10:40:40 +0100
Message-Id: <cover.1368783549.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQlynpJYc53BoTzpauhRFzuvyhjoXP5xcLAR2wggOQDfHQze4D3zzkZc1zVEVluw61Wvt27U
Subject: [PATCH 0/5] gdk-pixbuf and librsvg fixes
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
X-List-Received-Date: Fri, 17 May 2013 10:03:06 -0000
X-List-Received-Date: Fri, 17 May 2013 10:03:06 -0000
X-List-Received-Date: Fri, 17 May 2013 10:03:06 -0000

Hi,

A collection of fixes to gdk-pixbuf and librsvg, mainly improving the native
packages.

Ross

The following changes since commit 88a7b041fbf2583472aa9408a33dd8881223a0c1:

  bitbake: pysh: Say what kind of token isn't implemented (2013-05-10 13:35:10 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ross/pixbuf

for you to fetch changes up to 28ba5f0003c131377c4cff9bcd35c7eeabbb4f21:

  librsvg: small cleanups (2013-05-17 10:36:19 +0100)

----------------------------------------------------------------
Ross Burton (5):
      pixbufcache: update the loader cache when installing natively
      gdk-pixbuf: remove native loader cache generation, use the class
      librsvg: add more PACKAGECONFIG options
      librsvg: clean up native depends
      librsvg: small cleanups

 meta/classes/pixbufcache.bbclass                   |   13 +++++++++
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.26.5.bb |    3 --
 meta/recipes-gnome/librsvg/librsvg_2.32.1.bb       |   30 +++++++++-----------
 3 files changed, 27 insertions(+), 19 deletions(-)

Ross Burton (5):
  pixbufcache: update the loader cache when installing natively
  gdk-pixbuf: remove native loader cache generation, use the class
  librsvg: add more PACKAGECONFIG options
  librsvg: clean up native depends
  librsvg: small cleanups

 meta/classes/pixbufcache.bbclass                   |   13 +++++++++
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.26.5.bb |    3 --
 meta/recipes-gnome/librsvg/librsvg_2.32.1.bb       |   30 +++++++++-----------
 3 files changed, 27 insertions(+), 19 deletions(-)

-- 
1.7.10.4



