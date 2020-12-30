Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.7227.1609339199541452328
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Dec 2020 06:39:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Yzhn5SR4;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id r4so4879083wmh.5
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Dec 2020 06:39:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=CgSFh6CcWPYb3BVi3vo23kPM+0WCHwR6blG22bj6nuE=;
        b=Yzhn5SR4tDeyhffm/Ah1B4xPyL/dukbckxp2Yv9Cu/bxKA2tWLUWn4wd24p6dopDj/
         Ke8oJ/7OUOwdSCOHhsHj5rigRuhiZlO6N45X2FOByvdtGs+ju7sYf3xUMWcj8hq64Sf0
         rYMiJJjNqg6LMbnS+8LemHkKBl7kxza+IHlXM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=CgSFh6CcWPYb3BVi3vo23kPM+0WCHwR6blG22bj6nuE=;
        b=frSVLRTBiPojOdjwTEqg0kWZ5YWSCP3faR5kkMt+KgCb+C5ANZE0qGd+OMAyyOzhbw
         LztMNp2umIYmnlPsROa+fqL3logXaIZy7gl39fK3WNzT6SQ4uuM3Ihkci5G69Dr0blpY
         /emLQWzjhfC5WxSChRaNG4y/+MbQZ6HH2IacB/Ka+4u6G6kr//5TsbDCqu2qc2PV2NnJ
         qDTo9MCjottqdXjGC7VfqdQPijsCLDYr2qavURaPE4i6cQFC0QnYG07+XE+XpvJfOS/z
         lnOy+okZcOnCi2DoaJ4cdq7ujHt7z9srKsDCGoXw0M3wuvdz31pdvO29i9bjQGcTUxTM
         HxbQ==
X-Gm-Message-State: AOAM533nemSQGEmY2fwJSPjA7F2KSNjvjngbVvBGNZRQ5lyV6MH8KdiU
	2p/hYOc1mHtkbBJHQ8DpJmSTJA==
X-Google-Smtp-Source: ABdhPJz6UdWd/9WGLIzUP6S/gLrkaNYTh5n5BiBaMDG90EGxhqmklUR6sjFsMz1ANmYmYl1sXDM7FA==
X-Received: by 2002:a1c:2394:: with SMTP id j142mr8025025wmj.42.1609339198002;
        Wed, 30 Dec 2020 06:39:58 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from f.1.0.d.e.9.1.1.f.8.6.d.b.d.d.3.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (f.1.0.d.e.9.1.1.f.8.6.d.b.d.d.3.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:3ddb:d68f:119e:d01f])
        by smtp.gmail.com with ESMTPSA id y11sm7560251wmi.0.2020.12.30.06.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Dec 2020 06:39:57 -0800 (PST)
Message-ID: <be95f599b85aec68418a272ea514696d49b3ce14.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] selftest/reproducible: Add useradd-staticids to reproducible builds tests
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Naveen Saini
	 <naveen.kumar.saini@intel.com>
Date: Wed, 30 Dec 2020 14:39:56 +0000
In-Reply-To: <CANNYZj8Ag7L1k-ZMpnKefTcHA9Lf0q=O=Ek_XqSxOPfWQEzXYg@mail.gmail.com>
References: <20201227120952.139650-1-richard.purdie@linuxfoundation.org>
	 <20201227120952.139650-2-richard.purdie@linuxfoundation.org>
	 <CANNYZj8Ag7L1k-ZMpnKefTcHA9Lf0q=O=Ek_XqSxOPfWQEzXYg@mail.gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2020-12-27 at 14:08 +0100, Alexander Kanavin wrote:
> I wonder if this also addresses some of the existing entries on the
> exception list?

I've wondered that too. We probably need to analyse the results of some
of the builds and see if any are reproducing that didn't previously...

We do have a couple of intermittent issues that are showing in world
builds, one in grub:

https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20201228-mcoi5qk0/packages/diff-html/

looking likely due to changes in:

/usr/src/debug/grub-efi/2.04-r0/grub-2.04/grub-core/unidata.c

and one in initramfs-base:

https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20201223-og6v1hn1/packages/diff-html/

where the write bits are masked out on /dev/console, something to do
with umask handling in pseudo on tumbleweed-ty-3.

I think one has a bug, the other does not (yet).

Cheers,

Richard

