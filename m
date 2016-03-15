Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0D08E6FF04
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Mar 2016 06:52:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u2F6qrNa007343
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Mar 2016 23:52:53 -0700 (PDT)
Received: from [128.224.162.210] (128.224.162.210) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Mon, 14 Mar 2016 23:52:52 -0700
Message-ID: <56E7B14C.2080407@windriver.com>
Date: Tue, 15 Mar 2016 14:53:00 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1446191361.git.Qi.Chen@windriver.com>
	<f8f5893dae8e77dc271ecf1cd5d98f44adb75bf2.1446191361.git.Qi.Chen@windriver.com>
In-Reply-To: <f8f5893dae8e77dc271ecf1cd5d98f44adb75bf2.1446191361.git.Qi.Chen@windriver.com>
X-Originating-IP: [128.224.162.210]
Subject: Re: [PATCH 1/1] toolchain-script: use immediate expansion for TOOLCHAIN_CONFIGSITE_NOCACHE
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
X-List-Received-Date: Tue, 15 Mar 2016 06:52:53 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

ping

On 10/30/2015 03:50 PM, Chen Qi wrote:
> Use immediate expansion for the assignment to avoid other classes modifying
> variables like HOST_ARCH which changes the result. This happens in the
> meta-environment recipe. It inherits cross-canadian which changes HOST_ARCH
> from TARGET_ARCH to SDK_ARCH, resulting in wrong site config files in the
> generated SDK.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>   meta/classes/toolchain-scripts.bbclass | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
> index d0b2b91..4427369 100644
> --- a/meta/classes/toolchain-scripts.bbclass
> +++ b/meta/classes/toolchain-scripts.bbclass
> @@ -98,7 +98,7 @@ EOF
>   }
>   
>   #we get the cached site config in the runtime
> -TOOLCHAIN_CONFIGSITE_NOCACHE = "${@siteinfo_get_files(d, True)}"
> +TOOLCHAIN_CONFIGSITE_NOCACHE := "${@siteinfo_get_files(d, True)}"
>   TOOLCHAIN_CONFIGSITE_SYSROOTCACHE = "${STAGING_DIR}/${MLPREFIX}${MACHINE}/${target_datadir}/${TARGET_SYS}_config_site.d"
>   TOOLCHAIN_NEED_CONFIGSITE_CACHE ??= "virtual/${MLPREFIX}libc ncurses"
>   


