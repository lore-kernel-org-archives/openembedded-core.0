Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id BF501773FE
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jun 2016 15:54:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u52FrucN016530; Thu, 2 Jun 2016 16:53:56 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id HZSgXNCNbiRX; Thu,  2 Jun 2016 16:53:56 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u52FrqwW016526
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 2 Jun 2016 16:53:54 +0100
Message-ID: <1464882832.13979.4.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andrew Bradford <andrew@bradfordembedded.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 02 Jun 2016 16:53:52 +0100
In-Reply-To: <1464205571-26293-2-git-send-email-andrew@bradfordembedded.com>
References: <1464205571-26293-1-git-send-email-andrew@bradfordembedded.com>
	<1464205571-26293-2-git-send-email-andrew@bradfordembedded.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: Andrew Bradford <andrew.bradford@kodakalaris.com>
Subject: Re: [PATCH 1/3] oe-buildenv-internal: Add P4CONFIG to BB_ENV_EXTRAWHITE_OE
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
X-List-Received-Date: Thu, 02 Jun 2016 15:54:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2016-05-25 at 15:46 -0400, Andrew Bradford wrote:
> From: Andrew Bradford <andrew.bradford@kodakalaris.com>
> 
> So that the user's P4CONFIG variable can be used by recipes which
> utilize the perforce fetcher.
> 
> References [YOCTO #6303]
> 
> Signed-off-by: Andrew Bradford <andrew.bradford@kodakalaris.com>
> ---
>  scripts/oe-buildenv-internal | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/oe-buildenv-internal b/scripts/oe-buildenv
> -internal
> index 81ee784..e51b950 100755
> --- a/scripts/oe-buildenv-internal
> +++ b/scripts/oe-buildenv-internal
> @@ -114,7 +114,7 @@ BB_ENV_EXTRAWHITE_OE="MACHINE DISTRO TCMODE
> TCLIBC HTTP_PROXY http_proxy \
>  HTTPS_PROXY https_proxy FTP_PROXY ftp_proxy FTPS_PROXY ftps_proxy
> ALL_PROXY \
>  all_proxy NO_PROXY no_proxy SSH_AGENT_PID SSH_AUTH_SOCK
> BB_SRCREV_POLICY \
>  SDKMACHINE BB_NUMBER_THREADS BB_NO_NETWORK PARALLEL_MAKE
> GIT_PROXY_COMMAND \
> -SOCKS5_PASSWD SOCKS5_USER SCREENDIR STAMPS_DIR BBPATH_EXTRA"
> +SOCKS5_PASSWD SOCKS5_USER SCREENDIR STAMPS_DIR BBPATH_EXTRA
> P4CONFIG"
>  
>  BB_ENV_EXTRAWHITE="$(echo $BB_ENV_EXTRAWHITE $BB_ENV_EXTRAWHITE_OE |
> tr ' ' '\n' | LC_ALL=C sort --unique | tr '\n' ' ')"

With the recent changes to the bitbake fetcher, its able to pull
environment variables out of BB_ORIGENV. This should mean this patch
isn't necessary?

http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=f9c623ddbfc140c0c8911f06aa2824edef8a5f4f

Cheers,

Richard


