Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BA5EC636CC
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 16:35:41 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web10.17764.1676910930590996056
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Feb 2023 08:35:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GvYW8U8N;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id f18so2394557lfa.3
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 08:35:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lVsZtTAUoysyu935hywh5pX7W9CRvbyeGRJCRmGXSXQ=;
        b=GvYW8U8NdDYYmMBzaZ+sx8xXmFPsAyJHV7Y1tlwCL5CeSSqA9PZxNLIzUe6/lpsfUk
         PAr0aD3l6Xseg+BTQMdZlTY9jA6JmVnQVuOuIPEYoorpbHEmDeV+rPdMKC217sBsPJSW
         XfcBGAjv67Wqe15MgnLXRfbtUnfzWkjQf4WYle5Mxf51owQiP+uppOsQM5Rtpr3ag9+X
         jHA1nHEofx4t2tNmhUO+9Te0fCmf2JLzGEgq3Z0VE+F4wNFmifpF/S4zuN88RccEDWc0
         VEr43wYjI1JEoG5C7TLIBObnQEYtllD3ZF3xs1/i9VNFrYUhFCcMohJ1fU1Nycn4zGUg
         R4KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lVsZtTAUoysyu935hywh5pX7W9CRvbyeGRJCRmGXSXQ=;
        b=5pME2pZ2UA7evXLq0kJem0Vrwyy3R4brD7BIAnA7ws6+ewkrQBCYXxlBa3skwJCYRe
         WfwQSm4UIV0wXEkMkux5AuJtxtuwA8MAl43Bm3ktvG5b5RtdR4Pn8C1MiQOdNRDKwzgZ
         ZGfc5sV+DHFCHh4SLk/QWPYw2U8b72N28AqGgSmip2ywBTUW34lfkest8UKbbKqPh1Ch
         gSrKD3HqYtYzvz7DEPSoitqsisPsiEWShQcY7s0yGYrPoKbBy30CN/pIwJy6s/i43Wfl
         2sJTij0F6SHflTqwx8PmeO+37h34sS5fFuSXv9Vgl2mlk9agmhI44I800vO1y//B/eRI
         v6TQ==
X-Gm-Message-State: AO0yUKXv71QqKR6trCAdX8mtbbQwQw7dlCdAIHrvpn6ItIkXNh7C+nBv
	F8ygoV5nJlvEVuvTtGxm+wcuD33bYL7jrRTt5yQ=
X-Google-Smtp-Source: AK7set9ZPpDmmu7QlRsZRVZAt2vrqIUlIit5p8rZU4WM4LRZcLyswHuJZ+XpPowl3InUwF5UraymBZe61ffOHCqK6b0=
X-Received: by 2002:ac2:511c:0:b0:4d8:5810:1ffa with SMTP id
 q28-20020ac2511c000000b004d858101ffamr731208lfb.11.1676910928526; Mon, 20 Feb
 2023 08:35:28 -0800 (PST)
MIME-Version: 1.0
References: <20230220162817.180458-1-ross.burton@arm.com> <20230220162817.180458-3-ross.burton@arm.com>
 <ACFEBC4F-0692-43CA-A44E-2A4102500C3D@arm.com>
In-Reply-To: <ACFEBC4F-0692-43CA-A44E-2A4102500C3D@arm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 20 Feb 2023 17:35:17 +0100
Message-ID: <CANNYZj84YAwbOwxHzrocBD-Aod7U1nevhfL3-duLB4VChCqk0g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/3] glibc: backport the fix for CVE-2023-25139
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000037033705f52440ae"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 16:35:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177443

--00000000000037033705f52440ae
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

But then the cve should be marked as resolved?

Alex

On Mon 20. Feb 2023 at 17.34, Ross Burton <ross.burton@arm.com> wrote:

