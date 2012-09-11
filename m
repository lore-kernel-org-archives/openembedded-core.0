Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1TBSsA-0001Ev-CE
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 17:59:34 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q8BFkxxT020338
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Sep 2012 08:46:59 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.227) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Tue, 11 Sep 2012 08:46:59 -0700
Message-ID: <504F5CF2.4070402@windriver.com>
Date: Tue, 11 Sep 2012 10:46:58 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:15.0) Gecko/20120824 Thunderbird/15.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <504F05A8.3000207@communistcode.co.uk>
	<1347359617-4821-1-git-send-email-ml@communistcode.co.uk>
In-Reply-To: <1347359617-4821-1-git-send-email-ml@communistcode.co.uk>
Subject: Re: [PATCH] git: add missing Python dependency
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
X-List-Received-Date: Tue, 11 Sep 2012 15:59:34 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 9/11/12 5:33 AM, Jack Mitchell wrote:
> From: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
>
> Add python to DEPENDS as it fails to install on target with RPM
> failing at do_rootfs due to un-met dependencies.
>
> Signed-off-by: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
> ---
>   meta/recipes-devtools/git/git.inc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/git/git.inc
> index 6748b70..9181da6 100644
> --- a/meta/recipes-devtools/git/git.inc
> +++ b/meta/recipes-devtools/git/git.inc
> @@ -1,7 +1,7 @@
>   DESCRIPTION = "The git revision control system used by the Linux kernel developers"
>   SECTION = "console/utils"
>   LICENSE = "GPLv2"
> -DEPENDS = "openssl curl zlib expat"
> +DEPENDS = "openssl curl zlib expat python"

I think this depends is needed based on some easy evaluation of git.

git (at least git-native) provides one example python script, and some python 
modules.. these should be broken off into other sub packages to help eliminate 
the -runtime- python requirement (I'm assuming they're both optional for general 
git usage....)

But someone with more knowledge with git then me should go that.

--Mark

>
>   PROVIDES_append_virtclass-native = " git-replacement-native"
>
>



