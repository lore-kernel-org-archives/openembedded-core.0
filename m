Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1SNgVL-0007wt-N1
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Apr 2012 10:26:15 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 27 Apr 2012 01:16:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="93764105"
Received: from edwin-gen.sh.intel.com (HELO edwin-gen) ([10.239.36.17])
	by AZSMGA002.ch.intel.com with SMTP; 27 Apr 2012 01:16:34 -0700
Received: by edwin-gen (sSMTP sendmail emulation);
	Fri, 27 Apr 2012 16:20:09 +0800
Date: Fri, 27 Apr 2012 16:20:09 +0800
From: "Zhai, Edwin" <edwin.zhai@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120427082009.GH1450@edwin-gen>
References: <20120426075321.GG1450@edwin-gen>
MIME-Version: 1.0
In-Reply-To: <20120426075321.GG1450@edwin-gen>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: Pango multilib issue
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
X-List-Received-Date: Fri, 27 Apr 2012 08:26:16 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments?
I'd like a agreement before any patch:)

Thanks,
Edwin


On Thu, Apr 26, 2012 at 03:53:22PM +0800, Zhai, Edwin wrote:
> RP,
> 
> I have found one common issues for multilib when system config file differ 
> between multilibs.
> 
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=2356
> This bug caused by modules mechanism in pango:
> 
> pango utils, pango-querymodules produce a system config file to indicate where
> to find the modules when 1st boot, like /usr/{lib64|lib}/pango/1.6.0/modules/
> for {x86-64|lib32}-pango respectively. 
> 
> When installing lib32-pango on sato-image-qemux86-64, lib32 version of
> pango-querymodules override x86-64 version and produce a system config file
> with path for lib32 version of modules. Then x86-64 matchbox-desktop failed to
> open these modules and loaded corrupted fonts.
> 
> To resolve this conflict, one possible solution is put the config file and 
> binary under different dir: $LIBDIR for config file, and 
> /usr/{libexec|lib64exec} for config binary(or create different dir under 
> /usr/bin/ for different multilib)
> 
> Any comments for this?
> 
> Thanks,
> 
> 
> -- 
> best rgds,
> edwin
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

-- 
best rgds,
edwin


