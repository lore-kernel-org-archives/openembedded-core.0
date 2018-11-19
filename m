Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f193.google.com (mail-it1-f193.google.com
	[209.85.166.193])
	by mail.openembedded.org (Postfix) with ESMTP id 260F96C120
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Nov 2018 10:35:28 +0000 (UTC)
Received: by mail-it1-f193.google.com with SMTP id g85so5843118ita.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Nov 2018 02:35:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=N8yOIgsFaKWgV0QhR7CnOnDhTLQkPXFfl3TSivYB/u8=;
	b=ybxM0BVCgw7hTrrbakQzCVyHsUxQT080xQTM8Bw+hryEDOdiR8+NqxERejT6zStowI
	F/4mKcNoydMB20wH5x4bPdJJLpsNIF5CFynnmWuMYRGRWquKYhXH1bMMM3qkl+FwuXJ9
	xMSGAy/Llyb953OTdJRcC0LL3GZ8ln762uLkmHeftbluaeppHbi9P6wTmUzq8EeXHTmZ
	SZFb5VEZxBrF4C7l8XOVpZLjIr9qZo6e/KKpmeanSLhbacQi5A01SuO4oQNqhcQBhh6t
	vlZoXpnGxxpqYpB4mrYFg8pNdTWyhVgPveKoUnm96GWzeYlAXeulOXam/QeOeajHB0Rl
	KlGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=N8yOIgsFaKWgV0QhR7CnOnDhTLQkPXFfl3TSivYB/u8=;
	b=tol/lKiYHk8t/Y5hEETNvH5dRV3SKqGJyIlKuf1muDCI+D7ZNJLsXVBHye0lumfuLo
	RW41QKZQX0lk+8kQd2dxD41oDXEqMjaH2aiLSiqrlY+XsGsjaF1LDWQwSBXpvj+tFEJo
	aKleJBbL6cphSmp8mJSjz5cye+X3XMgKq2EIUQemykMT7sGa/w5Y/B8fHmTWFAJyHtiL
	qs0ev3G/fk5gpa6R6JKfCPNbuIA+DbJxUOaSgpNAa3XmDlsxFQ1oyuMC4iIC+3JyykPX
	yJmFQF8V47eID6++By0DbYWiiOYLM9fbWBbidHSHXecRwKHObcDqssWT5i7zyvndf8G7
	R8tA==
X-Gm-Message-State: AA+aEWa1wVLYGNUaRiJe7SKxiOAIY0Z56QogLq6hmmwf0+LMkRq1f5Dr
	VfVp+HTRyP7lpRwEGvoiMX8tKao3ruZ8bxG673O5aw==
X-Google-Smtp-Source: AJdET5eT5H4LXb4Pn6d9ouuj4PUJthD4BmW52USKU3sWLt5/4li2mDAJfbs5weOXEkg5ECvTWVPmYmFH5dT76IN1GAo=
X-Received: by 2002:a24:9142:: with SMTP id
	i63-v6mr8286654ite.130.1542623729110; 
	Mon, 19 Nov 2018 02:35:29 -0800 (PST)
MIME-Version: 1.0
References: <20181117225753.15733-1-richard.purdie@linuxfoundation.org>
	<20181117225753.15733-4-richard.purdie@linuxfoundation.org>
In-Reply-To: <20181117225753.15733-4-richard.purdie@linuxfoundation.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 19 Nov 2018 10:35:17 +0000
Message-ID: <CAJTo0LaJsahHSCfD6ZSAvhjO2rkRLL9iCFMvsQqpmkouWtgixA@mail.gmail.com>
To: "Purdie, Richard" <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/9] nasm: Upgrade 2.13.03 -> 2.14
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
X-List-Received-Date: Mon, 19 Nov 2018 10:35:28 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, 17 Nov 2018 at 22:58, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> +inherit autotools-brokensep

Did you verify that this is still needed?

> +do_configure_prepend () {
> +       if [ -f ${S}/aclocal.m4 ] && [ ! -f ${S}/acinclude.m4 ]; then
> +               mv ${S}/aclocal.m4 ${S}/acinclude.m4
> +       fi
> +}

EXTRA_AUTORECONF += "--exclude=aclocal" is preferred.

> +do_install() {
> +       oe_runmake 'DESTDIR=${D}' install
> +}

This looks like autotool's do_install to me.

Ross

