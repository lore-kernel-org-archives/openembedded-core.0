Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 37C266041D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Jun 2013 20:53:58 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 05 Jun 2013 13:53:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,809,1363158000"; d="scan'208";a="251165133"
Received: from unknown (HELO [10.255.13.19]) ([10.255.13.19])
	by AZSMGA002.ch.intel.com with ESMTP; 05 Jun 2013 13:53:57 -0700
Message-ID: <51AFA565.3040607@linux.intel.com>
Date: Wed, 05 Jun 2013 13:53:57 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>
References: <1370417067-30166-1-git-send-email-nicolas.dechesne@linaro.org>
	<51AF67B8.20502@linux.intel.com>
	<CAP71WjzSHWmKYLTs3_Ao6Mt_sKnUdNCHM3dSMSs8FpKbVyuCoQ@mail.gmail.com>
	<51AF6E2F.8040309@linux.intel.com>
	<CAP9ODKrxMh3PGGwVHdVFcUL2-Ag4vA2bAKr+3PGKGNDzwMJnpg@mail.gmail.com>
	<51AF7336.8050802@linux.intel.com>
	<CAP71WjxL2g=k5hcgAo70Linsf-Occ-tdh1jM+ppYmghALDsq3w@mail.gmail.com>
	<CAP9ODKqiVaF3njGCLXHhT7n03d-QyESQAdw3S+HF2-JNEazCMw@mail.gmail.com>
	<20130605200740.GF10298@denix.org>
	<CAP9ODKr+SnNDEZJ4ON-fDpyZdjOTdVu+9=trCyEpmvHZa5AiwA@mail.gmail.com>
In-Reply-To: <CAP9ODKr+SnNDEZJ4ON-fDpyZdjOTdVu+9=trCyEpmvHZa5AiwA@mail.gmail.com>
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
X-List-Received-Date: Wed, 05 Jun 2013 20:53:58 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/05/2013 01:10 PM, Otavio Salvador wrote:
>
>
>
> On Wed, Jun 5, 2013 at 5:07 PM, Denys Dmytriyenko <denis@denix.org
> <mailto:denis@denix.org>> wrote:
>
>     On Wed, Jun 05, 2013 at 02:43:07PM -0300, Otavio Salvador wrote:
>      > On Wed, Jun 5, 2013 at 2:23 PM, Nicolas Dechesne <
>      > nicolas.dechesne@linaro.org <mailto:nicolas.dechesne@linaro.org>>
>     wrote:
>      >
>      > >
>      > >
>      > >
>      > > On Wed, Jun 5, 2013 at 7:19 PM, Saul Wold <sgw@linux.intel.com
>     <mailto:sgw@linux.intel.com>> wrote:
>      > >
>      > >> On 06/05/2013 10:12 AM, Otavio Salvador wrote:
>      > >>
>      > >>>
>      > >>>
>      > >>>
>      > >>> On Wed, Jun 5, 2013 at 1:58 PM, Saul Wold
>     <sgw@linux.intel.com <mailto:sgw@linux.intel.com>
>      > >>> <mailto:sgw@linux.intel.com <mailto:sgw@linux.intel.com>>> wrote:
>      > >>>
>      > >>>     On 06/05/2013 09:32 AM, Nicolas Dechesne wrote:
>      > >>>
>      > >>>
>      > >>>         On Wed, Jun 5, 2013 at 6:30 PM, Saul Wold
>     <sgw@linux.intel.com <mailto:sgw@linux.intel.com>
>      > >>>         <mailto:sgw@linux.intel.com <mailto:sgw@linux.intel.com>>
>      > >>>         <mailto:sgw@linux.intel.com
>     <mailto:sgw@linux.intel.com> <mailto:sgw@linux.intel.com
>     <mailto:sgw@linux.intel.com>>>>
>      > >>> wrote:
>      > >>>
>      > >>>              You could just directly put the nativesdk-libx11
>     in place
>      > >>>         of the
>      > >>>              variable, no need to have the variable there.
>      > >>>
>      > >>>
>      > >>>         yes, that's what I had initially, but found it was
>     less easy to
>      > >>>         read...
>      > >>>         with X11DEPENDS it's more 'obvious' that there is
>     something
>      > >>>         special..
>      > >>>         that said, i can make the change if that's really needed.
>      > >>>
>      > >>>     We do use the X11DEPENDS elsewhere when there are multiple
>      > >>>     dependencies, but I also found cases where we just
>     include the
>      > >>>     dependency directly in the test. I was trying pick a
>     direction:
>      > >>>     single entry no X11DEPENDS, multiple entries use X11DEPENDS.
>      > >>>
>      > >>>     Comments, flames, ...
>      > >>>
>      > >>>
>      > >>> Yes; I sent this patch in Febuary:
>      > >>>
>     http://patchwork.openembedded.**org/patch/44759/<http://patchwork.openembedded.org/patch/44759/>
>      > >>>
>      > >>> Please use this one instead of the recent one.
>      > >>>
>      > >>>
>      > >> Well reading back on that, it looks like I was waiting for an
>      > >> EXTRA_OECONF or related change to the autoconf scripts.
>      > >>
>      > >> Sau!
>      > >
>      > >
>      > > hmm. ok, sorry Otavio, i missed the other patch. I will check
>     on my side
>      > > too about EXTRA_OECONF.
>      > >
>      >
>      > Nicolas, don't worry. It is normal to end redoing some stuff.
>      >
>      > Last time I checked it had no support in Qt build system; I am
>     not sure if
>      > it uses or not the host headers (in case they exist) but it needs
>     testing
>      > to be sure.
>
>     I can confirm that it does not link against host X11 when built w/o that
>     dependency and nativesdk has no x11 libs/headers. As I previously
>     mentioned,
>     we've been using this fix for over 6 months on several releases built on
>     different machines w/o problems...
>
>
> In this case the patch can be merged 'as is'.
>

I am still concerned about a floating dependency here, imagine the 
following:

Build the toolchain with X11 enabled, nativesdk-libx11 is build, now 
rebuild with X11 disabled, the dependency is gone, but the libraries and 
headers still exist in the sysroot and thus the configure will still 
enable x11 in qte, bad things happen.

We need to have a disable flag to autotools.

Thanks
	Sau!

> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br http://projetos.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

