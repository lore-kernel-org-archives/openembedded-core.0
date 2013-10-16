Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 6B60F6CA74
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2013 10:25:25 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 16 Oct 2013 03:25:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,506,1378882800"; d="scan'208";a="375459118"
Received: from unknown (HELO helios.localnet) ([10.252.121.8])
	by azsmga001.ch.intel.com with ESMTP; 16 Oct 2013 03:25:26 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>
Date: Wed, 16 Oct 2013 11:25:23 +0100
Message-ID: <1517941.hq8ryEHxA8@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-31-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <1381875766-20689-1-git-send-email-sgw@linux.intel.com>
References: <1381875766-20689-1-git-send-email-sgw@linux.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] packagegroup-core-basic: libuser has a hard depenency on libpam
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
X-List-Received-Date: Wed, 16 Oct 2013 10:25:25 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 15 October 2013 15:22:46 Saul Wold wrote:
> Since libpam is only built when DISTRO_FEATURES pam is enabled we should
> not be trying to build libuser also.

Should this packagegroup be bringing in libraries such as this at all, given 
that libraries are generally pulled in as dependencies of applications that 
link to them?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

