Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id E256C77BF3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Mar 2017 10:32:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTP id v2TAWGt6006665; 
	Wed, 29 Mar 2017 11:32:16 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 8mjv1FBdPrc1; Wed, 29 Mar 2017 11:32:16 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v2TAWDgq006662
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 29 Mar 2017 11:32:14 +0100
Message-ID: <1490783533.13980.313.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Elizabeth 'pidge' Flanagan" <pidge@toganlabs.com>,
	openembedded-core@lists.openembedded.org
Date: Wed, 29 Mar 2017 11:32:13 +0100
In-Reply-To: <1490781608-1841-1-git-send-email-pidge@toganlabs.com>
References: <1490781608-1841-1-git-send-email-pidge@toganlabs.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH] bitbake.conf: Add aws to HOSTTOOLS_NONFATAL
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
X-List-Received-Date: Wed, 29 Mar 2017 10:32:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2017-03-29 at 12:00 +0200, Elizabeth 'pidge' Flanagan wrote:
> This adds aws to HOSTTOOLS_NONFATAL in order to get the s3 fetcher
> working again. 

Cool on this bit although you just broke the sorting patch I just
merged under duress (I knew this would cause pain) :/.

> It also sets FETCHCMD_s3 for completions sake.

Please don't if we don't need it.

Note your patch and this description don't match (FETCHCMD_aws) so its
clearly not needed ;-).

Cheers,

Richard

> Signed-off-by: Elizabeth 'pidge' Flanagan <pidge@toganlabs.com>
> ---
>  meta/conf/bitbake.conf | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 96a9ed9..bfa8dd8 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -469,7 +469,7 @@ HOSTTOOLS += " \
>  HOSTTOOLS += "ip ping ps scp ssh stty"
>  
>  # Link to these if present
> -HOSTTOOLS_NONFATAL += "ccache gcc-ar gpg ld.bfd ld.gold nc sftp
> socat sudo"
> +HOSTTOOLS_NONFATAL += "ccache gcc-ar gpg ld.bfd ld.gold nc sftp
> socat sudo aws"
>  
>  # Temporary add few more detected in bitbake world
>  HOSTTOOLS_NONFATAL += "join nl size yes zcat"
> @@ -640,6 +640,7 @@ FETCHCMD_cvs = "/usr/bin/env cvs"
>  FETCHCMD_wget = "/usr/bin/env wget -t 2 -T 30 -nv --passive-ftp --
> no-check-certificate"
>  FETCHCMD_bzr = "/usr/bin/env bzr"
>  FETCHCMD_hg = "/usr/bin/env hg"
> +FETCHCMD_aws = "/usr/bin/env aws"
>  
>  SRCDATE = "${DATE}"
>  SRCREV ??= "INVALID"
> -- 
> 1.9.1
> 

