Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SwaqM-0001PK-F0
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Aug 2012 17:28:14 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q71FGYsb009527
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 1 Aug 2012 08:16:35 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.34.39) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Wed, 1 Aug 2012 08:16:35 -0700
Message-ID: <50194853.6020909@windriver.com>
Date: Wed, 1 Aug 2012 10:16:35 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:14.0) Gecko/20120713 Thunderbird/14.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1343830340-25351-1-git-send-email-morgan.little@windriver.com>
	<1343830340-25351-11-git-send-email-morgan.little@windriver.com>
In-Reply-To: <1343830340-25351-11-git-send-email-morgan.little@windriver.com>
Subject: Re: [PATCH 10/19] time: use new update-alternatives
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
X-List-Received-Date: Wed, 01 Aug 2012 15:28:14 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 8/1/12 9:12 AM, Morgan Little wrote:
>
> Signed-off-by: Morgan Little <morgan.little@windriver.com>
> ---
>   meta/recipes-extended/time/time.inc |    6 +++---
>   1 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-extended/time/time.inc b/meta/recipes-extended/time/time.inc
> index 8e35843..b7cedac 100644
> --- a/meta/recipes-extended/time/time.inc
> +++ b/meta/recipes-extended/time/time.inc
> @@ -12,7 +12,7 @@
>   do_install_append () {
>           mv ${D}${bindir}/time ${D}${bindir}/time.${BPN}
>   }
>
> -ALTERNATIVE_NAME = "time"
> -ALTERNATIVE_LINK = "${bindir}/time"
> -ALTERNATIVE_PATH = "${bindir}/time.${BPN}"
> +ALTERNATIVE_${PN} = "time"
> +ALTERNATIVE_LINK_NAME[time] = "${bindir}/time"
> +ALTERNATIVE_TARGET[time] = "${bindir}/time.${BPN}"
>   ALTERNATIVE_PRIORITY = "100"
>

Remove the do_install_append, and then the ALTERNATIVE_TARGET[time] won't be needed.

--Mark


