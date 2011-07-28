Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QmE9k-0005Zq-5W
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jul 2011 02:08:52 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 27 Jul 2011 17:04:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,279,1309762800"; d="scan'208";a="32872917"
Received: from unknown (HELO [10.255.14.61]) ([10.255.14.61])
	by orsmga001.jf.intel.com with ESMTP; 27 Jul 2011 17:04:36 -0700
Message-ID: <4E30A793.4080202@linux.intel.com>
Date: Wed, 27 Jul 2011 17:04:35 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1311604062-14337-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
In-Reply-To: <1311604062-14337-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
	Enrico Scholz <enrico.scholz@informatik.tu-chemnitz.de>
Subject: Re: [PATCH] console-tools: removed wildcard from SRC_URI
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
X-List-Received-Date: Thu, 28 Jul 2011 00:08:52 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/25/2011 07:27 AM, Enrico Scholz wrote:
> From: Enrico Scholz<enrico.scholz@informatik.tu-chemnitz.de>
>
> Wildcards in SRC_URI are not supported by oe-core and work only
> when last (or first?) FILESPATH element points to the containing
> directory. Specifying plain dir works fine for this recipe.
>
> Signed-off-by: Enrico Scholz<enrico.scholz@informatik.tu-chemnitz.de>
> ---
>   .../console-tools/console-tools_0.3.2.bb           |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-core/console-tools/console-tools_0.3.2.bb b/meta/recipes-core/console-tools/console-tools_0.3.2.bb
> index 5b09105..7baace6 100644
> --- a/meta/recipes-core/console-tools/console-tools_0.3.2.bb
> +++ b/meta/recipes-core/console-tools/console-tools_0.3.2.bb
> @@ -11,7 +11,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/lct/console-tools-${PV}.tar.gz \
>              file://compile.patch;patch=1 \
>              file://kbdrate.patch;patch=1 \
>              file://uclibc-fileno.patch;patch=1 \
> -           file://config/*.m4"
> +           file://config"
>
>   SRC_URI[md5sum] = "bf21564fc38b3af853ef724babddbacd"
>   SRC_URI[sha256sum] = "eea6b441672dacd251079fc85ed322e196282e0e66c16303ec64c3a2b1c126c2"

Merged into OE-Core

Thanks
	Sau!


