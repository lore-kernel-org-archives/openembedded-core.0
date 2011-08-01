Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QnoZ5-0000pk-Rb
	for openembedded-core@lists.openembedded.org;
	Mon, 01 Aug 2011 11:13:35 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1QnoUw-0000MR-82
	for openembedded-core@lists.openembedded.org;
	Mon, 01 Aug 2011 11:09:18 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 01 Aug 2011 10:09:17 +0100
In-Reply-To: <44bd82a28e643c335047026c581b34497b6c8fb5.1312182844.git.sgw@linux.intel.com>
References: <cover.1312182844.git.sgw@linux.intel.com>
	<44bd82a28e643c335047026c581b34497b6c8fb5.1312182844.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1312189758.30326.504.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH 17/22] bitbake.conf: Add default tune-${DEFAULTTUNE} override
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 01 Aug 2011 09:13:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-08-01 at 00:36 -0700, Saul Wold wrote:
> From: Mark Hatle <mark.hatle@windriver.com>
> 
> We need to add the tune-* override in order for more complicated tune
> features to function properly.
> 
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> ---
>  meta/conf/bitbake.conf |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)
> 
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 9c80f11..11dfb6d 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -637,9 +637,10 @@ AUTO_LIBNAME_PKGS = "${PACKAGES}"
>  #
>  # This works for  functions as well, they are really just environment variables.
>  # Default OVERRIDES to make compilation fail fast in case of build system misconfiguration.
> -OVERRIDES = "${TARGET_OS}:${TARGET_ARCH}:build-${BUILD_OS}:pn-${PN}:${MACHINEOVERRIDES}:${DISTROOVERRIDES}:forcevariable"
> +OVERRIDES = "${TARGET_OS}:${TARGET_ARCH}:build-${BUILD_OS}:pn-${PN}:${MACHINEOVERRIDES}:${TUNEOVERRIDES}:${DISTROOVERRIDES}:forcevariable"
>  DISTROOVERRIDES ?= "${DISTRO}"
>  MACHINEOVERRIDES ?= "${MACHINE}"
> +TUNEOVERRIDES ?= "tune-${DEFAULTTUNE}"

What exactly are the "more complicated tune features" that require this?
It's not obvious to me that this is a good idea.

p.




