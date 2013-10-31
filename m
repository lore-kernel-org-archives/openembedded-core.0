Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 4F3596D2C4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2013 17:20:11 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 31 Oct 2013 10:20:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="315345890"
Received: from unknown (HELO [10.255.15.36]) ([10.255.15.36])
	by AZSMGA002.ch.intel.com with ESMTP; 31 Oct 2013 10:20:12 -0700
Message-ID: <5272914B.9040702@linux.intel.com>
Date: Thu, 31 Oct 2013 10:20:11 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: yaoxp <yaoxp@cn.fujitsu.com>, 
 openembedded-core@lists.openembedded.org
References: <008a01cec5bd$b1797160$146c5420$@cn.fujitsu.com>
In-Reply-To: <008a01cec5bd$b1797160$146c5420$@cn.fujitsu.com>
Subject: Re: [PATCH 1/1] cronie: build cronie with --with-syscrontab
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
X-List-Received-Date: Thu, 31 Oct 2013 17:20:12 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/10/2013 06:36 AM, yaoxp wrote:
> Hi all,
> 	
> If build cronie without --with-syscrontab, the /etc/crontab will not work.
>

I ran a test without this and the /etc/crontab file was read and the 
cron entry was executed, can you explain more clearly what you observed?

The default seems to have it enabled unless it's explicitly disabled. 
This might be a change from 1.4.9 to 1.4.11 as the recipe was recently 
updated.

Sau!



> Signed-off-by: Yao Xinpan <yaoxp@cn.fujitsu.com>
> ---
>   meta/recipes-extended/cronie/cronie_1.4.9.bb |    4 +++-
>   1 files changed, 3 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-extended/cronie/cronie_1.4.9.bb b/meta/recipes-extended/cronie/cronie_1.4.9.bb
> index 7db0381..0fbb815 100644
> --- a/meta/recipes-extended/cronie/cronie_1.4.9.bb
> +++ b/meta/recipes-extended/cronie/cronie_1.4.9.bb
> @@ -34,7 +34,9 @@ SRC_URI[sha256sum] = "bd7f6f118460c452bd1217a24b80fd3c000425d3de28731b98354a81a2
>   inherit autotools update-rc.d useradd
>
>   EXTRA_OECONF += "\
> -                ${@base_contains('DISTRO_FEATURES', 'pam', '--with-pam', '--without-pam', d)}"
> +                ${@base_contains('DISTRO_FEATURES', 'pam', '--with-pam', '--without-pam', d)} \
> +                --with-syscrontab \
> +                "
>
>   INITSCRIPT_NAME = "crond"
>   INITSCRIPT_PARAMS = "start 90 2 3 4 5 . stop 60 0 1 6 ."
> --
> 1.7.1
>
> -------------------------------------------
> Yao Xinpan
> TEL: 8559
>
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

