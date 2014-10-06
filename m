Return-Path: <blloyd@familyhonor.net>
X-Greylist: delayed 1730 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 06 Oct 2014 04:29:21 UTC
Received: from mho-02-ewr.mailhop.org (mho-02-ewr.mailhop.org [204.13.248.72])
	by mail.openembedded.org (Postfix) with ESMTP id 573896FDEB
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Oct 2014 04:29:21 +0000 (UTC)
Received: from dynamic30-98-142-75.dobsonteleco.com ([98.142.75.30]
	helo=lloydserv.home.familyhonor.net)
	by mho-02-ewr.mailhop.org with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.72) (envelope-from <blloyd@familyhonor.net>)
	id 1XazTM-000NTu-4q for openembedded-core@lists.openembedded.org;
	Mon, 06 Oct 2014 04:00:32 +0000
Received: from omclinuxballt.home.familyhonor.net ([192.168.0.65])
	(authenticated bits=0)
	by lloydserv.home.familyhonor.net (8.14.7/8.14.6) with ESMTP id
	s9640Jl7021670
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Sun, 5 Oct 2014 23:00:29 -0500
X-Mail-Handler: Dyn Standard SMTP by Dyn
X-Originating-IP: 98.142.75.30
X-Report-Abuse-To: abuse@dyndns.com (see
	http://www.dyndns.com/services/sendlabs/outbound_abuse.html for
	abuse reporting information)
X-MHO-User: U2FsdGVkX18AF2tMXpJc2BAuXXV+v4DPk8NxTHX8jG8=
From: Brian Lloyd <blloyd@familyhonor.net>
To: openembedded-core@lists.openembedded.org
Date: Sun,  5 Oct 2014 23:00:09 -0500
Message-Id: <cover.1412567765.git.blloyd@familyhonor.net>
X-Mailer: git-send-email 1.9.3
Cc: blloyd@familyhonor.net
Subject: [PATCH 0/1] xf-86-video-geode missing config.h include
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
X-List-Received-Date: Mon, 06 Oct 2014 04:29:25 -0000

This backports a fix already applied to development branh of xf86-video-geode to latest release since next release could be a ways away.  This allows compiling xf86-video-geode against the latest linux-yocto kernels.

Brian Lloyd (1):
  Backports inclusion of config.h to be compatible with newer kernels.

 ...1-Add-config.h-include-to-src-lx_memory.c.patch | 40 ++++++++++++++++++++++
 .../xorg-driver/xf86-video-geode_2.11.16.bb        |  2 +-
 2 files changed, 41 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-graphics/xorg-driver/xf86-video-geode/0001-Add-config.h-include-to-src-lx_memory.c.patch

-- 
1.9.3


