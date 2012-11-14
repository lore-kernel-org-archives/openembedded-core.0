Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@bigsur.com>) id 1TYR8x-000845-VN
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Nov 2012 01:47:52 +0100
Received: by mail-pb0-f47.google.com with SMTP id ro12so4980084pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Nov 2012 16:33:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bigsur.com; s=bigsur.com;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=UwEBkbVtCuPZ7fjfQE2jngJSFh3M09l/kfZ2xewhK2g=;
	b=Eh7X1zyiGyZN1iiLWKXa4pRkPkdKjQT8HTYw0YnGxakcXbe9wPnLmuFwSGiZ6vxa1H
	6B3nKVmfnNPMg+M31n6RmZQ2IzwzTl6RgK+5ooSTJuyMYr9dQpTh1xpORtaJxSsGLRpH
	+JSmN9x5vxuNKiaWDmvyUTdH8r5FQo1lts4ZM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=UwEBkbVtCuPZ7fjfQE2jngJSFh3M09l/kfZ2xewhK2g=;
	b=GpuGL+yLwMzLnugphA2grNJhpDacOS4B6/L36zsY+I30qi8uIPi78JUg96gozM3fho
	Rl/KXuEAi9bkRqWvH2p45sAPeuNbBlHC/qiEnA/xLZ5DeQMwKALViufSknN/nU6zOUns
	aF4OHwQtlmHrz9cdQ7BJDQtNF0TfQ2jClqlN0qHlajzL2k+aMxzVGpYKCil8dij3uI4F
	1Yi5+xwwLsw2AQ/QrqKBC9wjmp9WSgjsnV/i7Xnx1gHe1dhm7DPh8YJ3/019TFUKtcFG
	6wX4sP4FKYE45KD0ui8YEOm2itLKy+3iMWwRdj5btLOy5SZ/wHBiFIfdpDJu6pCIlF6K
	ZpPg==
Received: by 10.68.230.66 with SMTP id sw2mr66328236pbc.119.1352853236171;
	Tue, 13 Nov 2012 16:33:56 -0800 (PST)
Received: from localhost (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id jw14sm6735070pbb.36.2012.11.13.16.33.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 13 Nov 2012 16:33:55 -0800 (PST)
Sender: Saul Wold <sgw@bigsur.com>
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Nov 2012 16:33:07 -0800
Message-Id: <1352853188-3018-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
X-Gm-Message-State: ALoCoQmshgVM7F1rqQ+JMtzKicEwYNrJzUQicYNtN98qHSInYwbO504sPPTqWZY8Q59/juSB6Vnh
Subject: [PATCH] pulseaudio patch for Danny and Master
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
X-List-Received-Date: Wed, 14 Nov 2012 00:47:52 -0000

This should go to both Master and Danny

Saul Wold (1):
  pulseaudio: fix string test

 meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |    2 +-
 .../pulseaudio/pulseaudio_2.1.bb                   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
1.7.9.5



