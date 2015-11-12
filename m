Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id D38EE7722C;
	Thu, 12 Nov 2015 16:46:39 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 12 Nov 2015 08:46:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,282,1444719600"; d="scan'208";a="835789123"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 12 Nov 2015 08:46:40 -0800
Received: by linux.intel.com (Postfix, from userid 48)
	id 239E86A4087; Thu, 12 Nov 2015 08:45:35 -0800 (PST)
Received: from 10.252.13.130
	(SquirrelMail authenticated user alexander.kanavin)
	by linux.intel.com with HTTP; Thu, 12 Nov 2015 18:45:34 +0200 (EET)
Message-ID: <58488.10.252.13.130.1447346734.squirrel@linux.intel.com>
Date: Thu, 12 Nov 2015 18:45:34 +0200 (EET)
From: alexander.kanavin@linux.intel.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
User-Agent: SquirrelMail/1.4.8-5.el4.centos.8
MIME-Version: 1.0
X-Priority: 3 (Normal)
Importance: Normal
Subject: qt4 moves out of oe-core - to meta-qt4, or to meta-oe?
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
X-List-Received-Date: Thu, 12 Nov 2015 16:46:40 -0000
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit

Hello,

now that 2.0 is out, it's time to move the Qt4 recipes out of oe-core.
This has been discussed previously here:
http://lists.openembedded.org/pipermail/openembedded-core/2015-June/106355.html

I'm not sure where the recipes should land, and want to ask your opinion.
The options are:
1) Make a new layer, meta-qt4, under meta-openembedded tree. Move also
everything in meta-oe/recipes-qt (and possibly other spots) to that layer.
This is somewhat more disruptive to people's layer configurations, but
would clearly separate qt4, and slim down meta-oe.

2) Simply move the qt4 recipes from oe-core to meta-oe/recipes-qt, so they
will be next to all the qt4-based software. This is less disruptive, but
adds bloat to meta-oe.

Preferences?

Alex

