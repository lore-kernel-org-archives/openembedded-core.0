Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8140C021AA
	for <webhook@archiver.kernel.org>; Wed, 19 Feb 2025 10:02:42 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web11.18753.1739959357045773529
 for <Openembedded-core@lists.openembedded.org>;
 Wed, 19 Feb 2025 02:02:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=OEO09Y8/;
 spf=pass (domain: linaro.org, ip: 209.85.167.43, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5439a6179a7so779700e87.1
        for <Openembedded-core@lists.openembedded.org>; Wed, 19 Feb 2025 02:02:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739959355; x=1740564155; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7QKRcHhzCQVGtrdziqXb47bpOf+Ga6n8tY8QD3GIYyU=;
        b=OEO09Y8/KHGE4foClYILcVE2HUhgTMB5mqwn8F2FNE4pBSldFbjmAKmXndZVQaoHI6
         WoNgRjcMNfkMUOo9P5ps2TUXY65GEi34bcF5ycph/0f72E4WOQyrCkqnRqvw67CYHyD+
         tZwmMDSTtLQdWCtKbh/iY3akTHWhFqLCwDrW7gv1QH+HLnA8uYJ55YxPsr94cdmqlFth
         YCDJyBXIidvVWw6SapLL3S1B9yCZDmvRzhy61ljEHxYHo8XE73JYhMZPhDLeeZbHYc4W
         64OAqPIaBBYBRNTbSznvTYyd8ghRuGikVSQShKNfkcXlKjofHw+iqA7Ntr7LqL1jhjM4
         nmjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739959355; x=1740564155;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7QKRcHhzCQVGtrdziqXb47bpOf+Ga6n8tY8QD3GIYyU=;
        b=maKTkBZDKtYIgA7u5b1prG0z+ggTJVKn1LfPPLS586wJm56nzeWBCV6+VUbEeMUsFU
         9OjXP97XntHKP1QUxrBGs+uhB26whfpCxb7OLtKxyUQbPGcd63j9o7HxlIgAHg4ti361
         bmxRGtRYVRON9uz+2UIySZUrN/JWIaLxmyGQYSbHMgE58brIPlOn1PD974EQS7cGOoZF
         BxLRdz9M53AzwkO7F9FVF4ewLgyl8a2bZTicF78UCSpHj7txeoggNsKqxNqUwQJdFL/C
         4/cMnwxwe3xkqFs3d+K9KqvyMiVKQw666o3c72BQpwNW7g7mi6Krv0+YQlmZ3dCz6lw9
         ceow==
X-Forwarded-Encrypted: i=1; AJvYcCXBLn9OOGGBiPKUorYpm5fN4bXV1kuSK+0mn3L2GfrYANhFeDmNwYTrywRgLNY+Tl6v+pWlqq9qTvBXwU05DVNXng==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzfTvwdadFZ+kCVPPJY0zDdgvcH5XeAV4nfxx4tAOor743GwInT
	1xBfSTa2Ss4yYwumpu53ge2ROQBKt7bGlQMMA7+QWGZ9aCZStuHBoUS4LSGnaHk=
X-Gm-Gg: ASbGncuprkz+lUt0sdgAPeJOL6UHGwrAPys40S6usoaJy/QiIB5q9WJxc+P+d+DB/l4
	ZYEwe20Mr1eiJxFu0hNJQBoeBChabNhOQGeofXGZX/NekjcTNVQwRd0m6UobLBFW54DLd9fAbyu
	GrYC9edq5xtOspHx2GlwAOTqbxv0j1BtipcKJA0BcjOgRfkY7oMppzm0gZQek6rr5tgGuSI4pMG
	FHavQtFqmVoYN1yIZRVcoUCPzXH07i4TefhAh9O4TT785BOcqfhdOT1GahV6aoenj9Bjx0nrKRA
	l/epYpGIcuow4kLMz1jX0BfsxYfifLgcZUXpFRvK
X-Google-Smtp-Source: AGHT+IH1Q+z7M1NcIRsJKJ8S079o3cRppbNa/BcLKth8Pkqt+29qNrih+JSk0mNLNWxlkQq2RjHiHw==
X-Received: by 2002:a05:6512:3b23:b0:545:550:83e6 with SMTP id 2adb3069b0e04-5462eaa1f1amr976773e87.5.1739959354948;
        Wed, 19 Feb 2025 02:02:34 -0800 (PST)
Received: from nuoska (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-545254f7072sm1879824e87.127.2025.02.19.02.02.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 02:02:33 -0800 (PST)
Date: Wed, 19 Feb 2025 12:02:30 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: uvv.mail@gmail.com, Openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v5 1/2] systemd: Build the systemctl executable
Message-ID: <Z7WsNsR9-8lbzxjr@nuoska>
References: <20250218115647.40502-1-uvv.mail@gmail.com>
 <357c680fc29707fa3d6b9d934305acfb2df22c1f.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <357c680fc29707fa3d6b9d934305acfb2df22c1f.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Feb 2025 10:02:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211696

Hi,

On Wed, Feb 19, 2025 at 09:44:09AM +0000, Richard Purdie wrote:
> On Tue, 2025-02-18 at 12:56 +0100, Vyacheslav Yurkov via
> lists.openembedded.org wrote:
> > From: Vyacheslav Yurkov <uvv.mail@gmail.com>
> > 
> > Instead of the python re-implementation build the actual systemctl
> > from
> > the systemd source tree. The python script was used when systemd
> > didn't
> > provide an option to build individual executables. It is possible in
> > the
> > meantime, so instead of always adapting the script when there's a new
> > functionality, we simply use upstream implementation.
> > 
> > License-Update: Base recipe is used
> > 
> > Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
> > ---
> > �.../systemd/systemd-systemctl-native.bb������ |� 26 +-
> > �...-meson-add-install-tag-for-systemctl.patch |� 25 ++
> > �...2-meson-Bypass-certain-config-checks.patch |� 64 +++
> > �.../systemd/systemd-systemctl/systemctl������ | 376 ----------------
> > --
> > �
> 
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/9/builds/1022
> 
> and many similar failures unfortunately. Did we get out of sync with
> systemd versions?

I think a rebase is needed since point release update from 257.1 to 257.3.
Should be trivial. The patch file can be dropped since 257.3 already
has it. Thanks for upstreaming it!

Cheers,

-Mikko

