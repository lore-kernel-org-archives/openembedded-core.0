Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id 2CFD871D99
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2017 22:30:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 4B4BA31C6981
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2017 23:21:17 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id eQ4VzDWFpeJJ
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2017 23:21:15 +0100 (CET)
Received: from t510.zcs.saftware.de (55d41ba8.access.ecotel.net
	[85.212.27.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 0E35731C6982
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2017 23:21:15 +0100 (CET)
Date: Mon, 30 Jan 2017 23:21:14 +0100
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Message-ID: <20170130232114.1c3f8baf@t510.zcs.saftware.de>
In-Reply-To: <1480531827-11799-1-git-send-email-obi@opendreambox.org>
References: <1480531827-11799-1-git-send-email-obi@opendreambox.org>
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] bash: use update-alternatives for the bash binary
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
X-List-Received-Date: Mon, 30 Jan 2017 22:30:16 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Ping.

On Wed, 30 Nov 2016 19:50:26 +0100
Andreas Oberritter <obi@opendreambox.org> wrote:

> Busybox may offer a bash applet. If enabled, the alternatives mechanism
> avoids breaking logins if bash gets deinstalled while /bin/bash is configured
> as a login shell.
> 
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> ---
>  meta/recipes-extended/bash/bash.inc | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-extended/bash/bash.inc b/meta/recipes-extended/bash/bash.inc
> index 1d08526..a05b987 100644
> --- a/meta/recipes-extended/bash/bash.inc
> +++ b/meta/recipes-extended/bash/bash.inc
> @@ -14,9 +14,11 @@ EXTRA_OECONF = "--enable-job-control --without-bash-malloc"
>  # This is what other major distros do. And this is what we wanted. See bug#5359 and bug#7137.
>  CFLAGS += "-DNON_INTERACTIVE_LOGIN_SHELLS"
>  
> -ALTERNATIVE_${PN} = "sh"
> +ALTERNATIVE_${PN} = "bash sh"
> +ALTERNATIVE_LINK_NAME[bash] = "${base_bindir}/bash"
> +ALTERNATIVE_TARGET[bash] = "${base_bindir}/bash"
>  ALTERNATIVE_LINK_NAME[sh] = "${base_bindir}/sh"
> -ALTERNATIVE_TARGET[sh] = "${base_bindir}/bash"
> +ALTERNATIVE_TARGET[sh] = "${base_bindir}/bash.${BPN}"
>  ALTERNATIVE_PRIORITY = "100"
>  
>  RDEPENDS_${PN} += "base-files"


