Received: from mail-pz0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RGGjp-0004SM-PD
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Oct 2011 22:58:18 +0200
Received: by pzk33 with SMTP id 33so2582919pzk.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Oct 2011 13:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=VFHNY/cbSwCoR6yMjPfaAFeUnxZ8miNi8QsNuX+rquo=;
	b=LuC7haB26Q/KqYi0EujOmxgeGZnyNbUdYvjjgmw8i9TR8XH6yXAX1IxDW7BkcBrGx8
	sY3xjg1xZjR65xtwwof3RzHLmWUh4NgqSEcMx+2oQwuwC7z2mc67toqj/ghxCWGytuDf
	rfKktRR940MmXM3G0YFXiVtwPPQFwwLV5KWDM=
Received: by 10.68.36.232 with SMTP id t8mr7457429pbj.54.1318971146832;
	Tue, 18 Oct 2011 13:52:26 -0700 (PDT)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id z1sm10638379pbl.5.2011.10.18.13.52.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Oct 2011 13:52:26 -0700 (PDT)
Date: Tue, 18 Oct 2011 13:53:46 -0700
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111018205346.GB27472@sakrah.homelinux.org>
References: <cover.1318968860.git.nitin.a.kamble@intel.com>
	<09731abe1a3295426dfef8d54c52c7f6805fe5dc.1318968860.git.nitin.a.kamble@intel.com>
MIME-Version: 1.0
In-Reply-To: <09731abe1a3295426dfef8d54c52c7f6805fe5dc.1318968860.git.nitin.a.kamble@intel.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH 2/5] gmp: also generate the libgmpcxx library
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
X-List-Received-Date: Tue, 18 Oct 2011 20:58:18 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (18/10/11 13:14), nitin.a.kamble@intel.com wrote:
> From: Nitin A Kamble <nitin.a.kamble@intel.com>
> 
> Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> ---
>  meta/recipes-support/gmp/gmp.inc      |    2 ++
>  meta/recipes-support/gmp/gmp_4.2.1.bb |    2 +-
>  meta/recipes-support/gmp/gmp_5.0.2.bb |    2 +-
>  3 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-support/gmp/gmp.inc b/meta/recipes-support/gmp/gmp.inc
> index 66349e6..77ce10d 100644
> --- a/meta/recipes-support/gmp/gmp.inc
> +++ b/meta/recipes-support/gmp/gmp.inc
> @@ -14,3 +14,5 @@ ARM_INSTRUCTION_SET = "arm"
>  acpaths = ""
>  
>  BBCLASSEXTEND = "native nativesdk"
> +
> +EXTRA_OECONF += " --enable-cxx=yes"

if you want 'yes' then just --enable-cxx is enough have you tried with
--enable-cxx=detect that would make sure that C++ compiler and runtime
is ok. Secondly is this option needed for native recipes too ?

> diff --git a/meta/recipes-support/gmp/gmp_4.2.1.bb b/meta/recipes-support/gmp/gmp_4.2.1.bb
> index 74da6b8..97ac4b2 100644
> --- a/meta/recipes-support/gmp/gmp_4.2.1.bb
> +++ b/meta/recipes-support/gmp/gmp_4.2.1.bb
> @@ -6,7 +6,7 @@ LICENSE = "LGPLv2.1+"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=892f569a555ba9c07a568a7c0c4fa63a \
>                      file://COPYING.LIB;md5=fbc093901857fcd118f065f900982c24 \
>                      file://gmp-h.in;startline=6;endline=21;md5=5e25ffd16996faba8c1cd27b04b16099"
> -PR = "r0"
> +PR = "r1"
>  
>  SRC_URI = "${GNU_MIRROR}/gmp/${BP}.tar.bz2 \
>             file://disable-stdc.patch"
> diff --git a/meta/recipes-support/gmp/gmp_5.0.2.bb b/meta/recipes-support/gmp/gmp_5.0.2.bb
> index 03fef45..f80971e 100644
> --- a/meta/recipes-support/gmp/gmp_5.0.2.bb
> +++ b/meta/recipes-support/gmp/gmp_5.0.2.bb
> @@ -2,7 +2,7 @@ require gmp.inc
>  LICENSE="LGPLv3&GPLv3"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
>  		    file://version.c;endline=18;md5=d8c56b52b9092346b9f93b4da65ef790"
> -PR = "r0"
> +PR = "r1"
>  
>  SRC_URI_append += "file://sh4-asmfix.patch \
>                     file://use-includedir.patch "
> -- 
> 1.7.4.4
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

-- 
-Khem


