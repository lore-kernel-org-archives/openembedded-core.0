Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3BBE1731C2
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jan 2016 22:59:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u04Mxt5Z006258
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 4 Jan 2016 14:59:56 -0800
Received: from Marks-MacBook-Pro.local (172.25.36.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.248.2; Mon, 4 Jan 2016 14:59:55 -0800
To: Matthias Schiffer <mschiffer@universe-factory.net>,
	<openembedded-core@lists.openembedded.org>
References: <c00e9825d8e0221666adffd95ed157f9affe06b8.1451778497.git.mschiffer@universe-factory.net>
	<f8b6e0a67be1bede97cded62d1ee42aae8b8977b.1451778497.git.mschiffer@universe-factory.net>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <568AF96A.50302@windriver.com>
Date: Mon, 4 Jan 2016 16:59:54 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.5.0
MIME-Version: 1.0
In-Reply-To: <f8b6e0a67be1bede97cded62d1ee42aae8b8977b.1451778497.git.mschiffer@universe-factory.net>
Subject: Re: [PATCH v2 2/3] base-files: create ${base_bindir} etc. instead of /bin, /sbin and /lib
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
X-List-Received-Date: Mon, 04 Jan 2016 22:59:56 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 1/2/16 5:53 PM, Matthias Schiffer wrote:
> These directories conflict with the symlinks created for merged-usr setups.
> 
> Signed-off-by: Matthias Schiffer <mschiffer@universe-factory.net>
> ---
> v2: create both ${base_libdir} and ${nonarch_base_libdir}
> 
>  meta/recipes-core/base-files/base-files_3.0.14.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recipes-core/base-files/base-files_3.0.14.bb
> index b71d5c5..2af7ecd 100644
> --- a/meta/recipes-core/base-files/base-files_3.0.14.bb
> +++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
> @@ -33,8 +33,8 @@ INHIBIT_DEFAULT_DEPS = "1"
>  docdir_append = "/${P}"
>  dirs1777 = "/tmp ${localstatedir}/volatile/tmp"
>  dirs2775 = ""
> -dirs755 = "/bin /boot /dev ${sysconfdir} ${sysconfdir}/default \
> -           ${sysconfdir}/skel /lib /mnt /proc ${ROOT_HOME} /run /sbin \
> +dirs755 = "${base_bindir} /boot /dev ${sysconfdir} ${sysconfdir}/default \
> +           ${sysconfdir}/skel ${base_libdir} ${nonarch_base_libdir} /mnt /proc ${ROOT_HOME} /run ${base_sbindir} \
>             ${prefix} ${bindir} ${docdir} /usr/games ${includedir} \
>             ${libdir} ${sbindir} ${datadir} \
>             ${datadir}/common-licenses ${datadir}/dict ${infodir} \
> 

I agree this new set looks correct.. but I'd like to see the corresponding
change to fs-perms that sets the permissions and such for each of these new
locations.

--Mark

