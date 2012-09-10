Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1TB8kn-0004jv-NW
	for openembedded-core@lists.openembedded.org;
	Mon, 10 Sep 2012 20:30:37 +0200
Received: by pbcwy7 with SMTP id wy7so2944640pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Sep 2012 11:18:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=yY2hkcMgXSY3rERpLRgzn+TPLkbB4fgaz+Q4NkLp1/Y=;
	b=LVJ+3yMcjMt7OvBJRqWYcItjdfDZEF67WhSBD1zDqpiaKjL6Y5XL7mTMt2wBEhoA+8
	iNwy2crdsHk6DxLZqVWclwZmKV6IggWBmOTIzg1xZW427277XCOg78378Rbo+oiKK7AL
	8FZojMjtXDqu2b33zi5dUMgeNvCOqO9s3bLVJ4BaYO/4dKUlKhiZKXVNlTtWkSFlDz1L
	B2dGqEw11i+GDwamdd37g9uesEF1X8lQFGDXdXszBPOUJBvAKzPtKzOAiMA0IfRHZ3Dj
	PZHF/QawIeyxqFNYTllf+Yvwet9XLEBAjGDXzd20EtUS296mKp2t83HTno6GNsENcBF3
	DJmA==
Received: by 10.68.138.166 with SMTP id qr6mr6953192pbb.69.1347301087204;
	Mon, 10 Sep 2012 11:18:07 -0700 (PDT)
Received: from otp-agherzan-l1.corp.ad.wrs.com ([89.121.200.106])
	by mx.google.com with ESMTPS id pv9sm8424263pbb.67.2012.09.10.11.18.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 10 Sep 2012 11:18:06 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Sep 2012 21:17:56 +0300
Message-Id: <cover.1347300913.git.andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.9.5
X-Gm-Message-State: ALoCoQlg38pI2lI6KRMiUL/v3XinlbM+cxr7fNLV9Pio4+paBCyOkdw18yMKwEkHDqY1xB4lmd7O
Subject: [PATCH 0/1] Align final ROOTFS_SIZE after checking if base_size...
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
X-List-Received-Date: Mon, 10 Sep 2012 18:30:38 -0000

... is greater then IMAGE_ROOTFS_SIZE

The following changes since commit 0f55a5868457300a3defc7fa7451ef191d19e018:

  adt-installer: Allow changing YOCTOADT_REPO (2012-09-05 23:28:10 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ag/rootfs_size
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ag/rootfs_size

Andrei Gherzan (1):
  image_types.bbclass: Round up ROOTFS_SIZE after base_size check

 meta/classes/image_types.bbclass |    8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

-- 
1.7.9.5



