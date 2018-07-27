Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f49.google.com (mail-oi0-f49.google.com
	[209.85.218.49])
	by mail.openembedded.org (Postfix) with ESMTP id 6DB3778D39
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 17:31:53 +0000 (UTC)
Received: by mail-oi0-f49.google.com with SMTP id n21-v6so10428015oig.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 10:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=CB1GswWXyjtJSIq93wUNp8ooeXa6rlMEp47ZlOg9GZo=;
	b=Dlxu8zQiVINjqQYisMfi12eESdqmbIPPzV9Ni3Hqxig8VrlECQtdFkKnM/wvOMt4Dw
	Sz4wkUyr18jtcT3RmQxoXYLK7QLXQbniwWVQjO3n0YGFrwtmorqxUA8XfpdoXnP8UsHq
	OsfqgykssNu+HKZM1pbAKR4pS21al2UGmSJznWjlWYmgKb3J4mnCDnH+XrfNcsJ8Cl9B
	x6RvepLNeo3gIv+/u96VscBeqfDYfA7ZYHAbfLO+h+Gi9uWiVbbL99AJRaxx3NFRLdsF
	GQifWP2eQMVdzae1oKBfFPhikwJWqnPkOUS9oFgYFzj5Bh3xE1FrNLylYKpgwcvjbo8V
	zz1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=CB1GswWXyjtJSIq93wUNp8ooeXa6rlMEp47ZlOg9GZo=;
	b=Tcqy/nSj/gCkNWBm/VGuN23PCbQJC3MDQTl4L6ZmnAyu4DegYfy5LkWWuR/QBOs6tj
	N3tzSPnr1rw5udmrM03vPnBgMtzJwSt1UQTzRtUY0L+1/ia4yNV6ByrVbf1fcTE73XiS
	Xum8ipXozGRRL8vfwesKWqND7psgIatomgQVa8dfpEZn1bLjW6P3TlkVw4L2OGF4nHYX
	ZcU3p32kfl1p8uTkCNY57qgs/tnmotEWDVfJ/rPZMzjz2HQSTl3twCGAXl/iBqykDUsG
	B37rFAGvhCRoebpzqz6LC1XFLE59IOb6EdD9pfD+9bwXg5zDXNzhu6Xg3BGR4lSC66dL
	VLbA==
X-Gm-Message-State: AOUpUlFM6RvU3U+ixxJ/14+QHLk7rIT2+xDot6NLJu/gOL8IAftOnsST
	kNr9TAIOZQg6Kx1f/MR9dVVKGhcgsXzUp38jjoVKFw==
X-Google-Smtp-Source: AAOMgpd3+rXwsAne9m7CNrc9qHatcSjlpW+VbP3mFHWjDCHRZUBbj5KytszcMNw2tGCFP+KVevLvaBYESx/a71R2ep8=
X-Received: by 2002:aca:3f41:: with SMTP id
	m62-v6mr8013493oia.18.1532712714414; 
	Fri, 27 Jul 2018 10:31:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:6845:0:0:0:0:0 with HTTP; Fri, 27 Jul 2018 10:31:33
	-0700 (PDT)
In-Reply-To: <1532649082-32531-1-git-send-email-christopher.w.clark@gmail.com>
References: <1532649082-32531-1-git-send-email-christopher.w.clark@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 27 Jul 2018 18:31:33 +0100
Message-ID: <CAJTo0Law7B8kDgXd=beUoCzG1KWr5Lgzq_H_yxow9V11dWTuJA@mail.gmail.com>
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] binutils : enable x86_64-pep for producing EFI binaries on x86/x86-64
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
X-List-Received-Date: Fri, 27 Jul 2018 17:31:53 -0000
Content-Type: text/plain; charset="UTF-8"

On 27 July 2018 at 00:51, Christopher Clark
<christopher.w.clark@gmail.com> wrote:
> @@ -74,12 +74,17 @@ EXTRA_OECONF = "--program-prefix=${TARGET_PREFIX} \
>                  --enable-deterministic-archives \
>                  --enable-plugins \
>                  ${LDGOLD} \
> -                ${@bb.utils.contains('DISTRO_FEATURES', 'multiarch', '--enable-64-bit-bfd', '', d)}"
> +                ${@bb.utils.contains('DISTRO_FEATURES', 'multiarch', '--enable-64-bit-bfd', '', d)} \
> +                ${ENABLE_EXTRA_TARGETS}"
>
>  LDGOLD_class-native = ""
>  LDGOLD_class-crosssdk = ""
>  LDGOLD ?= "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', '--enable-gold=default --enable-threads', '--enable-gold --enable-ld=default --enable-threads', d)}"
>
> +ARCH_EFI_EMULATION_x86-64 = "x86_64-pep"
> +ARCH_EFI_EMULATION_x86 = "x86_64-pep"
> +ENABLE_EXTRA_TARGETS ?= "--enable-targets=${ARCH_EFI_EMULATION}"

Can't believe I didn't spot this when reviewing by hand but:

| checking for archiver @FILE support... configure: error:
--enable-targets option must specify target names or 'all'


Under non-x86, this passes --enable-targets=

Ross

