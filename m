Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RruHL-0000b8-By
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Jan 2012 17:40:27 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 30 Jan 2012 08:32:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="61311663"
Received: from unknown (HELO [10.255.14.96]) ([10.255.14.96])
	by AZSMGA002.ch.intel.com with ESMTP; 30 Jan 2012 08:32:33 -0800
Message-ID: <4F26C621.6080501@linux.intel.com>
Date: Mon, 30 Jan 2012 08:32:33 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111222 Thunderbird/9.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1327936840-13937-1-git-send-email-steve@sakoman.com>
	<1327936840-13937-2-git-send-email-steve@sakoman.com>
In-Reply-To: <1327936840-13937-2-git-send-email-steve@sakoman.com>
Cc: Steve Sakoman <steve@sakoman.com>
Subject: Re: [PATCH 1/4] libassuan: add recipe for 2.0.3
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
X-List-Received-Date: Mon, 30 Jan 2012 16:40:27 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/30/2012 07:20 AM, Steve Sakoman wrote:
> Libassuan is the IPC library used by some GnuPG related software
>
> Signed-off-by: Steve Sakoman<steve@sakoman.com>
> ---
>   meta/recipes-extended/gnupg/libassuan_2.0.3.bb |   11 +++++++++++
>   1 files changed, 11 insertions(+), 0 deletions(-)
>   create mode 100644 meta/recipes-extended/gnupg/libassuan_2.0.3.bb
>
> diff --git a/meta/recipes-extended/gnupg/libassuan_2.0.3.bb b/meta/recipes-extended/gnupg/libassuan_2.0.3.bb
> new file mode 100644
> index 0000000..ac34869
> --- /dev/null
> +++ b/meta/recipes-extended/gnupg/libassuan_2.0.3.bb
> @@ -0,0 +1,11 @@
> +DESCRIPTION = "Libassuan is the IPC library used by some GnuPG related software"
> +LICENSE = "GPLv3+&  LGPLv2.1+"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949 \
> +                    file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1"
> +
> +inherit autotools binconfig
> +
> +SRC_URI = "ftp://ftp.gnupg.org/gcrypt/${PN}/${PN}-${PV}.tar.bz2"
> +
> +SRC_URI[md5sum] = "179d1918325fdb928c7bd90b8a514fc7"
> +SRC_URI[sha256sum] = "bad5682374c76bcc0abb1a7a34c9557af6874a477500748e64a7d3def79cac1b"

Why is this needed, as we already have a copy in 
meta/recipes-support/libassuan?  Was that version not found for some reason?

Sau!


