Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 0483F60FEE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jul 2013 11:08:01 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 25 Jul 2013 04:08:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,742,1367996400"; d="scan'208";a="375830633"
Received: from unknown (HELO helios.localnet) ([10.252.122.176])
	by fmsmga002.fm.intel.com with ESMTP; 25 Jul 2013 04:08:01 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Shakeel, Muhammad" <muhammad_shakeel@mentor.com>
Date: Thu, 25 Jul 2013 12:08 +0100
Message-ID: <1588434.lE7kCy0PJ6@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-26-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <1374746524-18179-1-git-send-email-muhammad_shakeel@mentor.com>
References: <1374746524-18179-1-git-send-email-muhammad_shakeel@mentor.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] avahi: Remove unnecessary runtime dependency on sysvinit-pidof
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
X-List-Received-Date: Thu, 25 Jul 2013 11:08:02 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 25 July 2013 15:02:04 Shakeel, Muhammad wrote:
> From: Muhammad Shakeel <muhammad_shakeel@mentor.com>
> 
> 'pidof' is alternatively coming from busybox so no need for avahi to
> explicitly rdepend on sysvinit-pidof. This unnecessarily includes sysvinit
> in systemd only build.

Surely this just results in sysvinit being built as opposed to being included 
in the image?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

