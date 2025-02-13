Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D536C021A0
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 08:49:20 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web10.6864.1739436552659642554
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Feb 2025 00:49:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YaHHbemE;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6e4468b7099so5098886d6.1
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 00:49:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739436551; x=1740041351; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RmVbaF61foG6JnS22C9udciCKhJU8tosnknR2l4FPpc=;
        b=YaHHbemE30IvMHNDq/bAPL6tHiKv1eiZyCR7TKgDh3Eou+yyhCG/RN906ktUQimRRd
         wf7COmAyNBNf6d8NQds520t5Y7LtZX8ST0IvXrw2d2j+CKYkQfEunL2KH3fK5NSRfD/c
         RK+ZaCKbaQoKWSoFGtUVC4OnBqFwtMkDNrktF8ZvgFj2+et/P58j2d1Mb+wNKqrkJ1Ve
         2NSPU+4cDz9r2ZUBDn+1XymcjwseoOQAEp5X6gJgUHhtaNrlLfPRKBt7GYSEQ0nD/6OV
         b1OTITWrFQ03BXoB8OEZQ5HyM++5LVWtDKgPPSz5a3x8GyVRCdiY9zCNHfI36bY9REhw
         2t3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739436551; x=1740041351;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RmVbaF61foG6JnS22C9udciCKhJU8tosnknR2l4FPpc=;
        b=RN8RtxCZRTL77+rofJOQRxAyklGteoVd+6IdWfIS5S1l/oGOrBr2c5TvF66JXWN5BB
         dIiwYKMioF7zFVyBh6+fFLW6G/AIdaOGHKHEyRI79NXCOR9nOMqmZLejkStcULo/XEfj
         GdwKF1dux7bugMfLLdImRKNPgnCU+eJAET/ltpN+C7ngdNc9woXaKfDEnq/8+i09jgOs
         uM/ysYepo/xsKZsmeeyMn7yy5TN4cFy0gZs0eyohZt8AntBaQhiGu6RKC9oF+ncd/tKI
         YyRYr93KbTfzrwWNSqkhhypzLWlKeTvoAVay32Unk1MqgPsgrKBuOFXk+CKdI2+1PQOc
         7wSA==
X-Forwarded-Encrypted: i=1; AJvYcCWFYfIMqic3bbkIyeFm3putD2clWFEXgQ808bGR6vYUwfpEvBBWu7acH8OZ2+aDAiGt8cGMgzxPP1PsvsMVWxd6Pg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzPfCfmRXmwDdeUXYIScduAWrESe/Qo/4WAdFfEoLEYaaT9J3xt
	ia0csQMK4X7xwnhEYVGu8YTMdWsyz14Z2N9RWPtZMWLNozaPXwukWD8tbwiZc4tVm5loJ1kEBdb
	cmLOijwQCqg82+28smotM4Yjy9Jsg3DON
X-Gm-Gg: ASbGncsa6m4AuYFYNb+WQIMgsaN72Td9X3m/QPa/lMb2sKKVNRxuiEpnryUIDCYppDI
	x4hpsIaO5FDL15GRs+3IvRI57+BxW+jGoPJLujny1WbI+9CXOFRqX6zPxqrbWJStJrjwgiMeKD8
	lXGeW3BNVD71kmsCRjnzHTBY9Bzdt5A1s=
X-Google-Smtp-Source: AGHT+IGioQn/HX21SCcdt4wUc6EBCKKbTveiMIS/LW+rVpiqvnCNiIQFFITH7xnZquKEkE3ywKBBMhumdxIHsusM+sw=
X-Received: by 2002:a05:6214:5098:b0:6d8:aeda:dd93 with SMTP id
 6a1803df08f44-6e65c155eadmr46100436d6.39.1739436551616; Thu, 13 Feb 2025
 00:49:11 -0800 (PST)
MIME-Version: 1.0
References: <CAK5yBb9Fr9MFy5uub2_pTRWmVbt96OWBJ5ty+eAB9Qn+LYa_Wg@mail.gmail.com>
 <CANNYZj-PbWQDa5hAc5X6sqHVMvJ0QE01XXwytya8rprwvSsqag@mail.gmail.com>
 <d22a4cec5e317e62f1f44d8d9a810cf4745ccb48.camel@linuxfoundation.org>
 <CAMSfU+6d7gvYkjC5sbUPu6D_hOOF43ZUnM_NMEwmLUxZn6ysSA@mail.gmail.com>
 <4e883a56eb9b74a5663d7ad258194d16b1c79912.camel@linuxfoundation.org>
 <CAMSfU+44qwScnoDP4As37TNHYvwx5mBmTdGEQgq_VVz7woh6sQ@mail.gmail.com> <CAMSfU+4MY-JVmWPUixJYiUrtKd2CXHrJuQ0sMJJrrkLzrvAuvA@mail.gmail.com>
In-Reply-To: <CAMSfU+4MY-JVmWPUixJYiUrtKd2CXHrJuQ0sMJJrrkLzrvAuvA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 13 Feb 2025 09:48:58 +0100
X-Gm-Features: AWEUYZl6ttCObkqINtPsH83f7gYmLGYKKMS_HriExcZOzdNMWmGsAp59cJtfpiY
Message-ID: <CANNYZj_8o=SHOn-kRBxzwc8vp3omCL290SA-jKkL_En1m2SWEA@mail.gmail.com>
Subject: Re: [yocto] [OE-core] Yocto Project Status 11 Feb. 2025 (WW07)
To: Yoann Congal <yoann.congal@smile.fr>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Yocto Mailing list <yocto@lists.yoctoproject.org>, 
	",openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 08:49:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211306

On Thu, 13 Feb 2025 at 00:04, Yoann Congal <yoann.congal@smile.fr> wrote:

> I did not find a magic silver bullet that would solve everything (I discovered that Gitlab is way more flexible on this subject).
> I guess we need to find a compromise between what a github user sees and the effort we are willing to put into it.

So as I understand, there are no 'settings' in github openembedded
organization we can tweak and everything is through repos?

Then here's the plan:
- someone with rights to manage overall
https://github.com/openembedded org creates an empty .github repo and
gives Yoann rights to manage it.
- Yoann opens pull requests to that repo, and notifies of them here
- any needed github specific tweaks to individual repos are proposed
and merged through the standard mailing list process.

Alex

