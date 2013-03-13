Received: from mail-ob0-f173.google.com ([209.85.214.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eu@felipetonello.com>) id 1UFp7g-0001Ls-Cp
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Mar 2013 18:06:01 +0100
Received: by mail-ob0-f173.google.com with SMTP id dn14so1229547obc.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Mar 2013 09:49:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=bBeUorR6HahKSS1xxP5HzUnMG35fJBJPhFV0ay3aiU8=;
	b=BsTkwe+9L0Q0TsGaYK6CGBxA0kf//mT0m95jJmBZWfiukj7u6j4FTxVyJ2FDjgMrnv
	f6gMEzcH7+XMrrcT3wmYY8TSOaMajb0AOSBw4nSNfyPnEZVvDuzDI8+nMW+njqRdPlYk
	itetkYKQ29UKkHgzCoPrtHn71Y0gcpRq5UhaP4ktJSgmWAsuRXMhSh0rPjR08q8gj4NN
	Gzg0El5xebALQJrSZ0wnbL6Yqqs3lvbmoVGCUoXZzSsKeSiT2CXlhixO+pMSy45gwVaJ
	cF9ze8oVEbAAEfqTubOXedYazjrDIyHW2MFNTMWBt5V4P7xH7+HMbjtP8e8Q4fdADBhl
	R9iw==
X-Received: by 10.182.127.7 with SMTP id nc7mr16395623obb.94.1363193350995;
	Wed, 13 Mar 2013 09:49:10 -0700 (PDT)
Received: from mlabs-ftonello.masimolabs.com
	(wsip-70-183-20-162.oc.oc.cox.net. [70.183.20.162])
	by mx.google.com with ESMTPS id ka6sm26233523obb.3.2013.03.13.09.49.09
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 13 Mar 2013 09:49:09 -0700 (PDT)
From: eu@felipetonello.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Mar 2013 09:49:11 -0700
Message-Id: <1363193354-6895-1-git-send-email-eu@felipetonello.com>
X-Mailer: git-send-email 1.7.9.5
X-Gm-Message-State: ALoCoQlBCIo36/FVG9pjk7f7N/M1K+pUrbQAjwf1zcIxNwb/mDSgYMGAAiPgXtZCILmWqb4WyhR9
Cc: "Felipe F. Tonello" <ftonello@cercacor.com>
Subject: [PATCH v2 0/3] qt-mobility: improved recipe
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
X-List-Received-Date: Wed, 13 Mar 2013 17:06:06 -0000
X-List-Received-Date: Wed, 13 Mar 2013 17:06:06 -0000

From: "Felipe F. Tonello" <ftonello@cercacor.com>

Removed bluez and pulseaudio forced dependency.
Also extended functionality by enabling the user to choose which qt mobility
module to build. By default, all modules supported will be build.

Felipe F. Tonello (3):
  qt-mobility: Add bluez dependency if DISTRO_FEATURES has bluetooth
  qt-mobility: Add pulseaudio dependency if DISTRO_FEATURES has
    pulseaudio
  qt-mobility: added list of modules to be compiled

 meta/recipes-qt/qt4/qt-mobility_1.2.0.inc |   13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

-- 
1.7.9.5



