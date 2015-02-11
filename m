Return-Path: <Paul.Gortmaker@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 76C1A72374
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Feb 2015 01:02:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t1B12uga009750
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Feb 2015 17:02:56 -0800 (PST)
Received: from yow-pgortmak-d1 (128.224.56.57) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 10 Feb 2015 17:02:56 -0800
Received: by yow-pgortmak-d1 (Postfix, from userid 1000)	id 84724E1D48B; Tue,
	10 Feb 2015 20:03:07 -0500 (EST)
Date: Tue, 10 Feb 2015 20:03:07 -0500
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Message-ID: <20150211010307.GB3150@windriver.com>
References: <1421866336-17183-1-git-send-email-paul.gortmaker@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1421866336-17183-1-git-send-email-paul.gortmaker@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] procps: disable fancy new top output mode
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
X-List-Received-Date: Wed, 11 Feb 2015 01:02:58 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

[[PATCH] procps: disable fancy new top output mode] On 21/01/2015 (Wed 13:52) Paul Gortmaker wrote:

> General consensus is that the new output format, with the all red
> colour and one line per core is too fugly to be left as the default.
> 
> Use the configure option to switch it back to the sane default that
> we've all become used to seeing for decades.

Ping -- discussion on IRC was in unanimous agreement with the above
assessment; so it seems like we should get this merged.

P.
--

> 
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
> ---
>  meta/recipes-extended/procps/procps_3.3.10.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-extended/procps/procps_3.3.10.bb b/meta/recipes-extended/procps/procps_3.3.10.bb
> index d8b04dc204a0..621b6dd5786c 100644
> --- a/meta/recipes-extended/procps/procps_3.3.10.bb
> +++ b/meta/recipes-extended/procps/procps_3.3.10.bb
> @@ -22,7 +22,7 @@ SRC_URI[sha256sum] = "a02e6f98974dfceab79884df902ca3df30b0e9bad6d76aee0fb5dce17f
>  
>  S = "${WORKDIR}/procps-ng-${PV}"
>  
> -EXTRA_OECONF = "--enable-skill"
> +EXTRA_OECONF = "--enable-skill --disable-modern-top"
>  
>  CPPFLAGS += "-I${S}"
>  
> -- 
> 2.2.1
> 

