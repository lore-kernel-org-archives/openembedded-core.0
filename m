Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9460E7608E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jun 2018 07:34:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w567XxHt015809
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 6 Jun 2018 00:34:20 -0700
Received: from [128.224.162.218] (128.224.162.218) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Wed, 6 Jun 2018 00:33:59 -0700
To: <openembedded-core@lists.openembedded.org>
References: <cover.1527043080.git.Qi.Chen@windriver.com>
	<01db808060198d019ee3a16b4ffc193c31f894a4.1527043080.git.Qi.Chen@windriver.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <d0f9bbe0-bae6-2758-7049-eabf6f490d28@windriver.com>
Date: Wed, 6 Jun 2018 15:36:33 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <01db808060198d019ee3a16b4ffc193c31f894a4.1527043080.git.Qi.Chen@windriver.com>
X-Originating-IP: [128.224.162.218]
Subject: Re: [PATCH 1/1] sysklogd: fix typo in RCONFLICTS
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
X-List-Received-Date: Wed, 06 Jun 2018 07:34:29 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

ping

On 05/23/2018 10:39 AM, Chen Qi wrote:
> It should be RCONFLICTS_${PN} instead of RCONFLICTS_${PN}-syslog.
> There's no ${PN}-syslog package.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>   meta/recipes-extended/sysklogd/sysklogd.inc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-extended/sysklogd/sysklogd.inc b/meta/recipes-extended/sysklogd/sysklogd.inc
> index 1a537fa..fc4e67c 100644
> --- a/meta/recipes-extended/sysklogd/sysklogd.inc
> +++ b/meta/recipes-extended/sysklogd/sysklogd.inc
> @@ -33,7 +33,7 @@ SYSTEMD_AUTO_ENABLE = "enable"
>   
>   INITSCRIPT_NAME = "syslog"
>   CONFFILES_${PN} = "${sysconfdir}/syslog.conf"
> -RCONFLICTS_${PN}-syslog = "rsyslog busybox-syslog syslog-ng"
> +RCONFLICTS_${PN} = "rsyslog busybox-syslog syslog-ng"
>   
>   CFLAGS += "-DSYSV -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE"
>   



