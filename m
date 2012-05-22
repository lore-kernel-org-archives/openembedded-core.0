Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SWqZ4-0000UX-8x
	for openembedded-core@lists.openembedded.org;
	Tue, 22 May 2012 16:59:58 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 22 May 2012 07:49:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="155692574"
Received: from unknown (HELO helios.localnet) ([10.252.120.151])
	by fmsmga001.fm.intel.com with ESMTP; 22 May 2012 07:49:44 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Andreas Oberritter <obi@opendreambox.org>
Date: Tue, 22 May 2012 15:49:43 +0100
Message-ID: <7503511.eEOeCZTR2f@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.2 (Linux/3.2.0-24-generic-pae; KDE/4.8.2; i686; ; )
In-Reply-To: <4FBB9E6C.6030509@opendreambox.org>
References: <1337686647-1027-1-git-send-email-obi@opendreambox.org>
	<1823492.ykGXyerc6j@helios> <4FBB9E6C.6030509@opendreambox.org>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] qt4(-embedded).inc: create variables to ease overriding
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
X-List-Received-Date: Tue, 22 May 2012 14:59:58 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 22 May 2012 16:10:52 Andreas Oberritter wrote:
> No need to hurry. I'll keep using my patch in my denzil-based branch
> anyway, because denzil-next is unlikely to include either variant.
> 
> I'm not a big fan of PACKAGECONFIG. Its syntax is hard to read and hard
> to write, maybe unless you're the inventor of it.

Can you suggest an alternative syntax that we could have consistent across 
multiple recipes and handles adding/removing DEPENDS as well as configure 
options? That is what it attempts to provide.
 
> Looking for users of PACKAGECONFIG in OE-Core denzil, I saw it's used in
> only 6 recipes. Even less in meta-openembedded (exactly 1). It looks
> like it's not going to get adopted by many. So your statement about
> taking away newly created variables in the near future is not
> necessarily going to become true.

It's still pretty new. Besides, we haven't exactly gone out on a program of 
adding it everywhere there is a configuration option for something - we only 
add it on an as-needed basis.

> Besides that, introducing a new PACKAGECONFIG variable for Qt, that
> includes new flags for basically everything already in QT_CONFIG_FLAGS,
> doesn't seem to be an improvement.

It is now our standard way of switching on and off features particularly where 
those features imply a change to DEPENDS.
 
> Furthermore, as I understand it, PACKAGECONFIG handles only simple
> on/off switches, but QT_CONFIG_FLAGS has switches for
> on/off/plugin/system etc., and not everything you can build into qt can
> be built as a plugin and vice versa, so the resulting set of
> PACKAGECONFIG flags will likely become quite huge in order to be able to
> express all options.

So this might present a problem I agree. Perhaps PACKAGECONFIG is not going to 
work here. I dislike however that we would have the ability to configure these 
options and yet there is no management of DEPENDS to match.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


