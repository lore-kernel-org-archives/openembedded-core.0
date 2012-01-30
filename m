Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RruIl-0000ec-8u
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Jan 2012 17:41:55 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 30 Jan 2012 08:34:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="61312448"
Received: from unknown (HELO [10.255.14.96]) ([10.255.14.96])
	by AZSMGA002.ch.intel.com with ESMTP; 30 Jan 2012 08:34:00 -0800
Message-ID: <4F26C678.2080305@linux.intel.com>
Date: Mon, 30 Jan 2012 08:34:00 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111222 Thunderbird/9.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1327936840-13937-1-git-send-email-steve@sakoman.com>
	<1327936840-13937-4-git-send-email-steve@sakoman.com>
In-Reply-To: <1327936840-13937-4-git-send-email-steve@sakoman.com>
Cc: Steve Sakoman <steve@sakoman.com>
Subject: Re: [PATCH 3/4] gnupg: add recipe for 2.0.18
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
X-List-Received-Date: Mon, 30 Jan 2012 16:41:55 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/30/2012 07:20 AM, Steve Sakoman wrote:
> GnuPG 2.0 is the new modularized version of GnuPG supporting OpenPGP and S/MIME
>
> Signed-off-by: Steve Sakoman<steve@sakoman.com>
> ---
>   meta/recipes-extended/gnupg/gnupg_2.0.18.bb |   24 ++++++++++++++++++++++++
>   1 files changed, 24 insertions(+), 0 deletions(-)
>   create mode 100644 meta/recipes-extended/gnupg/gnupg_2.0.18.bb
>
> diff --git a/meta/recipes-extended/gnupg/gnupg_2.0.18.bb b/meta/recipes-extended/gnupg/gnupg_2.0.18.bb
> new file mode 100644
> index 0000000..c56f3d5
> --- /dev/null
> +++ b/meta/recipes-extended/gnupg/gnupg_2.0.18.bb
> @@ -0,0 +1,24 @@
> +DESCRIPTION = "gnupg - GNU privacy guard"
> +LICENSE = "GPLv2+"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949"
> +
> +DEPENDS = "pth libassuan libksba zlib bzip2 readline"
> +
> +inherit autotools gettext
> +
> +SRC_URI = "ftp://ftp.gnupg.org/gcrypt/gnupg/gnupg-${PV}.tar.bz2"
> +
> +SRC_URI[md5sum] = "2f37e0722666a0fedbe4d9f9227ac4d7"
> +SRC_URI[sha256sum] = "48aedd762ca443fb952a9e859efe3c66706d7c2c9c77c32dbdbac4fe962dae5b"
> +
> +S = "${WORKDIR}/gnupg-${PV}"
> +
> +EXTRA_OECONF = "--disable-ldap \
> +		--with-zlib=${STAGING_LIBDIR}/.. \
> +		--with-bzip2=${STAGING_LIBDIR}/.. \
> +                --with-readline=${STAGING_LIBDIR}/.. \
> +               "
> +
> +do_install_append() {
> +	ln -sf gpg2 ${D}${bindir}/gpg
> +}

This recipe along with libksba, would should live in recipes-support, as 
they "support" functionality provided elsewhere.

Sau!




