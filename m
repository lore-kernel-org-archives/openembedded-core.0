Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7514BE85385
	for <webhook@archiver.kernel.org>; Fri,  3 Apr 2026 17:08:04 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.470.1775236080650030825
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Apr 2026 10:08:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=C9HgZscV;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-486b96760easo24142755e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Apr 2026 10:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775236079; x=1775840879; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5y5PqVvaaDcFO0VkxqlIGf4Q8rrozwvn5+Ha8okmdk4=;
        b=C9HgZscVkUe+F+AmqZ+9NJNuAt9lPCtfztoFUCkQgNXWnt93occdYSJts7q+mGumhr
         ESC2PI1SgO+Fb7YPlNqmjy9+UfjCYhIMYtMK9IubsyUL+WmgIkTVqGyfn9aFEi4/77Xw
         vZF++ADBCgFWvaRpQdYgeAqPMATWHQFz+OU2E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775236079; x=1775840879;
        h=in-reply-to:references:subject:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5y5PqVvaaDcFO0VkxqlIGf4Q8rrozwvn5+Ha8okmdk4=;
        b=hhQY75bsihy6ypFIvI0XQUerLTf7cawr8T6aU/N2VURM3o8Jw0ljX7ptXCrWWt1ARU
         D4D4P70pJAOIl/ciNTrTy6rXcx5Q/8mLpyCuT+UGzs7GlAVGbXYhu9JdqoC1T0jtpXhg
         E41KDouAqTytfJAUDzGsyB+aeljHBGvQx1xUpWwEIjiN5JyuQRu9tDdW2WLcIRYe0c/z
         xNZD60EsaXuUX24HOfaIsZEb41y/IEZ0VHE5VtenJAMTzgoBqECwyIIzZLIyszM8UHfm
         4XXVdSQOByHao4UprKGZd3UFqb622FYBVtjYL9nTHL185VuyVkc+54/kWu6OFi4JysVf
         81VA==
X-Forwarded-Encrypted: i=1; AJvYcCXucWkdvKhC1esB9XiAx+1Lk8P+1BZrkuMB6GI1aPCTyZIHnmMvZ09fl8nxelDMFSf+22nyMthExyGaEhTYsa1XPw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyJNwGD2RkGDOrrgJi1VlyJtrC0PPk97rEIRAbvKah/sKK64zoV
	Wh8mtKKKhHcYPiSTHtckiTqgbL/xPHx10uFDenv9W4/MNlmG/gSH6LW/9GZsLXM7kgQ=
X-Gm-Gg: ATEYQzxfc/zHj9EqkN7DnQCU3egaf3/+p1s3UC6CpHpnjhPWTkgQxr2LuEitQh71gsq
	s6RMZrtY+BhOWVXoBcFxB1ZKuqKH+LULJ+yVZdA5TFYwN2ZQgoK6RqaZZSVuEaZKn6PTBFCmrxn
	wh4j6sjI8vnn7rSa2DkFZ2TjIBdCuUIO+7dCHUaHlU0/Pr6zfqZWMCJaWBcXlGlPU7tQJp5AKa9
	bAbBGDVKieisbWxiPJ/GoImzjBB2kBBuCRoNvJQpMYKYtFIEJrT2zLwtSw8gukXVrRur5fvTerR
	8QECygMGiMkR597eoFwgGsAK0qTPiCa40o1A80HPH/8m5N5F6YweKnAmTE1Y9d70NJ2Qtzgdi6q
	xAY2mAI63NdKtNC3N04nV13vvEw4pt58/o2AQoCho8AXNUvNXy03mkhWnvQK5bladFDvxVgeNTG
	HX/7buhSTQOIjHl4CRJ7mKlOTkBhrfrJ6K7OP2rxpe4Jkic+NjYpFCJYa2yWA+B44kTw++FUIPO
	boU1ZiiBrOWl/I5
X-Received: by 2002:a05:600c:1d86:b0:485:4388:3492 with SMTP id 5b1f17b1804b1-4889970d844mr62059645e9.11.1775236078983;
        Fri, 03 Apr 2026 10:07:58 -0700 (PDT)
Received: from localhost (2a01cb001331aa00dac7300510953f30.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:dac7:3005:1095:3f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4889f6843dfsm40477315e9.12.2026.04.03.10.07.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2026 10:07:58 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 03 Apr 2026 19:07:58 +0200
Message-Id: <DHJOO3S7NQMS.D0NB9IPZPFV0@smile.fr>
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <mathieu.dubois-briand@bootlin.com>, "Paul Barker" <paul@pbarker.dev>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] sanity: Require tar 1.35 or later on
 rhel9-alike distros
X-Mailer: aerc 0.20.0
References: <20260403-rhel9-tar-v1-1-b9c7fb64bbd9@pbarker.dev>
 <DHJO8L8EC2Z9.1N02J4E6QUEGC@bootlin.com>
In-Reply-To: <DHJO8L8EC2Z9.1N02J4E6QUEGC@bootlin.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Apr 2026 17:08:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234591

On Fri Apr 3, 2026 at 6:47 PM CEST, Mathieu Dubois-Briand via lists.openemb=
edded.org wrote:
> On Fri Apr 3, 2026 at 1:54 PM CEST, Paul Barker wrote:
>> tar 1.34 (and possibly earlier versions) is unable to extract tarballs
>> containing read-only files with xattrs. This was fixed upstream, but
>> it's unlikely at this point that the fix will be backported to RHEL9
>> related distros (CentOS Stream 9, AlmaLinux 9, Rocky Linux 9). The issue
>> affects these distros specifically because they have selinux enabled by
>> default and this uses xattrs.
>>
>> The specific failure we've seen is with the /usr/lib/udev/hwdb.bin file
>> installed by the systemd recipe - this file is chmod 0444. This leads to
>> the following error, typically during do_image_wic (shortened and split
>> to make it readable):
>>
>>     subprocess.CalledProcessError: Command
>>     'tar --xattrs --xattrs-include=3D'*' -cf - -S -C .../tmp/work/qemux8=
6_64-poky-linux/core-image-minimal/1.0/rootfs -p . |
>>     tar --xattrs --xattrs-include=3D'*' -xf - -C .../tmp/work/qemux86_64=
-poky-linux/core-image-minimal/1.0/tmp-wic/rootfs2'
>>     returned non-zero exit status 2.
>>
>> That error message is likely to confuse users, and the fix is not
>> obvious. So, error out if tar 1.34 or earlier is present on affected
>> distros and recommend upgrading or using the buildtools tarball.
>>
>> Signed-off-by: Paul Barker <paul@pbarker.dev>
>
> Hi Paul,
>
> So now, this is failing on several workers. Aren't we using buildtools
> on rocky9 / stream9?
You're thinking of "[PATCH yocto-autobuilder-helper] config.json: Use build=
tools on RHEL9 derivatives"
https://lore.kernel.org/yocto-patches/20260331-rhel9-v1-1-e5c2cf815386@pbar=
ker.dev/T/#u
... not merged, yet.

>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/17/builds/3369
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/4/builds/3536



>
> Thanks,
> Mathieu


--=20
Yoann Congal
Smile ECS


