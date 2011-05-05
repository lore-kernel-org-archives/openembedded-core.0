Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1QHs8M-0001e0-6i
	for openembedded-core@lists.openembedded.org;
	Thu, 05 May 2011 08:33:59 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 04 May 2011 23:31:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,318,1301900400"; d="scan'208";a="742635215"
Received: from shxpwgzhai1a.ccr.corp.intel.com (HELO [10.239.48.130])
	([10.239.48.130])
	by orsmga001.jf.intel.com with ESMTP; 04 May 2011 23:31:17 -0700
Message-ID: <4DC24434.6000209@intel.com>
Date: Thu, 05 May 2011 14:31:16 +0800
From: "Zhai, Edwin" <edwin.zhai@intel.com>
User-Agent: Thunderbird 2.0.0.17 (Windows/20080914)
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <BANLkTi=f-GL8RbJLCAikFTtkON5C9NDvDw@mail.gmail.com>	<4DBF4F26.90404@intel.com>	<BANLkTimUw9+kWHwdw5dZ0=kUZuNSsorsdA@mail.gmail.com>	<4DC03C43.8080507@windriver.com>
	<4DC04CCA.2030100@intel.com>	<BANLkTikmGcS4hJY0+vmo-sGTTurFbY6HuQ@mail.gmail.com>	<4DC1F20A.4000906@intel.com>
	<BANLkTimpqOp2+AjNJFqsyA4JVfJmbuToSw@mail.gmail.com>
In-Reply-To: <BANLkTimpqOp2+AjNJFqsyA4JVfJmbuToSw@mail.gmail.com>
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
X-List-Received-Date: Thu, 05 May 2011 06:33:59 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit



Khem Raj wrote:
>
> On Wed, May 4, 2011 at 5:40 PM, Zhai, Edwin <edwin.zhai@intel.com> wrote:
> > Raj,
> > We have a bug for Nvidia driver @
> > http://bugzilla.pokylinux.org/show_bug.cgi?id=649
> > and a fix @
> > 
> http://git.pokylinux.org/cgit.cgi/poky-contrib/commit/?h=gzhai/fix2&id=f596757000465a4b8350e16f21553a23b8bbedfa 
> <http://git.pokylinux.org/cgit.cgi/poky-contrib/commit/?h=gzhai/fix2&id=f596757000465a4b8350e16f21553a23b8bbedfa> 
>
> >
> > I think it deserves a try.
> >
> > BTW, where is your gl library, including original one and Nvidia's? 
> I doubt
> > the layout may changes in ubuntu 11.04, so that our code failed to 
> detect
> > it.
>
> yes this helps indeed. Please propose this patch for oe-core's
> scripts/runqemu-internal
>

After discussion, we found this patch only works for Ubuntu(Fedora 
installed Nvidia driver in different way), and there is no elegant fix 
for all distribution. So we decided that just give out useful info and 
let end user to do the right thing for their own distribution.

> Thanks
> -Khem
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


