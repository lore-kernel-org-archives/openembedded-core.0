Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id B756A70030
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 17:13:10 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP; 18 Jan 2016 09:12:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,313,1449561600"; d="scan'208";a="31637225"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga004.fm.intel.com with ESMTP; 18 Jan 2016 09:12:55 -0800
Received: by linux.intel.com (Postfix, from userid 48)
	id 7599B2C8001; Mon, 18 Jan 2016 10:00:51 -0800 (PST)
Received: from 10.252.12.252
	(SquirrelMail authenticated user alexander.kanavin)
	by linux.intel.com with HTTP; Mon, 18 Jan 2016 20:00:51 +0200 (EET)
Message-ID: <57332.10.252.12.252.1453140051.squirrel@linux.intel.com>
In-Reply-To: <5682ACB5.4060005@linux.intel.com>
References: <cover.1450364672.git.alexander.kanavin@linux.intel.com>
	<e51f04160f355bc12130d556a49f6f525ac12913.1450364672.git.alexander.kanavin@linux.intel.com>
	<CAJTo0LaCS-MeOUOUiBPNbhuBry3b5fo-5eR-JtREigUyav_39g@mail.gmail.com>
	<5682ACB5.4060005@linux.intel.com>
Date: Mon, 18 Jan 2016 20:00:51 +0200 (EET)
From: alexander.kanavin@linux.intel.com
To: "Alexander Kanavin" <alexander.kanavin@linux.intel.com>
User-Agent: SquirrelMail/1.4.8-5.el4.centos.8
MIME-Version: 1.0
X-Priority: 3 (Normal)
Importance: Normal
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 13/17] nss: update to 3.21
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
X-List-Received-Date: Mon, 18 Jan 2016 17:13:14 -0000
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit

> The third failure is probably a gcc 4.8 issue on opensuse 13.1. I can't
> reproduce it here. Would you be able to develop a fix? Or we can try
> again when upstream makes a new release.

Oh, I just noticed that opensuse 13.1 has been removed from
SANITY_TESTED_DISTROS in March 2015, so why is it still used to test the
builds? Should I still try to fix the build failure?


Alex

