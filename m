Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1QHmf6-0000hF-8T
	for openembedded-core@lists.openembedded.org;
	Thu, 05 May 2011 02:43:25 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 04 May 2011 17:40:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,317,1301900400"; d="scan'208";a="918164884"
Received: from shxpwgzhai1a.ccr.corp.intel.com (HELO [10.239.48.130])
	([10.239.48.130])
	by fmsmga001.fm.intel.com with ESMTP; 04 May 2011 17:40:43 -0700
Message-ID: <4DC1F20A.4000906@intel.com>
Date: Thu, 05 May 2011 08:40:42 +0800
From: "Zhai, Edwin" <edwin.zhai@intel.com>
User-Agent: Thunderbird 2.0.0.17 (Windows/20080914)
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <BANLkTi=f-GL8RbJLCAikFTtkON5C9NDvDw@mail.gmail.com>	<4DBF4F26.90404@intel.com>	<BANLkTimUw9+kWHwdw5dZ0=kUZuNSsorsdA@mail.gmail.com>	<4DC03C43.8080507@windriver.com>
	<4DC04CCA.2030100@intel.com>
	<BANLkTikmGcS4hJY0+vmo-sGTTurFbY6HuQ@mail.gmail.com>
In-Reply-To: <BANLkTikmGcS4hJY0+vmo-sGTTurFbY6HuQ@mail.gmail.com>
Subject: Re: qemu segfaulting when booting ext3 image
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
X-List-Received-Date: Thu, 05 May 2011 00:43:25 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Raj,
We have a bug for Nvidia driver @ 
http://bugzilla.pokylinux.org/show_bug.cgi?id=649
and a fix @
http://git.pokylinux.org/cgit.cgi/poky-contrib/commit/?h=gzhai/fix2&id=f596757000465a4b8350e16f21553a23b8bbedfa

I think it deserves a try.

BTW, where is your gl library, including original one and Nvidia's? I 
doubt the layout may changes in ubuntu 11.04, so that our code failed to 
detect it.

Thanks,
edwin


Khem Raj wrote:
>
> On Tue, May 3, 2011 at 11:43 AM, Scott Garman 
> <scott.a.garman@intel.com> wrote:
> > On 05/03/2011 10:32 AM, Mark Hatle wrote:
> >>
> >> On 5/3/11 12:27 PM, Khem Raj wrote:
> >>>
> >>> On Mon, May 2, 2011 at 5:41 PM, Zhai, Edwin<edwin.zhai@intel.com> 
>  wrote:
> >>>>
> >>>> Did you installed Nvidia proprietary driver? Any error mesg from the
> >>>> runqemu
> >>>> script?
> >>>
> >>> yes I did and I think that could be a culprit but then why would it
> >>> work with nfs boot.
> >>> there is no useful message from script it just collapses
> >>
> >> The script tries to detect the nvidia drivers.  If it finds them is
> >> supposed to
> >> issue a warning.  Sounds like your system might not have a version 
> that it
> >> knows
> >> how to detect.
> >
> > The Nvidia libGL bug caused a segfault in qemu when booting images, 
> so it
> > should be pretty obvious if that's what's causing it.
> >
> > Given that Khem is booting the nfs version successfully, and not 
> seeing any
> > error message, I think this might be a new error.
> >
>
> the host system is 64-bit kubuntu 11.04 with nvidia proprietary
> drivers. IIRC it worked fine without them but that was a month back.
>
>
> > Scott
> >
> > --
> > Scott Garman
> > Embedded Linux Engineer - Yocto Project
> > Intel Open Source Technology Center
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> >
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


