Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f48.google.com (mail-yh0-f48.google.com
	[209.85.213.48])
	by mail.openembedded.org (Postfix) with ESMTP id 50F6272656
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Dec 2014 13:58:01 +0000 (UTC)
Received: by mail-yh0-f48.google.com with SMTP id i57so5081301yha.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Dec 2014 05:58:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=hRiCzoDUiBYCWmJLM2q/QtRKzNQOwrKFnJTEON5maqA=;
	b=NTC7IOs1QvnNUaOgDuqrguWcdVEOR0IhNiNmIBzqrbWaQVV0+4LLXgeAOILxeyeIXa
	1+mhYNsmi9vIdfScBZvHPxaM6ypmCLFGYZXCc4ANqQvxLvy5FpWZdwYXaRwmRajH8LbF
	IJXVMIYKPI5HxY9ZZ+jRgimlwZFuiR8Tsia8ujsDvUKKB286SFifBTuXspw3q74IbtMR
	ev9FDGExWUcNq0413FUKVPmVgpWiPZniT4g0VMTJrA79WrvU7WNe78XL5pCx8U+QwREz
	2LmdDKxEAmG6zwhalw5QmFc3SfYxlOSK77B3QHgKrtxd90CTMerxRAjV7e76LqzT2Lng
	nEQg==
MIME-Version: 1.0
X-Received: by 10.236.39.134 with SMTP id d6mr8906251yhb.90.1419602282231;
	Fri, 26 Dec 2014 05:58:02 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.171.132 with HTTP; Fri, 26 Dec 2014 05:58:02 -0800 (PST)
In-Reply-To: <e9074ded94dbbe718226ad040c289dd608d9606a.1419471695.git.hongxu.jia@windriver.com>
References: <cover.1419471695.git.hongxu.jia@windriver.com>
	<e9074ded94dbbe718226ad040c289dd608d9606a.1419471695.git.hongxu.jia@windriver.com>
Date: Fri, 26 Dec 2014 11:58:02 -0200
X-Google-Sender-Auth: G1AbvPtkPx5WYtyFGBmK3jOZYmg
Message-ID: <CAP9ODKp5dfUVySnmZRyYmEBS-m0AC6QRM5POLdM3LDnaPVzYAQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] linux-libc-headers.inc: fix QA package-missing warnings
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
X-List-Received-Date: Fri, 26 Dec 2014 13:58:04 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Dec 24, 2014 at 11:48 PM, Hongxu Jia <hongxu.jia@windriver.com> wrote:
> While building linux-libc-headers with QA package-missing checking enabled,
> there was warning:
> ...
> QA Issue: package linux-libc-headers not generated, but listed in PACKAGES
> ...
>
> Only linux-libc-headers-dev was generated, the others are empty, we should
> set PACKAGE manually.
>
> We also set linux-libc-headers-dev as linux-libc-headers's provider, so
> package management could install linux-libc-headers.
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
> index b18d09f..a69bbe6 100644
> --- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
> +++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
> @@ -71,3 +71,5 @@ RRECOMMENDS_${PN}-dbg = "${PN}-dev (= ${EXTENDPKGV})"
>
>  INHIBIT_DEFAULT_DEPS = "1"
>  DEPENDS += "unifdef-native"
> +PACKAGES="${PN}-dev"

Fix spaces around =

> +RPROVIDES_${PN}-dev = "${PN}"
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

