Return-Path: <stefan@herbrechtsmeier.net>
X-Greylist: delayed 397 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 16 Nov 2015 11:39:47 UTC
Received: from dd5638.kasserver.com (dd5638.kasserver.com [85.13.130.155])
	by mail.openembedded.org (Postfix) with ESMTP id E0A49763F8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Nov 2015 11:39:47 +0000 (UTC)
Received: from [129.70.144.65] (astra.TechFak.Uni-Bielefeld.DE [129.70.144.65])
	by dd5638.kasserver.com (Postfix) with ESMTPSA id 8712956005F3;
	Mon, 16 Nov 2015 12:33:09 +0100 (CET)
To: Kevron Rees <kevron.m.rees@intel.com>,
	openembedded-core@lists.openembedded.org
References: <1447464250-12204-1-git-send-email-kevron.m.rees@intel.com>
From: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
Message-ID: <5649BEF4.10002@herbrechtsmeier.net>
Date: Mon, 16 Nov 2015 12:33:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1447464250-12204-1-git-send-email-kevron.m.rees@intel.com>
Cc: tripzero.kev@gmail.com
Subject: Re: [PATCH] cmake.bbclass: remove ${prefix} assignment
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
X-List-Received-Date: Mon, 16 Nov 2015 11:39:48 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Am 14.11.2015 um 02:24 schrieb Kevron Rees:
> CMAKE_INSTALL_PREFIX has a different semantic meaning than ${prefix}[1].  cmake treats
> CMAKE_INSTALL_PREFIX the same as the DESTDIR environment variable.
CMAKE_INSTALL_PREFIX and DESTDIR are different and used together [1]:
[...] install the concerned software using the installation prefix [...] 
prepended with the DESTDIR [...]
>    Setting
> CMAKE_INSTALL_PREFIX to ${prefix} is inappropriate.
Why? It configures the prefix.
${prefix} is set to "/usr" in bitbake.conf. The default 
CMAKE_INSTALL_PREFIX is "/usr/local"

> This will likely break a lot of cmake recipes that have do_post_install hacks to get
> around this bug.
What hacks do you mean?

> [1] - https://cmake.org/cmake/help/v3.0/variable/CMAKE_INSTALL_PREFIX.html
>
> Signed-off-by: Kevron Rees <kevron.m.rees@intel.com>
> ---
>   meta/classes/cmake.bbclass | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
> index ae3cc02..b7d5950 100644
> --- a/meta/classes/cmake.bbclass
> +++ b/meta/classes/cmake.bbclass
> @@ -108,7 +108,7 @@ cmake_do_configure() {
>   	cmake \
>   	  ${OECMAKE_SITEFILE} \
>   	  ${OECMAKE_SOURCEPATH} \
> -	  -DCMAKE_INSTALL_PREFIX:PATH=${prefix} \
> +	  -DCMAKE_INSTALL_PREFIX:PATH="" \
>   	  -DCMAKE_INSTALL_BINDIR:PATH=${bindir} \
>   	  -DCMAKE_INSTALL_SBINDIR:PATH=${sbindir} \
>   	  -DCMAKE_INSTALL_LIBEXECDIR:PATH=${libexecdir} \


