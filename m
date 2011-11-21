Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RSSQq-0007lY-R1
	for openembedded-core@lists.openembedded.org;
	Mon, 21 Nov 2011 12:53:05 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 21 Nov 2011 03:46:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="78347592"
Received: from unknown (HELO helios.localnet) ([10.252.121.206])
	by orsmga001.jf.intel.com with ESMTP; 21 Nov 2011 03:46:33 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Nov 2011 11:46:31 +0000
Message-ID: <2673505.vfujBTNCRF@helios>
Organization: Intel Corporation
User-Agent: KMail/4.7.3 (Linux/3.0.0-12-generic-pae; KDE/4.7.3; i686; ; )
In-Reply-To: <CAP9ODKqe8r=PH=uRSo019drokB5qwPVHPrdBcnYWSJ82AkPqBQ@mail.gmail.com>
References: <cover.1321628513.git.paul.eggleton@linux.intel.com>
	<1707586.L5PGoRtkiK@helios>
	<CAP9ODKqe8r=PH=uRSo019drokB5qwPVHPrdBcnYWSJ82AkPqBQ@mail.gmail.com>
MIME-Version: 1.0
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [RFC PATCH 1/1] qt4: disable pulseaudio
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
X-List-Received-Date: Mon, 21 Nov 2011 11:53:05 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Saturday 19 November 2011 12:55:04 Otavio Salvador wrote:
> I think this needs to be a distro option, not enforced.
> 
> I agree this needs to be explicitly added or removed but I'd like it
> to be optional ... many embedded systems now depends on pulseaudio and
> if one is using it, phonon ought to use it too.

So, is this a DISTRO_FEATURE? Or do we use PACKAGECONFIG?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


