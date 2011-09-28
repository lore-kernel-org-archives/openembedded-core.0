Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1R8v5p-0006tn-OH
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Sep 2011 16:26:37 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 28 Sep 2011 07:21:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,455,1312182000"; d="scan'208";a="21456618"
Received: from unknown (HELO helios.localnet) ([10.252.120.159])
	by AZSMGA002.ch.intel.com with ESMTP; 28 Sep 2011 07:21:08 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Dmitry Cherukhin <dima_ch@emcraft.com>
Date: Wed, 28 Sep 2011 15:21:07 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-10-generic-pae; KDE/4.6.2; i686; ; )
References: <c477d260c34472a416ccb6eec9af0300a40d576f>
	<1317202559-17845-1-git-send-email-dima_ch@emcraft.com>
In-Reply-To: <1317202559-17845-1-git-send-email-dima_ch@emcraft.com>
MIME-Version: 1.0
Message-Id: <201109281521.07861.paul.eggleton@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] qt4: Added support for QtMobility 1.2
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
X-List-Received-Date: Wed, 28 Sep 2011 14:26:38 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Wednesday 28 September 2011 10:35:59 Dmitry Cherukhin wrote:
> The QtMobility is a Qt add-on which allows to include standard mobile
> functionality to Qt applications. For details, see
>    http://qt.nokia.com/products/qt-addons/mobility/
> The patch is intended to add support for the QtMobility 1.2 package to OE.

So apart from adding Qt Mobility this attempts to work around two issues by 
removing the checks rather than fixing the underlying cause of the checks 
failing. These checks look fine to me, so why are they not working?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


