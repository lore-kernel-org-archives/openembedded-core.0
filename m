Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <84c2e406c6127e55e7bdea01f2bcade6a9ab1c89.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 02/36] groff: mark patch as non-upstreamable
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Date: Fri, 19 Nov 2021 11:15:25 +0000
In-Reply-To: <20211117153525.257146-2-alex@linutronix.de>
References: <20211117153525.257146-1-alex@linutronix.de>
	 <20211117153525.257146-2-alex@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>

On Wed, 2021-11-17 at 16:34 +0100, Alexander Kanavin wrote:
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  meta/recipes-extended/groff/files/0001-Include-config.h.patch | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-extended/groff/files/0001-Include-config.h.patch b/meta/recipes-extended/groff/files/0001-Include-config.h.patch
> index 46065bc513..34fca1eb2f 100644
> --- a/meta/recipes-extended/groff/files/0001-Include-config.h.patch
> +++ b/meta/recipes-extended/groff/files/0001-Include-config.h.patch
> @@ -20,7 +20,7 @@ In file included from TOPDIR/build/tmp/work/aarch64-yoe-linux-musl/groff/1.22.4-
>  We delete eqn.cpp and qen.hpp in do_configure
>  to ensure they're regenerated and deterministic.
>  
> -Upstream-Status: Pending
> +Upstream-Status: Inappropriate [issue fixed upstream with a similar patch]
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>  ---
>   src/libs/libgroff/assert.cpp  |   4 +


Should we replace this with the upstream patch? That way we'd have a clean
backport which would help at upgrade time? 

Is the upstream patch exactly functionally equivalent?

Sometimes it can be good to test the upstream version so we know come upgrade
time we're ok and we don't need to ask upstream to make any further tweaks.

Cheers,

Richard

