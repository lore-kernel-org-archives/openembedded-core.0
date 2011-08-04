Received: from [93.97.173.237] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QoyQF-0001GO-42 for openembedded-core@lists.openembedded.org;
	Thu, 04 Aug 2011 15:57:15 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p74DqqMS002275
	for <openembedded-core@lists.openembedded.org>;
	Thu, 4 Aug 2011 14:52:52 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 01579-07 for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Aug 2011 14:52:48 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p74DqgIB002269
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 4 Aug 2011 14:52:43 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <d395c1bac934913af1ed7c8fc3a09601c823339b.1311807353.git.tom_rini@mentor.com>
References: <cover.1311807353.git.tom_rini@mentor.com>
	<d395c1bac934913af1ed7c8fc3a09601c823339b.1311807353.git.tom_rini@mentor.com>
Date: Thu, 04 Aug 2011 14:52:22 +0100
Message-ID: <1312465942.2344.743.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 3/9] Various site files: Drop monotone
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
X-List-Received-Date: Thu, 04 Aug 2011 13:57:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-07-27 at 15:56 -0700, Tom Rini wrote:
> Not in oe-core nor meta-oe and based on oe.dev, possibly incomplete.
> 
> Signed-off-by: Tom Rini <tom_rini@mentor.com>
> ---
>  meta/site/arm-common        |    3 ---
>  meta/site/arm-linux         |    3 ---
>  meta/site/common-glibc      |    3 ---
>  meta/site/ix86-common       |    3 ---
>  meta/site/mips-linux        |    5 -----
>  meta/site/mips-linux-uclibc |    5 -----
>  meta/site/mipsel-linux      |    5 -----
>  meta/site/powerpc32-linux   |    4 ----
>  meta/site/sh-common         |    3 ---
>  9 files changed, 0 insertions(+), 34 deletions(-)
> 
> diff --git a/meta/site/arm-common b/meta/site/arm-common
> index 2129298..7317a13 100644
> --- a/meta/site/arm-common
> +++ b/meta/site/arm-common
> @@ -116,9 +116,6 @@ with_broken_putenv=${with_broken_putenv=no}
>  # links
>  ac_cv_lib_png_png_create_info_struct=${ac_cv_lib_png_png_create_info_struct=yes}
>  
> -# mono
> -cv_mono_sizeof_sunpath=108
> -
>  # mysql
>  mysql_cv_func_atomic_sub=${mysql_cv_func_atomic_sub=no}
>  mysql_cv_func_atomic_add=${mysql_cv_func_atomic_add=no}

Isn't mono different from monotone?

We don't have mono in OE.core either so the patch is probably fine but I
just wanted to mention it...

Cheers,

Richard



