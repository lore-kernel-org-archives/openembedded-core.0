Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 68D307589F;
	Mon, 15 Jun 2015 09:46:33 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 15 Jun 2015 02:46:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,618,1427785200"; d="scan'208";a="727524284"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.143])
	([10.237.68.143])
	by fmsmga001.fm.intel.com with ESMTP; 15 Jun 2015 02:46:30 -0700
Message-ID: <557E9EFE.1030703@linux.intel.com>
Date: Mon, 15 Jun 2015 12:46:38 +0300
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org, 
	openembedded-devel@lists.openembedded.org, yocto@yoctoproject.org
Subject: Webkit-gtk will be updated to latest upstream; midori browser to be replaced with Epiphany
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
X-List-Received-Date: Mon, 15 Jun 2015 09:46:36 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello everyone,

I've been looking into updating oe-core's aging web engine/browser 
combo, and want to give you a heads up about what's going to happen:

1) webkit-gtk engine will be updated to latest stable upstream release 
(2.8.3 which is providing Webkit2 API and is a Gtk3 port)

2) midori browser will be replaced with Epiphany browser from the Gnome 
project. The reason is that the latest release of midori still defaults 
to Webkit1 and gtk2, a new version of midori is in development, but is a 
major rewrite with no target release date and is far from ready at the 
moment (from looking at the list of open issues).

The downside to this is extra bloat and dependencies, but I can't see 
any other way we can provide a modern client stack for the web. Having a 
browser is important nowadays for any kiosk-type device with a 
touchscreen, because that's how UIs are written.

Regards,
Alex

