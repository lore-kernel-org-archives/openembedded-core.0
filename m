Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id CA5C078306
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jul 2017 07:04:17 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id t138so7652525wmt.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jul 2017 00:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=OwJK2YvLpGElUu3/aaUsmDJf5eWWGXPA7eOPf07N86Y=;
	b=ZfDyEpqVCP4HakI1zepianOpHrekhyZyfAD+oxAZ+S3j/cil3Z8EKH2Y2I86bcRblv
	4oHfZXLFE7bnyk2Kc6A8nS16uggujvhbKA265V/9MjNKzVSnlGC23eYzR9cavrDGGm/M
	U/YVOVyEeU8CcOblgQSJ0j2YceMGCldC/rXh7D7WCX0KDaZ2avH/2psPA46wIvppJXt6
	g2CaR01BjjX8cTdao/rJbhW+9WtUApcBNvpQHR9Pa0DA5mRM5WsbzqHwyHmaAJ2QUmym
	fZCovHEnc41VFKn/IWgyY7Ca2zj3nTFkmQJ7rYNYRoiEF6ZUkjeufkD2/EOyqdnQRGr0
	Z8LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=OwJK2YvLpGElUu3/aaUsmDJf5eWWGXPA7eOPf07N86Y=;
	b=KQLqPpc6aXIcf1MqrbUkpcZBtVbbCvNjZ30HZGWSIFVbqLPmCPsaWSiXEfNRObp+P6
	75YxCt3oYgh1O2IlQO0RDvlDT04PBTQ4VUXzPBhnwu90Oey9WBMWHIU75sjFKpP9SusW
	vT6DSyEw1PPQYjlert/IPmKQ4J6XmcKKkVGFSQxW4H0CfVgsX0i6j9s+ms/LEmKHK6Vj
	q1/ja0FIeVr7bwZFS0t8DNSIOb/AVAGemPKBjpxNBLyEOtm+cE9wJv3zpVYG2F1pl57L
	JMm7osBkuiybZYrLf6UFrUAVs6gzJxZpAPmFJumvlDknrcgggsMJ+rhUQf7nv3CbHUGy
	38gg==
X-Gm-Message-State: AIVw113StJoi4YuMOoqYjEprlFvEcylcrg2dqmaV+Fj00xNQmDiLqAGV
	h7cwFQpPdH+W3T1YU4RfgBW5cjBlgQ==
X-Received: by 10.28.216.21 with SMTP id p21mr5244231wmg.24.1501225458204;
	Fri, 28 Jul 2017 00:04:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.175.16 with HTTP; Fri, 28 Jul 2017 00:04:17 -0700 (PDT)
In-Reply-To: <e178ab56ae1af5a5b840e933c74f8a10a4e3c794.1501217624.git.raj.khem@gmail.com>
References: <cover.1501217624.git.raj.khem@gmail.com>
	<e178ab56ae1af5a5b840e933c74f8a10a4e3c794.1501217624.git.raj.khem@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 28 Jul 2017 00:04:17 -0700
Message-ID: <CAJ86T=Utv6Lo-6u40ZODR-1jQfsDSC61BYrULA4ouNaBbCqZAQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] ninja: Add recipe
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
X-List-Received-Date: Fri, 28 Jul 2017 07:04:18 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 27, 2017 at 9:56 PM, Khem Raj <raj.khem@gmail.com> wrote:
> llvm is using it, therefore move it from meta-oe
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-devtools/ninja/ninja_1.7.2.bb | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 meta/recipes-devtools/ninja/ninja_1.7.2.bb
>
> diff --git a/meta/recipes-devtools/ninja/ninja_1.7.2.bb b/meta/recipes-devtools/ninja/ninja_1.7.2.bb
> new file mode 100644
> index 0000000000..20dca2f0af
> --- /dev/null
> +++ b/meta/recipes-devtools/ninja/ninja_1.7.2.bb
> @@ -0,0 +1,29 @@
> +SUMMARY = "Ninja is a small build system with a focus on speed."
> +HOMEPAGE = "http://martine.github.com/ninja/"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=a81586a64ad4e476c791cda7e2f2c52e"
> +
> +DEPENDS = "re2c-native ninja-native"

Should the re2c recipe also be moved to oe-core?

> +SRCREV = "717b7b4a31db6027207588c0fb89c3ead384747b"
> +
> +SRC_URI = "git://github.com/martine/ninja.git;branch=release"
> +
> +S = "${WORKDIR}/git"
> +
> +do_configure[noexec] = "1"
> +
> +do_compile_class-native() {
> +       ./configure.py --bootstrap
> +}
> +
> +do_compile() {
> +       ./configure.py
> +       ninja
> +}
> +
> +do_install() {
> +       install -D -m 0755  ${S}/ninja ${D}${bindir}/ninja
> +}
> +
> +BBCLASSEXTEND = "native nativesdk"
> --
> 2.13.3
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

