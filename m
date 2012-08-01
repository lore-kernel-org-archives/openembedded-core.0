Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SwanP-00014h-B9
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Aug 2012 17:25:11 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q71FDWXO019433
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 1 Aug 2012 08:13:32 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.34.39) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Wed, 1 Aug 2012 08:13:32 -0700
Message-ID: <5019479C.3020806@windriver.com>
Date: Wed, 1 Aug 2012 10:13:32 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:14.0) Gecko/20120713 Thunderbird/14.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1343830340-25351-1-git-send-email-morgan.little@windriver.com>
	<1343830340-25351-3-git-send-email-morgan.little@windriver.com>
In-Reply-To: <1343830340-25351-3-git-send-email-morgan.little@windriver.com>
Subject: Re: [PATCH 02/19] patch: use new update-alternatives
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
X-List-Received-Date: Wed, 01 Aug 2012 15:25:11 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 8/1/12 9:12 AM, Morgan Little wrote:
>
> Signed-off-by: Morgan Little <morgan.little@windriver.com>
> ---
>   meta/recipes-devtools/patch/patch.inc |    4 ++--
>   1 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-devtools/patch/patch.inc b/meta/recipes-devtools/patch/patch.inc
> index 21c06c6..80e00f6 100644
> --- a/meta/recipes-devtools/patch/patch.inc
> +++ b/meta/recipes-devtools/patch/patch.inc
> @@ -13,6 +13,6 @@
>   do_install_append () {
>           mv ${D}${bindir}/patch ${D}${bindir}/patch.${BPN}
>   }
>
> -ALTERNATIVE_NAME = "patch"
> -ALTERNATIVE_PATH = "patch.${BPN}"
> +ALTERNATIVE_${PN} = "patch"
> +ALTERNATIVE_TARGET[patch] = "$[bindir}/patch.${BPN}"
>   ALTERNATIVE_PRIORITY = "100"
>

See the previous.. the do_install_append should be removed, and once that is 
done the alternative_target[patch] is no needed.

--Mark


