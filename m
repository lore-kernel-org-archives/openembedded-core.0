Received: from mail-pz0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QnEep-0000qy-Co
	for openembedded-core@lists.openembedded.org;
	Sat, 30 Jul 2011 20:53:07 +0200
Received: by pzk1 with SMTP id 1so8492850pzk.16
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Jul 2011 11:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:organization:user-agent:in-reply-to
	:references:mime-version:content-transfer-encoding:content-type;
	bh=y6NkTjecOlblkESby1c01y9PMAgsz5iyJZvU4KNqTD4=;
	b=Y5Eh3nQxY78HeSylZa3SFCAE9m/+vm8/9wyH8TggLzqQ5PCDNjxcfi3M6IfXAK7XaS
	FullTp+Yll9KhcaNYlIOfEkFopQOvcILPb+XLoAnqb3SF7vU3UHGZUTRHxfzWs0AsgEU
	EoJZMAXoct9mmnGccytF/1pwJChpugz/qACBo=
Received: by 10.68.13.41 with SMTP id e9mr700012pbc.90.1312051728454;
	Sat, 30 Jul 2011 11:48:48 -0700 (PDT)
Received: from perseus.localnet (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id v2sm3276845pbi.51.2011.07.30.11.48.47
	(version=SSLv3 cipher=OTHER); Sat, 30 Jul 2011 11:48:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Sat, 30 Jul 2011 11:48:46 -0700
Message-ID: <2074233.Hg07R4aRha@perseus>
Organization: Sakrah
User-Agent: KMail/4.7.0  (Linux/2.6.38-10-generic; KDE/4.7.0; i686; ; )
In-Reply-To: <dbe75b1d05a85f17c749a45fdfbca0025c481c24.1311858056.git.edwin.zhai@intel.com>
References: <cover.1311858056.git.edwin.zhai@intel.com>
	<dbe75b1d05a85f17c749a45fdfbca0025c481c24.1311858056.git.edwin.zhai@intel.com>
MIME-Version: 1.0
Subject: Re: [PATCH 4/7] apr-util: Upgrade to 1.3.12
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
X-List-Received-Date: Sat, 30 Jul 2011 18:53:07 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday, July 28, 2011 09:03:06 PM edwin.zhai@intel.com wrote:
> From: Zhai Edwin <edwin.zhai@intel.com>
> 
> Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
> ---
>  .../apr/{apr-util_1.3.10.bb => apr-util_1.3.12.bb} |    8 ++++++--
>  1 files changed, 6 insertions(+), 2 deletions(-)
>  rename meta/recipes-support/apr/{apr-util_1.3.10.bb => apr-util_1.3.12.bb}
> (74%)
> 
> diff --git a/meta/recipes-support/apr/apr-util_1.3.10.bb
> b/meta/recipes-support/apr/apr-util_1.3.12.bb similarity index 74%
> rename from meta/recipes-support/apr/apr-util_1.3.10.bb
> rename to meta/recipes-support/apr/apr-util_1.3.12.bb
> index 7071b90..8e9fd61 100644
> --- a/meta/recipes-support/apr/apr-util_1.3.10.bb
> +++ b/meta/recipes-support/apr/apr-util_1.3.12.bb
> @@ -13,8 +13,8 @@ SRC_URI = "${APACHE_MIRROR}/apr/${P}.tar.gz \
>             file://configfix.patch;patch=1 \
>             file://configure_fixes.patch;patch=1"
> 
> -SRC_URI[md5sum] = "82acd25cf3df8c72eba44eaee8b80c19"
> -SRC_URI[sha256sum] =
> "7c37ac40b2351bfc23000fb6b7b54a67e0872255df315c82eb60c821bcef4b23"
> +SRC_URI[md5sum] = "d1977289889592ef998e3f777f68efe4"
> +SRC_URI[sha256sum] =
> "815b6fc82950f61050a5e711a7f3c20fd9b6ffcc7a4cacfe9f291fb241210cd8"
> 
>  EXTRA_OECONF = "--with-apr=${STAGING_BINDIR_CROSS}/apr-1-config \
>  		--without-odbc \
> @@ -33,3 +33,7 @@ do_configure_prepend() {
>  	cp ${STAGING_DATADIR}/apr/apr_rules.mk ${S}/build/rules.mk
>  }
> 
> +FILES_${PN}-dev += "${libdir}/aprutil.exp"
> +FILES_${PN}     += "${libdir}/apr-util-1/apr_dbm_gdbm-1.so"
> +FILES_${PN}-dbg += "${libdir}/apr-util-1/* ${libdir}/apr-util-1/.debug/*"

do you really want ${libdir}/apr-util-1/* wildcard to go into a dbg package 
here ?
> +
-- 
Khem Raj


