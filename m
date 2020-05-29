Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web11.37063.1590765829751341741
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 May 2020 08:23:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=u/j203zZ;
 spf=pass (domain: gmail.com, ip: 209.85.128.65, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f65.google.com with SMTP id l26so3791479wme.3
        for <openembedded-core@lists.openembedded.org>; Fri, 29 May 2020 08:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=HMVddUuhYA4ZXWEJ6kncNmWB2IDOMirFmSTSxMmbpzw=;
        b=u/j203zZf+nPh9Bng7Ktvw6M1HlVKtLjboZL83DOHFbDAyPLxSYW+jwTGtiQasmdM3
         9sjLHVVOHllvbbaZgeV+/2RAauO3wmE90A5q6WE0ltWffEZZ9aj1VYHkCvvLijm2DYg2
         reYk63zUuA7i+s/w+LDVLRZm68xyJ4qf1edbs50YInsF5hgYMAIlfiBGR11CC4vp0loL
         OEJIF6xQXIozCLleo/jzxaBDnfUsf3gJcdV92GkyrrVnFG0LSOedfby31yes1D62xW7b
         1yiIBhORkWQ1KMuoG7NHrdUwlBxUEJYtjy5R95eaZg09juDbwrL2dAH7sjExp7/ReQgB
         ccLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HMVddUuhYA4ZXWEJ6kncNmWB2IDOMirFmSTSxMmbpzw=;
        b=HlDxDv32OIV0oX0ST0tTx0uVTRjh7VcD2EnXxHiJXS3t2KTn4EiuyWp/UP4iHLTP/8
         Jj9GngjK32d3DuJITHQ0/Bz6DhWTWXYJgkryYTJ/J7h+p643kf6slUK0U6AFem7ehOYX
         XnVVl0Y+/T3nsNgrYtsFVSDmkLVcz/Wwoz9ngzLVGi7VTtSDSyw8lgO1vfNKEfFUhOay
         wxpcD054LaM4hNnEwBzfisWeQMUDM3w4PWwkQeXIbNKtcEeSCD5aJghd15ZWbpcxeREb
         yLlNhQErlE71SlijdZnmYZG2wgnG/CcApquiRU4WwxpxgP0yiDv/oh+kaMolmulA0MxF
         /DgA==
X-Gm-Message-State: AOAM533A25fhw94YLl+GhM6u/cg7EECHa+a0EKPDE2PQTtJEM5QgEWEC
	Cu2lqkhI5lWVg4m9LuXSn3U=
X-Google-Smtp-Source: ABdhPJx+LxPLuH++QU/TgxMEhU3imSNoNtKCfzm9m2GVYuDMZUVpO26a8gBZ0NG8QG9ShqUTqONNdw==
X-Received: by 2002:a1c:9cca:: with SMTP id f193mr8861291wme.71.1590765828276;
        Fri, 29 May 2020 08:23:48 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id v7sm11142144wre.93.2020.05.29.08.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2020 08:23:47 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 29 May 2020 17:23:46 +0200
To: vygu@protonmail.ch
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] Issue with qemu and a shared sstate-cache used by different linux distribution supported by yocto
Message-ID: <20200529152346.wnjo67wqfx4asbby@jama>
References: <qGlJFzBcawqf2UFr8E8EaYuftNrwyxaR9FaRpw7UDU7hVtXdCiCR9oZT9pWwRM-XXY-_OoOVLDeYazLfwnS7FbFIijyMlVVBGHDUc6R_EP8=@protonmail.ch>
 <CANNYZj-5X7R+u8DbcukZcCYcZH6iAdX6b-4Q9vcbFpA2yJMzig@mail.gmail.com>
 <FG9FuupfY7gDkVp6dksFTfV4g1Qle4LG1sHTTz91zoOH_jEESEpz1O8GNILOjGMyVMrEXt9qYL59sFCppoS8R3684y7ke6_dTGJ1ylWbnfA=@protonmail.ch>
 <CANNYZj--Yx21SroOLE6eONZZ+ZwJKpX2LPQF+zFG+0deSMffHw@mail.gmail.com>
 <7xh5hOJ5tSwnrCbnQdloia-LKhVW2MVdxJCBJMjLgXThh5LVPTNMGqvr-82zGry4GUiSuCh7cXfzvg57g86O241yyt1K6DZoYUIknPYqs8s=@protonmail.ch>
MIME-Version: 1.0
In-Reply-To: <7xh5hOJ5tSwnrCbnQdloia-LKhVW2MVdxJCBJMjLgXThh5LVPTNMGqvr-82zGry4GUiSuCh7cXfzvg57g86O241yyt1K6DZoYUIknPYqs8s=@protonmail.ch>
X-Groupsio-MsgNum: 138918
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="e3ilcmlhckm2d56u"
Content-Disposition: inline

--e3ilcmlhckm2d56u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 29, 2020 at 03:12:14PM +0000, vygu via lists.openembedded.org wrote:
> After some investigation on the debian buildfarm, we can see in the build/tmp/work/x86_64-linux/qemu-system-native/4.2.0-r0/temp/log.do_configure "libnfs support yes". If we comment in poky/meta/recipes-devtools/qemu/qemu.inc all the prepend do_configure_prepend_class-native(), we obtain "libnfs support no". The function do_configure_prepend_class-native, as written in commentaries, is to find sdl. But we see now it adds more than just the sdl support. Is it expected?

No, it's not expected, you should add PACKAGECONFIG for nfs to make it
consistent across various builders.

--e3ilcmlhckm2d56u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXtEpAQAKCRA3VSO3ZXaA
HK0ZAJ9YjiW70NnlAsvBQM6QU0sM6hrhUwCgn/7lbR9rGezZlIhB4oXMzvutCsg=
=xqLR
-----END PGP SIGNATURE-----

--e3ilcmlhckm2d56u--
