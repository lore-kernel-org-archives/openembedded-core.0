Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1StEuP-0005qA-Ca
	for openembedded-core@lists.openembedded.org;
	Mon, 23 Jul 2012 11:26:33 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 23 Jul 2012 02:15:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="196638452"
Received: from unknown (HELO helios.localnet) ([10.252.121.29])
	by fmsmga002.fm.intel.com with ESMTP; 23 Jul 2012 02:15:04 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Mon, 23 Jul 2012 10:15:03 +0100
Message-ID: <1965034.biL4ROLyBP@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.4 (Linux/3.2.0-26-generic-pae; KDE/4.8.4; i686; ; )
In-Reply-To: <alpine.DEB.2.02.1207221512360.968@oneiric>
References: <alpine.DEB.2.02.1207221512360.968@oneiric>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: any current standard on avoiding use of both "_append" and "+="?
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
X-List-Received-Date: Mon, 23 Jul 2012 09:26:33 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Sunday 22 July 2012 15:12:51 Robert P. J. Day wrote:
>   quick check shows this:
> 
> recipes-graphics/xorg-lib/libxp_1.0.1.bb:CFLAGS_append += " -I
> ${S}/include/X11/XprintUtil -I ${S}/include/X11/extensions"
> recipes-sato/webkit/webkit-gtk_1.8.1.bb:EXTRA_OECONF_append_powerpc +=
> "--with-unicode-backend=glib"
> recipes-sato/webkit/webkit-gtk_1.8.1.bb:CPPFLAGS_append_powerpc +=
> "-I${STAGING_INCDIR}/pango-1.0 \
> 
>   was there going to be any effort to avoid combining "_append" with
> "+=" in recipe files, simply for the sake of clarity?

It's fine for these to be cleaned up as long as a leading space is added for 
the second and third (since += will be doing this at the moment).

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


