Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1S24Sh-0006NO-0E
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Feb 2012 18:34:11 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 27 Feb 2012 09:25:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="112305246"
Received: from unknown (HELO helios.localnet) ([10.252.123.30])
	by orsmga001.jf.intel.com with ESMTP; 27 Feb 2012 09:24:43 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Feb 2012 17:24:42 +0000
Message-ID: <1624619.CXJLtNuTG7@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.0 (Linux/3.0.0-16-generic-pae; KDE/4.8.0; i686; ; )
In-Reply-To: <CAP9ODKr1faEWrO877gfeMkutp8_STOvNp81iA00uiC0w46A1qQ@mail.gmail.com>
References: <1330362610-12851-1-git-send-email-obi@opendreambox.org>
	<CAP9ODKr1faEWrO877gfeMkutp8_STOvNp81iA00uiC0w46A1qQ@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: [PATCH] qt4.inc: depend on tiff
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
X-List-Received-Date: Mon, 27 Feb 2012 17:34:11 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 27 February 2012 14:20:15 Otavio Salvador wrote:
> On Mon, Feb 27, 2012 at 14:10, Andreas Oberritter <obi@opendreambox.org> 
wrote:
> > * Fixes the following error with qt4-embedded-4.8.0 and possibly others:
> > | ../../../gui/image/qtiffhandler.cpp:48:20: fatal error: tiffio.h: No
> > | such file or directory
> Please bump INC_PR.

FYI, there's no INC_PR in qt4.inc but you can bump INC_PR in qt4-embedded.inc 
and qt4-x11-free.inc since those are the only places that include qt4.inc.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


