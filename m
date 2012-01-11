Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RkymW-0001Ed-OP
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Jan 2012 15:04:01 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 11 Jan 2012 05:56:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="55468476"
Received: from unknown (HELO helios.localnet) ([10.252.122.95])
	by AZSMGA002.ch.intel.com with ESMTP; 11 Jan 2012 05:56:28 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Jan 2012 13:56:27 +0000
Message-ID: <1356479.bsRlACIzx0@helios>
Organization: Intel Corporation
User-Agent: KMail/4.7.3 (Linux/3.0.0-14-generic-pae; KDE/4.7.4; i686; ; )
In-Reply-To: <1326285902-31525-1-git-send-email-andrei@gherzan.ro>
References: <1326285902-31525-1-git-send-email-andrei@gherzan.ro>
MIME-Version: 1.0
Subject: Re: [PATCH] license.py: remove duplicate '&' or '|' from LICENSE
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Jan 2012 14:04:01 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 11 January 2012 14:45:02 Andrei Gherzan wrote:
> Some upstream layers (ex: meta-oe) use '&&' or '||' syntax in LICENSE
> variable. Because of my last commit, these bbfiles are failing as LICENSE
> is tested with oe.license where '&&' and '||' are the bug source.
> The fix is to replace multiple characters of '&' or '|' with a single one.

Sorry to be a pain but could we not just fix those layers to use the accepted 
syntax? Doing so should be just a one-line find/sed command.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


