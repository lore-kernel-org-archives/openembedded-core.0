Return-Path: <diego.rondini@kynetics.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 511B3C7618D
	for <webhook@archiver.kernel.org>; Thu,  6 Apr 2023 09:08:24 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web11.154053.1680772101081968130
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Apr 2023 02:08:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kynetics-com.20210112.gappssmtp.com header.s=20210112 header.b=OVAdLCIP;
 spf=neutral (domain: kynetics.com, ip: 209.85.215.179, mailfrom: diego.rondini@kynetics.com)
Received: by mail-pg1-f179.google.com with SMTP id y35so23351810pgl.4
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Apr 2023 02:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kynetics-com.20210112.gappssmtp.com; s=20210112; t=1680772100;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YFXIWcWafGjlQHysu4Wa7wvVRawCWhskOTbf3cWtaJc=;
        b=OVAdLCIP5fqiwLE9bnbgJFBpmDH5v4HglBGNMSX85eMpFNcWg/CAnJfIxGb1pFVMAE
         0eFUFHFtBWc28tO+Ty9HigqfB0F8gkYoHXX8GOb1JMz4VS+K/Go5KvBnyt/VonO+daRJ
         3qvoO90KFg01Gcapu5Hn/gF/TGvAEZzo6PAKRT8th6xNTE3j9SLNXTPCcqs23Qu+GDf6
         pHsU3AjxN3HmuTLRwcvZ0xqyWWG09Btcn/MFGb2KF3+idAtQ8Y4l3//V4O2Vxh108tI7
         vW+mOiXZh/SklH8yyedLUkRdDUHaDl06Xj7NT0XD/r4nw+6YWt6bx2Oh9yTpb41M7qvx
         ymVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680772100;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YFXIWcWafGjlQHysu4Wa7wvVRawCWhskOTbf3cWtaJc=;
        b=gPcFoUQKxh1x9i5+J260rDZne15mJTn/uphFCvyYpCuJkn0ioTLW34tH8Ofv935zMa
         aDnrr025cUSm2zsAl62wctUlzv1ojrkfc+wuOYHgyFPGvmNDzVWuulVTZu/QZEXyde1H
         d8jgrxOA59hghG1pBKfMBIkBKNcTR6V2KFGOXdoDpTvwjZpYq9ntGkPBShWr+7eSdujG
         /RNR034EmBjOCTbx1Y3YkC1iJZCmfYxfQigBLs5tfZ6b1XloJweHuxGcwYawJKhMq85w
         FOroYP76HPzGIONLxZLcU/38TYThcwDrRxFcUeBwXY1WFmplbgPT3LYC6Hvo3vjeMMq4
         i0DA==
X-Gm-Message-State: AAQBX9efCLtN92nC+y5IhyUokx9bsezwCqJvHSMb4hXwRyAmVfzZ3REf
	DKtnTTBNjsVAJ1d5SuhhTmme0YCS4wiR8TSmxIw8xg==
X-Google-Smtp-Source: AKy350aHVLKB2MOCuVm+rp9mTlz6BH79XOEIjtfCQ7GMw8eA08m948/EH+7HcegJ7qie4RSwlnll0ksHYymYmd6vE6Q=
X-Received: by 2002:a63:4506:0:b0:50b:188d:25bb with SMTP id
 s6-20020a634506000000b0050b188d25bbmr3005551pga.5.1680772100377; Thu, 06 Apr
 2023 02:08:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230322155430.31594-1-dit.kozmaj@kynetics.com> <23e742ca62b882717bd04827c3939f4951481551.camel@linuxfoundation.org>
In-Reply-To: <23e742ca62b882717bd04827c3939f4951481551.camel@linuxfoundation.org>
From: Diego Rondini <diego.rondini@kynetics.com>
Date: Thu, 6 Apr 2023 11:08:09 +0200
Message-ID: <CAMfw5YreGza5Z5fUBq9Jrjs0pEjwU1ajOCK=U1gsLgWwTyfuFA@mail.gmail.com>
Subject: Re: [OE-core] [RFC][PATCH] wic: use part_name when defined
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: dit.kozmaj@kynetics.com, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000fde3d205f8a73fca"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Apr 2023 09:08:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179765

