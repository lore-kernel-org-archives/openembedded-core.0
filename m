Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 40C7761E92
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 12:40:48 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 28 Jun 2013 05:38:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,958,1363158000"; d="scan'208";a="361066109"
Received: from unknown (HELO helios.localnet) ([10.252.122.97])
	by orsmga002.jf.intel.com with ESMTP; 28 Jun 2013 05:40:27 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Jun 2013 13:40:26 +0100
Message-ID: <9031819.zlCvcHI3ah@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.3 (Linux/3.8.0-25-generic; KDE/4.10.3; i686; ; )
In-Reply-To: <CA+chaQcjeX_y3c7=MOFkp5jndMdo4xKcAmgA7yWjB_bsaBMb3g@mail.gmail.com>
References: <1371254791-8168-1-git-send-email-net147@gmail.com>
	<51CD7C66.3020702@gmail.com>
	<CA+chaQcjeX_y3c7=MOFkp5jndMdo4xKcAmgA7yWjB_bsaBMb3g@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: [PATCH] qt4e.bbclass: export OE_QMAKE_QT_CONFIG
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 28 Jun 2013 12:40:48 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 28 June 2013 14:28:56 Martin Jansa wrote:
> It's failing in my world builds too now, you can see log here:
> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.2013
> 0627_214856.log/bitbake.log
> 
> Cheers,
> 
> On Fri, Jun 28, 2013 at 2:07 PM, Jonathan Liu <net147@gmail.com> wrote:
> > On 15/06/2013 10:06 AM, Jonathan Liu wrote:
> >> The class is inheriting qmake2.bbclass which exports OE_QMAKE_QT_CONFIG
> >> pointing to the qt4 qconfig.pri when it should be pointing to the
> >> qt4-embedded qconfig.pri.
> >> 
> >> Signed-off-by: Jonathan Liu <net147@gmail.com>
> >> ---
> >> 
> >>   meta/classes/qt4e.bbclass | 1 +
> >>   1 file changed, 1 insertion(+)
> >> 
> >> diff --git a/meta/classes/qt4e.bbclass b/meta/classes/qt4e.bbclass
> >> index de2a68d..13b1050 100644
> >> --- a/meta/classes/qt4e.bbclass
> >> +++ b/meta/classes/qt4e.bbclass
> >> @@ -9,6 +9,7 @@ QT_LIBINFIX = "E"
> >> 
> >>   # override variables set by qmake-base to compile Qt/Embedded apps
> >>   #
> >>   export QMAKESPEC = "${STAGING_DATADIR}/${QT_DIR_**
> >> 
> >> NAME}/mkspecs/${TARGET_OS}-oe-**g++"
> >> +export OE_QMAKE_QT_CONFIG = "${STAGING_DATADIR}/${QT_DIR_**
> >> NAME}/mkspecs/qconfig.pri"
> >> 
> >>   export OE_QMAKE_INCDIR_QT = "${STAGING_INCDIR}/${QT_DIR_**NAME}"
> >>   export OE_QMAKE_LIBDIR_QT = "${STAGING_LIBDIR}"
> >>   export OE_QMAKE_LIBS_QT = "qt"
> > 
> > Hi Saul,
> > 
> > Do you have a log of the error you had building qt4-embedded with this
> > patch?

FWIW, I see the same error without this patch if I build qt4-embedded after 
building qt4-x11, so I don't know if this patch is really related to the 
problem or not.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

