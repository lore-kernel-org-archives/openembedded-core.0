Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 8B30278302
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 19:01:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 943DF20BAF;
	Fri,  9 Jun 2017 19:01:59 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id VjXiXq5nilkq; Fri,  9 Jun 2017 19:01:59 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7284E207BD;
	Fri,  9 Jun 2017 19:01:58 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 0B2631624E9; Fri,  9 Jun 2017 15:01:58 -0400 (EDT)
Date: Fri, 9 Jun 2017 15:01:57 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Fan Xin <fan.xin@jp.fujitsu.com>
Message-ID: <20170609190157.GM28053@denix.org>
References: <1496972359-6459-1-git-send-email-fan.xin@jp.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1496972359-6459-1-git-send-email-fan.xin@jp.fujitsu.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] flex: Upgrade to 2.6.4
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
X-List-Received-Date: Fri, 09 Jun 2017 19:02:00 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

There were numerous issues with flex > 2.6.0 (e.g. doxygen), so all previous 
updates were reverted. Is 2.6.4 now safe? I doubt that, considering the new 
version was not published on sourceforge...

-- 
Denys


On Fri, Jun 09, 2017 at 10:39:19AM +0900, Fan Xin wrote:
> 1. Upgrade flex from 2.6.0 to 2.6.4
> 
> 2. Change the SRC_URI
>    Change SRC_URI from sourceforge to github due to the flex on sourceforge has not been updated more than one year.
> 
> Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
> ---
>  meta/recipes-devtools/flex/{flex_2.6.0.bb => flex_2.6.4.bb} | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta/recipes-devtools/flex/{flex_2.6.0.bb => flex_2.6.4.bb} (90%)
> 
> diff --git a/meta/recipes-devtools/flex/flex_2.6.0.bb b/meta/recipes-devtools/flex/flex_2.6.4.bb
> similarity index 90%
> rename from meta/recipes-devtools/flex/flex_2.6.0.bb
> rename to meta/recipes-devtools/flex/flex_2.6.4.bb
> index ab35b09..038aa37 100644
> --- a/meta/recipes-devtools/flex/flex_2.6.0.bb
> +++ b/meta/recipes-devtools/flex/flex_2.6.4.bb
> @@ -10,7 +10,7 @@ BBCLASSEXTEND = "native nativesdk"
>  
>  LIC_FILES_CHKSUM = "file://COPYING;md5=e4742cf92e89040b39486a6219b68067"
>  
> -SRC_URI = "${SOURCEFORGE_MIRROR}/flex/flex-${PV}.tar.bz2 \
> +SRC_URI = "https://github.com/westes/flex/files/981163/${PN}-${PV}.tar.gz \
>             file://run-ptest \
>             file://do_not_create_pdf_doc.patch \
>             file://0001-tests-add-a-target-for-building-tests-without-runnin.patch \
> @@ -19,8 +19,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/flex/flex-${PV}.tar.bz2 \
>             ${@bb.utils.contains('PTEST_ENABLED', '1', '', 'file://disable-tests.patch', d)} \
>             "
>  
> -SRC_URI[md5sum] = "266270f13c48ed043d95648075084d59"
> -SRC_URI[sha256sum] = "24e611ef5a4703a191012f80c1027dc9d12555183ce0ecd46f3636e587e9b8e9"
> +SRC_URI[md5sum] = "2882e3179748cc9f9c23ec593d6adc8d"
> +SRC_URI[sha256sum] = "e87aae032bf07c26f85ac0ed3250998c37621d95f8bd748b31f15b33c45ee995"
>  
>  # Flex has moved to github from 2.6.1 onwards
>  UPSTREAM_CHECK_URI = "https://github.com/westes/flex/releases"
> -- 
> 1.9.1
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

