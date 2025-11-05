Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0144CCFA0D
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 16:53:57 +0000 (UTC)
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14510.1762361637347494202
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 08:53:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=U1du/Ttj;
 spf=pass (domain: gmail.com, ip: 74.125.224.52, mailfrom: jpewhacker@gmail.com)
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-63fc72db706so55263d50.2
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 08:53:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762361636; x=1762966436; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8qOFf0oTu9ZgYOdFHyPmP+NI/3PrXRD9bS959Dpo4Ok=;
        b=U1du/TtjRxNjp615WKsYjdECUvDTeJlO8VkW4qxsnXtwrLXPlFOEuKd0TT5JEJOl9O
         ky1k4RKQyJqg3Q5ghHPiwsdcfoUychXcn7aLTzdYqCBY34jmTG12mEu4Wu6/qR1PhMcu
         hngAlhNvOf4+VKnWCL2X0qV5Ba5tp1AtqY3qKbVsB21A8fjtbHy/X3wlxVHD4+eilUYx
         h1EEWUBk6o0KQzbmTVLdocKoA8IZNrPhkp49qtZtCVaV6wG0ifEyztgzSQz6he+OylLe
         loisPZByXwYiiZ6i1xcFFxaD1c4/O65uaJldNGNL1L7PBM+oWkJDpuZRv9iOZUZ2YIUz
         mnxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762361636; x=1762966436;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8qOFf0oTu9ZgYOdFHyPmP+NI/3PrXRD9bS959Dpo4Ok=;
        b=JI0kDkw7DrFNA4CKDA/ep72CcfggcEJR2zEAO8juEpnMpV733EuhMMb1NoJ0PQ/86o
         yR8KUg3FDRQ71eCnGHd+3CJ6QxycDWc+DhJzXpqMSXzDReBUepaJYpNrB14Ry+AdteMs
         CQMeQzON7rEj6MdbmJHE5yiMBdTW8ypHmZ+pZhobPu08tn96vDncQAf3LoOlJ5E3xfrh
         Xu7MK/XMDJbzh3wKFGkBCcLZ5Pjb/HPe3WxpcH99TFWvnD47Ic8uj9yjm8zqRU013II6
         AT4kUOl8NVyM1bKW6kizVCNuuazpFRd8B3JvLgm4Ja8kHxgMBPb7PYbvI8SBuDm1Kv63
         //vw==
X-Gm-Message-State: AOJu0YxEibYNSc+sNaulcSWi4OlTaMCoBWUF4AXjZ59Thbd03heJBtho
	QBwQSdfAiSLVWYZChlPX3kznNg1FTvDN8vV99KjumCHSor+pwLqMWGSFi5LXXn5uoMJVbQXOvKZ
	o/2aCDk6jrXVHTZF/rwO2XL+Dl8aB5tw=
X-Gm-Gg: ASbGnctX/KdHXTbaAiqMIFANLCvbd8ljAseeMr235KhpZe+UcpD9pMCLe1G5X4yjNM9
	M7Mr52Bv2lawKzLvZrkVoKanQ1IwcXdOrJcip2iqhqDZ2vvvFa+QNprMXRGlHn1WEfYiJMse6pR
	VWdU6KNzW5sUCM3FlzR2iS3Ujv2GYqzH8WBcrb8X4XPAmkufT2exVeXvEQd3Vw04oCMNJyOKEpL
	F8nasG6tGKpCVAeVPV3r5eN7kfNSQWVyTctiJ4ZMbYFCjF9Ma5GTZ64KhxGeFc1aw9mH0LAh2hP
	QAIXBZWV5g==
X-Google-Smtp-Source: AGHT+IGUPOG3OCdDBaIDoNhvbEEdx7d1FaO58yIlCw77V9/5VOwKda7KOQOd486GdCf4oG6WBnwxnXeCT8cdH83RVk0=
X-Received: by 2002:a05:690e:2417:b0:63f:9cef:d5f4 with SMTP id
 956f58d0204a3-63fd355d562mr2417082d50.36.1762361636413; Wed, 05 Nov 2025
 08:53:56 -0800 (PST)
