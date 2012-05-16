Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SUiiM-0004yI-68
	for openembedded-core@lists.openembedded.org;
	Wed, 16 May 2012 20:12:46 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 16 May 2012 11:02:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="141373577"
Received: from unknown (HELO [10.255.13.103]) ([10.255.13.103])
	by orsmga001.jf.intel.com with ESMTP; 16 May 2012 11:02:42 -0700
Message-ID: <4FB3EBC1.6090500@linux.intel.com>
Date: Wed, 16 May 2012 21:02:41 +0300
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <fa8d138dc96a622f36b8783457c375186a84e411.1336524034.git.raj.khem@gmail.com>
	<9ebe1b84f4b1497ed0469d13b3e768b85d4020da.1336524034.git.raj.khem@gmail.com>
In-Reply-To: <9ebe1b84f4b1497ed0469d13b3e768b85d4020da.1336524034.git.raj.khem@gmail.com>
Subject: Re: [PATCH 2/2] classes/mirrors.bbclass: Point snapshot.debian.org mirror to working location
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
X-List-Received-Date: Wed, 16 May 2012 18:12:46 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/09/2012 03:43 AM, Khem Raj wrote:
> If you point to snapshot.debian.net/archive/pool then it will fetch
> you a html page which will end up in corrupt download. The locations
> have changed for archives and here we point the mirror to right
> location.
>
> Signed-off-by: Khem Raj<raj.khem@gmail.com>
> ---
>   meta/classes/mirrors.bbclass |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/meta/classes/mirrors.bbclass b/meta/classes/mirrors.bbclass
> index bf23e05..86ccd7a 100644
> --- a/meta/classes/mirrors.bbclass
> +++ b/meta/classes/mirrors.bbclass
> @@ -1,5 +1,5 @@
>   MIRRORS += "\
> -${DEBIAN_MIRROR}/main	http://snapshot.debian.net/archive/pool \n \
> +${DEBIAN_MIRROR}/main	http://snapshot.debian.org/archive/debian-archive/20120328T092752Z/debian/pool/ \n \
>   ${DEBIAN_MIRROR}	ftp://ftp.de.debian.org/debian/pool \n \
>   ${DEBIAN_MIRROR}	ftp://ftp.au.debian.org/debian/pool \n \
>   ${DEBIAN_MIRROR}	ftp://ftp.cl.debian.org/debian/pool \n \

Merged into OE-Core

Thanks
	Sau!


