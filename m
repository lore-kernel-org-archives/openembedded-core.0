Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Q6j3X-0004db-3b for openembedded-core@lists.openembedded.org;
	Mon, 04 Apr 2011 14:38:55 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p34Cap9O015982
	for <openembedded-core@lists.openembedded.org>;
	Mon, 4 Apr 2011 13:36:52 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 15963-01 for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Apr 2011 13:36:48 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p34CalSQ015976
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 4 Apr 2011 13:36:47 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <9a48f0f3f9de28625cb8b0d86690a9a42fc0ea45.1301631488.git.raj.khem@gmail.com>
References: <cover.1301631488.git.raj.khem@gmail.com>
	<9a48f0f3f9de28625cb8b0d86690a9a42fc0ea45.1301631488.git.raj.khem@gmail.com>
Date: Mon, 04 Apr 2011 13:36:44 +0100
Message-ID: <1301920604.24596.351.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 25/46] gcc-runtime_4.5.1.bb: Do not filter out -feliminate-dwarf2-dups
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
X-List-Received-Date: Mon, 04 Apr 2011 12:38:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-03-31 at 21:29 -0700, Khem Raj wrote:
> This is already taken care by bitbake.conf
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-devtools/gcc/gcc-runtime_4.5.1.bb |    5 -----
>  1 files changed, 0 insertions(+), 5 deletions(-)
> 
> diff --git a/meta/recipes-devtools/gcc/gcc-runtime_4.5.1.bb b/meta/recipes-devtools/gcc/gcc-runtime_4.5.1.bb
> index 9d4e158..2127eb6 100644
> --- a/meta/recipes-devtools/gcc/gcc-runtime_4.5.1.bb
> +++ b/meta/recipes-devtools/gcc/gcc-runtime_4.5.1.bb
> @@ -9,8 +9,3 @@ SRC_URI_append = "file://fortran-cross-compile-hack.patch"
>  ARCH_FLAGS_FOR_TARGET += "-isystem${STAGING_INCDIR}"
>  
>  EXTRA_OECONF += "--disable-libunwind-exceptions"
> -
> -# gcc 4.5 ends up in ICE when using -feliminate-dwarf2-dups in libstdc++
> -# compiling pre compiled headers so we remove this option when compiling
> -# to workaround it
> -CXXFLAGS := "${@oe_filter_out('-feliminate-dwarf2-dups', '${CXXFLAGS}', d)}"

Merged, thanks.

Richard



