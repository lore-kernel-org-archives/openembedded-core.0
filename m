Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id C6F7477439
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Feb 2016 14:24:14 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 26 Feb 2016 06:24:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,498,1449561600"; d="scan'208";a="895488259"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 26 Feb 2016 06:24:14 -0800
Received: by linux.intel.com (Postfix, from userid 48)
	id 808D76A4004; Fri, 26 Feb 2016 07:12:03 -0800 (PST)
Received: from 10.252.8.77 (SquirrelMail authenticated user alexander.kanavin)
	by linux.intel.com with HTTP; Fri, 26 Feb 2016 17:12:03 +0200 (EET)
Message-ID: <56013.10.252.8.77.1456499523.squirrel@linux.intel.com>
In-Reply-To: <1456496056-31812-1-git-send-email-net147@gmail.com>
References: <1456496056-31812-1-git-send-email-net147@gmail.com>
Date: Fri, 26 Feb 2016 17:12:03 +0200 (EET)
From: alexander.kanavin@linux.intel.com
To: "Jonathan Liu" <net147@gmail.com>
User-Agent: SquirrelMail/1.4.8-5.el4.centos.8
MIME-Version: 1.0
X-Priority: 3 (Normal)
Importance: Normal
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] ffmpeg: add bzlib, lzma and xv PACKAGECONFIGs
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
X-List-Received-Date: Fri, 26 Feb 2016 14:24:14 -0000
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit

> +PACKAGECONFIG[xv] = "--enable-outdev=xv,--disable-outdev=xv,libxv"

Ah, ffmpeg already had a way to do it :) This patch is fine.

Alex

