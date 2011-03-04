Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1PvJWm-0003EI-PI
	for openembedded-core@lists.openembedded.org;
	Fri, 04 Mar 2011 02:09:57 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 03 Mar 2011 17:07:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.62,261,1297065600"; d="scan'208";a="608889487"
Received: from shxpwgzhai1a.ccr.corp.intel.com (HELO [10.239.48.130])
	([10.239.48.130])
	by orsmga002.jf.intel.com with ESMTP; 03 Mar 2011 17:05:49 -0800
Message-ID: <4D703AEF.4060905@intel.com>
Date: Fri, 04 Mar 2011 09:05:51 +0800
From: "Zhai, Edwin" <edwin.zhai@intel.com>
User-Agent: Thunderbird 2.0.0.17 (Windows/20080914)
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1299192495.git.sgw@linux.intel.com>	
	<732c81e35c4936d54c7fb495420cbb5c67c474ba.1299192495.git.sgw@linux.intel.com>
	<1299194668.17567.181.camel@rex>
In-Reply-To: <1299194668.17567.181.camel@rex>
X-Mailman-Approved-At: Fri, 04 Mar 2011 10:03:32 +0100
Cc: poky@yoctoproject.org, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 03/10] sato-icon-theme: Explictly use "Sato" as gtk icon theme
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
X-List-Received-Date: Fri, 04 Mar 2011 01:09:57 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



Richard Purdie wrote:
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
> >          if [ "x$D" != "x" ]; then
> >                  exit 1
> >          fi
> >          gtk-update-icon-cache -q /usr/share/icons/Sato
> > +        echo 'gtk-icon-theme-name = "Sato"' >> /etc/gtk-2.0/gtkrc
> >  }
>
> I've deliberately merged the previous version of this patch as this one
> wipes out any contents of the file! I can live with duplicate lines for
> now.
>
> I'd like the bug to remain open on this one as this is a workaround, not
> a proper fix for the problem. It can change priority/target milestone
> though.
>

Agree.  We can revisit it in future. It is very hard for reproducing and 
debugging.
 
>
> Cheers,
>
> Richard
>


