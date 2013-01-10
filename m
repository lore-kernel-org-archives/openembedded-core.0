Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1TtIu3-0007O0-Bu
	for openembedded-core@lists.openembedded.org;
	Thu, 10 Jan 2013 15:14:58 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 10 Jan 2013 05:59:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,444,1355126400"; d="scan'208";a="275361530"
Received: from lpalcu-linux (HELO [10.237.105.165]) ([10.237.105.165])
	by fmsmga002.fm.intel.com with ESMTP; 10 Jan 2013 05:59:28 -0800
Message-ID: <50EEC93F.9060802@intel.com>
Date: Thu, 10 Jan 2013 15:59:27 +0200
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <50EC3002.8050209@intel.com>
	<CADkTA4NFq_EoFY8H800ewKQMWEOMjfroqT0t3okRKJz5jEYZzw@mail.gmail.com>
In-Reply-To: <CADkTA4NFq_EoFY8H800ewKQMWEOMjfroqT0t3okRKJz5jEYZzw@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: update-modules, do we need it anymore?
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
X-List-Received-Date: Thu, 10 Jan 2013 14:15:10 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 01/10/2013 03:45 PM, Bruce Ashfield wrote:
> 
> 
> 
> On Tue, Jan 8, 2013 at 9:41 AM, Laurentiu Palcu
> <laurentiu.palcu@intel.com <mailto:laurentiu.palcu@intel.com>> wrote:
> 
>     Hi all,
> 
>     While working on making all postinstalls run on host, I saw that we
>     still use update-modules script. However, neither the kmod modprobe nor
>     the busybox one read /etc/modules.conf file anymore which is created by
>     update-modules script. Both scan /etc/modprobe.d/*.conf files.
> 
>     So, does anybody know why do we still have it around? Most modern
>     distributions declared update-modules as obsolete and /etc/modules.conf
>     doesn't exist anymore. Am I missing something?
> 
> 
> I've been using the autoload functionality (not heavily, but from time
> to time) 
> that is currently tied to update-modules. I did a quick scan of the
> alternatives
> in oe-core, and didn't immediately see that the same thing is possible via
> kmod. Is that the case, or am I missing something as well ?
This autoload functionality seems to be provided by
/etc/init.d/modutils.sh which is explicitly called from update-modules
script. However, modutils.sh resides in modutils-initscripts.bb recipe.
So, I personally see not use for update-modules anymore...

Thanks,
Laurentiu
> 
> Cheers,
> 
> Bruce
>  
> 
> 
>     Thanks,
>     Laurentiu
> 
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> 
> 
> 
> 
> -- 
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"


