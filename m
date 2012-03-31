Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SE0ds-0005nf-K6
	for openembedded-core@lists.openembedded.org;
	Sat, 31 Mar 2012 17:55:04 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 31 Mar 2012 08:45:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="136008800"
Received: from unknown (HELO helios.localnet) ([10.252.123.233])
	by fmsmga001.fm.intel.com with ESMTP; 31 Mar 2012 08:45:57 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 31 Mar 2012 16:45:56 +0100
Message-ID: <2542745.0CB1lCEMpW@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.0 (Linux/3.0.0-17-generic-pae; KDE/4.8.1; i686; ; )
In-Reply-To: <cover.1332848153.git.paul.eggleton@linux.intel.com>
References: <cover.1332848153.git.paul.eggleton@linux.intel.com>
MIME-Version: 1.0
Subject: Re: [PATCH 0/3] Fixes for bitbake wrapper script
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
X-List-Received-Date: Sat, 31 Mar 2012 15:55:04 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 27 March 2012 12:50:07 Paul Eggleton wrote:
> Andreas, if you could review these that would be much appreciated.
> 
> 
> The following changes since commit 644b7503c37fd73730dd3d7841463b158b8934ed:
> 
>   guile: Deal with hardcoded path issues (2012-03-27 00:28:41 +0100)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib paule/builddir
>  
> http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paul
> e/builddir
> 
> Paul Eggleton (3):
>   scripts/bitbake: try harder to check if pseudo exists
>   scripts/bitbake: allow switching between build directories
>   scripts/bitbake: add/fix some comments
> 
>  scripts/bitbake |   43 ++++++++++++++++++++++++++++++++-----------
>  1 files changed, 32 insertions(+), 11 deletions(-)

FYI I've rebased this patch on top of Mark's recent bitbake wrapper script 
changes that are now in master.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


