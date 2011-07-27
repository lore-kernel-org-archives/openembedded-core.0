Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1QlsUa-00047T-3y
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 03:00:57 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 26 Jul 2011 17:56:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,272,1309762800"; d="scan'208";a="30476017"
Received: from shxpwgzhai1a.ccr.corp.intel.com (HELO [10.239.48.130])
	([10.239.48.130])
	by orsmga002.jf.intel.com with ESMTP; 26 Jul 2011 17:56:41 -0700
Message-ID: <4E2F624B.4070701@intel.com>
Date: Wed, 27 Jul 2011 08:56:43 +0800
From: "Zhai, Edwin" <edwin.zhai@intel.com>
User-Agent: Thunderbird 2.0.0.17 (Windows/20080914)
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1311682779.git.edwin.zhai@intel.com>	<73ea8ff94e4bda213df1a5a39615f4cd39899589.1311682779.git.edwin.zhai@intel.com>
	<C36AA1E0-9A00-4761-9912-A3AC81367446@dominion.thruhere.net>
In-Reply-To: <C36AA1E0-9A00-4761-9912-A3AC81367446@dominion.thruhere.net>
Subject: Re: [PATCH 2/3] xinput-calibrator: Add 0.7.5 as new recipe
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
X-List-Received-Date: Wed, 27 Jul 2011 01:00:58 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I borrowed it from meta-oe with minor modification.
xinput is very useful for debug and test of input device under X. 
xinput_calibrator is a must for touchscreen device.

Koen Kooi wrote:
>
> This one looks suspicously like the one in meta-oe. Apart from that, 
> is it really needed in oe-core?
>
> Op 26 jul. 2011, om 14:30 heeft edwin.zhai@intel.com het volgende 
> geschreven:
>
> > From: Zhai Edwin <edwin.zhai@intel.com>
> >
> > Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
> > ---
> > .../xinput-calibrator/xinput-calibrator_0.7.5.bb   |   24 
> ++++++++++++++++++++
> > 1 files changed, 24 insertions(+), 0 deletions(-)
> > create mode 100644 
> meta/recipes-graphics/xinput-calibrator/xinput-calibrator_0.7.5.bb
> >
> > diff --git 
> a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_0.7.5.bb 
> b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_0.7.5.bb
>
> > new file mode 100644
> > index 0000000..5a868f7
> > --- /dev/null
> > +++ 
> b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_0.7.5.bb
> > @@ -0,0 +1,24 @@
> > +DESCRIPTION = "A generic touchscreen calibration program for X.Org"
> > +HOMEPAGE = 
> "http://www.freedesktop.org/wiki/Software/xinput_calibrator"
> > +
> > +LICENSE = "MIT/X11"
> > +LIC_FILES_CHKSUM = 
> "file://COPYING;md5=d9a6926aaad6b8f38bb4f995fe088466\ 
> <file://COPYING;md5=d9a6926aaad6b8f38bb4f995fe088466%5C>
> > +                    
> file://src/calibrator.cpp;endline=22;md5=998e238a7638a7446eaeb02398f691fc" 
>
> > +
> > +DEPENDS = "virtual/libx11 libxi"
> > +
> > +inherit autotools
> > +
> > +RDEPENDS_${PN} = "xinput"
> > +
> > +SRC_URI = 
> "http://github.com/downloads/tias/xinput_calibrator/xinput_calibrator-${PV}.tar.gz" 
>
> > +SRC_URI[md5sum] = "20da0a2055a5a75962add8c6b44f60fa"
> > +SRC_URI[sha256sum] = 
> "baa4ddca49ec94c27ba4c715bfa26692fec1132103e927213c3169e475d3d971"
> > +
> > +S = "${WORKDIR}/xinput_calibrator-${PV}"
> > +
> > +do_install_append() {
> > +        install -d ${D}${bindir}
> > +        install -m 0755 scripts/xinput_calibrator_pointercal.sh 
> ${D}${bindir}/xinput_calibrator_once.sh
> > +        install -m 0755 
> scripts/xinput_calibrator_get_hal_calibration.sh 
> ${D}${bindir}/xinput_calibrator_get_hal_calibration.sh
>
> > +}
> > --
> > 1.7.1
> >
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


