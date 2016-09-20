Return-Path: <zeenix@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 97F0760403
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Sep 2016 07:39:27 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id b184so1835625wma.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Sep 2016 00:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=AnbdSXCTl6f5N8j8K1npHlLdhtiaU8QdeX7myWGDMLs=;
	b=fd8AoN6ZRsOHqVc9vsnPtEOaLVd/ky8ZV7B4n/KldtdHCHXMqvnLgCmmsHe1OOnYkC
	IRlRqqG0f4Dlvu6u32iYkx19/ZCNmThrOlaT2V80uWtQ7zbcsIaTX5yADizVSOdPWfpH
	/Y5H/F1Z/0FzaZ5/KxHCT8HoUfqHT5HqhmVHWzF0JOfYoi8aPWHhgImwXThFnICWa5Tt
	3ePeJXaSNV/xWRovZaWzkzPHQdFYuI2ReulveCL1M7Ru48WYa6E1oMHg30Ph1XX7lSte
	CDAk+0c29JdXbIheXVaw0IclYe/sTazOUC4hqkPm6AkLWHYhdGCA3gUEM06uSYQxzF4d
	3UQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=AnbdSXCTl6f5N8j8K1npHlLdhtiaU8QdeX7myWGDMLs=;
	b=HXOmhn5/RN0VRIqIDZmb90a4+BJ4hkNPvloir8/lATqwghwZFhEAurXe1Bnw4hdI5p
	cavAcLaJXjNgah2gomqP+D4h/5ll+QXhNJv01EiraQ69fEZ605WZPDyjZwRdWXJmP4MG
	sXOcJ7Yg4gGFacP9D0WsmP9KKaKXsWzMZi8vP4r5SsouNvzoe1qC45on02KcnhQE9rf6
	7ML5gcPanVA8O+QD6TRV7QS5oD81QImr8nnZ8OZZdtl1wuNQzQqbgGmMvg5VMfnIHFhy
	OOCBFT7WShaVE3O6BFn/JD7fCJWpJGsKnL3JtPZ7jvtUKK9u4IbdmsnXZ6DBsCaxuw8a
	Z6tQ==
X-Gm-Message-State: AE9vXwMURfSY1wXdZCkEf7dbcWCMSkoYowpzWdELQ/5DXF/Pnkk7I6MeZavICMNP06cz5jP5zqCUZz0fEBuW+Q==
X-Received: by 10.194.149.102 with SMTP id tz6mr26815924wjb.154.1474357168701; 
	Tue, 20 Sep 2016 00:39:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.109.139 with HTTP; Tue, 20 Sep 2016 00:39:28 -0700 (PDT)
In-Reply-To: <1473688845-10252-1-git-send-email-zeenix@gmail.com>
References: <1473688845-10252-1-git-send-email-zeenix@gmail.com>
From: Zeeshan Ali <zeenix@gmail.com>
Date: Tue, 20 Sep 2016 09:39:28 +0200
Message-ID: <CAAa3hFOVJQM3R=rHEXAgnXOjY63EmCi-ngYhPSEqkE60s_-7tg@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] [krogoth] gobject-introspection.bbclass: disable introspection for -native and -nativesdk recipes
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
X-List-Received-Date: Tue, 20 Sep 2016 07:39:29 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

Could we please cherry-pick this? Otherwise some native recipes fail
to build if gobject-introspection is available on host.

On Mon, Sep 12, 2016 at 4:00 PM, Zeeshan Ali <zeenix@gmail.com> wrote:
> From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
>
> It is not necessary for those targets, adds to the build time, and pulls
> in the unneeded qemu-native dependency.
>
> (From OE-Core rev: be18364edd5cd2c664f68120063a1e147563faab)
>
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes/gobject-introspection.bbclass | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/gobject-introspection.bbclass b/meta/classes/gobject-introspection.bbclass
> index 2d73e40..cc7ca5a 100644
> --- a/meta/classes/gobject-introspection.bbclass
> +++ b/meta/classes/gobject-introspection.bbclass
> @@ -3,13 +3,23 @@
>  # This sets up autoconf-based recipes to build introspection data (or not),
>  # depending on distro and machine features (see gobject-introspection-data class).
>  inherit gobject-introspection-data
> -EXTRA_OECONF_prepend = "${@bb.utils.contains('GI_DATA_ENABLED', 'True', '--enable-introspection', '--disable-introspection', d)} "
> +EXTRA_OECONF_prepend_class-target = "${@bb.utils.contains('GI_DATA_ENABLED', 'True', '--enable-introspection', '--disable-introspection', d)} "
> +
> +# When building native recipes, disable introspection, as it is not necessary,
> +# pulls in additional dependencies, and makes build times longer
> +EXTRA_OECONF_prepend_class-native = "--disable-introspection "
> +EXTRA_OECONF_prepend_class-nativesdk = "--disable-introspection "
>
>  UNKNOWN_CONFIGURE_WHITELIST_append = " --enable-introspection --disable-introspection"
>
>  # Generating introspection data depends on a combination of native and target
>  # introspection tools, and qemu to run the target tools.
> -DEPENDS_append = " gobject-introspection gobject-introspection-native qemu-native"
> +DEPENDS_append_class-target = " gobject-introspection gobject-introspection-native qemu-native"
> +
> +# Even though introspection is disabled on -native, gobject-introspection package is still
> +# needed for m4 macros.
> +DEPENDS_append_class-native = " gobject-introspection-native"
> +DEPENDS_append_class-nativesdk = " gobject-introspection-native"
>
>  # This is necessary for python scripts to succeed - distutils fails if these
>  # are not set
> --
> 2.7.4
>



-- 
Regards,

Zeeshan Ali

