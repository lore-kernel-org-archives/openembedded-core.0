Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 6011C77242;
	Thu, 12 Nov 2015 17:40:02 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 12 Nov 2015 09:40:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,282,1444719600"; d="scan'208";a="849672959"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 12 Nov 2015 09:40:03 -0800
Received: by linux.intel.com (Postfix, from userid 48)
	id B10336A4087; Thu, 12 Nov 2015 09:38:58 -0800 (PST)
Received: from 10.252.13.130
	(SquirrelMail authenticated user alexander.kanavin)
	by linux.intel.com with HTTP; Thu, 12 Nov 2015 19:38:58 +0200 (EET)
Message-ID: <58904.10.252.13.130.1447349938.squirrel@linux.intel.com>
In-Reply-To: <20151112171915.GK2574@jama>
References: <58488.10.252.13.130.1447346734.squirrel@linux.intel.com>
	<20151112171915.GK2574@jama>
Date: Thu, 12 Nov 2015 19:38:58 +0200 (EET)
From: alexander.kanavin@linux.intel.com
To: "Martin Jansa" <martin.jansa@gmail.com>
User-Agent: SquirrelMail/1.4.8-5.el4.centos.8
MIME-Version: 1.0
X-Priority: 3 (Normal)
Importance: Normal
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: qt4 moves out of oe-core - to meta-qt4, or to meta-oe?
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
X-List-Received-Date: Thu, 12 Nov 2015 17:40:05 -0000
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit

> There is already enough meta-oe bloat moved from oe-core:
>
> http://lists.openembedded.org/pipermail/openembedded-core/2015-November/112665.html
>
> WARN: qt-mobility-embedded: qt-mobility-embedded rdepends on glib-2.0, but
> it isn't a build dependency?

If increasing bloat is a problem, why do recipes in meta-oe need to be
maintained indefinitely? Old cruft can be dropped from meta-oe, just as it
is dropped from oe-core. Just ask the public if it's ok, set a timeframe,
and do it.

qt-mobility in particular has been dead for several years, and doesn't
even have official upstream tarballs anymore. Why spend time fixing it?


Alex

