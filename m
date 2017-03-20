Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 7408677980
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Mar 2017 14:06:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5A280208FB;
	Mon, 20 Mar 2017 14:06:15 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 95G2qf23xUHn; Mon, 20 Mar 2017 14:06:15 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 32172208DA;
	Mon, 20 Mar 2017 14:06:13 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id AAD9A162413; Mon, 20 Mar 2017 10:06:12 -0400 (EDT)
Date: Mon, 20 Mar 2017 10:06:12 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Message-ID: <20170320140612.GX15664@denix.org>
References: <1489793040-52384-1-git-send-email-denis@denix.org>
MIME-Version: 1.0
In-Reply-To: <1489793040-52384-1-git-send-email-denis@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Christos Zoulas <christos@zoulas.com>, Denys Dmytriyenko <denys@ti.com>
Subject: Re: [morty][PATCH] file: update SRCREV for 5.28 to fix fetch fail on missing commit
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
X-List-Received-Date: Mon, 20 Mar 2017 14:06:14 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Ping.

This is getting quickly escalated by my teams and customers. Can we merge this 
to morty right away? Thanks!

There's another patch for krogoth, that's not as urgent yet, but probably will 
be soon too...

BTW, I believe Armin was traveling last week, not sure if he's back yet.

-- 
Denys


On Fri, Mar 17, 2017 at 07:24:00PM -0400, Denys Dmytriyenko wrote:
> From: Paul Gortmaker <paul.gortmaker@windriver.com>
> 
> Machines that cloned a while ago will have the commit, but new
> deployments won't because it seems the upstream changed/rebased
> and the old commit ID has been garbage-collected away.  Hence
> the fetch fails to check out the named commit ID.
> 
> Both the old (gone) commit, and the "new" commit show the same
> dates and commit log and point at 5.28, so hopefully this is
> the right thing to do.  A git diff of the two seems to only show
> a blanket uprev of CVS tags and deletion of a couple autogen'd
> files, and no real source changes.
> 
> (From OE-Core rev: adb71e06768adadda7b69c3b5e81ca3ad67237f4)
> 
> Cc: Christos Zoulas <christos@zoulas.com>
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  meta/recipes-devtools/file/file_5.28.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-devtools/file/file_5.28.bb b/meta/recipes-devtools/file/file_5.28.bb
> index e64a89c..048fb8e 100644
> --- a/meta/recipes-devtools/file/file_5.28.bb
> +++ b/meta/recipes-devtools/file/file_5.28.bb
> @@ -19,7 +19,7 @@ SRC_URI = "git://github.com/file/file.git \
>          file://0001-Add-P-prompt-into-Usage-info.patch \
>          "
>  
> -SRCREV = "3c521817322a6bf5160cfeb09b9145ccde587b2a"
> +SRCREV = "acbaf156236cbc54b3cf3bc6cbf05d80cb196451"
>  S = "${WORKDIR}/git"
>  
>  inherit autotools
> -- 
> 2.7.4
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

