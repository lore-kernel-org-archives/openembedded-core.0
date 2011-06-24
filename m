Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QaDPu-0004A5-Md
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Jun 2011 22:55:54 +0200
Received: by pwi1 with SMTP id 1so2184810pwi.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2011 13:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=8M0Fz0zYik3Heveh/fzyYoNq496GY0Tdhe0GF50qZLI=;
	b=ku01rwYlHrsDPcM6pswh3qjpHE8ocaM7K+hYJO35jE8aKbkKIY9CqMhhDPb3lsIb4n
	jg3yL3+nqfk1WpVufWznsAuOwHg3vEvrGNIoIbpBxDcg14GT3a67bN4O4Ymju1HTCjeX
	lArj7KUILbGxGfNVgyivAVXHOnpFACRpw9knQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=t5mbresyatRJ1RZYRqTRxmkzA/oxhZBVBV/qN1ptYS7tXfk4lAYHlHc35+VTKceHp5
	yhi4EuG3Wux01SJ32lOC4Y2oI2EQBx4NuEeNwj+g9W0DnU7oybJbjfeoJ/4vIpOSZg3s
	pkxd4hSiY8pKIY8Va5zhRLEynB5E52vW6qEm8=
Received: by 10.68.46.38 with SMTP id s6mr2006680pbm.241.1308948736546;
	Fri, 24 Jun 2011 13:52:16 -0700 (PDT)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id g2sm2304784pbh.79.2011.06.24.13.52.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 24 Jun 2011 13:52:15 -0700 (PDT)
Date: Fri, 24 Jun 2011 13:51:36 -0700
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110624205136.GB7676@sakrah.homelinux.org>
References: <cover.1308944503.git.mark.hatle@windriver.com>
	<4f64811b18665d26645a376fda0828dad0b07c7c.1308944503.git.mark.hatle@windriver.com>
MIME-Version: 1.0
In-Reply-To: <4f64811b18665d26645a376fda0828dad0b07c7c.1308944503.git.mark.hatle@windriver.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH 1/1] prelink: Uprev prelink to latest version (V2)
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
X-List-Received-Date: Fri, 24 Jun 2011 20:55:55 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (24/06/11 14:42), Mark Hatle wrote:
> The latest cross-prelink version tracks the prelink r190 SVN.
> 
> Fix two minor issues as well.  If we remove the package, we would
> unprelink the filesystem after the rm was finished.  This is
> incorrect.. we need to do this prerm.
> 
> Move the cron and cron configuration file to a new package split.
> This item is not valid for most embedded users.
> 
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> ---
>  .../prelink/prelink/prelink.default                |    2 +-
>  meta/recipes-devtools/prelink/prelink_git.bb       |   25 +++++++++++++++++--
>  2 files changed, 23 insertions(+), 4 deletions(-)
> 
> diff --git a/meta/recipes-devtools/prelink/prelink/prelink.default b/meta/recipes-devtools/prelink/prelink/prelink.default
> index 901258e..d8802f8 100644
> --- a/meta/recipes-devtools/prelink/prelink/prelink.default
> +++ b/meta/recipes-devtools/prelink/prelink/prelink.default
> @@ -2,7 +2,7 @@
>  # or to yes to enable it.
>  # (if you change this from yes to no prelink -ua
>  # will be run next night to undo prelinking)
> -PRELINKING=unknown
> +PRELINKING=yes
>  

this is a functionality change. Will it have system wide effects ?


