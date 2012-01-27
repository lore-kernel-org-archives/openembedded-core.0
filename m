Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Rqknj-00086l-GP
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Jan 2012 13:21:08 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 27 Jan 2012 04:13:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="60535065"
Received: from unknown (HELO helios.localnet) ([10.252.122.187])
	by AZSMGA002.ch.intel.com with ESMTP; 27 Jan 2012 04:13:16 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Samuel Stirtzel <s.stirtzel@googlemail.com>
Date: Fri, 27 Jan 2012 12:13:15 +0000
Message-ID: <2310484.775mZrL9pm@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8 rc2 (Linux/3.0.0-15-generic-pae; KDE/4.7.97; i686; ; )
In-Reply-To: <CAGiJk9dDm0KKcKZUhqrTFg9JLgKwbyn45K2Y4WgdiWoctskaEA@mail.gmail.com>
References: <cover.1322061836.git.paul.eggleton@linux.intel.com>
	<2153827.uieeAmS9LV@helios>
	<CAGiJk9dDm0KKcKZUhqrTFg9JLgKwbyn45K2Y4WgdiWoctskaEA@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/3] Make pulseaudio a DISTRO_FEATURE
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
X-List-Received-Date: Fri, 27 Jan 2012 12:21:08 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 27 January 2012 12:34:59 Samuel Stirtzel wrote:
> Oh ok, I thought just about Qt + Phonon +- Pulseaudio case.
> If a user disables or enables Pulseaudio he would need to rebuild all
> Qt stuff to make it work (and building Qt is time consuming).
> With a separate phonon recipe he could just rebuild the libphonon
> recipe instead.

Whilst this might seem attractive, I don't believe encouraging people to play 
with DISTRO_FEATURES *after* they have built things is a good idea - these 
should really be set beforehand and not changed without rebuilding everything. 
Otherwise we're setting users up for unexpected and difficult to debug failures.

(Of course that assumes the user knows and appreciates the implications of 
items in DISTRO_FEATURES, and we may need to improve our tooling and 
documentation such that they can, should they even need to change them that 
is.)

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


