Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RqNfc-0002fw-O0
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jan 2012 12:39:12 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 26 Jan 2012 03:31:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="102922305"
Received: from unknown (HELO helios.localnet) ([10.252.122.174])
	by orsmga002.jf.intel.com with ESMTP; 26 Jan 2012 03:31:23 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Jan 2012 11:31:21 +0000
Message-ID: <1494171.ziDK2I0A7F@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8 rc2 (Linux/3.0.0-15-generic-pae; KDE/4.7.97; i686; ; )
In-Reply-To: <CACW_hTb9UZACKZ+acn2jp-PZzrk1YkbmohyFxoi2deJdRvJpKw@mail.gmail.com>
References: <CACW_hTb9UZACKZ+acn2jp-PZzrk1YkbmohyFxoi2deJdRvJpKw@mail.gmail.com>
MIME-Version: 1.0
Cc: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
Subject: Re: should recipes be distro agnostic?
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
X-List-Received-Date: Thu, 26 Jan 2012 11:39:13 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 26 January 2012 07:52:22 Frans Meulenbroeks wrote:
> By coincidence I bumped into this in oe-core:
> 
> ./meta/recipes-devtools/apt/apt.inc:EXTRA_OECONF_append_angstrom = "
> ac_cv_glibc_ver=libc6.4"
> 
> That also triggered me to do this:
> 
> frans@frans-desktop:~/workspace/openembedded-core$ grep -r _poky .
> ./meta/recipes-sato/pcmanfm/pcmanfm_0.9.10.bb:DEPENDS_append_poky = "
> libowl"
> ./meta/recipes-sato/pcmanfm/pcmanfm_0.9.10.bb:SRC_URI_append_poky = "
> file://owl-window-menu.patch"
> ./meta/recipes-sato/leafpad/leafpad_0.8.18.1.bb:DEPENDS_append_poky = "
> libowl"
> ./meta/recipes-sato/leafpad/leafpad_0.8.18.1.bb:SRC_URI_append_poky += "
> file://owl-menu.patch;apply=yes "
> ./meta/recipes-sato/pimlico/dates.inc:OWL_poky = "--enable-owl
> --disable-dnd"
> ./meta/recipes-sato/pimlico/dates.inc:DEPENDS_append_poky = " libowl"
> ./meta/recipes-sato/pimlico/dates.inc:SRC_URI_append_poky = "
> file://dates-owl-window-menu.patch;apply=yes "
> ./meta/recipes-sato/pimlico/tasks_0.19.bb:OWL_poky = "--with-owl"
> ./meta/recipes-sato/pimlico/contacts.inc:DEPENDS_append_poky = " libowl"
> ./meta/recipes-sato/pimlico/contacts.inc:OWL_poky = "--enable-owl"
> ./meta/recipes-sato/pimlico/contacts.inc:SRC_URI_append_poky = "
> file://contacts-owl-window-menu.patch;apply=yes "
> ./meta/recipes-sato/pimlico/tasks.inc:DEPENDS_append_poky = " libowl"
> ./meta/recipes-sato/pimlico/tasks.inc:OWL_poky ?= "--enable-owl"
> ./meta/recipes-sato/puzzles/oh-puzzles_git.bb:DEPENDS_append_poky = "
> libowl"
> ./meta/recipes-sato/puzzles/oh-puzzles_git.bb:SRC_URI_append_poky = "
> file://oh-puzzles-owl-menu.patch;striplevel=0 "
> ./meta/recipes-devtools/gcc/gcc-runtime_4.6.bb:EXTRA_OECONF_append_poky-lsb
> = " --enable-clocale=gnu"
> 
> I'd hoped oe-core to be core and not know things about distro's etc.
> E.g. the first case with apt, this should probably be fixed with a
> .bbappend in the angstrom layer, shouldn't it.
> And the poky things in a poky layer.

Absolutely, there should be no distro-specific items in OE-Core at all, and I 
have to admit I was not aware they were there. Most of the poky ones seem to 
be related to enabling libowl in various Sato apps - I don't know enough about 
this area to know if we should now just always be applying these or whether 
they indeed need to be moved out. Richard/Saul/anyone else?

Regarding meta-oe, I think we have bigger issues than the items you found (see 
other thread on OE-devel) although they shouldn't be in there either.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


