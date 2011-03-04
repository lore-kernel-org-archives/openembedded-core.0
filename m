Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1PvJOp-00036c-Q0
	for openembedded-core@lists.openembedded.org;
	Fri, 04 Mar 2011 02:01:44 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 03 Mar 2011 16:59:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.62,261,1297065600"; d="scan'208";a="663674692"
Received: from shxpwgzhai1a.ccr.corp.intel.com (HELO [10.239.48.130])
	([10.239.48.130])
	by fmsmga002.fm.intel.com with ESMTP; 03 Mar 2011 16:58:56 -0800
Message-ID: <4D703953.8040000@intel.com>
Date: Fri, 04 Mar 2011 08:58:59 +0800
From: "Zhai, Edwin" <edwin.zhai@intel.com>
User-Agent: Thunderbird 2.0.0.17 (Windows/20080914)
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1299182375.git.sgw@linux.intel.com>	<e5662d07e615cfa5879a5d700df2d1e9049a6413.1299182375.git.sgw@linux.intel.com>
	<AANLkTi=aQ=HYbPrXd98qvxYC=voFhf0AJMsse5bcrp3M@mail.gmail.com>
In-Reply-To: <AANLkTi=aQ=HYbPrXd98qvxYC=voFhf0AJMsse5bcrp3M@mail.gmail.com>
X-Mailman-Approved-At: Fri, 04 Mar 2011 10:03:32 +0100
Cc: openembedded-core@lists.openembedded.org, poky@yoctoproject.org
Subject: Re: [poky] [PATCH 03/10] sato-icon-theme: Explictly use "Sato" as gtk icon theme
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
X-List-Received-Date: Fri, 04 Mar 2011 01:01:44 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



Khem Raj wrote:
>
>
> > --- a/meta/recipes-sato/sato-icon-theme/sato-icon-theme.inc
> > +++ b/meta/recipes-sato/sato-icon-theme/sato-icon-theme.inc
> > @@ -16,9 +16,12 @@ PACKAGE_ARCH = "all"
> >
> >  EXTRA_OECONF += 
> "--with-iconmap=${STAGING_LIBDIR_NATIVE}/../libexec/icon-name-mapping"
> >
> > +#explictly setting "Sato" as default icon theme to avoid icon 
> missing due to
> > +#tricky race condition
> >  pkg_postinst_${PN} () {
> >         if [ "x$D" != "x" ]; then
> >                 exit 1
> >         fi
> >         gtk-update-icon-cache -q /usr/share/icons/Sato
> > +        echo 'gtk-icon-theme-name = "Sato"' >> /etc/gtk-2.0/gtkrc
>
> what would happen if you reinstalled this packge again I guess it
> would keep appending right ?
>

I think postinst only got called via init script on 1st boot of the 
image, so it should be okay.

>
> >  }
> > --
> > 1.7.1.1
> >
> > _______________________________________________
> > poky mailing list
> > poky@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/poky
> >
> _______________________________________________
> poky mailing list
> poky@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/poky
>


