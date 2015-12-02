Return-Path: <avery.brian@gmail.com>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id 7072F6FF76
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Dec 2015 18:38:51 +0000 (UTC)
Received: by padhx2 with SMTP id hx2so48018382pad.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Dec 2015 10:38:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=lrH08QEDnSZDmGrYSkGcB6s14oASw2cDxemKCYn8Zk4=;
	b=xlgRRS4Zra6zLgRdOK73Ok04EwoGVCS/oebYLxdsPCpFP7vPb15OWJv8jyb2+HjIk1
	gIe/pXiMSZirb0CocdNkXUg2K94aVkcJ8r2d0dfbmeWJKfTf8tZf0lq8e6wdapCKZNcZ
	sC681Y0sVgSA+Nu2B51VIY8cnGAKy4G+Zd1MfpLNxuqfwcgO+5q2FwQ9pJZ2CXhPQhAa
	ZF0RkhLreKLN1NobsGT20cKAPkT5tJwid217CL4EkitbiMJzddR+8ki/VALue2hAtwE7
	M1skAG+tMPONmyasi4HBuogS5C3ZuhuRePmAzNIiAFGYFLY87VHLHbilubsRnj5ClqMH
	iqyA==
X-Received: by 10.66.253.5 with SMTP id zw5mr6860689pac.100.1449081531823;
	Wed, 02 Dec 2015 10:38:51 -0800 (PST)
Received: from whisper.hsd1.or.comcast.net
	(c-98-232-142-195.hsd1.or.comcast.net. [98.232.142.195])
	by smtp.gmail.com with ESMTPSA id
	129sm5777696pfa.54.2015.12.02.10.38.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 02 Dec 2015 10:38:50 -0800 (PST)
From: brian avery <avery.brian@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Dec 2015 10:42:22 -0800
Message-Id: <cover.1449081562.git.avery.brian@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/1] meta/conf/toasterconf.json - remove SDKMACHINE variable
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
X-List-Received-Date: Wed, 02 Dec 2015 18:38:51 -0000

Hi,
This removes SDKMACHINE from meta/conf/toasterconf.json as it is no longer used.

-b

The following changes since commit 698c74c373110ed081a7586e21d4a27b8b44c89b:

  libsdl: remove redundant configure_tweak patch (2015-12-01 21:32:15 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib bavery/remove-SDKMAHINE-meta-toasterconf
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=bavery/remove-SDKMAHINE-meta-toasterconf

brian avery (1):
  meta/conf/toasterconf.json: remove SDKMACHINE variable as it no longer
    used

 meta/conf/toasterconf.json | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

--
1.9.1

