Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id EE5DA78982
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Jun 2018 08:28:42 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w5A8Seb9014311
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Sun, 10 Jun 2018 09:28:42 +0100
Message-ID: <3c2822a6667bf7cde3d5440d96e51af8ddc28ed2.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: liu.ming50@gmail.com, openembedded-core@lists.openembedded.org
Date: Sun, 10 Jun 2018 09:28:40 +0100
In-Reply-To: <1528557877-22037-1-git-send-email-liu.ming50@gmail.com>
References: <1528557877-22037-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] bitbake.conf: add BB_CURRENT_MC to OVERRIDES
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
X-List-Received-Date: Sun, 10 Jun 2018 08:28:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2018-06-09 at 17:24 +0200, liu.ming50@gmail.com wrote:
> From: Ming Liu <liu.ming50@gmail.com>
> 
> This is useful when the users want different variables/tasks when
> using
> multiconfig.
> 
> Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> ---
>  meta/conf/bitbake.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 3b2ef9f..8b2555b 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -731,7 +731,7 @@ DISTRO_NAME ??= "OpenEmbedded"
>  # And finally '<foo>_forcevariable' overrides any standard variable,
> with the highest priority.
>  # This works for functions as well, they are really just variables.
>  #
> -OVERRIDES = "${TARGET_OS}:${TRANSLATED_TARGET_ARCH}:pn-
> ${PN}:${MACHINEOVERRIDES}:${DISTROOVERRIDES}:${CLASSOVERRIDE}${LIBCOV
> ERRIDE}:forcevariable"
> +OVERRIDES = "${TARGET_OS}:${TRANSLATED_TARGET_ARCH}:pn-
> ${PN}:${MACHINEOVERRIDES}:${DISTROOVERRIDES}:${CLASSOVERRIDE}${LIBCOV
> ERRIDE}:${BB_CURRENT_MC}:forcevariable"
>  LIBCOVERRIDE ?= ""
>  CLASSOVERRIDE ?= "class-target"
>  DISTROOVERRIDES ?= "${@d.getVar('DISTRO') or ''}"

This adds "" in OVERRIDES in the default case. Whilst I think (but am
not 100% sure) we fixed bitbake not to break on such a value, I'm not
convinced adding empty elements to it is a good idea and this did used
to break things.

Cheers,

Richard

