Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Swaoe-0001Fj-Ew
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Aug 2012 17:26:28 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q71FEmHd009501
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 1 Aug 2012 08:14:48 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.34.39) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Wed, 1 Aug 2012 08:14:49 -0700
Message-ID: <501947E9.5060000@windriver.com>
Date: Wed, 1 Aug 2012 10:14:49 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:14.0) Gecko/20120713 Thunderbird/14.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1343830340-25351-1-git-send-email-morgan.little@windriver.com>
	<1343830340-25351-6-git-send-email-morgan.little@windriver.com>
In-Reply-To: <1343830340-25351-6-git-send-email-morgan.little@windriver.com>
Subject: Re: [PATCH 05/19] less: use new update-alternatives
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
X-List-Received-Date: Wed, 01 Aug 2012 15:26:28 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 8/1/12 9:12 AM, Morgan Little wrote:
>
> Signed-off-by: Morgan Little <morgan.little@windriver.com>
> ---
>   meta/recipes-extended/less/less_444.bb |    6 +++---
>   1 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-extended/less/less_444.bb b/meta/recipes-extended/less/less_444.bb
> index 146b4fd..d18293d 100644
> --- a/meta/recipes-extended/less/less_444.bb
> +++ b/meta/recipes-extended/less/less_444.bb
> @@ -23,7 +23,7 @@
>   LICENSE = "GPLv3+ | BSD-2-Clause"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
>                       file://LICENSE;md5=1237c0f825bb36122b0b2b486ffbe6be"
>   DEPENDS = "ncurses"
> -PR = "r2"
> +PR = "r3"
>
>   SRC_URI = "http://www.greenwoodsoftware.com/${BPN}/${BPN}-${PV}.tar.gz"
>
> @@ -37,6 +37,6 @@
>   do_install () {
>           mv ${D}${bindir}/less ${D}${bindir}/less.${BPN}
>   }
>
> -ALTERNATIVE_NAME = "less"
> -ALTERNATIVE_PATH = "less.${BPN}"
> +ALTERNATIVE_${PN} = "less"
> +ALTERNATIVE_TARGET[less] = "${bindir}/less.${BPN}"
>   ALTERNATIVE_PRIORITY = "100"
>

The mv in the do_install is not needed, once it is removed the 
ALTERNATIVE_TARGET[LESS] is no longer needed either.


