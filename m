Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAC44CE7D1F
	for <webhook@archiver.kernel.org>; Tue,  1 Oct 2024 12:56:19 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.80503.1727787373389696037
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Oct 2024 05:56:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PaF+zcPm;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-42cbbb1727eso48623145e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Oct 2024 05:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1727787372; x=1728392172; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=J/l3a1gui4Y+wb7Z5Gj6sMJ8Ocn3dWxlYf+/7abZqWo=;
        b=PaF+zcPmqVdoJw+FAsjqtgWf+gq58LFdm2WfnpHgEl5M3wWiuLKZqRzmvEc2OYiK9q
         vTLVUa8LHspt8N0iCBlXlCe3fFkpF1GSovhlLUyuDqJfLIUa3xZQS/ynEwZ1Twy8+v1D
         iIwSVRBwrLh4V0dmcadOdQ7nwMxJRMistFUao=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727787372; x=1728392172;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J/l3a1gui4Y+wb7Z5Gj6sMJ8Ocn3dWxlYf+/7abZqWo=;
        b=EI9fpHqEr3G5fuwxypKTmsBWEzxKdjpQSrGQGuDwg5Bsxt74KR6uxVnhb6IkQC7MPv
         XXEt0G12jlW8GOIIi+mTvJf/DSlh7h5J2GDhuc2FKu1ANrNXHdUJ6o9rNiTyIrIUZ/HO
         lSPiyVQozDc5QQHajj2sdEF434u3xEwTiuIBtUJjCQfm68V9/Ym1ICnE9fWYuSUPivkE
         rAGkP7qHTnMvV3nnoNxt4dY0pN7fnGdd0ViIntJ8TC8oHNTAQ/4feQDMOEDeCKoR0+dH
         /xvUNvaVWswOyDwv2bcwJvFpfD5lySnt1vIOEA9sWuxPJRvefrnmyfmdOabGdhDutq3k
         WqXw==
X-Forwarded-Encrypted: i=1; AJvYcCUZHQ8XMGzP+jT4NfUhyfaZJc0uIp/909CR7Gy+2T1/ygeVR+dCsaCrRj/qPJzauxtc5xeKy2fhjYNzy0Or0sBx1w==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyRcSJDqKkWYRE2pVdG52BwE/t2RF/0d+Ei4boooaSwoGmGtQeh
	4LMHgSLu7TdS1St/YoIYBwHX3jdzlEMxHXJdRFn6tKWNAIppcrTyDjq7TZfOhE8=
