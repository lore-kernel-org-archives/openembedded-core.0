Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1QjFkU-0008I1-DV
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jul 2011 21:14:30 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 19 Jul 2011 12:10:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,229,1309762800"; d="scan'208";a="29509151"
Received: from unknown (HELO [10.255.14.85]) ([10.255.14.85])
	by orsmga001.jf.intel.com with ESMTP; 19 Jul 2011 12:10:23 -0700
From: Joshua Lock <josh@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>
Date: Tue, 19 Jul 2011 12:10:17 -0700
In-Reply-To: <4E25CD11.3090306@linux.intel.com>
References: <cover.1310511423.git.josh@linux.intel.com>
	<4E25CD11.3090306@linux.intel.com>
X-Mailer: Evolution 3.0.2 (3.0.2-3.fc15) 
Message-ID: <1311102623.2115.9.camel@scimitar>
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] Hob integration patches
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
X-List-Received-Date: Tue, 19 Jul 2011 19:14:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-07-19 at 11:29 -0700, Saul Wold wrote:
> On 07/12/2011 04:24 PM, Joshua Lock wrote:
> > Hob is the BitBake GUI I've been working on, the following pair of patches
> > make it a little more nicely integrated into OE-Core.
> >
> > The first adds a variable to image_types.bbclass that the GUI can use to
> > determine what image types are available.
> >
> > The second adds a wrapper script to call the GUI with a postfile, if the UI
> > can find hob.local.conf any configuration settings made in the UI will be
> > written to that file, rather than local.conf, ensuring that configuration
> > changes made in the GUI don't affect CLI builds.
> >
> > The following changes since commit a6e9edb7b4b5b0bdb067a59d691d33fba8948963:
> >
> >    sato-sdk: add clutter for sato-sdk image (2011-07-12 15:23:35 +0100)
> >
> > are available in the git repository at:
> >    git://git.openembedded.org/openembedded-core-contrib josh/hob
> >    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=josh/hob
> >
> > Joshua Lock (2):
> >    classes/image_types: add a variable to list available IMAGE_FSTYPE's
> >    scripts/hob: wrapper script to run hob gui with a UI specific config
> >      file
> >
> The scripts/hob patch has been merged, but the image_types is pending a 
> v2 I believe.

The v2 was already merged:
http://git.openembedded.org/cgit.cgi/openembedded-core/commit/?id=12600138721262ce02e9dd243bcf44e52e065179

Thanks,
Joshua
-- 
Joshua Lock
        Yocto Project "Johannes factotum"
        Intel Open Source Technology Centre



