Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1FE6E6B1EE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2013 08:46:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r6V8klQ7023140
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2013 01:46:47 -0700 (PDT)
Received: from [128.224.162.233] (128.224.162.233) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Wed, 31 Jul 2013 01:46:47 -0700
Message-ID: <51F8CEFF.2050406@windriver.com>
Date: Wed, 31 Jul 2013 16:46:55 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1375258783-9009-1-git-send-email-B40290@freescale.com>
In-Reply-To: <1375258783-9009-1-git-send-email-B40290@freescale.com>
X-Originating-IP: [128.224.162.233]
Subject: Re: [PATCH] base-files: remove symbolic link from /etc/mtab to /proc/mounts
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
X-List-Received-Date: Wed, 31 Jul 2013 08:46:47 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 07/31/2013 04:19 PM, Chunrong Guo wrote:
>      *If /etc/mtab is a symlink to /proc/self/mounts,
>       mounting fails because addmntent returns an error.
>       As a consequence, the Private directory is unusable
>       because /proc/self/mounts is read-only feature.

Could you please detail your environment a little bit?
Where does this error come from?

Besides, if you're going to make this change, please take a read-only 
rootfs into consideration. There should be more to fix.

Best Regards,
Chen Qi

> Signed-off-by: Chunrong Guo <B40290@freescale.com>
> ---
>   meta/recipes-core/base-files/base-files_3.0.14.bb |    1 -
>   1 files changed, 0 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recipes-core/base-files/base-files_3.0.14.bb
> index 054fefa..1843bdd 100644
> --- a/meta/recipes-core/base-files/base-files_3.0.14.bb
> +++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
> @@ -100,7 +100,6 @@ do_install () {
>   	install -m 0644 ${WORKDIR}/host.conf ${D}${sysconfdir}/host.conf
>   	install -m 0644 ${WORKDIR}/motd ${D}${sysconfdir}/motd
>   
> -	ln -sf /proc/mounts ${D}${sysconfdir}/mtab
>   }
>   
>   do_install_basefilesissue () {


