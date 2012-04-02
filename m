Received: from mail-pz0-f51.google.com ([209.85.210.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SEodr-0003Du-13
	for openembedded-core@lists.openembedded.org;
	Mon, 02 Apr 2012 23:18:23 +0200
Received: by dadz8 with SMTP id z8so2805549dad.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Apr 2012 14:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=wXyG9qsA1roFmubw3E0cZN2hH4Ot4JsA21El+ejLoPA=;
	b=XxBVRFSihxu7z0fSsHTd/Fyo/Dw/LrV9gOGkH2yNOLa/kr1LDNjQD+XY6+poQLQO8/
	w7d33/xLgJ+jwS8m/71eWvehw5S8aULA40PaBNz0aNhtZCFOZ0UM/jxivTsUpFbirjOl
	9QXy6qIDh5V89+MwOwe1P17GIWOokntaTA6HCVeDuiGCMh6CYuwRI8cf8qmJmuAsTogG
	rjxs4TOaZzMQVTzIzgAWpBccac8gJZGLfKCqAS1hPwNLe0mopETjKcHaOy8eeFLg6JmJ
	Xq48Kft6kg/usZSwN6DZMvGy3uSfh8EJLIOyllsC27PpbzTTeqJZPlugQKy8hr+dzEVA
	/U7A==
Received: by 10.68.222.165 with SMTP id qn5mr23209187pbc.88.1333400953527;
	Mon, 02 Apr 2012 14:09:13 -0700 (PDT)
Received: from sakrah.homelinux.org
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id b1sm14724872pbm.68.2012.04.02.14.09.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 02 Apr 2012 14:09:12 -0700 (PDT)
Date: Mon, 2 Apr 2012 14:08:59 -0700
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120402210859.GA26880@sakrah.homelinux.org>
References: <1331773718-14372-1-git-send-email-obi@opendreambox.org>
MIME-Version: 1.0
In-Reply-To: <1331773718-14372-1-git-send-email-obi@opendreambox.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] parted: don't pass --disable-Werror to configure
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
X-List-Received-Date: Mon, 02 Apr 2012 21:18:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (15/03/12 02:08), Andreas Oberritter wrote:
> * Fixes the following warning:
> 
> | configure: WARNING: unrecognized options: --disable-Werror


should 'W' be 'w' in --disable-Werror

> 
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> ---
> * No PR bump required because it doesn't change anything
>   apart from the log message mentioned above.
> 
>  meta/recipes-extended/parted/parted_3.0.bb |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/meta/recipes-extended/parted/parted_3.0.bb b/meta/recipes-extended/parted/parted_3.0.bb
> index 29daf01..2fba6d1 100644
> --- a/meta/recipes-extended/parted/parted_3.0.bb
> +++ b/meta/recipes-extended/parted/parted_3.0.bb
> @@ -13,7 +13,7 @@ SRC_URI = "${GNU_MIRROR}/parted/parted-${PV}.tar.gz \
>  SRC_URI[md5sum] = "a94e84a9b9944715c4453f82ccc639bf"
>  SRC_URI[sha256sum] = "8886eece015202f6bd5ce8414f4b68838452cef509f2e3389ad56128219837b7"
>  
> -EXTRA_OECONF = "--disable-Werror --disable-device-mapper"
> +EXTRA_OECONF = "--disable-device-mapper"
>  
>  inherit autotools pkgconfig gettext
>  
> -- 
> 1.7.5.4
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

-- 
-Khem


