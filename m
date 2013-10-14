Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f170.google.com (mail-ve0-f170.google.com
	[209.85.128.170])
	by mail.openembedded.org (Postfix) with ESMTP id 563576CE3F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Oct 2013 15:40:51 +0000 (UTC)
Received: by mail-ve0-f170.google.com with SMTP id db12so3778veb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Oct 2013 08:40:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=I+Wpmp+rnQqXI6ZPgO4Kr0xqBQ5iU+JNmP+cKd+0oZc=;
	b=QCUyYGN3BouDz4Ve8AA/loYDnUBQIYpDmVpxPltP0dOCl623K4AbN1f3NLMMMqG/fX
	niIiZ9dhrdnYYwp1u7EsdbZIiM9bJ5rFH2AFOHNdmc9ypFVqWKDArq2kxoOVsrLajbtH
	2BWROOSPWVVkfm43ZvS/yNapR2d72YrMEl+quOUyR87ZGCiaOpeCnwqX7vTC+KdaEoDz
	I/M2ZZywbDmXv+nzBLY1joU5VKlZ8uaIuU1Nkvv6YYsC0hRkuk9IYuFi0ADMctqv2Hz8
	cpe0xS6kmv5i0n8FPLubwIpoclFC6EFdBO7J9M5brc61S1N2kV5pWlEaSLs4PWG+Jf3V
	RI3A==
X-Gm-Message-State: ALoCoQm6PaQdqF8+K+t3AjAq5PVTsgIrHWxNkX0x6IPjLj0MaRmQHzFr+engkXKnyDTS0MvXjsay
X-Received: by 10.52.161.231 with SMTP id xv7mr29804105vdb.1.1381765252973;
	Mon, 14 Oct 2013 08:40:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Mon, 14 Oct 2013 08:40:32 -0700 (PDT)
In-Reply-To: <1381759718-11554-1-git-send-email-Ewan.LEBIDEAU-CANEVET@eurogiciel.fr>
References: <1381759718-11554-1-git-send-email-Ewan.LEBIDEAU-CANEVET@eurogiciel.fr>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 14 Oct 2013 16:40:32 +0100
Message-ID: <CAJTo0LZkw-6jSdrmegNJfy8AcU5PvrFi0s=fSAQh4ic03CvfYg@mail.gmail.com>
To: Ewan LE BIDEAU-CANEVET <Ewan.LEBIDEAU-CANEVET@eurogiciel.fr>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4 1/3] Wayland : Bump to version 1.3.0
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
X-List-Received-Date: Mon, 14 Oct 2013 15:40:51 -0000
Content-Type: text/plain; charset=UTF-8

On 14 October 2013 15:08, Ewan LE BIDEAU-CANEVET
<Ewan.LEBIDEAU-CANEVET@eurogiciel.fr> wrote:
> Remove do_configure_append_class-native() function useless for this version
> (file wayland-scanner.m4.in does not exist anymore)

When building weston:

| configure:17492: checking for WAYLAND_SCANNER
| configure:17499: $PKG_CONFIG --exists --print-errors "wayland-scanner"
| Package wayland-scanner was not found in the pkg-config search path.
| Perhaps you should add the directory containing `wayland-scanner.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'wayland-scanner' found

The script is calling pkg-config so is trying to find a target .pc
file, but this is only installed by wayland-native so is in the host
native sysroot.  I'll dig into this and work out a fix.

Ross

