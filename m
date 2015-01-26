Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0C49560670
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Jan 2015 03:29:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t0Q3TWOt010652
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Jan 2015 19:29:32 -0800 (PST)
Received: from [128.224.162.136] (128.224.162.136) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Sun, 25 Jan 2015 19:29:31 -0800
Message-ID: <54C5B49A.30808@windriver.com>
Date: Mon, 26 Jan 2015 11:29:30 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1422241586-21660-1-git-send-email-rongqing.li@windriver.com>
In-Reply-To: <1422241586-21660-1-git-send-email-rongqing.li@windriver.com>
Subject: Re: [PATCH] systemd/update-rc.d: set UPDATERCD to empty if systemd is used
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
X-List-Received-Date: Mon, 26 Jan 2015 03:29:34 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Please ignore it.
Thanks

-Roy

On 2015年01月26日 11:06, rongqing.li@windriver.com wrote:
> From: Roy Li <rongqing.li@windriver.com>
>
> if a package is using systemd to manager its start/stop, it does not need
> UPDATERCD, so not need to add update-rc.d into its RRECOMMENDS
>
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>   meta/classes/systemd.bbclass     | 2 ++
>   meta/classes/update-rc.d.bbclass | 2 +-
>   2 files changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/systemd.bbclass b/meta/classes/systemd.bbclass
> index 708ba89..58791fa 100644
> --- a/meta/classes/systemd.bbclass
> +++ b/meta/classes/systemd.bbclass
> @@ -8,6 +8,8 @@ SYSTEMD_PACKAGES_class-nativesdk ?= ""
>   # Whether to enable or disable the services on installation.
>   SYSTEMD_AUTO_ENABLE ??= "enable"
>
> +UPDATERCD = ""
> +
>   # This class will be included in any recipe that supports systemd init scripts,
>   # even if systemd is not in DISTRO_FEATURES.  As such don't make any changes
>   # directly but check the DISTRO_FEATURES first.
> diff --git a/meta/classes/update-rc.d.bbclass b/meta/classes/update-rc.d.bbclass
> index bc1aa7d..81e96ea 100644
> --- a/meta/classes/update-rc.d.bbclass
> +++ b/meta/classes/update-rc.d.bbclass
> @@ -3,7 +3,7 @@ UPDATERCPN ?= "${PN}"
>   DEPENDS_append = " update-rc.d-native"
>   VIRTUAL-RUNTIME_initscripts ?= "initscripts"
>   DEPENDS_append_class-target = " ${VIRTUAL-RUNTIME_initscripts}"
> -UPDATERCD = "update-rc.d"
> +UPDATERCD ?= "update-rc.d"
>   UPDATERCD_class-cross = ""
>   UPDATERCD_class-native = ""
>   UPDATERCD_class-nativesdk = ""
>

-- 
Best Reagrds,
Roy | RongQing Li

