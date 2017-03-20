Return-Path: <sbabic@denx.de>
X-Greylist: delayed 514 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 20 Mar 2017 09:23:00 UTC
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id 335F860777
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Mar 2017 09:23:00 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 3vmqyV5V6hz1qqvY;
	Mon, 20 Mar 2017 10:14:26 +0100 (CET)
Received: from localhost (dynscan01.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 3vmqyV4BBqz3jgYT;
	Mon, 20 Mar 2017 10:14:26 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan01.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id 8776Kw_IyexU; Mon, 20 Mar 2017 10:14:24 +0100 (CET)
Received: from babic.homelinux.org (host-88-217-136-221.customer.m-online.net
	[88.217.136.221]) by mail.mnet-online.de (Postfix) with ESMTP;
	Mon, 20 Mar 2017 10:14:24 +0100 (CET)
Received: from localhost (mail.babic.homelinux.org [127.0.0.1])
	by babic.homelinux.org (Postfix) with ESMTP id BFFE24540228;
	Mon, 20 Mar 2017 10:13:31 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at babic.homelinux.org
Received: from babic.homelinux.org ([127.0.0.1])
	by localhost (mail.babic.homelinux.org [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id iTvMkfKewZZw; Mon, 20 Mar 2017 10:13:27 +0100 (CET)
Received: from [192.168.178.132] (papero.fritz.box [192.168.178.132])
	by babic.homelinux.org (Postfix) with ESMTP id 81A5B454043A;
	Mon, 20 Mar 2017 10:13:27 +0100 (CET)
To: Robert Yang <liezhi.yang@windriver.com>,
	openembedded-core@lists.openembedded.org
References: <cover.1487727826.git.liezhi.yang@windriver.com>
	<2702bdc3f6961ba31689d97d67e900f9865d40ee.1487727826.git.liezhi.yang@windriver.com>
From: Stefano Babic <sbabic@denx.de>
Message-ID: <ef157c32-b0e7-c487-e9de-57449c22b474@denx.de>
Date: Mon, 20 Mar 2017 10:14:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <2702bdc3f6961ba31689d97d67e900f9865d40ee.1487727826.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 5/5] file: 5.29 -> 5.30
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
X-List-Received-Date: Mon, 20 Mar 2017 09:23:01 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 22/02/2017 02:44, Robert Yang wrote:
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/recipes-devtools/file/{file_5.29.bb => file_5.30.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-devtools/file/{file_5.29.bb => file_5.30.bb} (96%)
> 
> diff --git a/meta/recipes-devtools/file/file_5.29.bb b/meta/recipes-devtools/file/file_5.30.bb
> similarity index 96%
> rename from meta/recipes-devtools/file/file_5.29.bb
> rename to meta/recipes-devtools/file/file_5.30.bb
> index 29af8748150..0998fcfa899 100644
> --- a/meta/recipes-devtools/file/file_5.29.bb
> +++ b/meta/recipes-devtools/file/file_5.30.bb
> @@ -19,7 +19,7 @@ SRC_URI = "git://github.com/file/file.git \
>          file://0001-Add-P-prompt-into-Usage-info.patch \
>          "
>  
> -SRCREV = "015b0cdce1a0abb68ab99510e7fc8d2f77e8ec77"
> +SRCREV = "79814950aafb81ecd6a910c2a8a3b8ec12f3e4a6"
>  S = "${WORKDIR}/git"
>  
>  inherit autotools
> 

Strange enough, it seems that the tree loses the history and all SRCREV
are wrong. I tried with -krogoth, -morty, -master, and no revision
number is found. In fact, after cloning the tree I see that all revision
number were changed, just a couple here:

5.25 is now : 789cfc7d727cee1c7cfb7d29c09162e2399285c5

5.30 (this patch) : 3050419355566d2a96c5be97fef0ffae097bbb96

Ok, I fix this in my layer with a .bbappend, but...Of course, all builds
are broken - have you seen the same effect ?

Best regards,
Stefano

-- 
=====================================================================
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-53 Fax: +49-8142-66989-80 Email: sbabic@denx.de
=====================================================================