MIME-Version: 1.0
References: <b2e867d19c02966f3e11d2c7e6b7765564587df5.camel@emlix.com>
In-Reply-To: <b2e867d19c02966f3e11d2c7e6b7765564587df5.camel@emlix.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Wed, 5 Nov 2025 09:53:43 -0700
X-Gm-Features: AWmQ_bk4pR_FqPl-mX9KBEnHFks_w35i5roZYbTDvpF8TgA0PdDT8mDYVp7IEa8
Message-ID: <CAJdd5GYSgnUtey269iGQzcoxNfB6u48QWMGsjsDYoAQCa_YNCw@mail.gmail.com>
Subject: Re: [OE-core] Thoughts on SPDX for files from meta-layer
To: dwagenknecht@emlix.com
Cc: openembedded-core@lists.openembedded.org, 
	OpenEmbedded Architecture <openembedded-architecture@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 16:53:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225776

On Wed, Nov 5, 2025 at 7:54=E2=80=AFAM Daniel Wagenknecht via
lists.openembedded.org <dwagenknecht=3Demlix.com@lists.openembedded.org>
wrote:
>
> Hello,
>
> I've looked through the generated SPDX files for a project recently.
> I' m specifically interested in the downloadLocation property that is
> set for entries in SRC_URI in recipe scope SPDX files, as our list of
> upstream sources we need to monitor for security information is based
> off those values.
>
> We'd like to extend the generated SPDX to also cover files from meta-
> layers, that are provided via file:// entries in SRC_URI. The files
> provided via this mechanism are mostly configuration files, systemd
> services, initscripts and the likes, so one could argue that they
> are not relevant dependencies and thus do not need to be traced in
> SPDX, but we'd prefer to properly trace them in the SPDX documents.
>
> Are there any thoughts on this, prior discussion that I've not found in
> the mailinglist archive or external resources on how such files should
> be treated in SPDX in general?
>
> I'm considering implementing this as outlined:
> - for file:// entries in SRC_URI determine which layer provides the
> file (via bb.fetch2.local.localpath())
> - check if the layer is modified via oe.buildcfg.is_layer_modified()
>   -> modified -> abort
> - retrieve the layers URL. This is more involved since what
> oe.buildcfg.get_metadata_git_remotes() returns might not be the URL
> that should be specified in the downloadLocation
> My approach would be to introduce a per-layer variable that specifies
> it's public URL.
>   -> no public URL for the layer found -> abort

adding architecture list

I don't think a variable to specify the public URL is going to work
well; for example, if a layer is forked, it will be wrong and
confusing. Just thinking off the top of my head, a better option might
be a variable that specifies the name of the git remote that should be
used, and if it's not specified then the URLs are ignored? For
example, in typical clone of oe-core, you could do something like:

  # Please don't take the name of this variable as a strong
suggestion, it's just an example :)
  LAYER_REMOTE_core =3D "origin"

which would use the "origin" remote of the oe-core git repo, and _if_
the current SHA-1 of that repo (which bitbake already knows) is in
that remote, then it will use that remote as the URL. In this way, if
you fork you can choose to use your own remote, or for example pull in
upstream oe-core as an "upstream" remote and use that.

I'm not entirely sold the above description is the best path, so maybe
we can let others chime in. I do think that we will want a way to
solve this, as we have also talked about including the information
about the layer itself into the SPDX, so this is more or less an
extension of that


> - create a SPDXRef-Download-recipename-X entry for the file with the
> downloadLocation set to the layers url with commit and subpath of the
> file in the repository specified
>
> If the layer is modified or a public URL for that layer is not
> specified the downloadLocation would yield a NOASSERTION value.

This is the correct approach, once we figure out how to get the URL.

>
> I'd be glad to get some feedback on those ideas!
>
> Sincerely
> Daniel Wagenknecht
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#225774): https://lists.openembedded.org/g/openembedde=
d-core/message/225774
> Mute This Topic: https://lists.openembedded.org/mt/116135395/3616693
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [JP=
EWhacker@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

