Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Q8OgL-00072c-AA
	for openembedded-core@lists.openembedded.org;
	Sat, 09 Apr 2011 05:17:54 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 08 Apr 2011 20:15:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.63,328,1299484800"; d="scan'208";a="907446025"
Received: from unknown (HELO [10.255.12.242]) ([10.255.12.242])
	by fmsmga001.fm.intel.com with ESMTP; 08 Apr 2011 20:15:42 -0700
Message-ID: <4D9FCF5D.8060202@linux.intel.com>
Date: Fri, 08 Apr 2011 20:15:41 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.10) Gecko/20100621 Fedora/3.0.5-1.fc13 Lightning/1.0b2pre
	Thunderbird/3.0.5
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1302137428.git.tom_rini@mentor.com>
In-Reply-To: <cover.1302137428.git.tom_rini@mentor.com>
Subject: Re: [PATCH 0/1] v2: Update ncurses
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
X-List-Received-Date: Sat, 09 Apr 2011 03:17:54 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


Tom,

I think your patch introduced the following problem when building 
qemux86 world build.

ERROR: -------------------
ERROR: ncurses-tools is listed in PACKAGES multiple times, this leads to 
packaging errors.
ERROR: Please fix the metadata/report this as bug to OE bugtracker.
ERROR: -------------------
ERROR: -------------------
ERROR: ncurses-terminfo is listed in PACKAGES multiple times, this leads 
to packaging errors.
ERROR: Please fix the metadata/report this as bug to OE bugtracker.
ERROR: -------------------

Sau!

On 04/06/2011 05:50 PM, Tom Rini wrote:
> This updates ncurses to 5.9.  While less of a deal for oe-core where we
> had the patch we applied on top of 5.7 mirrored and referenced that
> openembedded.master did not and the patch recently went away.  Fortunately
> there's now a 5.8 and 5.9 release of ncurses and our 5.7 + patch was
> close to 5.8 making this an easy update.  While at this we move most of
> the important parts of ncurses_5.x.bb into ncurses.inc which has previously
> been unused.  Finally, we add a comment saying that invisible-island.net
> may have useful additional patches.
>
> Pull URL: git://git.openembedded.org/openembedded-core-contrib
>    Branch: trini/update-ncurses
>    Browse: http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=trini/update-ncurses
>
> Thanks,
>      Tom Rini<tom_rini@mentor.com>
> ---
>
>
> Tom Rini (1):
>    ncurses: Update to 5.9
>
>   .../{ncurses-5.7 =>  ncurses-5.9}/config.cache      |    0
>   .../{ncurses-5.7 =>  ncurses-5.9}/tic-hang.patch    |    0
>   meta/recipes-core/ncurses/ncurses.inc              |  256 +++++++++++++++-----
>   meta/recipes-core/ncurses/ncurses_5.7.bb           |  246 -------------------
>   meta/recipes-core/ncurses/ncurses_5.9.bb           |   10 +
>   5 files changed, 204 insertions(+), 308 deletions(-)
>   rename meta/recipes-core/ncurses/{ncurses-5.7 =>  ncurses-5.9}/config.cache (100%)
>   rename meta/recipes-core/ncurses/{ncurses-5.7 =>  ncurses-5.9}/tic-hang.patch (100%)
>   delete mode 100644 meta/recipes-core/ncurses/ncurses_5.7.bb
>   create mode 100644 meta/recipes-core/ncurses/ncurses_5.9.bb
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


