Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id AB07260043
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Apr 2015 10:02:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t38A07Ha032109; Wed, 8 Apr 2015 11:00:07 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id rmKZLMmwmRTH; Wed,  8 Apr 2015 11:00:07 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t389xrxd032086
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 8 Apr 2015 11:00:05 +0100
Message-ID: <1428487193.14020.499.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Denys Dmytriyenko <denis@denix.org>
Date: Wed, 08 Apr 2015 10:59:53 +0100
In-Reply-To: <1428440035-6307-2-git-send-email-denis@denix.org>
References: <1428440035-6307-1-git-send-email-denis@denix.org>
	<1428440035-6307-2-git-send-email-denis@denix.org>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: Denys Dmytriyenko <denys@ti.com>, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] security_flags.inc: disable PIE for bash due to issues in mkbuiltins
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
X-List-Received-Date: Wed, 08 Apr 2015 10:02:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2015-04-07 at 16:53 -0400, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
> 
> As bash builds a native tool called mkbuiltins, it fails with PIE flags:
> 
> ld: mkbuiltins.o: relocation R_X86_64_32 against `.rodata.str1.8' can not be used when making a shared object; recompile with -fPIC
> 
> Affects at least version 3.2 of bash.

I am a little worried about this one. Which architecture were you
building for and is this just 3.x of bash or 4.x as well? I'd like to
understand why we haven't seen this before...

Cheers,

Richard

> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  meta/conf/distro/include/security_flags.inc | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
> index 21e1a53..3401c4b 100644
> --- a/meta/conf/distro/include/security_flags.inc
> +++ b/meta/conf/distro/include/security_flags.inc
> @@ -16,6 +16,7 @@ SECURITY_CFLAGS_pn-lttng-tools_arm = "${SECURITY_NO_PIE_CFLAGS}"
>  SECURITY_CFLAGS_pn-elfutils_arm = "${SECURITY_NO_PIE_CFLAGS}"
>  
>  SECURITY_CFLAGS_pn-aspell = "${SECURITY_NO_PIE_CFLAGS}"
> +SECURITY_CFLAGS_pn-bash = "${SECURITY_NO_PIE_CFLAGS}"
>  SECURITY_CFLAGS_pn-beecrypt = "${SECURITY_NO_PIE_CFLAGS}"
>  SECURITY_CFLAGS_pn-blktrace = "${SECURITY_NO_PIE_CFLAGS}"
>  # Curl seems to check for FORTIFY_SOURCE in CFLAGS, but even assigned
> -- 
> 2.2.0
> 



