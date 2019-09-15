Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id EA0587DE5A
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Sep 2019 17:00:57 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id v8so1144214wrt.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Sep 2019 10:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=FdYIjOWVV1/lo06g+482TgBzA6u39ESZZQGMZl312Ak=;
	b=SEVks5VcRYyiCtPd6E2PkG0/Vd/eufrpTMtQ056eRsR1lOJB2eEhjTjg/eFcaEXdlo
	3piyam6usgmDVf6mwFSgRZPI3A9kSbDOdm/BFiXIcIlfbhnhjfh6ohTdY9DqMVm30jIT
	2QDzdUTZjY+APBBA7UofGYM8ncIf4Es2ysB8s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=FdYIjOWVV1/lo06g+482TgBzA6u39ESZZQGMZl312Ak=;
	b=bfokJ3gfBGUD8DEysNvHWz9ZyWnmITn3tHl6kZQ6R6hdJ8Mf5mCv6DL72yExXySRz+
	kmeidO+g+lOSThfk0gir1jKSFpYKUdZc+iXq0bxirTcCyCAnpKXvIaYSeSzeDqpaAGZz
	m72iZqt3W/HOsI1HEcHTcbEYr3ApXQd41YAgXIqSyNPiY0ujGnf9FmWhEFRkEHrhFlJz
	P9XWaoSBAQcshlerQB5ietF28GFhPjGGO7cGKJl8hPhCg5Bt2cMe0I9xW+buKY2cD/+0
	6FbPtdV5y7WQPr4RItX2+kgZjmv4b3QPTyHsdQP0p/yrSASkTLWEIWzUeOwRpxqf2qlr
	SZyg==
X-Gm-Message-State: APjAAAVMOnpYa85DoLtaLGlHROl63l7NikS69F5l20JSOYzBb89E4Zaa
	P8Wcyex6T2EKqfa5xKQyJEgoGw==
X-Google-Smtp-Source: APXvYqzgip6LBQkeL/kfTK59/+mpjnJfzwVtPhhKcFHZ1LlpxpI+MkdFVAgBAkguyGHBJAw32qYJOQ==
X-Received: by 2002:adf:e7c2:: with SMTP id e2mr1069391wrn.319.1568566858583; 
	Sun, 15 Sep 2019 10:00:58 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id k9sm63972382wrd.7.2019.09.15.10.00.57
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 15 Sep 2019 10:00:57 -0700 (PDT)
Message-ID: <9df8634565338081c441eda3afdaceea07ceb886.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: akuster808 <akuster808@gmail.com>, Scott Murray
	<scott.murray@konsulko.com>, openembedded-core@lists.openembedded.org
Date: Sun, 15 Sep 2019 18:00:56 +0100
In-Reply-To: <90cb6c92-7b17-c0ee-e7cf-79bfae46b760@gmail.com>
References: <20190913232627.126619-1-scott.murray@konsulko.com>
	<90cb6c92-7b17-c0ee-e7cf-79bfae46b760@gmail.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: Adrian Bunk <bunk@stusta.de>
Subject: Re: [PATCH v3] systemd: upgrade to 243
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
X-List-Received-Date: Sun, 15 Sep 2019 17:00:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2019-09-14 at 08:00 -0700, akuster808 wrote:
> 
> On 9/13/19 4:26 PM, Scott Murray wrote:
> > PATCH REBASED:
> > ==============
> > 0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch
> > 0001-do-not-disable-buffer-in-writing-files.patch
> > 0002-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch
> > 0004-add-fallback-parse_printf_format-implementation.patch
> > 0004-rules-whitelist-hd-devices.patch
> > 0005-rules-watch-metadata-changes-in-ide-devices.patch
> > 0005-src-basic-missing.h-check-for-missing-strndupa.patch
> > 0006-Include-netinet-if_ether.h.patch
> > 0007-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not.patch
> > 0017-Do-not-disable-buffering-when-writing-to-oom_score_a.patch
> > 
> > PATCH DROPPED:
> > ==============
> > 0001-Replace-the-legacy-ULONG_LONG_MAX-with-the-C99-ULLON.patch
> > 0001-src-udev-udev-event.c-must-include-sys-wait.h.patch
> > 0023-socket-util.h-include-string.h.patch
> > 0025-fs-utilh-add-missing-sys-stat-include.patch
> > 
> > PATCH ADDED:
> > ============
> > 0002-src-login-brightness.c-include-sys-wait.h.patch
> > 0003-src-basic-copy.c-include-signal.h.patch
> > 0004-src-shared-cpu-set-util.h-add-__cpu_mask-definition.patch
> > 
> > Also applied libc-glibc over-ride to pkg_postinst and pkg_prerm
> > function
> > definitions, as musl does not provide nsswitch.conf.
> 
> This update did not introduce any new issues. We had hoped it might
> address the mips-alt systmed timeouts we are seeing but it did not.
> 
> Hopefully this is a data point for Richard when he gets back.

Its a good data point thanks!

Cheers,

Richard


