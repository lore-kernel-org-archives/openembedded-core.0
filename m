Received: from mail-oa0-f45.google.com ([209.85.219.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eu@felipetonello.com>) id 1UI4kL-0002Eg-En
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Mar 2013 23:11:07 +0100
Received: by mail-oa0-f45.google.com with SMTP id o6so1106586oag.18
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2013 14:54:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=bBeUorR6HahKSS1xxP5HzUnMG35fJBJPhFV0ay3aiU8=;
	b=bJTMFXFqbzUdFaXWjqAWdkrywDLrCFWiyID3vcuPo6qagvQC7d7UyoK0kE+qezDM+o
	de0snoTvuX901YvOaZougZwSHrIJV2mYVDw3ombW+krZWh3aGqSOzW9G3oHofPz+7W/y
	LlciCn9YDhfWB5I7jNRgwlKs1kZjhjX93PV33pXgZmkWRodf4sktMDogo0TB7giprFy1
	w6qzRbAqGM5KmbAPg59yjYoOJVcMenNZm0ayDT7KFGSItTl9eggqxwuCZn4nXYxE3F5C
	nyf2w5sGArE8ex8dSX/2iweaor2/i9AfjTz4MmreFqwX3ZcbLZYBSmpnO58+PfCVnnzL
	ibVw==
X-Received: by 10.182.144.42 with SMTP id sj10mr2635440obb.66.1363730054907;
	Tue, 19 Mar 2013 14:54:14 -0700 (PDT)
Received: from mlabs-ftonello.masimolabs.com
	(wsip-70-183-20-162.oc.oc.cox.net. [70.183.20.162])
	by mx.google.com with ESMTPS id h9sm13500091obg.14.2013.03.19.14.54.13
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 19 Mar 2013 14:54:13 -0700 (PDT)
From: eu@felipetonello.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Mar 2013 14:54:10 -0700
Message-Id: <1363730053-7719-1-git-send-email-eu@felipetonello.com>
X-Mailer: git-send-email 1.7.9.5
X-Gm-Message-State: ALoCoQkfSLCJfbSj+MsKd0gK5IE6dvXoq4WKxS0xkBsw8rGgmDOda0KdgBiFFM3iMafKZeiuxG3Y
Cc: "Felipe F. Tonello" <ftonello@cercacor.com>
Subject: [PATCH v3 0/3] qt-mobility: improved recipe
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
X-List-Received-Date: Tue, 19 Mar 2013 22:11:07 -0000

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



