Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 2B36562132
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Jul 2016 21:17:47 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP; 31 Jul 2016 14:17:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,452,1464678000"; d="scan'208";a="1005918314"
Received: from clee25-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.164.236])
	by orsmga001.jf.intel.com with ESMTP; 31 Jul 2016 14:17:46 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Date: Mon, 01 Aug 2016 09:17:43 +1200
Message-ID: <1741854.t2UPzGOPnl@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.6.4-201.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
In-Reply-To: <CAP9ODKr5zc+cB-iGcze7Uq8DswUko=2cReYhWLyURe5DwLuE2Q@mail.gmail.com>
References: <20160729222801.9806-1-raj.khem@gmail.com>
	<CAP9ODKr5zc+cB-iGcze7Uq8DswUko=2cReYhWLyURe5DwLuE2Q@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3] linux-dtb.inc: Support for .dtbo files for dtb overlays
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
X-List-Received-Date: Sun, 31 Jul 2016 21:17:48 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Sat, 30 Jul 2016 08:00:45 Otavio Salvador wrote:
> On Fri, Jul 29, 2016 at 7:27 PM, Khem Raj <raj.khem@gmail.com> wrote:
> > From: Herve Jourdain <herve.jourdain@neuf.fr>
> > 
> > Signed-off-by: Herve Jourdain <herve.jourdain@neuf.fr>
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> > 
> >  meta/recipes-kernel/linux/linux-dtb.inc | 18 +++++++++++-------
> >  1 file changed, 11 insertions(+), 7 deletions(-)
> > 
> > diff --git a/meta/recipes-kernel/linux/linux-dtb.inc
> > b/meta/recipes-kernel/linux/linux-dtb.inc index 74f5ef8..8528d64 100644
> > --- a/meta/recipes-kernel/linux/linux-dtb.inc
> > +++ b/meta/recipes-kernel/linux/linux-dtb.inc
> > @@ -33,12 +33,13 @@ do_compile_append() {
> > 
> >  do_install_append() {
> >  
> >         for DTB in ${KERNEL_DEVICETREE}; do
> >         
> >                 DTB=`normalize_dtb "${DTB}"`
> > 
> > -               DTB_BASE_NAME=`basename ${DTB} .dtb`
> > +               DTB_EXT=${DTB##*.}
> 
> Bashism, no?

No:

  http://pubs.opengroup.org/onlinepubs/009695399/utilities/xcu_chap02.html

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

