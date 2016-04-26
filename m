Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 138137317C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Apr 2016 08:41:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u3Q8fMvQ029405; Tue, 26 Apr 2016 09:41:22 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 9yHg-G2kUNGn; Tue, 26 Apr 2016 09:41:22 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u3Q8fGIb029401
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 26 Apr 2016 09:41:17 +0100
Message-ID: <1461660076.31320.145.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Tristan Van Berkom <tristan.vanberkom@codethink.co.uk>,
	openembedded-core@lists.openembedded.org
Date: Tue, 26 Apr 2016 09:41:16 +0100
In-Reply-To: <1461617044-25526-1-git-send-email-tristan.vanberkom@codethink.co.uk>
References: <1461617044-25526-1-git-send-email-tristan.vanberkom@codethink.co.uk>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH 1/4] gcc-cross-initial: Split all-gcc and configure-target-libgcc
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
X-List-Received-Date: Tue, 26 Apr 2016 08:41:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2016-04-25 at 16:44 -0400, Tristan Van Berkom wrote:
> Serializing this fixes build on aarch64
> ---
>  meta/recipes-devtools/gcc/gcc-cross-initial.inc | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-devtools/gcc/gcc-cross-initial.inc
> b/meta/recipes-devtools/gcc/gcc-cross-initial.inc
> index c0fa139..98aae45 100644
> --- a/meta/recipes-devtools/gcc/gcc-cross-initial.inc
> +++ b/meta/recipes-devtools/gcc/gcc-cross-initial.inc
> @@ -43,7 +43,8 @@ do_configure_prepend () {
>  }
>  
>  do_compile () {
> -    oe_runmake all-gcc configure-target-libgcc
> +    oe_runmake all-gcc
> +    oe_runmake configure-target-libgcc
>  }
>  do_install () {
>  	( cd ${B}/${TARGET_SYS}/libgcc; oe_runmake 'DESTDIR=${D}'
> install-unwind_h )

I'd note we have been doing aarch64 builds for a while and not run into
this. What was the actual failure?

Can we fix the underlying aarch64 problem, rather than breaking
parallelism for everyone else this appears to be working for?

Cheers,

Richard



