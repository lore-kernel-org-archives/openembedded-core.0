Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1ShJXt-0001oz-Tt
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jun 2012 13:58:02 +0200
Received: from mail-wg0-f44.google.com ([74.125.82.44])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 20 Jun 2012 04:47:15 -0700
Received: by wgbdr13 with SMTP id dr13so5066440wgb.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jun 2012 04:47:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=VRiBvddmTU+L8jSc0bvcIWAhnS6EIFSbzaHDnFxdsYY=;
	b=BtgO336QF8UrCKjD2Ceomeb5VhMZgAA7QZXf3+sDAhGNwml5o5WvqSYDHbzeHs+FDY
	tOZRhtXy+qfqnWcXweN5fbbAHeDk6qxeCoOJcxHgQ/KfD7CZVXi/V2/YGif4eZIzmaEo
	fWxdkAF8eVpyOg4bwoXMRVilX2GhMhWesL9KnXITTQCMsKesBI+RUveVUva/JaKD2zMG
	bV7DQZzdq5nYjXS565kfXX2jDJbL/6NuwNOzhEX+7LfY0rKojefGT69XgJ9bUd9vmToT
	VHfcVM037C9KjRTef/0ODBJP3cVdF6hA8TjRe+vVUr4UoUYAVGhisCmXVXYMIT+WAUeQ
	M8Ug==
Received: by 10.180.7.133 with SMTP id j5mr11442060wia.14.1340192833554;
	Wed, 20 Jun 2012 04:47:13 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPS id t8sm4596363wiy.3.2012.06.20.04.47.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 20 Jun 2012 04:47:12 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jun 2012 12:47:08 +0100
Message-Id: <cover.1340192772.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQnN8UhiEE1v2y2r2duboG6Bldsagn8rUQVGzGv8faUbqdlwUqSUWfKMxZGc27LANA/7aWRm
Subject: [PATCH 0/1] ignore build*/ entirely
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
X-List-Received-Date: Wed, 20 Jun 2012 11:58:02 -0000

Instead of ignoring bits of the build dir, just ignore the entire thing. 
build/ shouldn't be in git, right?

The following changes since commit e0a70547069fe7e8a2d6bdaffc985fb172d46c31:

  perl: Allow perl to cross build and native build in a directory named "t" (2012-06-18 17:33:04 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ross/ignore
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ross/ignore

Ross Burton (1):
  gitignore: ignore build*/ entirely

 .gitignore |    6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

-- 
1.7.10



