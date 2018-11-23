Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id D819579DCB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Nov 2018 23:35:55 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	wANNZsKX026149
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Fri, 23 Nov 2018 23:35:55 GMT
Message-ID: <cfce994eb17d8b687039a4acf8c9b8756f694878.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Fri, 23 Nov 2018 23:35:53 +0000
In-Reply-To: <20181122154136.121480-11-alex.kanavin@gmail.com>
References: <20181122154136.121480-1-alex.kanavin@gmail.com>
	<20181122154136.121480-11-alex.kanavin@gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 11/16] psmisc: update to 23.2
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
X-List-Received-Date: Fri, 23 Nov 2018 23:35:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2018-11-22 at 16:41 +0100, Alexander Kanavin wrote:
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  ...001-Use-UINTPTR_MAX-instead-of-__WORDSIZE.patch | 14 +++++-------
> --
>  .../psmisc/{psmisc_23.1.bb => psmisc_23.2.bb}      |  2 +-
>  2 files changed, 6 insertions(+), 10 deletions(-)
>  rename meta/recipes-extended/psmisc/{psmisc_23.1.bb =>
> psmisc_23.2.bb} (87%)
> 
> diff --git a/meta/recipes-extended/psmisc/psmisc/0001-Use-
> UINTPTR_MAX-instead-of-__WORDSIZE.patch b/meta/recipes-
> extended/psmisc/psmisc/0001-Use-UINTPTR_MAX-instead-of-
> __WORDSIZE.patch
> index b57a006bc67..3609594b67a 100644
> --- a/meta/recipes-extended/psmisc/psmisc/0001-Use-UINTPTR_MAX-
> instead-of-__WORDSIZE.patch
> +++ b/meta/recipes-extended/psmisc/psmisc/0001-Use-UINTPTR_MAX-
> instead-of-__WORDSIZE.patch
> @@ -1,4 +1,4 @@
> -From 5dc872bb2fba6421cb8e1ee578f7bd4aaed55f61 Mon Sep 17 00:00:00
> 2001
> +From 115fcf1daff18aa2f2e130d63704f04031878db0 Mon Sep 17 00:00:00
> 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Thu, 24 Mar 2016 15:46:14 +0000
>  Subject: [PATCH] Use UINTPTR_MAX instead of __WORDSIZE
> @@ -7,14 +7,13 @@ Do not include sys/user.h since it conflicts with
>  pt_regs struct from kernel APIs in asm/ptrace.h
>  
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> -Upstream-Status: Pending
>  
> +---

I tweaked this not to remove the badly placed Upstream-Status line!

Cheers,

Richard


