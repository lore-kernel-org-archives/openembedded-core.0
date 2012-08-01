Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SwapS-0001Ic-Tv
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Aug 2012 17:27:19 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q71FFdfw009518
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 1 Aug 2012 08:15:39 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.34.39) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Wed, 1 Aug 2012 08:15:40 -0700
Message-ID: <5019481C.4080107@windriver.com>
Date: Wed, 1 Aug 2012 10:15:40 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:14.0) Gecko/20120713 Thunderbird/14.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1343830340-25351-1-git-send-email-morgan.little@windriver.com>
	<1343830340-25351-8-git-send-email-morgan.little@windriver.com>
In-Reply-To: <1343830340-25351-8-git-send-email-morgan.little@windriver.com>
Subject: Re: [PATCH 07/19] mktemp: use new update-alternatives
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
X-List-Received-Date: Wed, 01 Aug 2012 15:27:19 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 8/1/12 9:12 AM, Morgan Little wrote:
>
> Signed-off-by: Morgan Little <morgan.little@windriver.com>
> ---
>   meta/recipes-extended/mktemp/mktemp_1.7.bb |    8 ++++----
>   1 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/meta/recipes-extended/mktemp/mktemp_1.7.bb b/meta/recipes-extended/mktemp/mktemp_1.7.bb
> index b3a3d51..57f0df3 100644
> --- a/meta/recipes-extended/mktemp/mktemp_1.7.bb
> +++ b/meta/recipes-extended/mktemp/mktemp_1.7.bb
> @@ -5,7 +5,7 @@
>   SECTION = "console/utils"
>   LICENSE = "ISC"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=430680f6322a1eb87199b5e01a82c0d4"
>
> -PR = "r2"
> +PR = "r3"
>
>   SRC_URI = "ftp://ftp.mktemp.org/pub/mktemp/${BPN}-${PV}.tar.gz \
>           file://disable-strip.patch \
> @@ -25,7 +25,7 @@
>   do_install_append () {
>   	rmdir ${D}${bindir}
>   }
>
> -ALTERNATIVE_NAME = "mktemp"
> -ALTERNATIVE_LINK = "${base_bindir}/mktemp"
> -ALTERNATIVE_PATH = "${base_bindir}/mktemp.${BPN}"
> +ALTERNATIVE_${PN} = "mktemp"
> +ALTERNAITVE_LINK_NAME[mktemp] = "${base_bindir}/mktemp"
> +ALTERNATIVE_TARGET[mktemp] = "${base_bindir}/mktemp.${BPN}"
>   ALTERNATIVE_PRIORITY = "100"
>

Similar to the previous, figure out where mktemp.${BPN} is generated, the 
update-alternatives will do it automatically..  Then ALTERNATIVE_TARGET[mktemp] 
shouldn't be needed.

--Mark


