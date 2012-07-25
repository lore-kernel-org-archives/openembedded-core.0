Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Su2fc-0000kp-2N
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Jul 2012 16:34:36 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 25 Jul 2012 07:23:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="185933112"
Received: from unknown (HELO helios.localnet) ([10.252.121.26])
	by fmsmga001.fm.intel.com with ESMTP; 25 Jul 2012 07:23:05 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Jul 2012 15:23:02 +0100
Message-ID: <1528039.fg9dttDzQG@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.4 (Linux/3.2.0-27-generic-pae; KDE/4.8.4; i686; ; )
In-Reply-To: <CAJTo0LbFcZYhBzgO4wEhnS4Dq+msQP9pu8Biagiy3cPGUoPGkA@mail.gmail.com>
References: <1343225031-19107-1-git-send-email-radu.moisan@intel.com>
	<E1C8B862-C08F-4098-93A4-9C7E6262038B@dominion.thruhere.net>
	<CAJTo0LbFcZYhBzgO4wEhnS4Dq+msQP9pu8Biagiy3cPGUoPGkA@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: [PATCH] dbus: include dbus-launch in the main dbus package
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
X-List-Received-Date: Wed, 25 Jul 2012 14:34:36 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 25 July 2012 15:19:10 Burton, Ross wrote:
> On 25 July 2012 15:17, Koen Kooi <koen@dominion.thruhere.net> wrote:
> > This breaks the upgrade path
> 
> So how would the upgrade path be unbroken?  A dummy dbus-x11 package
> that pulls in dbus, I suspect.

RREPLACES_${PN} += "dbus-x11" ought to be enough...

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


