Return-Path: <armccurdy@gmail.com>
Received: from mail-vk0-f67.google.com (mail-vk0-f67.google.com
	[209.85.213.67])
	by mail.openembedded.org (Postfix) with ESMTP id AB40A74D9C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 May 2018 20:14:03 +0000 (UTC)
Received: by mail-vk0-f67.google.com with SMTP id q189-v6so975237vkb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 May 2018 13:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=efpp7CIeyqud2dn/aBHAE99IjyAlaa+iIlSI2z9i8xk=;
	b=t7Ze0DFvVT0D/VcWpwOaczypf3ktDczorOUenyEcAy0h4MO113o2m/jrdpYW26TYYj
	tAipsSXQSIF9hpWpVaihQ0H7DRfZa8KQ4FFRxfAqaSmNy3agQBYPzuWk/ZxMW7+zRNms
	1yn0GPrdTqTVnShCdimIb3T7roHelQLP+0Mk8BzBxyCSGrLEwPOMLzovkWosAQMOa5Qr
	x0lO/SRd9J3TRyxzohURdBToJaHP/AyHr3ocPeSP2DcOn6/r2XpQHnS70iN6j8VNlZV9
	a8eCbmRF1in85mVkSpVhobZLQUEnGaEOzDEEhIrM4kU+MNIJXYZXzyloOC9BHzUwwJya
	VIlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=efpp7CIeyqud2dn/aBHAE99IjyAlaa+iIlSI2z9i8xk=;
	b=ZKlnD/7qJxmQZqsQFMFf+qjgKiVVji5+c0RAa2gzoJh6Afh6heAL40BfQ9klCu7VpZ
	LlwIVapCYjM0wVaNs2Jvqa1G7BYhwVxoTvEppiOla30nb0GvLSV5D+fjSIygQB0V5pX+
	gPXDo8BHM5gfjXfmGzoXSELp94ZuPPJvLin3oH4pYoK3qAwURLY/SoCc9lGMzRjEs2q4
	IUISeGgiWXw0X3TMAVgmiyNVCErVZxMiEcQAvRbz7t+foRgKGyepFq8o6F788Vp4uy6O
	H8twdPmwtYcZTrNUZGNux5BdUBMfe0nsPUyY71aLo23/i3+UBQPY6lyZWqwJatNkiNM8
	c4EA==
X-Gm-Message-State: ALKqPwc1RZtLbxyrjSXGTdqyoPESL5whPYbdlNYMSvfboMc6z6bvSzlb
	KszJKaKBaaYRmalHeJKdfP5Us3E0sFOI3QWAnEo=
X-Google-Smtp-Source: AB8JxZrsOY8vIFIYrQrAmfi8BBsWTLU2eIc8CeTQHBx3hwRxroFjcQ/dyL4cWGEOV3h2gCRL9RGkfDfJ5iGlgFQiNpw=
X-Received: by 2002:a1f:28ca:: with SMTP id
	o193-v6mr6416985vko.194.1526415244010; 
	Tue, 15 May 2018 13:14:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.48.148 with HTTP; Tue, 15 May 2018 13:14:03 -0700 (PDT)
In-Reply-To: <1526082723-13508-1-git-send-email-armccurdy@gmail.com>
References: <1526082723-13508-1-git-send-email-armccurdy@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 15 May 2018 13:14:03 -0700
Message-ID: <CAJ86T=U56fvKy5m6xv75LAzEDp5Sk8NWorjw4FSFkAi1=BNkMQ@mail.gmail.com>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>, 
	akuster808 <akuster808@gmail.com>
Subject: Re: [rocko][PATCH] libnl: fix CVE-2017-0553
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
X-List-Received-Date: Tue, 15 May 2018 20:14:03 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, May 11, 2018 at 4:52 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> An elevation of privilege vulnerability in libnl could enable a local
> malicious application to execute arbitrary code within the context of
> the Wi-Fi service. This issue is rated as Moderate because it first
> requires compromising a privileged process and is mitigated by
> current platform configurations. Product: Android. Versions: 5.0.2,
> 5.1.1, 6.0, 6.0.1, 7.0, 7.1.1. Android ID: A-32342065. NOTE: this
> issue also exists in the upstream libnl before 3.3.0 library.
>
>   https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2017-0553
>
> Backport fix from upstream libnl 3.3.0 release:
>
>   https://github.com/thom311/libnl/commit/3e18948f17148e6a3c4255bdeaaf01ef6081ceeb
>   http://lists.infradead.org/pipermail/libnl/2017-May/002313.html

