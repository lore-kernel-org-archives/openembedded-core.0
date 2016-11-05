Return-Path: <paul@paulbarker.me.uk>
X-Greylist: delayed 430 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 05 Nov 2016 10:21:50 UTC
Received: from 9.mo6.mail-out.ovh.net (9.mo6.mail-out.ovh.net [87.98.171.146])
	by mail.openembedded.org (Postfix) with ESMTP id 09CA86078E
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 Nov 2016 10:21:50 +0000 (UTC)
Received: from player786.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo6.mail-out.ovh.net (Postfix) with ESMTP id CA64456EF6
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 Nov 2016 11:14:40 +0100 (CET)
Received: from nuc.betafive.co.uk
	(cpc11-shep11-2-0-cust130.8-3.cable.virginm.net [86.27.96.131])
	(Authenticated sender: paul@betafive.co.uk)
	by player786.ha.ovh.net (Postfix) with ESMTPSA id 5524F80080
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 Nov 2016 11:14:40 +0100 (CET)
Date: Sat, 5 Nov 2016 10:14:38 +0000
From: Paul Barker <paul@paulbarker.me.uk>
To: OpenEmbedded Core <openembedded-core@lists.openembedded.org>
Message-ID: <20161105101438.1ef1f627@nuc.betafive.co.uk>
In-Reply-To: <1477161480-20271-1-git-send-email-paul@paulbarker.me.uk>
References: <1477161480-20271-1-git-send-email-paul@paulbarker.me.uk>
X-Mailer: Claws Mail 3.11.1 (GTK+ 2.24.25; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Ovh-Tracer-Id: 12758697746201020865
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelvddrledugddufecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Subject: Re: [PATCH] kernel.bbclass: Allow ${S} to be overridden
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
X-List-Received-Date: Sat, 05 Nov 2016 10:21:51 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 22 Oct 2016 19:38:00 +0100
Paul Barker <paul@paulbarker.me.uk> wrote:

> For kernel recipes which fetch sources from an archive instead of git, it's
> necessary to point ${S} at the extracted sources. In kernel.bbclass there is
> already logic in base_do_unpack_append() to link ${KERNEL_STAGING_DIR} to ${S}
> if these aren't the same, so we just need to be able to override ${S}.
> 
> Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
> ---
>  meta/classes/kernel.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 25a153c..a7d467b 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -3,7 +3,7 @@ inherit linux-kernel-base kernel-module-split
>  PROVIDES += "virtual/kernel"
>  DEPENDS += "virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFIX}gcc kmod-native depmodwrapper-cross bc-native lzop-native"
>  
> -S = "${STAGING_KERNEL_DIR}"
> +S ?= "${STAGING_KERNEL_DIR}"
>  B = "${WORKDIR}/build"
>  KBUILD_OUTPUT = "${B}"
>  OE_TERMINAL_EXPORTS += "KBUILD_OUTPUT"

Ping on this. Anyone had a chance to look at it?

