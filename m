Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB594E7AD58
	for <webhook@archiver.kernel.org>; Tue,  3 Oct 2023 14:22:20 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web11.109277.1696342935693710138
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Oct 2023 07:22:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Qquu1y3E;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: rybczynska@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-50567477b29so1165698e87.3
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Oct 2023 07:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696342934; x=1696947734; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=klMBJuyZMD4QdC6xqmpmksAZxtiOxnS751MTqUMGdDY=;
        b=Qquu1y3EuncQ2N4EPQI004h6VGJ5CfM5Ip/0dr1iOmCnxtC1uwX/QHbOnQWMHj2TXl
         RfY2Fx1UbhwXLtvVjs3ZhPrfUCZpmkDNMXeMpAQNdUbVOaRwbKMVcqctc/EUuxnZrbN7
         DbWdRMQf0AUzeeL18gkZKSaq0TiaaiKTifhpNWiFkBtEIY80WWSYEtEUsYTDqvry22mm
         o7h6nS59vZnPv/uxjjJt1QGBZO39HmoJHZB6bOnbCmK3Kw2onzLeHNWtOxd6AfjR5ikf
         Gmt8ve6QUL7FZ7Vpq342il1wOZaHghawf3vU0SaIMgRg9D+HaCUyTXJrdkOhoi0e3paX
         Qm2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696342934; x=1696947734;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=klMBJuyZMD4QdC6xqmpmksAZxtiOxnS751MTqUMGdDY=;
        b=nqU/wf9AwOyv4wp/pfE6Ex5uEtaa/Sy7lSeoJ+XRFpL0DsbZHozVywlfF/LKXnwX+P
         /GrCqEXyipxB6DXttcF8/PsErkgVZAxXBXZoqlAJ6RG6NnTTaBLuLA0jIAXBX6RgcEXL
         H19ybfEGnNQWwPL1XJIJjhl5hfTZFwY+I1F/rqdvCFTC3ouXo9D56Jfn1GSbAuIQ5f1l
         mRh4iYxSJZueNgXOL5+bdpdK9JE47QsUO5yMP7y9XayYwXbmxhHFHylwc5xeSH9POV4Y
         XzJXu7tVOJl0hEERyES54yjCk6lsDeCIUiNPeYYq6U3JAsV3/f5hoz226IN+lAwvjNdY
         NB4A==
X-Gm-Message-State: AOJu0YwdOfasVbFPE+dbzQUXyD7NycFumWsg0SjuLYBGp/hQJJr/vbWu
	VML2n1r/eE1C2WZq/d8voTlo9nEBkVnYfUEanic=
X-Google-Smtp-Source: AGHT+IE/A7g6FU6WEc132uXutHSZaJC5wDtkXalXYZ8CswAEMH7qGiaMIoB1N7l6GTrVUzt+dUHv1yCtjjqk+9Ko8/U=
X-Received: by 2002:a2e:9995:0:b0:2c0:2b93:884c with SMTP id
 w21-20020a2e9995000000b002c02b93884cmr12527579lji.29.1696342933430; Tue, 03
 Oct 2023 07:22:13 -0700 (PDT)
MIME-Version: 1.0
References: <5de278299252520d600532c7d0d18c7292c777d8.camel@linuxfoundation.org>
In-Reply-To: <5de278299252520d600532c7d0d18c7292c777d8.camel@linuxfoundation.org>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Tue, 3 Oct 2023 16:22:01 +0200
Message-ID: <CAApg2=TgrRTTi0pTG3kE=-W+LXvhRu5x0K3dS=A1o_Sp+0aE9w@mail.gmail.com>
Subject: Re: [OE-core] An insight into the kind of help we need/maintainer overload
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Oct 2023 14:22:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188641

