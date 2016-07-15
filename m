Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f66.google.com (mail-pa0-f66.google.com
	[209.85.220.66])
	by mail.openembedded.org (Postfix) with ESMTP id A4A1B606D0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2016 13:53:14 +0000 (UTC)
Received: by mail-pa0-f66.google.com with SMTP id q2so6139953pap.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2016 06:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=mDSI+xcd1k7A4KcQqUqEw4AvL/097cr8IIIcKgKJoGU=;
	b=MGPC4YWlL5gKaPtQV5cbf3/S7qcGYxKTFvpntRK146m9jJDpca3oH21CRlHSm2tqPz
	LQtBLrRdAz6gW4RGNsAB/CN1svQPRuuI+ABi5TaKxDojhkQRXc2epezDnfARdiaNr6N0
	QTECxPkOf5NkMhZhtPxccUBqpZ1QtPSosT0qt3YT15KD5hf3Jeeh+z6bJhSQUE9HGoXb
	8ZbaV39N4lm0VXLlkk5WpVQ8buuMEFIMDqNDAGXC6MCWp7yP4laC60VnIu64zrf/mYCM
	XUXHixKX6kZCc2xLk/nub8PNdjsV7sPwTsZopMsSz+z+BghjpPujs0ctwgZqTLInykQC
	WjXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=mDSI+xcd1k7A4KcQqUqEw4AvL/097cr8IIIcKgKJoGU=;
	b=dEzXyFKxiKhqEXQ5tUN3B0o7ykQ472Rw+8InQ6l6btapcRNbfL3FO/bNZZVnGTpZaT
	sjC8rx/GAu2roG8Lapd8X+Z0KbM9Wd1Q0BZjtLzmIDODIH0Q3UyE9nCJVAwduniXaDmY
	TQAixRwsNawH4hCgje4sYetM0bhdSsHsUoflNmOFeFSMKogpb1ezyP1yM0PRP5hwF9dP
	tDkc6dQcS99WcKS3Ta1Jyt/DkbkxoGZ/bbrIKd7BqsI1yvPumCUxUI4GfaidGufSduG3
	hEXme71cI4mYbPtGiKdiT0NUspKB5hqxa2DPc3JTYgfJZE1cF2XB5DmWCWkPlBYDGbeq
	CBFg==
X-Gm-Message-State: ALyK8tLSqxSNPeyXHUdcJoIVVrnk7oDTR6LxUHZluBgRF5nhiBGwi3dkQBkSU1FlGqfKPQ==
X-Received: by 10.66.101.101 with SMTP id ff5mr25930625pab.88.1468590794640;
	Fri, 15 Jul 2016 06:53:14 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:194d:2232:d2ef:3b9c?
	([2601:202:4001:9ea0:194d:2232:d2ef:3b9c])
	by smtp.googlemail.com with ESMTPSA id
	dz13sm5015568pac.44.2016.07.15.06.53.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Jul 2016 06:53:13 -0700 (PDT)
To: Tim Orling <timothy.t.orling@linux.intel.com>,
	openembedded-core@lists.openembedded.org
References: <cover.1468546499.git.timothy.t.orling@linux.intel.com>
	<ba010ae55186d533ee35ed38839d7761d7b004a3.1468546499.git.timothy.t.orling@linux.intel.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <5788EAC8.5090701@gmail.com>
Date: Fri, 15 Jul 2016 06:53:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <ba010ae55186d533ee35ed38839d7761d7b004a3.1468546499.git.timothy.t.orling@linux.intel.com>
Subject: Re: [krogoth][PATCH 1/8] pkgconfig: Fix build with gcc-6
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
X-List-Received-Date: Fri, 15 Jul 2016 13:53:16 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

So this is the host gcc not the one in OE?

- armin

On 07/14/2016 06:49 PM, Tim Orling wrote:
> Our patch in master was on top of 0.29.1 update.
> commit b83a808fcbd3e7aec3b0757c7180cf83dac44e92
> 
> Apply to krogoth stable 0.29 version instead.
> 
> [YOCTO #9897] (Fedora-24)
> 
> Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
> ---
>  ...te-suppress-string-format-literal-warning.patch | 34 ++++++++++++++++++++++
>  meta/recipes-devtools/pkgconfig/pkgconfig_git.bb   |  1 +
>  2 files changed, 35 insertions(+)
>  create mode 100644 meta/recipes-devtools/pkgconfig/pkgconfig/0001-gdate-suppress-string-format-literal-warning.patch
> 
> diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig/0001-gdate-suppress-string-format-literal-warning.patch b/meta/recipes-devtools/pkgconfig/pkgconfig/0001-gdate-suppress-string-format-literal-warning.patch
> new file mode 100644
> index 0000000..830d3d2
> --- /dev/null
> +++ b/meta/recipes-devtools/pkgconfig/pkgconfig/0001-gdate-suppress-string-format-literal-warning.patch
> @@ -0,0 +1,34 @@
> +The upstream patch would not apply cleanly, so perform the same changes.
> +
> +Original patch header:
> +From 00148329967adb196138372771052a3f606a6ea3 Mon Sep 17 00:00:00 2001
> +From: coypu <coypu@sdf.org>
> +Date: Wed, 2 Mar 2016 19:43:10 +0200
> +Subject: [PATCH 2/2] gdate: Suppress string format literal warning
> +
> +Newer versions of GCC emit an error here, but we know it's safe.
> +https://bugzilla.gnome.org/761550
> +
> +Upstream-Status: Backport
> +
> +Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
> +
> +Index: git/glib/glib/gdate.c
> +===================================================================
> +--- git.orig/glib/glib/gdate.c
> ++++ git/glib/glib/gdate.c
> +@@ -2439,6 +2439,8 @@ win32_strftime_helper (const GDate     *
> +  *
> +  * Returns: number of characters written to the buffer, or 0 the buffer was too small
> +  */
> ++#pragma GCC diagnostic push
> ++#pragma GCC diagnostic ignored "-Wformat-nonliteral"
> + gsize     
> + g_date_strftime (gchar       *s, 
> +                  gsize        slen, 
> +@@ -2549,3 +2551,5 @@ g_date_strftime (gchar       *s,
> +   return retval;
> + #endif
> + }
> ++
> ++#pragma GCC diagnostic pop
> diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb b/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
> index d34f608..cd4dc8e 100644
> --- a/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
> +++ b/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
> @@ -18,6 +18,7 @@ PV = "0.29+git${SRCPV}"
>  SRC_URI = "git://anongit.freedesktop.org/pkg-config \
>             file://pkg-config-native.in \
>             file://fix-glib-configure-libtool-usage.patch \
> +	   file://0001-gdate-suppress-string-format-literal-warning.patch \
>             "
>  
>  S = "${WORKDIR}/git"
> 