--000000000000fde3d205f8a73fca
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Mar 29, 2023 at 5:55=E2=80=AFPM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Wed, 2023-03-22 at 16:54 +0100, dit.kozmaj@kynetics.com wrote:
> > From: Dit Kozmaj <dit.kozmaj@kynetics.com>
> >
> > So far part.label has been used to define GPT partition label even if
> > part.part_name was defined.
> > Fix the code to use part.part_name whenever available, as it makes sens=
e
> > to have a GPT partition label which is different from the contained
> > filesystem label.
> >
> > Signed-off-by: Dit Kozmaj <dit.kozmaj@kynetics.com>
> > Signed-off-by: Diego Rondini <diego.rondini@kynetics.com>
> > ---
> >  scripts/lib/wic/plugins/imager/direct.py | 14 ++++----------
> >  1 file changed, 4 insertions(+), 10 deletions(-)
> >
> > diff --git a/scripts/lib/wic/plugins/imager/direct.py
> b/scripts/lib/wic/plugins/imager/direct.py
> > index dfaa901567..1f06b89f8e 100644
> > --- a/scripts/lib/wic/plugins/imager/direct.py
> > +++ b/scripts/lib/wic/plugins/imager/direct.py
> > @@ -571,11 +571,12 @@ class PartitionedImage():
> >              self._create_partition(self.path, part.type,
> >                                     parted_fs_type, part.start,
> part.size_sec)
> >
> > -            if part.part_name:
> > +            if part.part_name or part.label:
> > +                partition_label =3D part.part_name if part.part_name e=
lse
> part.label
> >                  logger.debug("partition %d: set name to %s",
> > -                             part.num, part.part_name)
> > +                             part.num, partition_label)
> >                  exec_native_cmd("sgdisk --change-name=3D%d:%s %s" % \
> > -                                         (part.num, part.part_name,
> > +                                         (part.num, partition_label,
> >                                            self.path),
> self.native_sysroot)
> >
> >              if part.part_type:
> > @@ -592,13 +593,6 @@ class PartitionedImage():
> >                                  (part.num, part.uuid, self.path),
> >                                  self.native_sysroot)
> >
> > -            if part.label and self.ptable_format =3D=3D "gpt":
> > -                logger.debug("partition %d: set name to %s",
> > -                             part.num, part.label)
> > -                exec_native_cmd("parted -s %s name %d %s" % \
> > -                                (self.path, part.num, part.label),
> > -                                self.native_sysroot)
> > -
> >              if part.active:
> >                  flag_name =3D "legacy_boot" if self.ptable_format =3D=
=3D
> 'gpt' else "boot"
> >                  logger.debug("Set '%s' flag for partition '%s' on disk
> '%s'",
>
> This was flagged on irc as not having a response. We're struggling with
> a lack of a maintainer for wic at the moment so review is slow and I'm
> not really a wic expert but I'm all we have :/.
>
> As mentioned, changes to code like this are much more likely if there
> is a test case included. The existing tests can be run with "oe-
> selftest -r wic".
>
> Can you confirm this patch doesn't regress the current tests?
>

We've sent a new patchset that doesn't regress the current tests:
https://patchwork.yoctoproject.org/project/oe-core/list/?series=3D11822


> Would you be able to add a test so this change doesn't regress in
> future?
>

The aforementioned patchset includes a new test for that purpose and
updates the documentation to reflect the changes and explain what happens
in each case.

This RFC is superseded by the patchset.

Cheers,
>
> Richard
>
>
Cheers,

Diego Rondini
Sr. Embedded Engineer

Kynetics
www.kynetics.com

--000000000000fde3d205f8a73fca
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div dir=3D"ltr">Hi,<br></div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 29, 2023 at 5:55=
=E2=80=AFPM Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfounda=
tion.org">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">On Wed, 2023-03-22 at 16:54 +01=
00, <a href=3D"mailto:dit.kozmaj@kynetics.com" target=3D"_blank">dit.kozmaj=
@kynetics.com</a> wrote:<br>
&gt; From: Dit Kozmaj &lt;<a href=3D"mailto:dit.kozmaj@kynetics.com" target=
=3D"_blank">dit.kozmaj@kynetics.com</a>&gt;<br>
&gt; <br>
&gt; So far part.label has been used to define GPT partition label even if<=
br>
&gt; part.part_name was defined.<br>
&gt; Fix the code to use part.part_name whenever available, as it makes sen=
se<br>
&gt; to have a GPT partition label which is different from the contained<br=
>
&gt; filesystem label.<br>
&gt; <br>
&gt; Signed-off-by: Dit Kozmaj &lt;<a href=3D"mailto:dit.kozmaj@kynetics.co=
m" target=3D"_blank">dit.kozmaj@kynetics.com</a>&gt;<br>
&gt; Signed-off-by: Diego Rondini &lt;<a href=3D"mailto:diego.rondini@kynet=
ics.com" target=3D"_blank">diego.rondini@kynetics.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 scripts/lib/wic/plugins/imager/direct.py | 14 ++++----------<br>
&gt;=C2=A0 1 file changed, 4 insertions(+), 10 deletions(-)<br>
&gt; <br>
&gt; diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wi=
c/plugins/imager/direct.py<br>
&gt; index dfaa901567..1f06b89f8e 100644<br>
&gt; --- a/scripts/lib/wic/plugins/imager/direct.py<br>
&gt; +++ b/scripts/lib/wic/plugins/imager/direct.py<br>
&gt; @@ -571,11 +571,12 @@ class PartitionedImage():<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._create_partition=
(self.path, part.type,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0parted_fs_typ=
e, part.start, part.size_sec)<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if part.part_name:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if part.part_name or part.l=
abel:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 partition_lab=
el =3D part.part_name if part.part_name else part.label<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 logger.d=
ebug(&quot;partition %d: set name to %s&quot;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0part.num, part.part_name)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0part.num, partition_label)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exec_nat=
ive_cmd(&quot;sgdisk --change-name=3D%d:%s %s&quot; % \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0(part.num, part.part_name,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0(part.num, partition_label,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 self.path), self.native_sysroot)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if part.part_type:<br>
&gt; @@ -592,13 +593,6 @@ class PartitionedImage():<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (part.num, part.uuid, self=
.path),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.native_sysroot)<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if part.label and self.ptab=
le_format =3D=3D &quot;gpt&quot;:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 logger.debug(=
&quot;partition %d: set name to %s&quot;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0part.num, part.label)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exec_native_c=
md(&quot;parted -s %s name %d %s&quot; % \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (self.path, part.num, part.label=
),<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.native_sysroot)<br>
&gt; -<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if part.active:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 flag_nam=
e =3D &quot;legacy_boot&quot; if self.ptable_format =3D=3D &#39;gpt&#39; el=
se &quot;boot&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 logger.d=
ebug(&quot;Set &#39;%s&#39; flag for partition &#39;%s&#39; on disk &#39;%s=
&#39;&quot;,<br>
<br>
This was flagged on irc as not having a response. We&#39;re struggling with=
<br>
a lack of a maintainer for wic at the moment so review is slow and I&#39;m<=
br>
not really a wic expert but I&#39;m all we have :/.<br>
<br>
As mentioned, changes to code like this are much more likely if there<br>
is a test case included. The existing tests can be run with &quot;oe-<br>
selftest -r wic&quot;.<br>
<br>
Can you confirm this patch doesn&#39;t regress the current tests?<br></bloc=
kquote><div><br></div><div>We&#39;ve sent a new patchset that doesn&#39;t r=
egress the current tests:<br><a href=3D"https://patchwork.yoctoproject.org/=
project/oe-core/list/?series=3D11822">https://patchwork.yoctoproject.org/pr=
oject/oe-core/list/?series=3D11822</a></div><div><br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
<br>
Would you be able to add a test so this change doesn&#39;t regress in<br>
future?<br></blockquote><div><br></div><div>The aforementioned patchset inc=
ludes a new test for that purpose and updates the documentation to reflect =
the changes and explain what happens in each case.<br></div><div>=C2=A0</di=
v><div>This RFC is superseded by the patchset.</div><div><br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div><br></div><div>Cheers,</div><div><br></div><div><div dir=
=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr">Diego Rondini<br>Sr. Em=
bedded Engineer<br><br>Kynetics<br><a href=3D"http://www.kynetics.com" targ=
et=3D"_blank">www.kynetics.com</a><br></div></div></div></div>

--000000000000fde3d205f8a73fca--

