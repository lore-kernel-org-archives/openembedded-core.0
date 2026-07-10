Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE02EC43458
	for <webhook@archiver.kernel.org>; Fri, 10 Jul 2026 07:27:42 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7812.1783668461581582829
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2026 00:27:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=sVaWqEON;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-493bb510ce4so3775125e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 00:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783668460; x=1784273260; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gU+QQT4qpoaVmHNftFTO0tkPl5FK6vQ6fCUIXwCZA4U=;
        b=sVaWqEON+Mdz39Bvzc3Bc9Q7MNT0IQCsZ+D4m5JnwDSSIAXuiZBuKy3I04PPpJwKcl
         n0NswI7CM8uMT/WpYiI4+q0Py5GR8Mzc/mxQSYYnlhERIiaIzR0lY4jy2ys2C6flEqpH
         DLVxPzCOUc2yxClacxmfoxGi+qTOSpr63OheY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783668460; x=1784273260;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gU+QQT4qpoaVmHNftFTO0tkPl5FK6vQ6fCUIXwCZA4U=;
        b=cnxYNcAyVwzF19Dj+4uhJPpLreBIUEuEHTIRaNK4mGMdCBRDRT5ctzUvbizMWd+g16
         0sT8ODeQSeAjeIbDpQiMVX5qhe+ynnYFNE3Cw5OVxPu5HboFdE64NYlqtECQ4SmJq/w3
         E5ilL51SYVbDRYsJ+svsZYkwBZxx6U0UYdU8B4UzsqOqEJhM8qfay5D3eunyNgEbqs4w
         UI4hKWj53jr/f1ztD6fzl/UOy4pFGVEvUfxWJE2vTPPtxts1hzhsKv/HJzwdqnxebgt/
         vd2q6mFxnsJbZ4Ga4/W6W5mdwimilaL9m3CraznFBxgQocR/Z531Q0fj265/CdbhPuob
         s+pw==
X-Gm-Message-State: AOJu0YwYrUdbJy7CRN8LtZWPLEWFaNeW4uXF3JwqkwRGQzDcrWnByITs
	+7D8Zu4r9MvShaRI1mRQo/8ykbq41qtIfhJAUH1eP7srXCQYfYaXRGGPV987CCdJt+k=
X-Gm-Gg: AfdE7ckWbTwA5/9hEtFOpQ3r2Jb5q17hnfBxKzMf9+svVEGoUWybdaiPuoalJpXFhtT
	bcJ39RzcZGrCQk3dMb7NCKW9F1dpfJA5ULPDE+EDMPx/Q0z5DM+088V08ir8sGGHvJBNvb6zxUn
	NbtLlBBTmZesWEdYggj4iGyNiB7nDdhnK+TAhP077/MFrfsCptZHarZZy/s3L9xa5ng8g9aM7rc
	AztvWCLitsI//vL8p4BVXlRhyTV+zCe+aQV8u4ibm9kS2FIeDtCWT1l0Zo1ymAT7AFOJ1j96ove
	BOciiVA79God3a0nJr9l3N0833pel6SyXe9B3TiRuqMnLiE29XhXZrSMgHJIvc59Iw4VbEgbr17
	AqYKFVhRCfLPKFmGXXwV9IsnUxLRJ21NFvF6oRh+f7vRVTugOq6zBmrYOOl3jQIRtB8TxNEkz2o
	m4f3opnJyE3h9kNupPB2pYGs7eoALczj+3STgqyev/ljcqaFk6ayC8UcAPhx8v8uRJSJB9x3+MT
	7DSeHRbIwVm/MaI
X-Received: by 2002:a05:600d:6413:10b0:493:f2b3:9cf9 with SMTP id 5b1f17b1804b1-493f2b39efemr15889135e9.36.1783668459739;
        Fri, 10 Jul 2026 00:27:39 -0700 (PDT)
Received: from localhost (2a01cb001331aa005f82d0ccbe50ecf8.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:5f82:d0cc:be50:ecf8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6d4f9fsm115880625e9.4.2026.07.10.00.27.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 00:27:39 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 10 Jul 2026 09:27:39 +0200
Message-Id: <DJUPP65UURBF.TY8K27J2AQTP@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH] dropbear: Disable DSS correctly
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <openembedded-core@lists.openembedded.org>
To: "Alex Kiernan" <alex.kiernan@gmail.com>, <mac@mcrowe.com>
X-Mailer: aerc 0.20.0
References: <20260629165056.2489582-1-mac@mcrowe.com>
 <DJS7O5671XMZ.OZRLCFBNZFYP@smile.fr> <ak_xh2CM7n4X8_c_@mcrowe.com>
 <CAO5Uq5Sh7MuFmb=xhQ=kaeyZcBaCDgjfTZ-Uwa25+swo66e3TA@mail.gmail.com>
