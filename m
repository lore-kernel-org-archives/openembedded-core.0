Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch-fe.de>) id 1SX5tc-0004ob-Jh
	for openembedded-core@lists.openembedded.org;
	Wed, 23 May 2012 09:22:12 +0200
Received: by bkcjm2 with SMTP id jm2so6059316bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 May 2012 00:12:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding:x-gm-message-state;
	bh=oCoWNwKwRp22u7mtVdz2LiLOguPQL11NHuzzk1krvgM=;
	b=Bz2Wmxw70k1u4agpnSTAWlpj8S2wJlXHR4oauGANySmtK0qIdNwSo3fg+bzb1HPYlT
	JMLdZM8s2vgJKwY2mzCdSfUwNEujA60Q6WxZpICAG/eS7jd0bStLAePPrIzKygFedB4e
	yIht1qil44J8u19cPxd7TyRiLZjHVvSEMEOvmkpIJuNd76Ayd/AIjzoIFOyrfJgD/O/Q
	mbPysVl2J8Tsd43ODzL5CyiJCx+4qd4bLH5WOJv3IJCy2srAgbzgW5wwTExhYJRS0pUn
	8YDX/wcXKLhqdS0IkOE5sGUVlHN0Hef9lZE821odhhkpXtYAXVWvM4z7EEihSMYW0Pd0
	Fseg==
Received: by 10.205.116.203 with SMTP id fj11mr11073783bkc.108.1337757122836; 
	Wed, 23 May 2012 00:12:02 -0700 (PDT)
Received: from fensuse.internal.dresearch-fe.de
	(pd95cb174.dip0.t-ipconnect.de. [217.92.177.116])
	by mx.google.com with ESMTPS id gm18sm35216491bkc.7.2012.05.23.00.12.01
	(version=SSLv3 cipher=OTHER); Wed, 23 May 2012 00:12:01 -0700 (PDT)
Message-ID: <4FBC8DC0.706@dresearch-fe.de>
Date: Wed, 23 May 2012 09:12:00 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120427 Thunderbird/12.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1337696160-26734-1-git-send-email-sledz@dresearch-fe.de>
In-Reply-To: <1337696160-26734-1-git-send-email-sledz@dresearch-fe.de>
X-Enigmail-Version: 1.4.1
X-Gm-Message-State: ALoCoQk2J72TDVn1ocwGCfc9uGyl7tAsj5oqcu60Vfe3dqgozfEwUEe2nM1Y8S3K0ozUrZebWe2r
Subject: Re: [PATCH] dropbear: fix include dependent PR generation
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
X-List-Received-Date: Wed, 23 May 2012 07:22:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22.05.2012 16:16, Steffen Sledz wrote:
> Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>
> ---
>  meta/recipes-core/dropbear/dropbear.inc        |    2 ++
>  meta/recipes-core/dropbear/dropbear_2012.55.bb |    2 +-
>  2 files changed, 3 insertions(+), 1 deletions(-)
> 
> diff --git a/meta/recipes-core/dropbear/dropbear.inc b/meta/recipes-core/dropbear/dropbear.inc
> index 2d6aeb2..2de442c 100644
> --- a/meta/recipes-core/dropbear/dropbear.inc
> +++ b/meta/recipes-core/dropbear/dropbear.inc
> @@ -2,6 +2,8 @@ DESCRIPTION = "Dropbear is a lightweight SSH and SCP implementation"
>  HOMEPAGE = "http://matt.ucc.asn.au/dropbear/dropbear.html"
>  SECTION = "console/network"
>  
> +INC_PR = "r0"
> +
>  # some files are from other projects and have others license terms:
>  #   public domain, OpenSSH 3.5p1, OpenSSH3.6.1p2, PuTTY
>  LICENSE = "MIT"
> diff --git a/meta/recipes-core/dropbear/dropbear_2012.55.bb b/meta/recipes-core/dropbear/dropbear_2012.55.bb
> index 4f0ef80..8323a33 100644
> --- a/meta/recipes-core/dropbear/dropbear_2012.55.bb
> +++ b/meta/recipes-core/dropbear/dropbear_2012.55.bb
> @@ -3,4 +3,4 @@ require dropbear.inc
>  SRC_URI[md5sum] = "44836e5a0419ba12557f9ea46880077e"
>  SRC_URI[sha256sum] = "808df243c61bb60f2f18fa64bca628cbba0918b2a14139f10e6d59d4ac5a17ce"
>  
> -PR = "r0"
> +PR = "${INC_PR}.0"

Did this message made it to the ML?

I could not find it in Patchwork OpenEmbedded Core?. :(

Steffen

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058


