Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Ucf1Y-0005tS-SE
	for openembedded-core@lists.openembedded.org;
	Wed, 15 May 2013 18:58:02 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 15 May 2013 09:39:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,678,1363158000"; d="scan'208";a="314101622"
Received: from unknown (HELO helios.localnet) ([10.255.12.118])
	by orsmga001.jf.intel.com with ESMTP; 15 May 2013 09:39:39 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Wed, 15 May 2013 17:39:38 +0100
Message-ID: <1711232.dboPgR0GxB@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.2 (Linux/3.8.0-19-generic; KDE/4.10.2; i686; ; )
In-Reply-To: <CAP9ODKrkH4dKFLFNUA_RusUk=27N7n-Dzu3DNaFLbPNK6FtDVQ@mail.gmail.com>
References: <1368123358-10995-1-git-send-email-eu@felipetonello.com>
	<CAP9ODKrkH4dKFLFNUA_RusUk=27N7n-Dzu3DNaFLbPNK6FtDVQ@mail.gmail.com>
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qt: updated qmake2 class to export qconfig.pri mkspec
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 15 May 2013 16:58:10 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 15 May 2013 13:31:41 Otavio Salvador wrote:
> On Thu, May 9, 2013 at 3:15 PM,  <eu@felipetonello.com> wrote:
> > From: "Felipe F. Tonello" <eu@felipetonello.com>
> > 
> > This is necessary when Qt applicatins want to know variables such as
> > QT_MAJOR_VERSION, QT_VERSION, QT_MINOR_VERSION, gcc version etc.
> > 
> > OBS: This change made the build system crazy. When I changed it and run
> > bitbake my-qt-app-recipe, qmake was consuming 100% cpu usage for long
> > time. I had to stop it. So I recommend rebuild the entire Qt stack when
> > changing this.
> > 
> > Signed-off-by: Felipe F. Tonello <eu@felipetonello.com>
> > ---
> > 
> >  meta/classes/qmake2.bbclass | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/meta/classes/qmake2.bbclass b/meta/classes/qmake2.bbclass
> > index 5eebd8e..8b9861c 100644
> > --- a/meta/classes/qmake2.bbclass
> > +++ b/meta/classes/qmake2.bbclass
> > @@ -6,6 +6,7 @@ inherit qmake_base
> > 
> >  DEPENDS_prepend = "qt4-tools-native "
> >  
> >  export QMAKESPEC = "${STAGING_DATADIR}/qt4/mkspecs/${TARGET_OS}-oe-g++"
> > 
> > +export OE_QMAKE_QT_CONFIG = "${STAGING_DATADIR}/qt4/mkspecs/qconfig.pri"
> > 
> >  export OE_QMAKE_UIC = "${STAGING_BINDIR_NATIVE}/uic4"
> >  export OE_QMAKE_UIC3 = "${STAGING_BINDIR_NATIVE}/uic34"
> >  export OE_QMAKE_MOC = "${STAGING_BINDIR_NATIVE}/moc4"
> 
> The patch makes a lot of sense for me, Paul?

I'm not sure I know enough about this to say either way; the comment about 
qmake going crazy doesn't exactly inspire confidence though...

I guess one question I would have is why have we not needed this before?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


