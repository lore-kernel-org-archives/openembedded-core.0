Return-Path: <ml@embed.me.uk>
Received: from bmx2.eumx.net (bmx2.eumx.net [37.48.73.248])
	by mail.openembedded.org (Postfix) with ESMTP id 3C2CA70016
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Aug 2016 13:23:02 +0000 (UTC)
Received: from owm.eumx.net (unknown [10.1.1.70])
	by bmx2.eumx.net (Postfix) with ESMTPS id A44C5DC8E5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Aug 2016 13:23:02 +0000 (UTC)
To: openembedded-core@lists.openembedded.org
References: <20160822130516.5719-1-ml@embed.me.uk>
From: Jack Mitchell <ml@embed.me.uk>
Message-ID: <84941321-4129-4a17-7eea-2fbea6513369@embed.me.uk>
Date: Mon, 22 Aug 2016 14:23:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <20160822130516.5719-1-ml@embed.me.uk>
Subject: Re: [PATCH] cmake: install path variables should be relative to the prefix path
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 22 Aug 2016 13:23:03 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 22/08/16 14:05, Jack Mitchell wrote:
> From: Jack Mitchell <jack@embed.me.uk>
>
> ---
>  meta/classes/cmake.bbclass | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
> index b18152a..2375d09 100644
> --- a/meta/classes/cmake.bbclass
> +++ b/meta/classes/cmake.bbclass
> @@ -108,15 +108,15 @@ cmake_do_configure() {
>  	  ${OECMAKE_SITEFILE} \
>  	  ${OECMAKE_SOURCEPATH} \
>  	  -DCMAKE_INSTALL_PREFIX:PATH=${prefix} \
> -	  -DCMAKE_INSTALL_BINDIR:PATH=${bindir} \
> -	  -DCMAKE_INSTALL_SBINDIR:PATH=${sbindir} \
> -	  -DCMAKE_INSTALL_LIBEXECDIR:PATH=${libexecdir} \
> -	  -DCMAKE_INSTALL_SYSCONFDIR:PATH=${sysconfdir} \
> -	  -DCMAKE_INSTALL_SHAREDSTATEDIR:PATH=${sharedstatedir} \
> -	  -DCMAKE_INSTALL_LOCALSTATEDIR:PATH=${localstatedir} \
> -	  -DCMAKE_INSTALL_LIBDIR:PATH=${libdir} \
> -	  -DCMAKE_INSTALL_INCLUDEDIR:PATH=${includedir} \
> -	  -DCMAKE_INSTALL_DATAROOTDIR:PATH=${datadir} \
> +	  -DCMAKE_INSTALL_BINDIR:PATH=${bindir#${prefix}/} \
> +	  -DCMAKE_INSTALL_SBINDIR:PATH=${sbindir#${prefix}/} \
> +	  -DCMAKE_INSTALL_LIBEXECDIR:PATH=${libexecdir#${prefix}/} \
> +	  -DCMAKE_INSTALL_SYSCONFDIR:PATH=${sysconfdir#${prefix}/} \
> +	  -DCMAKE_INSTALL_SHAREDSTATEDIR:PATH=${sharedstatedir#${prefix}/} \
> +	  -DCMAKE_INSTALL_LOCALSTATEDIR:PATH=${localstatedir#${prefix}/} \
> +	  -DCMAKE_INSTALL_LIBDIR:PATH=${libdir#${prefix}/} \
> +	  -DCMAKE_INSTALL_INCLUDEDIR:PATH=${includedir#${prefix}/} \
> +	  -DCMAKE_INSTALL_DATAROOTDIR:PATH=${datadir#${prefix}/} \
>  	  -DCMAKE_INSTALL_SO_NO_EXE=0 \
>  	  -DCMAKE_TOOLCHAIN_FILE=${WORKDIR}/toolchain.cmake \
>  	  -DCMAKE_VERBOSE_MAKEFILE=1 \
>

On second thoughts this isn't doing quite what I expected, how would one 
remove the prefix from a variable when it's expanded in this manner?

Cheers,
Jack.

