Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 8E16F65D89
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Apr 2014 13:25:24 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s3NDPAt9030847; Wed, 23 Apr 2014 14:25:10 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id jTkydlpGRXKA; Wed, 23 Apr 2014 14:25:10 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s3NDP3tW030840
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Wed, 23 Apr 2014 14:25:04 +0100
Message-ID: <1398259497.16672.111.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Saul Wold <sgw@linux.intel.com>
Date: Wed, 23 Apr 2014 14:24:57 +0100
In-Reply-To: <db84b0123ef1434809a5752719d24959938db202.1398210385.git.sgw@linux.intel.com>
References: <cover.1398210385.git.sgw@linux.intel.com>
	<db84b0123ef1434809a5752719d24959938db202.1398210385.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 05/10] mc: update to 4.8.12
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
X-List-Received-Date: Wed, 23 Apr 2014 13:25:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2014-04-22 at 16:49 -0700, Saul Wold wrote:
> Remove the disable-samba since it's been renamed to vfs_smb and disabled
> by default.

Will this detect the presence of samba in the sysroot and autoconfigure
itself to enabled?

Cheers,

Richard

> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  meta/recipes-extended/mc/{mc_4.8.10.bb => mc_4.8.12.bb} | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta/recipes-extended/mc/{mc_4.8.10.bb => mc_4.8.12.bb} (92%)
> 
> diff --git a/meta/recipes-extended/mc/mc_4.8.10.bb b/meta/recipes-extended/mc/mc_4.8.12.bb
> similarity index 92%
> rename from meta/recipes-extended/mc/mc_4.8.10.bb
> rename to meta/recipes-extended/mc/mc_4.8.12.bb
> index 511771a..9a43949 100644
> --- a/meta/recipes-extended/mc/mc_4.8.10.bb
> +++ b/meta/recipes-extended/mc/mc_4.8.12.bb
> @@ -8,12 +8,12 @@ RDEPENDS_${PN} = "ncurses-terminfo"
>  
>  SRC_URI = "http://www.midnight-commander.org/downloads/${BPN}-${PV}.tar.bz2"
>  
> -SRC_URI[md5sum] = "eb4bdc23abd4fdfa14911d53d65c8186"
> -SRC_URI[sha256sum] = "5f4166fe78fbf4b42f51ed526ca7f79fea8c77d04355c2b97d4df2a6bd2a1b1a"
> +SRC_URI[md5sum] = "a64c426364bfaee56b628f6c0738aade"
> +SRC_URI[sha256sum] = "1054fcc27a488771cbe5b85d7c10135fa1cd1b7682a19930d44b51a023e39396"
>  
>  inherit autotools gettext pkgconfig
>  
> -EXTRA_OECONF = "--with-screen=ncurses --without-gpm-mouse --without-x --without-samba"
> +EXTRA_OECONF = "--with-screen=ncurses --without-gpm-mouse --without-x"
>  
>  FILES_${PN}-dbg += "${libexecdir}/mc/.debug/"
>  
> -- 
> 1.8.3.1
> 



