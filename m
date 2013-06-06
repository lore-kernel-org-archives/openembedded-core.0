Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 3F3D86A689
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jun 2013 15:47:14 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r56FqAgr005557; Thu, 6 Jun 2013 16:52:11 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id L4FwtG2RIrES; Thu,  6 Jun 2013 16:52:10 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r56Fq4Wq005542
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Thu, 6 Jun 2013 16:52:06 +0100
Message-ID: <1370533615.6864.4.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Denys Dmytriyenko <denis@denix.org>, Otavio Salvador
	<otavio@ossystems.com.br>
Date: Thu, 06 Jun 2013 16:46:55 +0100
In-Reply-To: <20130605205801.GI10298@denix.org>
References: <CAP71WjzSHWmKYLTs3_Ao6Mt_sKnUdNCHM3dSMSs8FpKbVyuCoQ@mail.gmail.com>
	<51AF6E2F.8040309@linux.intel.com>
	<CAP9ODKrxMh3PGGwVHdVFcUL2-Ag4vA2bAKr+3PGKGNDzwMJnpg@mail.gmail.com>
	<51AF7336.8050802@linux.intel.com>
	<CAP71WjxL2g=k5hcgAo70Linsf-Occ-tdh1jM+ppYmghALDsq3w@mail.gmail.com>
	<CAP9ODKqiVaF3njGCLXHhT7n03d-QyESQAdw3S+HF2-JNEazCMw@mail.gmail.com>
	<20130605200740.GF10298@denix.org>
	<CAP9ODKr+SnNDEZJ4ON-fDpyZdjOTdVu+9=trCyEpmvHZa5AiwA@mail.gmail.com>
	<51AFA565.3040607@linux.intel.com>
	<CAP9ODKrzy+L9mptVFwNT5VvsxQt42igrQbE2m=yTzAw2Me3txg@mail.gmail.com>
	<20130605205801.GI10298@denix.org>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH dylan, master] Fix meta-toolchain-qte SDK build for x11-less DISTRO
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
X-List-Received-Date: Thu, 06 Jun 2013 15:47:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-06-05 at 16:58 -0400, Denys Dmytriyenko wrote:
> On Wed, Jun 05, 2013 at 05:56:31PM -0300, Otavio Salvador wrote:
> > On Wed, Jun 5, 2013 at 5:53 PM, Saul Wold <sgw@linux.intel.com> wrote:
> > 
> > > On 06/05/2013 01:10 PM, Otavio Salvador wrote:
> > >
> > >>
> > >>
> > >>
> > >> On Wed, Jun 5, 2013 at 5:07 PM, Denys Dmytriyenko <denis@denix.org
> > >> <mailto:denis@denix.org>> wrote:
> > >>
> > >>     On Wed, Jun 05, 2013 at 02:43:07PM -0300, Otavio Salvador wrote:
> > >>      > On Wed, Jun 5, 2013 at 2:23 PM, Nicolas Dechesne <
> > >>      > nicolas.dechesne@linaro.org <mailto:nicolas.dechesne@**linaro.org<nicolas.dechesne@linaro.org>
> > >> >>
> > >>
> > >>     wrote:
> > >>      >
> > >>      > >
> > >>      > >
> > >>      > >
> > >>      > > On Wed, Jun 5, 2013 at 7:19 PM, Saul Wold <sgw@linux.intel.com
> > >>     <mailto:sgw@linux.intel.com>> wrote:
> > >>      > >
> > >>      > >> On 06/05/2013 10:12 AM, Otavio Salvador wrote:
> > >>      > >>
> > >>      > >>>
> > >>      > >>>
> > >>      > >>>
> > >>      > >>> On Wed, Jun 5, 2013 at 1:58 PM, Saul Wold
> > >>     <sgw@linux.intel.com <mailto:sgw@linux.intel.com>
> > >>      > >>> <mailto:sgw@linux.intel.com <mailto:sgw@linux.intel.com>>>
> > >> wrote:
> > >>      > >>>
> > >>      > >>>     On 06/05/2013 09:32 AM, Nicolas Dechesne wrote:
> > >>      > >>>
> > >>      > >>>
> > >>      > >>>         On Wed, Jun 5, 2013 at 6:30 PM, Saul Wold
> > >>     <sgw@linux.intel.com <mailto:sgw@linux.intel.com>
> > >>      > >>>         <mailto:sgw@linux.intel.com <mailto:
> > >> sgw@linux.intel.com>>
> > >>      > >>>         <mailto:sgw@linux.intel.com
> > >>     <mailto:sgw@linux.intel.com> <mailto:sgw@linux.intel.com
> > >>     <mailto:sgw@linux.intel.com>>>**>
> > >>      > >>> wrote:
> > >>      > >>>
> > >>      > >>>              You could just directly put the nativesdk-libx11
> > >>     in place
> > >>      > >>>         of the
> > >>      > >>>              variable, no need to have the variable there.
> > >>      > >>>
> > >>      > >>>
> > >>      > >>>         yes, that's what I had initially, but found it was
> > >>     less easy to
> > >>      > >>>         read...
> > >>      > >>>         with X11DEPENDS it's more 'obvious' that there is
> > >>     something
> > >>      > >>>         special..
> > >>      > >>>         that said, i can make the change if that's really
> > >> needed.
> > >>      > >>>
> > >>      > >>>     We do use the X11DEPENDS elsewhere when there are multiple
> > >>      > >>>     dependencies, but I also found cases where we just
> > >>     include the
> > >>      > >>>     dependency directly in the test. I was trying pick a
> > >>     direction:
> > >>      > >>>     single entry no X11DEPENDS, multiple entries use
> > >> X11DEPENDS.
> > >>      > >>>
> > >>      > >>>     Comments, flames, ...
> > >>      > >>>
> > >>      > >>>
> > >>      > >>> Yes; I sent this patch in Febuary:
> > >>      > >>>
> > >>     http://patchwork.openembedded.****org/patch/44759/<http://**
> > >> patchwork.openembedded.org/**patch/44759/<http://patchwork.openembedded.org/patch/44759/>
> > >> >
> > >>      > >>>
> > >>      > >>> Please use this one instead of the recent one.
> > >>      > >>>
> > >>      > >>>
> > >>      > >> Well reading back on that, it looks like I was waiting for an
> > >>      > >> EXTRA_OECONF or related change to the autoconf scripts.
> > >>      > >>
> > >>      > >> Sau!
> > >>      > >
> > >>      > >
> > >>      > > hmm. ok, sorry Otavio, i missed the other patch. I will check
> > >>     on my side
> > >>      > > too about EXTRA_OECONF.
> > >>      > >
> > >>      >
> > >>      > Nicolas, don't worry. It is normal to end redoing some stuff.
> > >>      >
> > >>      > Last time I checked it had no support in Qt build system; I am
> > >>     not sure if
> > >>      > it uses or not the host headers (in case they exist) but it needs
> > >>     testing
> > >>      > to be sure.
> > >>
> > >>     I can confirm that it does not link against host X11 when built w/o
> > >> that
> > >>     dependency and nativesdk has no x11 libs/headers. As I previously
> > >>     mentioned,
> > >>     we've been using this fix for over 6 months on several releases built
> > >> on
> > >>     different machines w/o problems...
> > >>
> > >>
> > >> In this case the patch can be merged 'as is'.
> > >>
> > >>
> > > I am still concerned about a floating dependency here, imagine the
> > > following:
> > >
> > > Build the toolchain with X11 enabled, nativesdk-libx11 is build, now
> > > rebuild with X11 disabled, the dependency is gone, but the libraries and
> > > headers still exist in the sysroot and thus the configure will still enable
> > > x11 in qte, bad things happen.
> > >
> > 
> > I expect different distro features to have different build dirs. No?
> > 
> > 
> > > We need to have a disable flag to autotools.
> > >
> > 
> > The qmake based system does not provide this; so to support it, it will
> > need to be a hack ...
> 
> I agree with Otavio here - seems like you are after a rare corner case here...

We need determinism in the builds. Yes in this case it might be hard to
achieve but I do think we need to achieve it.

So this patch isn't going in until we can avoid this option magically
floating, sorry. I've said this before and I've not changed my mind.

Cheers,

Richard



