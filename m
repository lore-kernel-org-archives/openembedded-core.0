Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1897ECA0EE4
	for <webhook@archiver.kernel.org>; Mon, 18 Aug 2025 16:51:53 +0000 (UTC)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
 by mx.groups.io with SMTP id smtpd.web10.462.1755535910041662547
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Aug 2025 09:51:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HhMTl93u;
 spf=pass (domain: gmail.com, ip: 209.85.219.173, mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e931c858dbbso3424757276.0
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Aug 2025 09:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755535909; x=1756140709; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0/a6yTbiWmZf3j8uWCu6aoSF/H7QYP0Xz2w/Pt1gGC0=;
        b=HhMTl93uZs99L1gSJYQ0UaNX/48zh2QaIl47E9d1SkOczkT4pmB+pOi1IUraW41ng1
         yRJ8MPCP89OeEHa+SxvV+l+U82avlhEFPfSyIFZ6CtA0G5Yi2OCDS+ZeHQJs+cT7nC9J
         YTJuGsjhOGGCXZ6vLH/W49yTAKmoERaPRfEYxurDk+UGqeYt2q0lQVuR6+tn0DR6mNQU
         9G8iiHIi3mbweTOii3O6RcGsWKUqZ+6Ku0hgMBKfR6j7WCyTHaP/dayIur4nLolTlT4G
         VShXFMZngXYaxZ0O64Abz679O1sXR2twTFkcmhj5kt491ndAPVsOFPb+qj+lpgongo4v
         U58g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755535909; x=1756140709;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0/a6yTbiWmZf3j8uWCu6aoSF/H7QYP0Xz2w/Pt1gGC0=;
        b=GXkEMTqUNTmCCqo4xjaYwz3r0kozCQceK3IEXeYnMghTVaB+Ej52mOXKsgESDOvktW
         5RaHb0n8V/0VjHLhNGpgmTeUioeZ14/DeZfNW1azw/8TGDiRn0qESnDc0EslRCI/skj3
         UBh24i3lWJX1/vY18aTqlrVGLR8a6wUUAVhDO2CpXH8Ar04fGB5nbhNyyk47WP8psgQb
         Pgp0Am4GRfQcSsAaWYa8PafdbM4dSkOA1dKeGxDuLQDY9Ni09PFek5x/L5VMa/kDewLm
         I1dW7itWnqwtLrlCZQSuuic5hrues4aMyaO86WNuxHriG95U4C3IOCSpu6vqJjJCYV13
         q95A==
X-Gm-Message-State: AOJu0YxXhpHPsUkrhBbb0g0KCUD3oSb2DFb59hHOr84fB5geJOGIvZ7W
	UQ6GGqWgmHJyevIAaqHZ0QelAzxOATdMlkCsMa4SbNeFSVENn/U4fY2I20mFj67p5/AztgZb34Q
	rRZ17E2P/KwNLcD+afc4ZUSb5lxMLLdM=
X-Gm-Gg: ASbGncuYpP92hwLRORZSpOdGTqoJBJ2lDcJefX0vGlzXNHAvb/AJ48IVBQ8TpZpdBef
	Ilhf+ct6DR76eXcNOZ7+iDRES7Zx2Ow3e4RE4u7mcIdFWP7RGUL5HPRlTK0eIq2TTPm8T/EyppO
	FKEwBniq5cfJmM7D6LOhC+8ZONvtBYg65clK72Ai/x1sU6Iy9sUrgZHOjI0ocNxUys7bUMtYhKJ
	XigyKIWlf8xYqDBQgIczBBPhpkMqGo6C2b0lmdp
X-Google-Smtp-Source: AGHT+IG37BNRMkbrKT9eEJAx/0W+mHfEK43r2R8Y9/sms/MKJBaPhURYsKZ2wbMj3ejcqgZvDN7QjzfC4mL5c/Rl0Sk=
X-Received: by 2002:a05:6902:f84:b0:e93:4496:a2c7 with SMTP id
 3f1490d57ef6-e94e40cddcbmr156460276.15.1755535908879; Mon, 18 Aug 2025
 09:51:48 -0700 (PDT)
MIME-Version: 1.0
References: <20250815162502.3092192-1-raj.khem@gmail.com> <DC4VNCG1YJSI.EVHDCRSBIBIS@bootlin.com>
In-Reply-To: <DC4VNCG1YJSI.EVHDCRSBIBIS@bootlin.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 18 Aug 2025 09:51:22 -0700
X-Gm-Features: Ac12FXzjOZCJeXR12jEBxY2eH6KBiGjf7IL4sVLiYsdrS5GsWzYZdbQKgRwrHAQ
Message-ID: <CAMKF1sou6fS7oV5RQGoGAAAiM6qbD+mx+VeTY_Fo8UJ+kJEYeQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] spirv-llvm-translator: Upgrade to 21.1.0
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Aug 2025 16:51:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222041

On Sun, Aug 17, 2025 at 10:26=E2=80=AFAM Mathieu Dubois-Briand
<mathieu.dubois-briand@bootlin.com> wrote:
>
> On Fri Aug 15, 2025 at 6:25 PM CEST, Khem Raj via lists.openembedded.org =
wrote:
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
>
> Hi Khem,
>
> It looks like this is breaking the build:
>
> ERROR: spirv-llvm-translator-native-21.1.0-r0 do_configure: Execution of =
'/srv/pokybuild/yocto-worker/qemux86-64-x32/build/build/tmp/work/x86_64-lin=
ux/spirv-llvm-translator-native/21.1.0/temp/run.do_configure.97313' failed =
with exit code 1
> ...
> | CMake Error at CMakeLists.txt:82 (find_package):
> |   Could not find a configuration file for package "LLVM" that is compat=
ible
> |   with requested version "21.1.0".
> |
> |   The following configuration files were considered but not accepted:
> |
> |     /srv/pokybuild/yocto-worker/qemux86-64-x32/build/build/tmp/work/x86=
_64-linux/spirv-llvm-translator-native/21.1.0/recipe-sysroot-native/usr/lib=
/cmake/llvm/LLVMConfig.cmake, version: 20.1.8
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/11/builds/2207
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/50/builds/2253
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/63/builds/2058
>
> Can you have a look at this please?

Let's wait for it. I will send it when LLVM 21.1 releases, it just
makes sense to
send them in lockstep.

>
> Best regards,
> Mathieu
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

