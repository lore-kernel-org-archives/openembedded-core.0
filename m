Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id A54EA6BE6E
	for <openembedded-core@lists.openembedded.org>;
	Sun,  6 Oct 2013 08:57:25 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r968vLvQ017039; Sun, 6 Oct 2013 09:57:21 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id VpUrP0Wz6tj2; Sun,  6 Oct 2013 09:57:20 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r968vH8Q017026
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Sun, 6 Oct 2013 09:57:19 +0100
Message-ID: <1381049833.30971.16.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Sun, 06 Oct 2013 09:57:13 +0100
In-Reply-To: <1380925365-18427-1-git-send-email-otavio@ossystems.com.br>
References: <1380925365-18427-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] oe-buildenv-internal: Add UBOOT_CONFIG to environment whitelist
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
X-List-Received-Date: Sun, 06 Oct 2013 08:57:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-10-04 at 19:22 -0300, Otavio Salvador wrote:
> The uboot-config class uses the UBOOT_CONFIG environment setting to
> choose which U-Boot option is intended to build. It is convenient to
> allow it to be set from the shell, as supported for MACHINE.
> 
> This allow, for example, to trigger a build as:
> 
> ,----
> | MACHINE=imx28evk UBOOT_CONFIG=nand bitbake core-image-minimal
> `----
> 
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  scripts/oe-buildenv-internal | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

There are lots of things which we can expose from the shell, we only
really want to default to be things which are commonly changed though.
How often do people realistically change their uboot targets? I
appreciate that when working on uboot its useful but I don't think this
is a significant portion of the userbase?

Cheers,

Richard

> diff --git a/scripts/oe-buildenv-internal b/scripts/oe-buildenv-internal
> index bba6f8f..f8840c1 100755
> --- a/scripts/oe-buildenv-internal
> +++ b/scripts/oe-buildenv-internal
> @@ -106,4 +106,4 @@ export BB_ENV_EXTRAWHITE="MACHINE DISTRO TCMODE TCLIBC HTTP_PROXY http_proxy \
>  HTTPS_PROXY https_proxy FTP_PROXY ftp_proxy FTPS_PROXY ftps_proxy ALL_PROXY \
>  all_proxy NO_PROXY no_proxy SSH_AGENT_PID SSH_AUTH_SOCK BB_SRCREV_POLICY \
>  SDKMACHINE BB_NUMBER_THREADS BB_NO_NETWORK PARALLEL_MAKE GIT_PROXY_COMMAND \
> -SOCKS5_PASSWD SOCKS5_USER SCREENDIR STAMPS_DIR"
> +SOCKS5_PASSWD SOCKS5_USER SCREENDIR STAMPS_DIR UBOOT_CONFIG"



