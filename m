Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Swaqi-0001Rt-16
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Aug 2012 17:28:36 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q71FGuHc009533
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 1 Aug 2012 08:16:56 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.34.39) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Wed, 1 Aug 2012 08:16:56 -0700
Message-ID: <50194868.8050406@windriver.com>
Date: Wed, 1 Aug 2012 10:16:56 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:14.0) Gecko/20120713 Thunderbird/14.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1343830340-25351-1-git-send-email-morgan.little@windriver.com>
	<1343830340-25351-12-git-send-email-morgan.little@windriver.com>
In-Reply-To: <1343830340-25351-12-git-send-email-morgan.little@windriver.com>
Subject: Re: [PATCH 11/19] wget: use new update-alternatives
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
X-List-Received-Date: Wed, 01 Aug 2012 15:28:36 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 8/1/12 9:12 AM, Morgan Little wrote:
>
> Signed-off-by: Morgan Little <morgan.little@windriver.com>
> ---
>   meta/recipes-extended/wget/wget.inc |    8 ++++----
>   1 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/meta/recipes-extended/wget/wget.inc b/meta/recipes-extended/wget/wget.inc
> index 4e1e931..0047329 100644
> --- a/meta/recipes-extended/wget/wget.inc
> +++ b/meta/recipes-extended/wget/wget.inc
> @@ -4,7 +4,7 @@
>   LICENSE = "GPLv3"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>   DEPENDS = "openssl"
>
> -INC_PR = "r14"
> +INC_PR = "r15"
>
>   inherit autotools gettext update-alternatives
>
> @@ -14,7 +14,7 @@
>   do_install_append () {
>   	mv ${D}${bindir}/wget ${D}${bindir}/wget.${BPN}
>   }
>
> -ALTERNATIVE_NAME = "wget"
> -ALTERNATIVE_LINK = "${bindir}/wget"
> -ALTERNATIVE_PATH = "${bindir}/wget.${BPN}"
> +ALTERNATIVE_${PN} = "wget"
> +ALTERNATIVE_LINK_NAME[wget] = "${bindir}/wget"
> +ALTERNATIVE_TARGET[wget] = "${bindir}/wget.${BPN}"
>   ALTERNATIVE_PRIORITY = "100"
>

Remove the do_install_append, and the ALTERNATIVE_TARGET[wget] won't be needed.

--Mark