Armin, please let me know if this is OK and I'll send the same fix for
pyro and morty.

> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>  ...eck-for-integer-overflow-in-nlmsg_reserve.patch | 43 ++++++++++++++++++++++
>  meta/recipes-support/libnl/libnl_3.2.29.bb         |  2 +
>  2 files changed, 45 insertions(+)
>  create mode 100644 meta/recipes-support/libnl/libnl/lib-check-for-integer-overflow-in-nlmsg_reserve.patch
>
> diff --git a/meta/recipes-support/libnl/libnl/lib-check-for-integer-overflow-in-nlmsg_reserve.patch b/meta/recipes-support/libnl/libnl/lib-check-for-integer-overflow-in-nlmsg_reserve.patch
> new file mode 100644
> index 0000000..594dd06
> --- /dev/null
> +++ b/meta/recipes-support/libnl/libnl/lib-check-for-integer-overflow-in-nlmsg_reserve.patch
> @@ -0,0 +1,43 @@
> +From 3e18948f17148e6a3c4255bdeaaf01ef6081ceeb Mon Sep 17 00:00:00 2001
> +From: Thomas Haller <thaller@redhat.com>
> +Date: Mon, 6 Feb 2017 22:23:52 +0100
> +Subject: [PATCH] lib: check for integer-overflow in nlmsg_reserve()
> +
> +In general, libnl functions are not robust against calling with
> +invalid arguments. Thus, never call libnl functions with invalid
> +arguments. In case of nlmsg_reserve() this means never provide
> +a @len argument that causes overflow.
> +
> +Still, add an additional safeguard to avoid exploiting such bugs.
> +
> +Assume that @pad is a trusted, small integer.
> +Assume that n->nm_size is a valid number of allocated bytes (and thus
> +much smaller then SIZE_T_MAX).
> +Assume, that @len may be set to an untrusted value. Then the patch
> +avoids an integer overflow resulting in reserving too few bytes.
> +
> +Upstream-Status: Backport [https://github.com/thom311/libnl/commit/3e18948f17148e6a3c4255bdeaaf01ef6081ceeb]
> +CVE: CVE-2017-0553
> +
> +Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> +---
> + lib/msg.c | 3 +++
> + 1 file changed, 3 insertions(+)
> +
> +diff --git a/lib/msg.c b/lib/msg.c
> +index 9af3f3a..3e27d4e 100644
> +--- a/lib/msg.c
> ++++ b/lib/msg.c
> +@@ -411,6 +411,9 @@ void *nlmsg_reserve(struct nl_msg *n, size_t len, int pad)
> +       size_t nlmsg_len = n->nm_nlh->nlmsg_len;
> +       size_t tlen;
> +
> ++      if (len > n->nm_size)
> ++              return NULL;
> ++
> +       tlen = pad ? ((len + (pad - 1)) & ~(pad - 1)) : len;
> +
> +       if ((tlen + nlmsg_len) > n->nm_size)
> +--
> +1.9.1
> +
> diff --git a/meta/recipes-support/libnl/libnl_3.2.29.bb b/meta/recipes-support/libnl/libnl_3.2.29.bb
> index 7d4839b..4ce80e8 100644
> --- a/meta/recipes-support/libnl/libnl_3.2.29.bb
> +++ b/meta/recipes-support/libnl/libnl_3.2.29.bb
> @@ -12,7 +12,9 @@ DEPENDS = "flex-native bison-native"
>  SRC_URI = "https://github.com/thom311/${BPN}/releases/download/${BPN}${@d.getVar('PV').replace('.','_')}/${BP}.tar.gz \
>             file://fix-pktloc_syntax_h-race.patch \
>             file://fix-pc-file.patch \
> +           file://lib-check-for-integer-overflow-in-nlmsg_reserve.patch \
>  "
> +
>  UPSTREAM_CHECK_URI = "https://github.com/thom311/${BPN}/releases"
>
>  SRC_URI[md5sum] = "a8ba62a5c4f883f4e493a46d1f3733fe"
> --
> 1.9.1
>

