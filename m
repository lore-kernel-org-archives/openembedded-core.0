Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id EDFC665CE9
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Aug 2018 03:02:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w7632p2o010258
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 5 Aug 2018 20:02:51 -0700
Received: from [128.224.162.218] (128.224.162.218) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Sun, 5 Aug 2018 20:02:50 -0700
To: <openembedded-core@lists.openembedded.org>
References: <cover.1532943666.git.Qi.Chen@windriver.com>
	<3d50059e869d9d288a64995954c116c039f8fa2f.1532943666.git.Qi.Chen@windriver.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <1b6cc806-cf4b-ce01-64bf-abfa49ba2ccd@windriver.com>
Date: Mon, 6 Aug 2018 11:06:57 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <3d50059e869d9d288a64995954c116c039f8fa2f.1532943666.git.Qi.Chen@windriver.com>
X-Originating-IP: [128.224.162.218]
Subject: Re: [PATCH 1/1] busybox: move init related configs to init.cfg
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
X-List-Received-Date: Mon, 06 Aug 2018 03:02:51 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

ping

On 07/30/2018 05:41 PM, Chen Qi wrote:
> Move init related configs to init.cfg.
>
> These config items do not make much sense unless busybox is selected
> as the init manager. They should belong to init.cfg.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>   meta/recipes-core/busybox/busybox/defconfig | 12 ++++++------
>   meta/recipes-core/busybox/busybox/init.cfg  |  7 ++++++-
>   2 files changed, 12 insertions(+), 7 deletions(-)
>
> diff --git a/meta/recipes-core/busybox/busybox/defconfig b/meta/recipes-core/busybox/busybox/defconfig
> index fbb5fd8..59d93c7 100644
> --- a/meta/recipes-core/busybox/busybox/defconfig
> +++ b/meta/recipes-core/busybox/busybox/defconfig
> @@ -468,21 +468,21 @@ CONFIG_FEATURE_XARGS_SUPPORT_REPL_STR=y
>   # CONFIG_BOOTCHARTD is not set
>   # CONFIG_FEATURE_BOOTCHARTD_BLOATED_HEADER is not set
>   # CONFIG_FEATURE_BOOTCHARTD_CONFIG_FILE is not set
> -CONFIG_HALT=y
> -CONFIG_POWEROFF=y
> -CONFIG_REBOOT=y
> +# CONFIG_HALT is not set
> +# CONFIG_POWEROFF is not set
> +# CONFIG_REBOOT is not set
>   # CONFIG_FEATURE_CALL_TELINIT is not set
> -CONFIG_TELINIT_PATH=""
> +# CONFIG_TELINIT_PATH is not set
>   # CONFIG_INIT is not set
>   # CONFIG_LINUXRC is not set
>   # CONFIG_FEATURE_USE_INITTAB is not set
>   # CONFIG_FEATURE_KILL_REMOVED is not set
> -CONFIG_FEATURE_KILL_DELAY=0
> +# CONFIG_FEATURE_KILL_DELAY is not set
>   # CONFIG_FEATURE_INIT_SCTTY is not set
>   # CONFIG_FEATURE_INIT_SYSLOG is not set
>   # CONFIG_FEATURE_INIT_QUIET is not set
>   # CONFIG_FEATURE_INIT_COREDUMPS is not set
> -CONFIG_INIT_TERMINAL_TYPE=""
> +# CONFIG_INIT_TERMINAL_TYPE is not set
>   # CONFIG_FEATURE_INIT_MODIFY_CMDLINE is not set
>   
>   #
> diff --git a/meta/recipes-core/busybox/busybox/init.cfg b/meta/recipes-core/busybox/busybox/init.cfg
> index 006d4c6..3c1fdd4 100644
> --- a/meta/recipes-core/busybox/busybox/init.cfg
> +++ b/meta/recipes-core/busybox/busybox/init.cfg
> @@ -1,3 +1,8 @@
>   CONFIG_INIT=y
>   CONFIG_FEATURE_USE_INITTAB=y
> -
> +CONFIG_HALT=y
> +CONFIG_POWEROFF=y
> +CONFIG_REBOOT=y
> +CONFIG_FEATURE_KILL_DELAY=0
> +CONFIG_TELINIT_PATH=""
> +CONFIG_INIT_TERMINAL_TYPE=""



