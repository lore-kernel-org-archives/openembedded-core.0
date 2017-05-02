Return-Path: <tomas@novotny.cz>
X-Greylist: delayed 532 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 02 May 2017 16:59:46 UTC
Received: from hosting.pavoucek.net (hosting.pavoucek.net [46.28.107.168])
	by mail.openembedded.org (Postfix) with ESMTP id BFA2572F54
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 May 2017 16:59:46 +0000 (UTC)
Received: from tomas.local.tbs-biometrics.cz (unknown [176.74.132.138])
	(Authenticated sender: tomas@novotny.cz)
	by hosting.pavoucek.net (Postfix) with ESMTPSA id 9D339100D25;
	Tue,  2 May 2017 18:50:53 +0200 (CEST)
Date: Tue, 2 May 2017 18:50:52 +0200
From: Tomas Novotny <tomas@novotny.cz>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <20170502185052.0e094df2@tomas.local.tbs-biometrics.cz>
In-Reply-To: <20170502125151.5095-6-alexander.kanavin@linux.intel.com>
References: <20170502125151.5095-1-alexander.kanavin@linux.intel.com>
	<20170502125151.5095-6-alexander.kanavin@linux.intel.com>
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.31; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 6/6] mobile-broadband-provider-info: upgrade to 20170310
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
X-List-Received-Date: Tue, 02 May 2017 16:59:47 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,

On Tue,  2 May 2017 15:51:51 +0300
Alexander Kanavin <alexander.kanavin@linux.intel.com> wrote:

> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  .../mobile-broadband-provider-info_git.bb                             | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
> index bd488eb0896..f7e96318bc1 100644
> --- a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
> +++ b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
> @@ -2,8 +2,8 @@ SUMMARY = "Mobile Broadband Service Provider Database"
>  SECTION = "network"
>  LICENSE = "PD"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=87964579b2a8ece4bc6744d2dc9a8b04"
> -SRCREV = "519465766fabc85b9fdea5f2b5ee3d08c2b1f70d"
> -PV = "20151214"
> +SRCREV = "befcbbc9867e742ac16415660b0b7521218a530c"
> +PV = "20170310"
>  PE = "1"
>  
>  SRC_URI = "git://git.gnome.org/mobile-broadband-provider-info"

this package contains platform independent xml and dtd only. So I guess that
allarch class can be inherited. Does it makes sense to create a separate patch or
is it better to squash it here?

Thanks,

Tomas

