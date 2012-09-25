Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TGWH4-0004Yr-0Z
	for openembedded-core@lists.openembedded.org;
	Tue, 25 Sep 2012 16:38:10 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1TGW4g-0005dD-Ne; Tue, 25 Sep 2012 16:25:22 +0200
From: Phil Blundell <philb@gnu.org>
To: Saul Wold <sgw@linux.intel.com>
Date: Tue, 25 Sep 2012 15:25:21 +0100
In-Reply-To: <bbc5129ecdec37a4ebf62f3b43e0f0e0a64210f9.1311232435.git.sgw@linux.intel.com>
References: <cover.1311232435.git.sgw@linux.intel.com>
	<bbc5129ecdec37a4ebf62f3b43e0f0e0a64210f9.1311232435.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1348583122.31293.76.camel@phil-desktop>
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/1] gettext: Add depends to gettext to avoid host contamination
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
X-List-Received-Date: Tue, 25 Sep 2012 14:38:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Can you clarify what exactly is the host contamination issue here?  I
don't quite understand why it's appropriate for the target gettext to be
depending on libxml2-native (which it presumably can't be linking
against).  Also, since gettext-native is configured --with-included-xml,
it doesn't seem as though that one is going to be using libxml2-native
in any meaningful sense either.

thanks

p.

On Thu, 2011-07-21 at 00:15 -0700, Saul Wold wrote:
> [YOCTO #1242]
> 
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  meta/recipes-core/gettext/gettext_0.18.1.1.bb |    6 +++---
>  1 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/recipes-core/gettext/gettext_0.18.1.1.bb b/meta/recipes-core/gettext/gettext_0.18.1.1.bb
> index 0b11a90..cc0129f 100644
> --- a/meta/recipes-core/gettext/gettext_0.18.1.1.bb
> +++ b/meta/recipes-core/gettext/gettext_0.18.1.1.bb
> @@ -5,9 +5,9 @@ SECTION = "libs"
>  LICENSE = "GPLv3"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>  
> -PR = "r1"
> -DEPENDS = "gettext-native virtual/libiconv ncurses expat"
> -DEPENDS_virtclass-native = ""
> +PR = "r2"
> +DEPENDS = "libxml2-native gettext-native virtual/libiconv ncurses expat"
> +DEPENDS_virtclass-native = "libxml2-native"
>  PROVIDES = "virtual/libintl virtual/gettext"
>  PROVIDES_virtclass-native = ""
>  CONFLICTS_${PN} = "proxy-libintl"




