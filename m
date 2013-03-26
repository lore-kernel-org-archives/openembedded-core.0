Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UKYT1-0002QX-EZ
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Mar 2013 19:20:15 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 26 Mar 2013 11:00:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,913,1355126400"; d="scan'208";a="307712304"
Received: from unknown (HELO helios.localnet) ([10.255.13.152])
	by orsmga002.jf.intel.com with ESMTP; 26 Mar 2013 11:02:25 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 26 Mar 2013 18:02:24 +0000
Message-ID: <4660079.3r9XkPrOEm@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.1 (Linux/3.5.0-26-generic; KDE/4.10.1; i686; ; )
In-Reply-To: <20130326175514.GK7539@jama>
References: <cover.1363156578.git.Qi.Chen@windriver.com>
	<5482882.4phbAeRO1n@helios> <20130326175514.GK7539@jama>
MIME-Version: 1.0
Cc: qingtao.cao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] rm_work.bbclass: inhibit rm_work per recipe
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
X-List-Received-Date: Tue, 26 Mar 2013 18:20:30 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 26 March 2013 18:55:14 Martin Jansa wrote:
> On Tue, Mar 26, 2013 at 05:12:16PM +0000, Paul Eggleton wrote:
> > On Wednesday 13 March 2013 15:01:33 Qi.Chen@windriver.com wrote:
> > > From: Chen Qi <Qi.Chen@windriver.com>
> > > 
> > > Use RM_WORK_WHITELIST to inhibit rm_work per recipe. In this way,
> > > one can use rm_work for the most of the recipes but still keep the
> > > work area for the recipe(s) one is working on.
> > > 
> > > As an example, the following settings in local.conf will inhibit
> > > rm_work for icu-native, icu and busybox.
> > > 
> > >     INHERIT += "rm_work"
> > >     RM_WORK_WHITELIST += "icu-native icu busybox"
> > > 
> > > If we comment out the RM_WORK_WHITELIST line and do a rebuild, the
> > > working area of these recipes will be cleaned up.
> > 
> > This is a great feature, but I just looked at it and realised that the
> > term
> > "whitelist" isn't really correct - this is more of a blacklist.
> > 
> > The question is does it matter? If so we should probably change it now
> > before it becomes too hard to change...
> 
> I got similar question yesterday about BB_HASHBASE_WHITELIST:
> 
> 'And why is it called "WHITELIST"? Shouldn't things that are excluded be
> in a "BLACKLIST"?'
> 
> Maybe term WHITELIST isn't correct in both of them, at least they are
> consistent as it is now :)

You may well be right... BB_HASHBASE_WHITELIST has been around for so long 
though that I don't think we could consider changing it.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


