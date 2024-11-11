Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97DA9D2E9E7
	for <webhook@archiver.kernel.org>; Mon, 11 Nov 2024 13:08:29 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.58913.1731330501421283743
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Nov 2024 05:08:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ck6Mi6KN;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43162cf1eaaso57106875e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 11 Nov 2024 05:08:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1731330500; x=1731935300; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fi5gsf7AY3dU2Y6gD9Ykf6aTUwM3WxVxT6wqQFmyu2M=;
        b=ck6Mi6KNCa7wTubs7PdIlKrWENqhMxYXtV2eYrSyiVdatrVj/qnMSGlscgdcK4Gl/v
         WVTGzFMnVMo7MVOxr3w3r+apjn6kEA9EmO1+PCUrjkuU50GAzndefBvhXCndMkF6/fCL
         F2kh9tzqFPvA700rD0/VrkX/3FD8hFUOWeAnE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731330500; x=1731935300;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fi5gsf7AY3dU2Y6gD9Ykf6aTUwM3WxVxT6wqQFmyu2M=;
        b=cnvz1N/9+AJArHD8wkiMfZXaWJymm/I0EH1u0nLr99AuQ4xIpNr6xKkkiJ7kCnk1WK
         9jAYytTkLBnubHzaSZdptF84GYj8YThl8L7sSBxqs6KF2lzGzUKcoMZ0+l62u0woh8VX
         0eJEHQ0bupw+6bISSO8y5rTCwGUUn4IX+zhG7KOVtug9Dr3ebitEziINXKSxSBhknpJ1
         YAohENIIwRTvXmKpz/G/CNAcBYKA+HJX3DEDucFtLnrmeWvjQjcXnsocKLrMCy2fJGXy
         0+sdFE2yb4DbQeSNktDJW8U14e2jDzGG5qnXuFrdKy64fmnYc1Q636HJUNOqCMFp7jhf
         tLrw==
X-Gm-Message-State: AOJu0Yzk2SRXnT0CLCjUYiI2HrwCVgY8ztB7FK2GOtynW5g5cm3GF66A
	KmgIX5x1tcm5Srdwtb9alqKflz3yHzMS7Qlz30jnwKOjX9iU67oZrPKE51CL/eA=
X-Google-Smtp-Source: AGHT+IFpdXFF6ClT2rJehbqRV5pwsIONJ+buKuuj1wb7o8jN7aSsO1N0gkrJ8TsnOunK7nHm3pUWeA==
X-Received: by 2002:a05:600c:474e:b0:42f:75e0:780e with SMTP id 5b1f17b1804b1-432b7505822mr130419655e9.10.1731330499725;
        Mon, 11 Nov 2024 05:08:19 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:3ee1:3752:cc0b:60ed? ([2001:8b0:aba:5f3c:3ee1:3752:cc0b:60ed])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432b054b3fesm172750945e9.17.2024.11.11.05.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 05:08:18 -0800 (PST)
Message-ID: <a2870fb05d59ddd3578cee006200ed0d59919a48.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] package_manager : Add configuration option to
 select filterbydependencies
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Sreejith Ravi <sreejith.ravi087@gmail.com>, Alexander Kanavin
	 <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Mon, 11 Nov 2024 13:08:17 +0000
In-Reply-To: <CAFt4JuGioQWK8G72z_J6aJvKscp7zy4W2ZQPWP1_imH_keGSog@mail.gmail.com>
References: <20241025161627.3352-1-sreejith.ravi087@gmail.com>
	 <CANNYZj8+5LwPXrQ4eda4muAdOmpfvkg5oo0GXzCG+HJJh65vDQ@mail.gmail.com>
	 <CAFt4JuEdi+zFkN37vvvK-PNtqshncC_8dn44gU+FcKXpde-ynA@mail.gmail.com>
	 <CANNYZj-Q_Y4X80o_mbA=uEQ3gQbfwNB3bPcnu5-xvsOaPjKCbg@mail.gmail.com>
	 <CAFt4JuGioQWK8G72z_J6aJvKscp7zy4W2ZQPWP1_imH_keGSog@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Nov 2024 13:08:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206951

On Mon, 2024-11-11 at 09:53 +0000, Sreejith Ravi wrote:
> We are not changing the default behavior of Yocto but are instead
> using our own custom class to handle IPK.
>=20
> Since create_packages_dir is a function in rootfs.py, it would be
> beneficial to add an option allowing users to select either the
> deploy directory or oe-rootfs-repo. This would also save the copy
> time to oe-rootfs when it is not required for their projects.

For reference, the copy time here is minimal since the copy is created
using hardlinks to the files.

The reason this is done is to filter the packages to the ones directly
in the recipe's dependency chain. This is because files can be written
to tmp/deploy/ while an image build is running and this can cause build
failures.

For example consider core-image-sato-sdk and core-image-minimal being
built in parallel. The minimal rootfs will happen before the sato-sdk
one but if they all used the same directory, the minimal image could
see pieces of the SDK image. The files may be seen partially through
the write too.

To avoid this and more complex forms of the race (where things are
removed as they're rebuilt due to changes), we create the hardlinked
copy of only the packages a given image recipe should "see".

> Currently, in create_packages_dir, the option to check whether to
> create "oe-rootfs-repo" or use a symlink from "DEPLOY_DIR_IPK" to
> "oe-rootfs-repo" is ineffective with filterbydependencies, as it is
> always set to True. Our request is to add a configuration option for
> this behavior; otherwise, this check serves no purpose when used with
> filterbydependencies.
>=20
> =C2=A0 =C2=A0 if nodeps or not filterbydependencies:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 for arch in d.getVar("ALL_MULTILIB_PACKAGE_AR=
CHS").split() +
> d.getVar("ALL_MULTILIB_PACKAGE_ARCHS").replace("-", "_").split():
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target =3D os.path.join(deployd=
ir + "/" + arch)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.path.exists(target):
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 oe.path.symlink(t=
arget, subrepo_dir + "/" + arch,
> True)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 return
>=20
>=20
> This patch does not change the existing functionality. By default, it
> is set to True (consistent with default Yocto behavior), but users
> can adjust it as needed.

I'm not saying yes or no to the patch but you have to understand that
adding an extra parameter means we have to support that code path.
Should we include it in our test matrix? If we do, there is the cost of
testing it but it should work. If we don't, there is a significant risk
it might stop working at some point. There is therefore a cost/risk to
both directions if we do add it.

For me, the bigger concern is that we may then see people using this
without understanding the race concerns above too.

Cheers,

Richard



