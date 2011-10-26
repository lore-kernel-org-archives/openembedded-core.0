Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1RJA2l-0003jQ-Ki
	for openembedded-core@lists.openembedded.org;
	Wed, 26 Oct 2011 22:25:47 +0200
Received: from mail-ww0-f42.google.com ([74.125.82.42])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 26 Oct 2011 13:19:46 -0700
Received: by wwn22 with SMTP id 22so7114846wwn.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Oct 2011 13:19:44 -0700 (PDT)
Received: by 10.216.170.71 with SMTP id o49mr1315073wel.107.1319660384532;
	Wed, 26 Oct 2011 13:19:44 -0700 (PDT)
Received: from [10.192.3.184] ([85.13.70.251])
	by mx.google.com with ESMTPS id fy13sm5179333wbb.18.2011.10.26.13.19.42
	(version=SSLv3 cipher=OTHER); Wed, 26 Oct 2011 13:19:43 -0700 (PDT)
Message-ID: <4EA86B5C.2070500@intel.com>
Date: Wed, 26 Oct 2011 22:19:40 +0200
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1319173361-11527-1-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1319173361-11527-1-git-send-email-raj.khem@gmail.com>
Subject: Re: [PATCH 1/3] tcmode-default.inc: Add TRANSLATED_TARGET_ARCH suffix to binutils-cross-canadian
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
X-List-Received-Date: Wed, 26 Oct 2011 20:25:48 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/21/2011 07:02 AM, Khem Raj wrote:
> PN for binutils-cross-canadian is
> binutils-cross-canadian-${TRANSLATED_TARGET_ARCH}
> so thats what we should use for PREFERRED_VERSION
>
> Signed-off-by: Khem Raj<raj.khem@gmail.com>
> ---
>   meta/conf/distro/include/tcmode-default.inc |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
> index 86562be..2bf1beb 100644
> --- a/meta/conf/distro/include/tcmode-default.inc
> +++ b/meta/conf/distro/include/tcmode-default.inc
> @@ -45,7 +45,7 @@ PREFERRED_VERSION_libgcc-nativesdk ?= "${SDKGCCVERSION}"
>   PREFERRED_VERSION_binutils ?= "${BINUVERSION}"
>   PREFERRED_VERSION_binutils-cross ?= "${BINUVERSION}"
>   PREFERRED_VERSION_binutils-crosssdk ?= "${BINUVERSION}"
> -PREFERRED_VERSION_binutils-cross-canadian ?= "${BINUVERSION}"
> +PREFERRED_VERSION_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} ?= "${BINUVERSION}"
>   PREFERRED_VERSION_linux-libc-headers ?= "${LINUXLIBCVERSION}"
>   PREFERRED_VERSION_linux-libc-headers-nativesdk ?= "${LINUXLIBCVERSION}"
>   PREFERRED_VERSION_eglibc                   ?= "${EGLIBCVERSION}"

Merged all 3 of these with the V2 of the GCC patch

Thanks
	Sau!


