Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SCBMP-0000HL-V6
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Mar 2012 16:57:30 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 26 Mar 2012 07:48:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="133232939"
Received: from unknown (HELO helios.localnet) ([10.252.123.240])
	by fmsmga001.fm.intel.com with ESMTP; 26 Mar 2012 07:48:28 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Andreas Oberritter <obi@opendreambox.org>
Date: Mon, 26 Mar 2012 15:48:24 +0100
Message-ID: <5951957.sAPiJHEkf3@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.0 (Linux/3.0.0-16-generic-pae; KDE/4.8.1; i686; ; )
In-Reply-To: <4F707F4E.1060908@opendreambox.org>
References: <1332250625-18091-1-git-send-email-obi@opendreambox.org>
	<4F7044F5.30500@opendreambox.org>
	<4F707F4E.1060908@opendreambox.org>
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] scripts/bitbake: Allow to override path to pseudodone, make BUILDDIR optional
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
X-List-Received-Date: Mon, 26 Mar 2012 14:57:30 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 26 March 2012 16:38:06 Andreas Oberritter wrote:
> OK, I managed to find a way that's ok for me. I added a wrapper script that
> wraps the bitbake wrapper script and sets BUILDDIR automatically.

I'm actually working on a couple of fixes that should work for your setup right 
now. If you can wait a little the patches will get posted soon. No additional 
wrapper scripts necessary.

> This way I can als get rid of oe-core/scripts from PATH.

I don't think this is a good idea. If it doesn't cause breakage now I'd be 
surprised if it didn't in the future.

> Can you please ack this patch below, though? This keeps your change intact
> and surely causes no trouble for you.

This won't be necessary with the fixes I have. The directory where the 
"pseudodone" file is located is supposed to be your build directory, there's no 
need to configure it.

Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


