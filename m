Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1TkclC-0003EJ-7f
	for openembedded-core@lists.openembedded.org;
	Mon, 17 Dec 2012 16:37:45 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qBHFN0pF002136
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2012 07:23:00 -0800 (PST)
Received: from Marks-MacBook-Pro.local (172.25.36.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Mon, 17 Dec 2012 07:23:00 -0800
Message-ID: <50CF38D4.8040701@windriver.com>
Date: Mon, 17 Dec 2012 09:23:00 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1355741287-8655-1-git-send-email-alexandru.damian@intel.com>
In-Reply-To: <1355741287-8655-1-git-send-email-alexandru.damian@intel.com>
Subject: Re: [PATCH] Core image base ssh access and package management
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Dec 2012 15:37:45 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 12/17/12 4:48 AM, Alex DAMIAN wrote:
> From: Alexandru DAMIAN <alexandru.damian@intel.com>
>
> Since core-image-base is a default image that developers should
> use for developing headless applications, it should have
> package management and ssh access.

I'm not sure I agree with that.

'base' should be a small system, similar to minimal, but with discrete 
executables.  If the user wants packaging and ssh they should be able to add it.

--Mark

> Signed-off-by: Alexandru DAMIAN <alexandru.damian@intel.com>
> ---
>   meta/recipes-core/images/core-image-base.bb |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/images/core-image-base.bb b/meta/recipes-core/images/core-image-base.bb
> index 8ef3376..a78417f 100644
> --- a/meta/recipes-core/images/core-image-base.bb
> +++ b/meta/recipes-core/images/core-image-base.bb
> @@ -1,7 +1,7 @@
>   DESCRIPTION = "A console-only image that fully supports the target device \
>   hardware."
>
> -IMAGE_FEATURES += "splash"
> +IMAGE_FEATURES += "splash package-management ssh-server-dropbear"
>
>   LICENSE = "MIT"
>
>



