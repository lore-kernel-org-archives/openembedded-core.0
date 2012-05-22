Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SWxkc-00015l-JT
	for openembedded-core@lists.openembedded.org;
	Wed, 23 May 2012 00:40:22 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 22 May 2012 15:30:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="146474023"
Received: from unknown (HELO [10.255.12.24]) ([10.255.12.24])
	by azsmga001.ch.intel.com with ESMTP; 22 May 2012 15:30:12 -0700
Message-ID: <4FBC1374.9000903@linux.intel.com>
Date: Tue, 22 May 2012 15:30:12 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1337725501-18003-1-git-send-email-sgw@linux.intel.com>
In-Reply-To: <1337725501-18003-1-git-send-email-sgw@linux.intel.com>
Subject: Re: [PATCH] qemu: disable vnc-jpeg compression
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
X-List-Received-Date: Tue, 22 May 2012 22:40:22 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/22/2012 03:25 PM, Saul Wold wrote:
> This is disabled by default to ensure a deterministic build, qemu
> configure would sometimes detect the libjpeg and then enable this.
> Since mostly qemu is used locally disable by default.
>
> Signed-off-by: Saul Wold<sgw@linux.intel.com>
> ---
>   meta/recipes-devtools/qemu/qemu_0.15.1.bb |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-devtools/qemu/qemu_0.15.1.bb b/meta/recipes-devtools/qemu/qemu_0.15.1.bb
> index bdffcf4..986fa19 100644
> --- a/meta/recipes-devtools/qemu/qemu_0.15.1.bb
> +++ b/meta/recipes-devtools/qemu/qemu_0.15.1.bb
> @@ -3,7 +3,7 @@ require qemu.inc
>   LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
>                       file://COPYING.LIB;endline=24;md5=c04def7ae38850e7d3ef548588159913"
>
> -PR = "r6"
> +PR = "r7"
>
>   FILESPATH = "${FILE_DIRNAME}/qemu-${PV}"
>   FILESDIR = "${WORKDIR}"

Manged to not commit both halves, v2 forthcoming

Sau!


