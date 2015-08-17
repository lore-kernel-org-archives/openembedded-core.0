Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E2495759CD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Aug 2015 03:29:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t7H3TcEI004681
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 16 Aug 2015 20:29:38 -0700 (PDT)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.235.1;
	Sun, 16 Aug 2015 20:29:38 -0700
Message-ID: <55D15520.8040604@windriver.com>
Date: Mon, 17 Aug 2015 11:29:36 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: Armin Kuster <akuster808@gmail.com>,
	<openembedded-core@lists.openembedded.org>
References: <1439779827-15189-1-git-send-email-akuster808@gmail.com>
In-Reply-To: <1439779827-15189-1-git-send-email-akuster808@gmail.com>
Cc: Armin Kuster <akuster@mvista.com>
Subject: Re: [PATCH 1/2] bitbake.conf: Add Github mirror
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
X-List-Received-Date: Mon, 17 Aug 2015 03:29:47 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit


Hi Armin,

Please see this thread:

http://lists.openembedded.org/pipermail/openembedded-core/2015-July/108217.html

// Robert

On 08/17/2015 10:50 AM, Armin Kuster wrote:
> From: Armin Kuster <akuster@mvista.com>
>
> This adds Github mirror variable.
>
> Signed-off-by: Armin Kuster <akuster@mvista.com>
> ---
>   meta/conf/bitbake.conf | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 21f1698..56e7ca7 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -571,6 +571,7 @@ DEBIAN_MIRROR = "ftp://ftp.debian.org/debian/pool"
>   GENTOO_MIRROR = "http://distfiles.gentoo.org/distfiles"
>   GNOME_GIT = "git://git.gnome.org"
>   GNOME_MIRROR = "http://ftp.gnome.org/pub/GNOME/sources"
> +GITHUB_MIRROR = "git://github.com"
>   GNU_MIRROR = "http://ftp.gnu.org/gnu"
>   GPE_MIRROR = "http://gpe.linuxtogo.org/download/source"
>   KERNELORG_MIRROR = "http://kernel.org/pub"
>

