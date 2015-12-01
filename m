Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 829556011F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Dec 2015 22:22:32 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 01 Dec 2015 14:22:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,370,1444719600"; d="scan'208";a="851766778"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 01 Dec 2015 14:22:32 -0800
Received: by linux.intel.com (Postfix, from userid 48)
	id BE7BE6A408D; Tue,  1 Dec 2015 14:21:24 -0800 (PST)
Received: from 10.252.17.232
	(SquirrelMail authenticated user alexander.kanavin)
	by linux.intel.com with HTTP; Wed, 2 Dec 2015 00:21:24 +0200 (EET)
Message-ID: <60070.10.252.17.232.1449008484.squirrel@linux.intel.com>
In-Reply-To: <1449001866-29286-1-git-send-email-tom.hochstein@freescale.com>
References: <1449001866-29286-1-git-send-email-tom.hochstein@freescale.com>
Date: Wed, 2 Dec 2015 00:21:24 +0200 (EET)
From: alexander.kanavin@linux.intel.com
To: "Tom Hochstein" <tom.hochstein@freescale.com>
User-Agent: SquirrelMail/1.4.8-5.el4.centos.8
MIME-Version: 1.0
X-Priority: 3 (Normal)
Importance: Normal
Cc: Prabhu Sundararaj <prabhu.sundararaj@freescale.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] weston-init: Use weston-launch for XWayland
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
X-List-Received-Date: Tue, 01 Dec 2015 22:22:33 -0000
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit

> +        # If weston-launch exists, we're configured for XWayland.
> +        if [ -f /usr/bin/weston-launch ]; then
> +            echo "Starting Weston in XWayland"

Nope. XWayland support and weston-launch support are configured
separately. One may be present and the other one absent, both ways.

Alex

