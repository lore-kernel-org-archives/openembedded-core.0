Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1Te9iU-0007SY-Fh
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Nov 2012 20:24:11 +0100
Received: from mail-pb0-f69.google.com ([209.85.160.69])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 29 Nov 2012 11:07:58 -0800
Received: by mail-pb0-f69.google.com with SMTP id un15so20971018pbc.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Nov 2012 11:08:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=PS+ApoBtCyF25LhGmEVqrzkAvvM9Jy/bfDmo12L9UZ4=;
	b=GkPTdPtC4wKbPn/03cQpBAHavbbEsRVpy6Vexud2Kzm+w6I7LUmcmdy76Dvxymi3T+
	HtErH8YjKWaVbTAj4ZxhjeY8UDBAR3zxsMDip3GuP/dRhgwSWkjKcE/kOK+SV5WglgOd
	JwGnpkKyVRyq6YcstXRgofX1tEXGWmelCEaPiT0QbfUscrXS5t4Z+eVwkfh8k3bZ5UwT
	wuLjzv5DAfXUsICf8gfpmBhNK3jktZJDnYjprvAWc2/6Tzprans8JHx+bnnmqxhyuVeJ
	8p5IvKoZBHcj5WbAILP3MA06omxWTAGHSA48Lo7CT2EMQosVHEbMmu6QxZNnAeUo/STN
	OJ6w==
Received: by 10.68.236.8 with SMTP id uq8mr70350309pbc.156.1354216120943;
	Thu, 29 Nov 2012 11:08:40 -0800 (PST)
Received: by 10.68.236.8 with SMTP id uq8mr70350298pbc.156.1354216120802;
	Thu, 29 Nov 2012 11:08:40 -0800 (PST)
Received: from avartita.hsd1.or.comcast.net.
	(c-71-236-152-235.hsd1.or.comcast.net. [71.236.152.235])
	by mx.google.com with ESMTPS id is3sm1646524pbc.6.2012.11.29.11.08.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 29 Nov 2012 11:08:40 -0800 (PST)
From: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Nov 2012 11:08:25 -0800
Message-Id: <cover.1354208369.git.elizabeth.flanagan@intel.com>
X-Mailer: git-send-email 1.7.9.5
X-Gm-Message-State: ALoCoQnW+anxqGDfkLrA/98ryi/xABPlq/SFodTG8P4xvGSrSUIgOvNyV8Dh0nMC4UOe63oUToNPgOyipRVWM33lfDQn5GfUAMq+1tBN42FsJINSpjq7ynkRjnwxHU6/HuknJfoeDl0d0TvwXv8plAln+oJ0nXQX5FxcJ7lORikynviBQP6temyZ2Sxsvee00etqP88PvJkQ
Subject: [PATCH 0/1] base/license: Incompatible License fixes
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
X-List-Received-Date: Thu, 29 Nov 2012 19:24:11 -0000

Some minor changes to Andy Ross's patch to INCOMPATIBLE_LICENSE

The following changes since commit 247b6a3754c2c50318e2a73d79981ba0e9cb560b:

  gstreamer, gst-plugins*: fix localdata (2012-11-28 15:25:33 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib eflanagan/incompat
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=eflanagan/incompat

Andy Ross (1):
  base/license.bbclass: handle multiple INCOMPATIBLE_LICENSEs

 meta/classes/base.bbclass    |   67 ++++++++++++++++++++--------------------
 meta/classes/license.bbclass |   70 ++++++++++++++++--------------------------
 2 files changed, 59 insertions(+), 78 deletions(-)

-- 
1.7.9.5



