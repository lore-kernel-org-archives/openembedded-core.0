Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 411A877A31
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Mar 2017 23:10:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id CCEFE20BAC;
	Fri, 17 Mar 2017 23:10:44 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id j8KZAVoVEupI; Fri, 17 Mar 2017 23:10:44 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A3374208FB;
	Fri, 17 Mar 2017 23:10:42 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 24ABA162413; Fri, 17 Mar 2017 19:10:42 -0400 (EDT)
Date: Fri, 17 Mar 2017 19:10:42 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Message-ID: <20170317231042.GW15664@denix.org>
References: <1489689734-10232-1-git-send-email-paul.gortmaker@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1489689734-10232-1-git-send-email-paul.gortmaker@windriver.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Christos Zoulas <christos@zoulas.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] file: update SRCREV for 5.30 to fix fetch fail on missing commit
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
X-List-Received-Date: Fri, 17 Mar 2017 23:10:44 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

We would need to do the same for past releases - morty/5.28, krogoth/5.25, jethro/5.24...


On Thu, Mar 16, 2017 at 02:42:14PM -0400, Paul Gortmaker wrote:
> Machines that cloned a while ago will have the commit, but new
> deployments won't because it seems the upstream changed/rebased
> and the old commit ID has been garbage-collected away.  Hence
> the fetch fails to check out the named commit ID.
> 
> Both the old (gone) commit, and the "new" commit show the same
> dates and commit log and point at 5.30, so hopefully this is
> the right thing to do.  A git diff of the two seems to only show
> a blanket uprev of CVS tags and deletion of a couple autogen'd
> files, and no real source changes.
> 
> Cc: Christos Zoulas <christos@zoulas.com>
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
> 
> diff --git a/meta/recipes-devtools/file/file_5.30.bb b/meta/recipes-devtools/file/file_5.30.bb
> index 0998fcfa8990..112bf105781e 100644
> --- a/meta/recipes-devtools/file/file_5.30.bb
> +++ b/meta/recipes-devtools/file/file_5.30.bb
> @@ -19,7 +19,7 @@ SRC_URI = "git://github.com/file/file.git \
>          file://0001-Add-P-prompt-into-Usage-info.patch \
>          "
>  
> -SRCREV = "79814950aafb81ecd6a910c2a8a3b8ec12f3e4a6"
> +SRCREV = "3050419355566d2a96c5be97fef0ffae097bbb96"
>  S = "${WORKDIR}/git"
>  
>  inherit autotools
> -- 
> 2.11.1
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

