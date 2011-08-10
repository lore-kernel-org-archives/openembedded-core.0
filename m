Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1QrDGK-0003uU-6a
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Aug 2011 20:12:16 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 10 Aug 2011 11:07:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="37785757"
Received: from unknown (HELO [10.255.14.222]) ([10.255.14.222])
	by fmsmga002.fm.intel.com with ESMTP; 10 Aug 2011 11:07:43 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Aug 2011 11:07:38 -0700
In-Reply-To: <0C67B7D5-11F2-45F4-AD8F-F43F508CD784@kernel.crashing.org>
References: <0C67B7D5-11F2-45F4-AD8F-F43F508CD784@kernel.crashing.org>
X-Mailer: Evolution 3.0.2 (3.0.2-3.fc15) 
Message-ID: <1312999663.2351.0.camel@scimitar>
Mime-Version: 1.0
Subject: Re: sscache signature?
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
X-List-Received-Date: Wed, 10 Aug 2011 18:12:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-08-10 at 12:51 -0500, Kumar Gala wrote:
> the yocto wiki references mentions a bitbake-diffsigs
> 
> https://wiki.yoctoproject.org/wiki/Enable_sstate_cache
> 
> but not seeing that.  How can one compare signature or try and figure out why a cache item isn't being reused between cfgs.

Not seeing the program? 

It's bitbake/bin/bitbake-diffsigs and should be in your PATH if you're
in your oe-init-build-env'd environment.

Cheers,
Joshua
-- 
Joshua Lock
        Yocto Project "Johannes factotum"
        Intel Open Source Technology Centre



