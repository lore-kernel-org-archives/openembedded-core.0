Received: from mail-pz0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RGKUU-0006TA-JP
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Oct 2011 02:58:42 +0200
Received: by pzk33 with SMTP id 33so2998452pzk.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Oct 2011 17:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=F1VdQ01dqoXfqtKf/a7FDCONU0g5IE5MWPaAVZ8h1dc=;
	b=RehIElnvijN5tOBDFktJRds7U8h7cn0SwwwE/3OyIHlivhidt+IW/dY5Mzxj14J0WL
	N1a3m1L0jh+sOisCSP50AtzpP1E7FWD5RBvIFRKzszN8rvf1d1PhVgvA+02e1BVqhSkl
	JHqXdJRRaOe1PpJGadLyXb7s0Rd16jD0ujPhI=
Received: by 10.68.35.97 with SMTP id g1mr8683331pbj.38.1318985570989;
	Tue, 18 Oct 2011 17:52:50 -0700 (PDT)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id v7sm1320880pbr.10.2011.10.18.17.52.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Oct 2011 17:52:50 -0700 (PDT)
Date: Tue, 18 Oct 2011 17:54:11 -0700
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111019005411.GB27915@sakrah.homelinux.org>
References: <cover.1318976197.git.josh@linux.intel.com>
	<f90833637d03ce25b7d84641c29fb60c90c375fa.1318976197.git.josh@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <f90833637d03ce25b7d84641c29fb60c90c375fa.1318976197.git.josh@linux.intel.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH 2/2] tzdata: updated SRC_URI and update to 2011k
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
X-List-Received-Date: Wed, 19 Oct 2011 00:58:42 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (18/10/11 15:24), Joshua Lock wrote:
> tzdata is now hosted by IANA at http://www.iana.org/time-zones
> 
> Signed-off-by: Joshua Lock <josh@linux.intel.com>
> ---
>  .../tzdata/{tzdata_2011k.bb => tzdata_2011l.bb}    |    6 +++---
>  1 files changed, 3 insertions(+), 3 deletions(-)
>  rename meta/recipes-extended/tzdata/{tzdata_2011k.bb => tzdata_2011l.bb} (96%)
> 
> diff --git a/meta/recipes-extended/tzdata/tzdata_2011k.bb b/meta/recipes-extended/tzdata/tzdata_2011l.bb
> similarity index 96%
> rename from meta/recipes-extended/tzdata/tzdata_2011k.bb
> rename to meta/recipes-extended/tzdata/tzdata_2011l.bb
> index 45f2c4d..140f8ed 100644
> --- a/meta/recipes-extended/tzdata/tzdata_2011k.bb
> +++ b/meta/recipes-extended/tzdata/tzdata_2011l.bb
> @@ -12,10 +12,10 @@ RCONFLICTS= "timezones timezone-africa timezone-america timezone-antarctica \
>               timezone-australia timezone-europe timezone-indian \
>               timezone-iso3166.tab timezone-pacific timezone-zone.tab"
>  
> -SRC_URI = "ftp://elsie.nci.nih.gov/pub/tzdata${PV}.tar.gz;name=tzdata"
> +SRC_URI = "http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata"

I think same would be needed for tzcode-native recipes. Could you also
do that while you are at it.

>  
> -SRC_URI[tzdata.md5sum] = "9da1c2d4d1a01f9f504b73ccd371830f"
> -SRC_URI[tzdata.sha256sum] = "51f7d2a42b7fb9465feced642a6676afdf8b04a071e55f3fef1f0925bd67ef21"
> +SRC_URI[tzdata.md5sum] = "bae1b93673e1aef80186c90dfd493f1c"
> +SRC_URI[tzdata.sha256sum] = "cb9fec68a19c9c3b900bb71f3ca20d0051a863f765387b52fc2d144a5bbb0c7d"
>  
>  S = "${WORKDIR}"
>  
> -- 
> 1.7.6.4
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

-- 
-Khem


