Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 295ACC61D9B
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 13:19:49 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.19164.1700659179454566902
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Nov 2023 05:19:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CLkDwOXf;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-32dff08bbdbso5076105f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 05:19:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1700659178; x=1701263978; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5WAm08e+JwJr5I7hTrywI72l9ONs9GQ+X/wb9ryfeKc=;
        b=CLkDwOXfBGxR06oLcbH2AFLxjj9peEqkzSPcyzehCAXXnkAoldj8T4qiqlvcKQF13s
         fzK/0e5a1gM61UDWa9SF2L4YwbnG5CNmM81k4xcOe+mGcj5BO7xpyZh6vOJHrwoa+XCy
         /0624F6PAaj8xYpt8ki9p4pG3uoYjj8FFg0Ko=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700659178; x=1701263978;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5WAm08e+JwJr5I7hTrywI72l9ONs9GQ+X/wb9ryfeKc=;
        b=N/R0l8e63BYsGJth+hSXCbeQBK0DQvY6dp7SbTQcEt51fX8n+mg3wHdCOGpHbvMXRL
         4tdAEL+dxKLGJi/f5GCEdReOP0SohA/E0g/PZFi+XNkni9Q5Z42SJNy3hwgQve0/m4Z6
         xbS4JEd9Ya90/4HEkT/Vi/85oP5us6wHI20vus6GwZA6nUivIo+YF2TRYZwuerp0Ph80
         7+1ZrMLqJrjmY2IftPlPWlSgNjOdMQJHer+D0fgPUYDBqfoTbrZ5ICETtZLrjnjLaVAh
         s8fRZv2FuGWVTb85mhtW4cYoA6kzAqai+lX0vlWmPDwb9htgVDjDOkgsHUy8Z6TUAtHU
         wuew==
X-Gm-Message-State: AOJu0YzKzdKFoIocjXmYuKNaftUurMQqzeQXpCEdm7PsCdOZNoYourWm
	w507931Z62kMJUDFqDArsuH1/A==
X-Google-Smtp-Source: AGHT+IHlP5/7+swhGqh3t8Gd5FYFk0uWeerm55MojKxMPDv5oy7n3l8oXEi7sJY5N501lRsK+Jb/+w==
X-Received: by 2002:a5d:6dac:0:b0:332:d369:2da4 with SMTP id u12-20020a5d6dac000000b00332d3692da4mr1475512wrs.9.1700659177855;
        Wed, 22 Nov 2023 05:19:37 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:1718:e534:44cc:c75e? ([2001:8b0:aba:5f3c:1718:e534:44cc:c75e])
        by smtp.gmail.com with ESMTPSA id m10-20020a5d4a0a000000b00331702ab6acsm14529261wrq.7.2023.11.22.05.19.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 05:19:36 -0800 (PST)
Message-ID: <c70900d21794156f56b8b54978422e89638fba71.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 00/21] Consistent naming scheme for deployed
 artifacts
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 22 Nov 2023 13:19:35 +0000
In-Reply-To: <cover.1700600804.git.martin.jansa@gmail.com>
References: <cover.1700600804.git.martin.jansa@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 13:19:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191101

On Wed, 2023-11-22 at 13:44 +0100, Martin Jansa wrote:
> This is the final part of changes for [YOCTO #12937].
>=20
> I've run complete selftest with this and didn't see any failures.
>=20
> Only these 4 fail once, but pass when re-executed (and the same is
> reproducible here with master):
> pkgdata.OePkgdataUtilTests.test_lookup_recipe
> spdx.SPDXCheck.test_spdx_base_files
> esdk.oeSDKExtSelfTest.test_image_generation_binary_feeds
> esdk.oeSDKExtSelfTest.test_install_libraries_headers
>=20
> runtime_test.TestImage.test_testimage_virgl_gtk_sdl and this one
> needs extra "xhost +local" otherwise fails with:
>   runqemu - ERROR - Failed to run qemu: Invalid MIT-MAGIC-COOKIE-1 key
>   qemu-system-x86_64: OpenGL is not supported by the display
>=20
> The short description of these changes is that instead of symlinks
> it creates hardlinks in deploy dir and the kernel do_deploy creates
> the artifacts without version suffix and the do_deploy_links task
> adds those versioned hardlinks (this way do_deploy can be reused from
> sstate and only quick do_deploy_links is re-executed when the
> IMAGE_VERSION_SUFFIX changes - before that if you cannot re-use do_deploy
> from sstate due to different artifact filenames you had to re-run e.g.
> do_compile as well if you haven't built the same in the same TMPDIR
> before).

I am a bit worried about this change since there were uses for having
the symlinks present and this unconditionally moves everything over to
hardlinks.=C2=A0

With the symlink, you can see the pointer quite clearly, with
hardlinks, it is unclear which files are duplicates of each other
withouth diving into comparing inodes.

Part of the reasoning was due to the way OE used to work where it would
stack images, each build would add a new one and it would update the
end symlink to point at the latest. Once sstate started removing old
entries, that became less needed but the pointers still help runqemu
and other tooling find the latest.

This change is trying make the code do something different and it to
change versioning and do that in a way which allows maximal reuse from
sstate.

Both are valid usages so we gain some things with the change but lose
others. I'm not sure how users in general are going to find things
overall :/.

Cheers,

Richard



