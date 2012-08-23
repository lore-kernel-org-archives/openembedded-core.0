Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@bigsur.com>) id 1T4c9E-0001mk-2e
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Aug 2012 20:28:52 +0200
Received: by pbcwy7 with SMTP id wy7so1957436pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2012 11:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bigsur.com; s=bigsur.com;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=tfd/qbEazExpJTkMAoStx6sw6sBgejyfrKgpirJABh0=;
	b=JHQD5lhciSX4t12pri5hcAAUe6HaRBT9BH+cKLwq1r7cTSP6bgoC9As5bMbrWi0iUK
	NukW+CoelLnxQKsf1TdilfzjxqMKlDdXz0+SDDiVFdBktB5iSwGUBCBwucNrAdDapTNN
	QXpr+SYD+IRvlQHsZXf+iDeCJXgOfkSUJlgfQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:x-gm-message-state;
	bh=tfd/qbEazExpJTkMAoStx6sw6sBgejyfrKgpirJABh0=;
	b=RmSCQouY3FBnDSpP4BovtWIxJiVm3tjy1JeBtNLb6gzHeVL2/jREsE+RShXThe6D/a
	ogzJ/mDePZTRInGFhwV0K2BWe18Qduu5dan2OUY9AtqSQ/YW4V4pgaKfoswy1oSmTkiD
	BWfOptm5/SNhpQempBsO/TkUaP9bNo7B5GIXrTOZgTq9bVz2dLbJz9KOzkpZit4E5NKK
	f6YoVXksK2Dff+CSOc5VWN2ZAgG+xsva1Py8nS/BajTSAAyG7+XtC4Cz1qK6PVangHHf
	64+ut+jcg6bweie+2bgfK2agTqfrcnpYhSYvHGOW2kXN0NzHWiIflqCwDMP3tilS1TZk
	f34g==
Received: by 10.68.220.104 with SMTP id pv8mr6602075pbc.119.1345745804464;
	Thu, 23 Aug 2012 11:16:44 -0700 (PDT)
Received: from localhost (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id od6sm4936157pbb.7.2012.08.23.11.16.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 23 Aug 2012 11:16:43 -0700 (PDT)
Sender: Saul Wold <sgw@bigsur.com>
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Aug 2012 11:16:05 -0700
Message-Id: <1345745765-22194-2-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1345745765-22194-1-git-send-email-sgw@linux.intel.com>
References: <1345745765-22194-1-git-send-email-sgw@linux.intel.com>
X-Gm-Message-State: ALoCoQkHsBjprh9Fe/9/qUTzh7KbFAi6SnmSG9hwCgA0WDrTGGx7fIYW+YEzl6xtsTd6egpsKZtH
Subject: [PATCH - Denzil 2/2] build-appliance-image: Update SRCREV to Denzil 1.2.1
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
X-List-Received-Date: Thu, 23 Aug 2012 18:28:52 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/images/build-appliance-image.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/images/build-appliance-image.bb b/meta/recipes-core/images/build-appliance-image.bb
index 2b7906f..bac7f80 100644
--- a/meta/recipes-core/images/build-appliance-image.bb
+++ b/meta/recipes-core/images/build-appliance-image.bb
@@ -19,7 +19,7 @@ IMAGE_FSTYPES = "vmdk"
 
 inherit core-image
 
-SRCREV = "3ab5d73f0c49df9fefa2a46031d33436bbd7d7d8"
+SRCREV = "73cdebf60df225ee10f2eb215935be3b61e1b831"
 SRC_URI = "git://git.yoctoproject.org/poky;protocol=git"
 
 IMAGE_CMD_ext3_append () {
-- 
1.7.9.5