On Mon, Oct 2, 2023 at 12:40=E2=80=AFPM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> It isn't any secret that I'm overloaded and struggle to keep up with
> the demands of the project. People often ask me "how do you need
> help?". Today, we have a fairly good example of the kind of problem I
> struggle with. So it is documented, I'll describe my side of the
> challenge.
>
> We're supposed to be building the final release candidates for 4.3
> today. We've also just found out that the 6.4 kernel is EOL much sooner
> than we guessed. The choice is ship with a known working but
> unsupportable kernel (no security updates), or try and switch to 6.5.
>
> Over the weekend (when I should really be doing anything but work), I
> tested the preliminary 6.5 patches Bruce was kind enough to prepare on
> the autobuilder.
>
> Just getting to this point is a ton of work for Bruce which goes on
> quietly relatively unrecognised. The -dev kernel has been used to try
> and prepare for the future kernel upgrades and without that we wouldn't
> be at this point already. I'm going to focus on the challenges I have
> but I want to recognise others have already faced issues just to get to
> this point.
>
> On the autobuilder we found that:
>
> a) cryptodev breaks
> b) LTP ARM testing OOMs and crashes badly
> c) ARM ptests are hitting jitterentropy issues intermittently (~ a
>    third fail)
> d) x86 qemu image tests are failing say 5% of the time which means 3-4
>    of 5 oe-selftest fail plus some other random failures
> e) strace ptests are failing
> f) meta-virtualization breaks
>
> Bruce can't be expected to test or fix everything. Some of these issues
> have all the hallmarks of being really painful to fix.
>
> a) is trivial, there is a patch in master-next. Being selfish, f) isn't
> my problem. It is Bruce's though and will distract him from other
> kernel things. e) is probably deterministic and can either be fixed or
> disabled.
>
> This leaves b/c/d as the scary problems.
>
> c) has already been reported on the kernel lists but nobody responded.
> Not a good sign. I've looked to see if we can disable it but we'd have
> to disable the bluetooth stack to do so.
>
> The memory issues in b) if reported upstream will be pushed back with
> "why not add more memory?" or "what is using the memory? Please debug
> it and tell us how to fix it". Whilst I appreciate this is how the
> world works, it is frustrating as we're effectively on our own until we
> present it to upstream on a plate.
>
> The issues in d) are the scariest of the lot. A rare ish non-
> determinstic failure we can't talk to anyone about until we narrow the
> issue down. If I try and share with others, they'll ask how to
> reproduce and I simply don't know at this point. Engineers don't like
> to touch problems without a reproduction mechanism.
>
> Even just asking others about this has people asking "where is the bug
> report I can look at?". Given most of this happened over the weekend, I
> haven't written bug reports and that in itself is a lot of work even
> collecting up the information from the failed builds.
>
> So what do I do?
>
> I have no engineers I can "assign" to this. Our kernel maintainer will
> help but only has finite time they can spend on upstream work and the
> shear number of issues means they are unlikely to get all the issues
> resolved alone.
>
> Can we afford to fix this in several weeks time? No, we can't as we
> need to build 4.3 now so there is time pressure.
>
> I can ask for help from others and I will/have but most people can't
> drop everything and dive into this. This leaves my own time as about
> the only thing I can directly control/contribute.
>
> If these things happen very occasionally, they can be managed. It does
> feel like other upstreams are getting stretched more thinly,, quality
> is getting worse and they're pushing more bug resolution to their
> consumers. Yocto Project users are also pulling their engineers to
> internal/product focused work and I'm left in the middle with
> increasing work and fewer resources.
>
> I will likely take 48 hours to work out what we can do. If we can't
> find a line of sight on resolving the issues, the outcode after that
> time really has to be one of "ship 6.4, who cares about security" or
> "delay the release X (4?) weeks and hope for the best".
>
> If anyone has any idea of how to solve these process/resource issues,
> or what I should be going differently, let me know. I am really tempted
> just to stick with 6.4 as I really don't need these kind of problems.
>

Hello Richard,
I'm sorry hearing that. However, I find your analysis factual and complete.
I'm wondering about one thing (maybe missing some background): what about t=
he
option of using 6.1 by default and disabling both 6.4 and 6.5 ?

Shipping EOLed 6.4 would have an seriously bad impact on the project
image, in my opinion.

Kind regards,
Marta