X-Google-Smtp-Source: AGHT+IFAy4akh/G8xTLl7GHR1g5kABKCrtD4DPkVRRZ5siG8vSwQ6Ob1VLt/bdclZnYCWFfbXPA+fw==
X-Received: by 2002:a05:600c:1f91:b0:42c:bc04:58a5 with SMTP id 5b1f17b1804b1-42f58491434mr126505465e9.33.1727787371482;
        Tue, 01 Oct 2024 05:56:11 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:85a4:e3cc:bdf8:640d? ([2001:8b0:aba:5f3c:85a4:e3cc:bdf8:640d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e96a54fdesm180725845e9.41.2024.10.01.05.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 05:56:11 -0700 (PDT)
Message-ID: <183aa1235ab723f21f16c54d395e773fe4153c5d.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH 6/6] patchtest: use black to format libraries
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Trevor Gamblin <tgamblin@baylibre.com>, 
	openembedded-core@lists.openembedded.org
Cc: Ross Burton <Ross.Burton@arm.com>, tim.orling@konsulko.com
Date: Tue, 01 Oct 2024 13:56:10 +0100
In-Reply-To: <776f425a-eed8-4611-8c90-d79a2b56703f@baylibre.com>
References: <20240924115503.1599651-1-tgamblin@baylibre.com>
	 <20240924115503.1599651-7-tgamblin@baylibre.com>
	 <87ee2add3b3814aa41f6e0b6758dee068a1ab54f.camel@linuxfoundation.org>
	 <776f425a-eed8-4611-8c90-d79a2b56703f@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Oct 2024 12:56:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205162

On Tue, 2024-10-01 at 08:47 -0400, Trevor Gamblin wrote:
>=20
> On 2024-10-01 07:45, Richard Purdie wrote:
> > On Tue, 2024-09-24 at 07:55 -0400, Trevor Gamblin via lists.openembedde=
d.org wrote:
> > > Black makes things easier to read.
> > >=20
> > > Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> > > ---
> > > =C2=A0=C2=A0meta/lib/patchtest/mbox.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 44 +++---
> > > =C2=A0=C2=A0meta/lib/patchtest/patchtest_parser.py=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 106 ++++++++-----
> > > =C2=A0=C2=A0meta/lib/patchtest/patchtest_patterns.py=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 84 ++++++----
> > > =C2=A0=C2=A0meta/lib/patchtest/repo.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 32 ++--
> > > =C2=A0=C2=A0meta/lib/patchtest/selftest/selftest=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 92 ++++++++---
> > > =C2=A0=C2=A0meta/lib/patchtest/tests/base.py=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 86 ++++++---=
--
> > > =C2=A0=C2=A0meta/lib/patchtest/tests/test_mbox.py=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 144 +++++++++++++-----
> > > =C2=A0=C2=A0meta/lib/patchtest/tests/test_metadata.py=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 94 ++++++++----
> > > =C2=A0=C2=A0meta/lib/patchtest/tests/test_patch.py=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 39 +++--
> > > =C2=A0=C2=A0.../lib/patchtest/tests/test_python_pylint.py |=C2=A0 45 =
++++--
> > > =C2=A0=C2=A0scripts/patchtest=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 113 +++++++++-----
> > > =C2=A0=C2=A0scripts/patchtest-get-branch=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0 54 ++++---
> > > =C2=A0=C2=A0scripts/patchtest-send-results=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 66 =
+++++---
> > > =C2=A0=C2=A013 files changed, 660 insertions(+), 339 deletions(-)
> > I'm a bit nervous about this change for a few reasons. Firstly, it sets
> > a precedent where others will want to do this on other areas of the
> > code and I'm not sure we really want to do that.
> >=20
> > black is quite opinionated and I don't agree with everything it is
> > changing. Some of the code does look more readable before it made
> > changes compared to the end result, particularly around how it is
> > choosing to line wrap the code. Some of the changes are also just
> > rearranging things for little gain such as changing quoting characters.
> >=20
> > I'm therefore in two minds of this. I do want to empower people to
> > maintain code but I don't want to end up forced into taking style
> > changes I really don't agree with :/.
>=20
> I agree that it may lead to a rush of reformatting efforts that aren't=
=20
> desired. We certainly don't have to take this patch now if you don't=20
> want to, although the more minor changes (e.g. the quotations) were=20
> actually a bigger part of the draw for me when I ran it.
>=20
> On the other hand, some experience with using checkpatch.pl in the=20
> kernel has me wondering if we should be considering standardizing our
> formats for Python scripts and modules (over time) anyway. I have no=20
> strong preference on which formatter would be best (to be honest, I=20
> haven't even tried the others like YAPF or Ruff). Black, however, seems=
=20
> to be the one recommended most, and though it's opinionated it helps=20
> keep things consistent (the example above where the string quoting was=
=20
> sometimes single and sometimes double drove me nuts every time I looked=
=20
> at it).
>=20
> Is this a reasonable goal for some distant release? I've CC'd Ross and=
=20
> Tim since they're also doing some Python work. I might bring it up at
> the weekly today.

Seemingly simple formatting changes have been some of the more
contentious issues in the past. The churn such patches introduce make
history difficult to read and make LTS maintanenace hard as patches
become hard to backport. I've "lived" through the discussion multiple
times in one format or another and I'm still not convinced that
adopting hard "rules" around format X or Y is a great idea.

We have been adopting a rough standardisation of things slowly over
time as code gets updated but it doesn't extend to the quotes or line
wrapping as there were other bigger problems. I'm not against doing
that as we update code but I'm not sure I'm convinced about block
formatting changes like this patch.

If there was a specific issue like the quoting, I'd in many ways prefer
to fix that in a specific patch rather than have multiple formatting
changes all mixed together. Our metadata quoting really doesn't help
things there :/. Different people are triggered by different issues, I
know personally quoting bothers much much less that function parameter
white spacing.

I worry this is a topic where there is no right answer too :/

Cheers,

Richard