> Ignore this, "glibc: stable 2.37 branch updates=E2=80=9D incorporates it.
>
> Ross
>
> > On 20 Feb 2023, at 16:28, Ross Burton via lists.openembedded.org
> <ross.burton=3Darm.com@lists.openembedded.org> wrote:
> >
> > Signed-off-by: Ross Burton <ross.burton@arm.com>
> > ---
> > ...r-grouping-in-printf-width-bug-30068.patch | 84 +++++++++++++++++++
> > meta/recipes-core/glibc/glibc_2.37.bb         |  1 +
> > 2 files changed, 85 insertions(+)
> > create mode 100644
> meta/recipes-core/glibc/glibc/0001-Account-for-grouping-in-printf-width-b=
ug-30068.patch
> >
> > diff --git
> a/meta/recipes-core/glibc/glibc/0001-Account-for-grouping-in-printf-width=
-bug-30068.patch
> b/meta/recipes-core/glibc/glibc/0001-Account-for-grouping-in-printf-width=
-bug-30068.patch
> > new file mode 100644
> > index 00000000000..9efd39a9eb4
> > --- /dev/null
> > +++
> b/meta/recipes-core/glibc/glibc/0001-Account-for-grouping-in-printf-width=
-bug-30068.patch
> > @@ -0,0 +1,84 @@
> > +CVE: CVE-2023-25139
> > +Upstream-Status: Backport
> > +Signed-off-by: Ross Burton <ross.burton@arm.com>
> > +
> > +From 07b9521fc6369d000216b96562ff7c0ed32a16c4 Mon Sep 17 00:00:00 2001
> > +From: Carlos O'Donell <carlos@redhat.com>
> > +Date: Thu, 19 Jan 2023 12:50:20 +0100
> > +Subject: [PATCH] Account for grouping in printf width (bug 30068)
> > +
> > +This is a partial fix for mishandling of grouping when formatting
> > +integers.  It properly computes the width in the presence of grouping
> > +characters when the width is larger than the number of significant
> > +digits. The precision related issue is documented in bug 23432.
> > +
> > +Co-authored-by: Andreas Schwab <schwab@suse.de>
> > +(cherry picked from commit c980549cc6a1c03c23cc2fe3e7b0fe626a0364b0)
> > +---
> > + stdio-common/Makefile               |  2 ++
> > + stdio-common/tst-grouping3.c        | 54 ++++++++++++++++++++++++++++=
+
> > + stdio-common/vfprintf-process-arg.c | 22 +++++++++---
> > + 3 files changed, 73 insertions(+), 5 deletions(-)
> > + create mode 100644 stdio-common/tst-grouping3.c
> > +
> > +diff --git a/stdio-common/vfprintf-process-arg.c
> b/stdio-common/vfprintf-process-arg.c
> > +index 24c9125f9f..8c0fcbcf78 100644
> > +--- a/stdio-common/vfprintf-process-arg.c
> > ++++ b/stdio-common/vfprintf-process-arg.c
> > +@@ -186,11 +186,17 @@ LABEL (unsigned_number):      /* Unsigned number
> of base BASE.  */
> > +   bool octal_marker =3D (prec <=3D number_length && number.word !=3D =
0
> > +                        && alt && base =3D=3D 8);
> > +
> > +-  prec =3D MAX (0, prec - (workend - string));
> > ++  /* At this point prec_inc is the additional bytes required for the
> > ++     specificed precision.  It is 0 if the precision would not have
> > ++     required additional bytes i.e. the number of input digits is mor=
e
> > ++     than the precision.  It is greater than zero if the precision is
> > ++     more than the number of digits without grouping (precision only
> > ++     considers digits).  */
> > ++  unsigned int prec_inc =3D MAX (0, prec - (workend - string));
> > +
> > +   if (!left)
> > +     {
> > +-      width -=3D number_length + prec;
> > ++      width -=3D number_length + prec_inc;
> > +
> > +       if (number.word !=3D 0 && alt && (base =3D=3D 16 || base =3D=3D=
 2))
> > +         /* Account for 0X, 0x, 0B or 0b hex or binary marker.  */
> > +@@ -221,7 +227,7 @@ LABEL (unsigned_number):      /* Unsigned number o=
f
> base BASE.  */
> > +           Xprintf_buffer_putc (buf, spec);
> > +         }
> > +
> > +-      width +=3D prec;
> > ++      width +=3D prec_inc;
> > +       Xprintf_buffer_pad (buf, L_('0'), width);
> > +
> > +       if (octal_marker)
> > +@@ -237,6 +243,8 @@ LABEL (unsigned_number):      /* Unsigned number o=
f
> base BASE.  */
> > +     }
> > +   else
> > +     {
> > ++      /* Perform left justification adjustments.  */
> > ++
> > +       if (is_negative)
> > +         {
> > +           Xprintf_buffer_putc (buf, L_('-'));
> > +@@ -263,9 +271,13 @@ LABEL (unsigned_number):      /* Unsigned number
> of base BASE.  */
> > +       if (octal_marker)
> > + --width;
> > +
> > +-      width -=3D workend - string + prec;
> > ++      /* Adjust the width by subtracting the number of bytes
> > ++         required to represent the number with grouping characters
> > ++ (NUMBER_LENGTH) and any additional bytes required for
> > ++ precision.  */
> > ++      width -=3D number_length + prec_inc;
> > +
> > +-      Xprintf_buffer_pad (buf, L_('0'), prec);
> > ++      Xprintf_buffer_pad (buf, L_('0'), prec_inc);
> > +
> > +       if (octal_marker)
> > +         Xprintf_buffer_putc (buf, L_('0'));
> > +--
> > +2.34.1
> > +
> > diff --git a/meta/recipes-core/glibc/glibc_2.37.bb
> b/meta/recipes-core/glibc/glibc_2.37.bb
> > index f299a3004a4..e5689e536ad 100644
> > --- a/meta/recipes-core/glibc/glibc_2.37.bb
> > +++ b/meta/recipes-core/glibc/glibc_2.37.bb
> > @@ -51,6 +51,7 @@ SRC_URI =3D
> "${GLIBC_GIT_URI};branch=3D${SRCBRANCH};name=3Dglibc \
> >
> file://0020-tzselect.ksh-Use-bin-sh-default-shell-interpreter.patch \
> >
> file://0021-fix-create-thread-failed-in-unprivileged-process-BZ-.patch \
> >
> file://0022-Avoid-hardcoded-build-time-paths-in-the-output-binar.patch \
> > +
>  file://0001-Account-for-grouping-in-printf-width-bug-30068.patch \
> > "
> > S =3D "${WORKDIR}/git"
> > B =3D "${WORKDIR}/build-${TARGET_SYS}"
> > --
> > 2.34.1
> >
> >
> >
> >
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#177441):
> https://lists.openembedded.org/g/openembedded-core/message/177441
> Mute This Topic: https://lists.openembedded.org/mt/97089377/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000037033705f52440ae
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">But then the cve should be marked as resolved?</div><div =
dir=3D"auto"><br></div><div dir=3D"auto">Alex</div><div dir=3D"auto"><br><d=
iv class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon 20. F=
eb 2023 at 17.34, Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com">ro=
ss.burton@arm.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:=
solid;padding-left:1ex;border-left-color:rgb(204,204,204)">Ignore this, &qu=
ot;glibc: stable 2.37 branch updates=E2=80=9D incorporates it.<br>
<br>
Ross<br>
<br>
&gt; On 20 Feb 2023, at 16:28, Ross Burton via <a href=3D"http://lists.open=
embedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</=
a> &lt;ross.burton=3D<a href=3D"mailto:arm.com@lists.openembedded.org" targ=
et=3D"_blank">arm.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt; <br>
&gt; Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" =
target=3D"_blank">ross.burton@arm.com</a>&gt;<br>
&gt; ---<br>
&gt; ...r-grouping-in-printf-width-bug-30068.patch | 84 +++++++++++++++++++=
<br>
&gt; meta/recipes-core/glibc/<a href=3D"http://glibc_2.37.bb" rel=3D"norefe=
rrer" target=3D"_blank">glibc_2.37.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
|=C2=A0 1 +<br>
&gt; 2 files changed, 85 insertions(+)<br>
&gt; create mode 100644 meta/recipes-core/glibc/glibc/0001-Account-for-grou=
ping-in-printf-width-bug-30068.patch<br>
&gt; <br>
&gt; diff --git a/meta/recipes-core/glibc/glibc/0001-Account-for-grouping-i=
n-printf-width-bug-30068.patch b/meta/recipes-core/glibc/glibc/0001-Account=
-for-grouping-in-printf-width-bug-30068.patch<br>
&gt; new file mode 100644<br>
&gt; index 00000000000..9efd39a9eb4<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-core/glibc/glibc/0001-Account-for-grouping-in-print=
f-width-bug-30068.patch<br>
&gt; @@ -0,0 +1,84 @@<br>
&gt; +CVE: CVE-2023-25139<br>
&gt; +Upstream-Status: Backport<br>
&gt; +Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com"=
 target=3D"_blank">ross.burton@arm.com</a>&gt;<br>
&gt; +<br>
&gt; +From 07b9521fc6369d000216b96562ff7c0ed32a16c4 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Carlos O&#39;Donell &lt;<a href=3D"mailto:carlos@redhat.com" ta=
rget=3D"_blank">carlos@redhat.com</a>&gt;<br>
&gt; +Date: Thu, 19 Jan 2023 12:50:20 +0100<br>
&gt; +Subject: [PATCH] Account for grouping in printf width (bug 30068)<br>
&gt; +<br>
&gt; +This is a partial fix for mishandling of grouping when formatting<br>
&gt; +integers.=C2=A0 It properly computes the width in the presence of gro=
uping<br>
&gt; +characters when the width is larger than the number of significant<br=
>
&gt; +digits. The precision related issue is documented in bug 23432.<br>
&gt; +<br>
&gt; +Co-authored-by: Andreas Schwab &lt;<a href=3D"mailto:schwab@suse.de" =
target=3D"_blank">schwab@suse.de</a>&gt;<br>
&gt; +(cherry picked from commit c980549cc6a1c03c23cc2fe3e7b0fe626a0364b0)<=
br>
&gt; +---<br>
&gt; + stdio-common/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 2 ++<br>
&gt; + stdio-common/tst-grouping3.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 54 +++++++=
++++++++++++++++++++++<br>
&gt; + stdio-common/vfprintf-process-arg.c | 22 +++++++++---<br>
&gt; + 3 files changed, 73 insertions(+), 5 deletions(-)<br>
&gt; + create mode 100644 stdio-common/tst-grouping3.c<br>
&gt; +<br>
&gt; +diff --git a/stdio-common/vfprintf-process-arg.c b/stdio-common/vfpri=
ntf-process-arg.c<br>
&gt; +index 24c9125f9f..8c0fcbcf78 100644<br>
&gt; +--- a/stdio-common/vfprintf-process-arg.c<br>
&gt; ++++ b/stdio-common/vfprintf-process-arg.c<br>
&gt; +@@ -186,11 +186,17 @@ LABEL (unsigned_number):=C2=A0 =C2=A0 =C2=A0 /*=
 Unsigned number of base BASE.=C2=A0 */<br>
&gt; +=C2=A0 =C2=A0bool octal_marker =3D (prec &lt;=3D number_length &amp;&=
amp; number.word !=3D 0<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 &amp;&amp; alt &amp;&amp; base =3D=3D 8);<br>
&gt; + <br>
&gt; +-=C2=A0 prec =3D MAX (0, prec - (workend - string));<br>
&gt; ++=C2=A0 /* At this point prec_inc is the additional bytes required fo=
r the<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0specificed precision.=C2=A0 It is 0 if the preci=
sion would not have<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0required additional bytes i.e. the number of inp=
ut digits is more<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0than the precision.=C2=A0 It is greater than zer=
o if the precision is<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0more than the number of digits without grouping =
(precision only<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0considers digits).=C2=A0 */<br>
&gt; ++=C2=A0 unsigned int prec_inc =3D MAX (0, prec - (workend - string));=
<br>
&gt; + <br>
&gt; +=C2=A0 =C2=A0if (!left)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 width -=3D number_length + prec;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 width -=3D number_length + prec_inc;<br>
&gt; + <br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (number.word !=3D 0 &amp;&amp; alt &amp=
;&amp; (base =3D=3D 16 || base =3D=3D 2))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Account for 0X, 0x, 0B or 0b hex=
 or binary marker.=C2=A0 */<br>
&gt; +@@ -221,7 +227,7 @@ LABEL (unsigned_number):=C2=A0 =C2=A0 =C2=A0 /* U=
nsigned number of base BASE.=C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Xprintf_buffer_putc (buf, sp=
ec);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; + <br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 width +=3D prec;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 width +=3D prec_inc;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0Xprintf_buffer_pad (buf, L_(&#39;0&#39;), =
width);<br>
&gt; + <br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (octal_marker)<br>
&gt; +@@ -237,6 +243,8 @@ LABEL (unsigned_number):=C2=A0 =C2=A0 =C2=A0 /* U=
nsigned number of base BASE.=C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 /* Perform left justification adjustments.=C2=
=A0 */<br>
&gt; ++<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (is_negative)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Xprintf_buffer_putc (buf, L_=
(&#39;-&#39;));<br>
&gt; +@@ -263,9 +271,13 @@ LABEL (unsigned_number):=C2=A0 =C2=A0 =C2=A0 /* =
Unsigned number of base BASE.=C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (octal_marker)<br>
&gt; + --width;<br>
&gt; + <br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 width -=3D workend - string + prec;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 /* Adjust the width by subtracting the number o=
f bytes<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0required to represent the number w=
ith grouping characters<br>
&gt; ++ (NUMBER_LENGTH) and any additional bytes required for<br>
&gt; ++ precision.=C2=A0 */<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 width -=3D number_length + prec_inc;<br>
&gt; + <br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 Xprintf_buffer_pad (buf, L_(&#39;0&#39;), prec)=
;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 Xprintf_buffer_pad (buf, L_(&#39;0&#39;), prec_=
inc);<br>
&gt; + <br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (octal_marker)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Xprintf_buffer_putc (buf, L_(&#39;0=
&#39;));<br>
&gt; +-- <br>
&gt; +2.34.1<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-core/glibc/<a href=3D"http://glibc_2.37.bb" =
rel=3D"noreferrer" target=3D"_blank">glibc_2.37.bb</a> b/meta/recipes-core/=
glibc/<a href=3D"http://glibc_2.37.bb" rel=3D"noreferrer" target=3D"_blank"=
>glibc_2.37.bb</a><br>
&gt; index f299a3004a4..e5689e536ad 100644<br>
&gt; --- a/meta/recipes-core/glibc/<a href=3D"http://glibc_2.37.bb" rel=3D"=
noreferrer" target=3D"_blank">glibc_2.37.bb</a><br>
&gt; +++ b/meta/recipes-core/glibc/<a href=3D"http://glibc_2.37.bb" rel=3D"=
noreferrer" target=3D"_blank">glibc_2.37.bb</a><br>
&gt; @@ -51,6 +51,7 @@ SRC_URI =3D=C2=A0 &quot;${GLIBC_GIT_URI};branch=3D${=
SRCBRANCH};name=3Dglibc \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0020-tzselect.ksh-Use-=
bin-sh-default-shell-interpreter.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0021-fix-create-thread=
-failed-in-unprivileged-process-BZ-.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0022-Avoid-hardcoded-b=
uild-time-paths-in-the-output-binar.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Account-for-grou=
ping-in-printf-width-bug-30068.patch \<br>
&gt; &quot;<br>
&gt; S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; B =3D &quot;${WORKDIR}/build-${TARGET_SYS}&quot;<br>
&gt; -- <br>
&gt; 2.34.1<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#177441): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/177441" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/177441</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/97089377/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/97089377/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--00000000000037033705f52440ae--

