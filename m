Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id A66EB610F5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 22:52:18 +0000 (UTC)
Received: by mail-ig0-f172.google.com with SMTP id h15so11778642igd.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 15:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=zpZnAEtvjhrQYQZaGWX5nRClv4CjSMh4eXe8hdDQfjA=;
	b=gE4wfmvmEpzzuHfVhDj+mZXVOHMqekKOtAK0t41mKhCqjQLPJ0fv0qNxIZprEqo1hh
	KZZ2mJR+d/macRC7kmXqDUFrXIm2lEp2ndx1o0GU5nX6ba7XmsdDXrdjK+dmxNHEZFWk
	LcVZ5y84/uG/7pdBPtJIZxDEvbqgA1dOWg8M2DGWyLNTIh8tUucodDok5kA15VkPcoTZ
	ejVF9YZtdwQZyOkBa5eA/REmzzRBRCJJipvEMLD/zKsgzYTw5Gb+uOeI/t3ePBS1m9ZY
	St2ICmNv5qC0IM8JTx2EyygdwToPsSRd0rlKwNIwQWsY7FzGErtQL9CCI10BsxNPVFzH
	MtNQ==
X-Received: by 10.43.64.198 with SMTP id xj6mr9755692icb.70.1407970339247;
	Wed, 13 Aug 2014 15:52:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.126.103 with HTTP; Wed, 13 Aug 2014 15:51:49 -0700 (PDT)
In-Reply-To: <1407963825-20257-6-git-send-email-pab@pabigot.com>
References: <1407963825-20257-1-git-send-email-pab@pabigot.com>
	<1407963825-20257-6-git-send-email-pab@pabigot.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 13 Aug 2014 15:51:49 -0700
Message-ID: <CAMKF1soD=7dfxCezZHOnMNnvatiN+-bue1u3R5uzsq-B7fEYXA@mail.gmail.com>
To: "Peter A. Bigot" <pab@pabigot.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/5] gcc-target: make --enable-clocale consistent with gcc-runtime
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
X-List-Received-Date: Wed, 13 Aug 2014 22:52:25 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 13, 2014 at 2:03 PM, Peter A. Bigot <pab@pabigot.com> wrote:
> Signed-off-by: Peter A. Bigot <pab@pabigot.com>
> ---
>  meta/recipes-devtools/gcc/gcc-target.inc | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-target.inc b/meta/recipes-devtools/gcc/gcc-target.inc
> index 8941f5f..0f9a5f8 100644
> --- a/meta/recipes-devtools/gcc/gcc-target.inc
> +++ b/meta/recipes-devtools/gcc/gcc-target.inc
> @@ -8,6 +8,8 @@ EXTRA_OECONF_PATHS = "\
>      --with-gxx-include-dir=${includedir}/c++/${BINV} \
>  "
>
> +EXTRA_OECONF_append_linuxstdbase = " --enable-clocale=gnu"
> +

this looks ok

>  EXTRA_OECONF_FPU = "${@get_gcc_fpu_setting(bb, d)}"
>
>  PACKAGES = "\
> --
> 1.8.5.5
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

