Received: from mail-oa0-f43.google.com ([209.85.219.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eu@felipetonello.com>) id 1UFARR-0000TS-SN
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Mar 2013 22:39:35 +0100
Received: by mail-oa0-f43.google.com with SMTP id l10so5030133oag.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2013 14:22:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=cZ9J3N3WY/4f9ZlSkLaZjW7ArZXJg6JrUijXsYwBO5c=;
	b=j551O8mDvXQx2jZqEnzBBtGvftA89fF7QLP8srXZmCGsrNkzeYw/WD3CBBPt/v6kLD
	8VeGxoYSsBgWIcLmwSLi9hu3GwXLwKYrn40Vawg5kOUWxPMAf0LfN807+0cRm1089dWN
	Fy5JLjtuUEi48ZT7/GpEtGZmC1tQ5+HVCbnmPQkXN8J44yCpJ0jtwpHn/ZalU5k3GzpB
	TZKGeBk7v4vcQieg5MiCQ4TBUX4fURAYXrXTpjH1Rj3ou+2fkVlL0awzOQXltj/1kt3M
	s8ASEHxvorYxT8tCg92WikxlDBd9MeN35Co2PrriVWaRKVKeoIQ16BuBdRI3EU7+ihcY
	8I/g==
X-Received: by 10.182.23.101 with SMTP id l5mr10317813obf.16.1363036975008;
	Mon, 11 Mar 2013 14:22:55 -0700 (PDT)
Received: from mlabs-ftonello.masimolabs.com
	(wsip-70-183-20-162.oc.oc.cox.net. [70.183.20.162])
	by mx.google.com with ESMTPS id i19sm18709868obf.0.2013.03.11.14.22.53
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 11 Mar 2013 14:22:53 -0700 (PDT)
From: eu@felipetonello.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Mar 2013 14:23:02 -0700
Message-Id: <1363036984-29155-1-git-send-email-eu@felipetonello.com>
X-Mailer: git-send-email 1.7.9.5
X-Gm-Message-State: ALoCoQkvACDMICKMn5L4GOstPA/hEDK9soYxkWOmXjwZ5xAPSZvSrTSra8tip9A6UQCTWDvVnxHk
Cc: "Felipe F. Tonello" <ftonello@cercacor.com>
Subject: [PATCH 0/2] qt-mobility: improved recipe
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
X-List-Received-Date: Mon, 11 Mar 2013 21:39:35 -0000

From: "Felipe F. Tonello" <ftonello@cercacor.com>

Removed bluez forced dependency. Also extended functionality by enabling the
user to choose which qt mobility module to build. By default, all modules
supported will be build.

OBS: We might also want to remove pulseaudio dependency. But check against
which DISTRO_FEATURE?

Felipe F. Tonello (2):
  qt-mobility: Add bluez dependency if DISTRO_FEATURES has bluetooth
  qt-mobility: added list of modules to be compiled

 meta/recipes-qt/qt4/qt-mobility_1.2.0.inc |   13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

-- 
1.7.9.5



