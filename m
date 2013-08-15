Return-Path: <cazfi74@gmail.com>
Received: from mail-la0-f41.google.com (mail-la0-f41.google.com
	[209.85.215.41])
	by mail.openembedded.org (Postfix) with ESMTP id 3C6A662176
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 02:25:09 +0000 (UTC)
Received: by mail-la0-f41.google.com with SMTP id ec20so152853lab.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2013 19:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=1lgYwCQ9mvWkxiAQjGh4sX6c5HRC3XR9hZRtDAJNVgc=;
	b=ZVyaS7w/XOqJK0piTuQbu+aYOwIhJ5qkJrLu89yYgg6z9VdUUvj+iPsu7fGB+CBbUL
	6KS8FbZAu5ww5M9etRRZtD4Qj+ir5j8OZdClzABCeQSu56Is/RTPh/CuFiDwE7eri0En
	MQRi0R+9/23Z7SneurCFgxm0ye1BjgSdRm7derdcDzilz9BcIfzxEMQSSvTkcSwFh2qu
	5DAdj7cA9xwBVZwrmsRlRPEegCU4bG0KIgX+fGxNYnaqATgpOVI3QAHk4N3HNKEu+s/A
	5YTx8Fen7XInpmqi8nGmJakQSPmDddrn0s9XRhbVVvNU4X31//v5BeDxvUyTPR7KfkrI
	DoTg==
X-Received: by 10.112.35.52 with SMTP id e20mr10505939lbj.11.1376533509096;
	Wed, 14 Aug 2013 19:25:09 -0700 (PDT)
Received: from prime (a91-153-14-158.elisa-laajakaista.fi. [91.153.14.158])
	by mx.google.com with ESMTPSA id i3sm17153267laf.4.2013.08.14.19.25.07
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 14 Aug 2013 19:25:08 -0700 (PDT)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1V9nFK-000680-Dy; Thu, 15 Aug 2013 05:25:06 +0300
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Aug 2013 05:25:04 +0300
Message-Id: <cover.1376533154.git.cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 0/1] Add SDL2
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
X-List-Received-Date: Thu, 15 Aug 2013 02:25:09 -0000

Add libSDL2 recipe. SDL2 is not drop in replacement for SDL-1.2 so is not
replacing it. SDL2 could live outside core for now. I added it here just
so it would be next to SDL-1.2 recipe. Likewise I plan to add SDL2_image
and SDL2_mixer recipes to meta-openembedded next to their SDL-1.2 counterparts.

 - ML


The following changes since commit 57662d4f813d5795cac1529633db80a09efdb089:

  meta-skeleton: Add busybox config fragment example (2013-08-13 23:03:44 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib cazfi/misc
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=cazfi/misc

Marko Lindqvist (1):
  SDL2: add recipe

 meta/recipes-graphics/libsdl2/libsdl2_2.0.0.bb |   56 ++++++++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 meta/recipes-graphics/libsdl2/libsdl2_2.0.0.bb

-- 
1.7.10.4


