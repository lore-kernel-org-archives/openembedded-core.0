Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RrzEd-00068I-Go
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Jan 2012 22:57:59 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 30 Jan 2012 13:50:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="118217501"
Received: from unknown (HELO [10.255.14.89]) ([10.255.14.89])
	by fmsmga002.fm.intel.com with ESMTP; 30 Jan 2012 13:50:05 -0800
Message-ID: <4F27108D.4090303@linux.intel.com>
Date: Mon, 30 Jan 2012 13:50:05 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111222 Thunderbird/9.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1327957970-15159-1-git-send-email-steve@sakoman.com>
In-Reply-To: <1327957970-15159-1-git-send-email-steve@sakoman.com>
Cc: Steve Sakoman <steve@sakoman.com>
Subject: Re: [PATCH v4 0/3] zypper: support signed repositories
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
X-List-Received-Date: Mon, 30 Jan 2012 21:57:59 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/30/2012 01:12 PM, Steve Sakoman wrote:
> The current zypper implementation does not work with signed repositories.
> This patch series adds recipes for the required packages as well as the
> necessary runtime dependencies to zypper.
>
> Tested on Gumstix Overo (OMAP3) with meta-openembedded layer enabled and
> a systemd based console image.
>
> Version 4 incorporates feedback from Koen Kooi, Saul Wold, Khem Raj, and
> Anders Darander
>   - adds runtime dependencies to existing RDEPENDS_${PN} of zypper
>   - removes duplicate recipe for libassuan
>   - moves recipes for gnupg and libksba to recipes-support
>   - adds dependency on libgpg-error for libksba
>   - cleans up LICENSE field
>
> Steve Sakoman (3):
>    libksba: add recipe for 1.2.0
>    gnupg: add recipe for 2.0.18

Steve, I am still reviewing this, and I need to to a build with 
non-GPLv3, since you might have added a dependency with zypper on a 
GPLv3 item, this will take me some checking.

You might want to prepare a patch and test with a GPLv2 version of gnupg 
as well.  This will not hold up this patch if we know the GPLv2 version 
is forth coming.

Thanks

Sau!

>    zypper: add missing runtime dependences on gzip and gnupg
>
>   meta/recipes-extended/zypper/zypper_git.bb    |    4 ++--
>   meta/recipes-support/gnupg/gnupg_2.0.18.bb    |   25 +++++++++++++++++++++++++
>   meta/recipes-support/libksba/libksba_1.2.0.bb |   12 ++++++++++++
>   3 files changed, 39 insertions(+), 2 deletions(-)
>   create mode 100644 meta/recipes-support/gnupg/gnupg_2.0.18.bb
>   create mode 100644 meta/recipes-support/libksba/libksba_1.2.0.bb
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