In-Reply-To: <CAO5Uq5Sh7MuFmb=xhQ=kaeyZcBaCDgjfTZ-Uwa25+swo66e3TA@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 07:27:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240596

On Thu Jul 9, 2026 at 9:33 PM CEST, Alex Kiernan wrote:
> On Thu, Jul 9, 2026 at 8:07=E2=80=AFPM Mike Crowe via lists.openembedded.=
org
> <mac=3Dmcrowe.com@lists.openembedded.org> wrote:
>>
>> Hi Yoann,
>>
>> On Tuesday 07 July 2026 at 10:54:38 +0200, Yoann Congal wrote:
>> > On Mon Jun 29, 2026 at 6:50 PM CEST, Mike Crowe via lists.openembedded=
.org wrote:
>> > > From: Mike Crowe <mac@mcrowe.com>
>> > >
>> > > Take upstream patch that stops sysoptions.h unconditionally turning
>> > > DROPBEAR_DSS back on even when it has been disabled (which is the
>> > > default).
>> > >
>> > > Signed-off-by: Mike Crowe <mac@mcrowe.com>
>> > > ---
>> > >  ...PBEAR_DSS-is-only-forced-for-fuzzing.patch | 29 ++++++++++++++++=
+++
>> > >  .../recipes-core/dropbear/dropbear_2022.83.bb |  1 +
>> > >  2 files changed, 30 insertions(+)
>> > >  create mode 100644 meta/recipes-core/dropbear/dropbear/0001-Fix-so-=
DROPBEAR_DSS-is-only-forced-for-fuzzing.patch
>> > >
>> > > diff --git a/meta/recipes-core/dropbear/dropbear/0001-Fix-so-DROPBEA=
R_DSS-is-only-forced-for-fuzzing.patch b/meta/recipes-core/dropbear/dropbea=
r/0001-Fix-so-DROPBEAR_DSS-is-only-forced-for-fuzzing.patch
>> > > new file mode 100644
>> > > index 0000000000..b9705a2bbb
>> > > --- /dev/null
>> > > +++ b/meta/recipes-core/dropbear/dropbear/0001-Fix-so-DROPBEAR_DSS-i=
s-only-forced-for-fuzzing.patch
>> > > @@ -0,0 +1,29 @@
>> > > +From c7dfaebd5f6a4cde4198f4d2a7baabaa1f632274 Mon Sep 17 00:00:00 2=
001
>> > > +From: Matt Johnston <matt@ucc.asn.au>
>> > > +Date: Tue, 6 Dec 2022 22:34:11 +0800
>> > > +Subject: [PATCH] Fix so DROPBEAR_DSS is only forced for fuzzing
>> > > +
>> > > +Regression from 787391ea3b5af2acf5e3c83372510f0c79477ad7,
>> > > +was missing fuzzing conditional
>> > > +
>> > > +Upstream-Status: Backport [https://github.com/mkj/dropbear/commit/c=
043efb47c3173072fa636ca0da0d19875d4511f]
>> >
>> > This patch is missing your signed-off-by.
>>
>> Well, it's not my patch. :)
>>
>> I wasn't aware that I was expected to add one to the patch itself for a
>> backport.
>>
>> https://docs.yoctoproject.org/scarthgap/contributor-guide/recipe-style-g=
uide.html
>> doesn't seem to say that a SoB should be added to the patch. It does say=
:
>>
>> | Of course, if another person later takes care of submitting this patch
>> | upstream, the status should be changed to Submitted [where], and an
>> | additional Signed-off-by: line should be added to the patch by the per=
son
>> | claiming responsibility for upstreaming.
>>
>> which sort of implies that a SoB should be added for original patches th=
at
>> are suitable for upstreaming but this patch is a backport which originat=
ed
>> upstream (without a SoB) which isn't the same thing.
>>
>> Adding a SoB to an unmodified upstream backport patch feels like
>> appropriation on my part, but I can do so if that's the policy.
>>
>
> You're certifying that the patch you're submitting is appropriately
> licensed; it says nothing about who authored it.

I agree with Alex: As the one requesting the backport, you are the one
signing-off on this particular operation. The original author had
nothing to do with that.

I created a bug to request clarification in the doc on this point:
16356 =E2=80=93 Clarify trailers usage (Signed-off-by, ...) in imported pat=
ches
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16356

Regards,
--=20
Yoann Congal
Smile ECS


