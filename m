Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
 by mx.groups.io with SMTP id smtpd.web09.10332.1627569453205208598
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jul 2021 07:37:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uHbS/JUz;
 spf=pass (domain: gmail.com, ip: 209.85.217.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f50.google.com with SMTP id o8so3644145vss.4
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Jul 2021 07:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JjlehYAb4quSr+sY7Oor7nw6+AiHw4axNmGj06nil5o=;
        b=uHbS/JUzPJKfuPFVKuB+QnALQEpsel5EModweOd8+EKbHtB9upmD3g/8U+5KDGT+7l
         puoj6mJSgO0E2kCBYtXgFKbCFP+CcG5DtU87Nj3RaZzJ60KSiCOCvPsdv1b8gJH3Be1G
         20cGkgWLKn2L2BgK4SOieVSD7Xfa8zeBQWXlZ63pzfm1/gIvy4zVL2Ng8B3nS1Y0ZMpF
         kChvnGq4gdQDV8TIj4VieIbHq+IDNOi/mTWSv8h0Uk92/okRTsxuLNOdjJIgKcmer3eF
         ctlEFbc3xADA9oEbUjLj6WSXwoKVw+l9vf3GurUabHTrxGgBhmIisWVgBOXY6+M8IptM
         NaKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JjlehYAb4quSr+sY7Oor7nw6+AiHw4axNmGj06nil5o=;
        b=CZU/vQLLRDBuoF3PtvG0gatfXTYmgvl3wEVfmknC5Plv4VygtpUxap/nvg4kY0CCqR
         UjJYgoeEffWGAH6fSuXDicUup9VxJcsukX7ugOwlIU5P7hOh+J4XfH435U49gFN1LG7/
         tUaCdz0OkHAE0QVqb/s0/bxWqQ9x1GY/kBoFvu6eluo5gACQpgy4sqW5RlPYh/LXnzus
         j5XIa9S+L8+9rjm1P9HehWJbr+66+g6KZqYVk3TNHCoi3PxFYXQ/4BzLlMSbF6Q5kHOk
         cwmhF4I9INXOfSRXP8WjnBuAwdO2DHHxED+1/1udcFP+6pJBDNZFTUVgg/vsHdc1LhXT
         +CyA==
X-Gm-Message-State: AOAM530Lmo7tdZGwdx+bcSkkvFuvdTXd5gWmLUHe8D5SXJIGYCC2W3OM
	dKgCxRdIUpz2yFUGfDAsRQjzFjCYUZfyhZ0rCOY=
X-Google-Smtp-Source: ABdhPJz1PPxq2rStpRMhEvq2bz+UNzbwTxgmsXe2KEKfZ7gROr4atn/BTsrLc8Z7uFpEkjLwtkBDGKo88WN1NtEnULQ=
X-Received: by 2002:a67:64c2:: with SMTP id y185mr4451617vsb.54.1627569452343;
 Thu, 29 Jul 2021 07:37:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210727201325.2215487-1-raj.khem@gmail.com> <AM7PR83MB0436960F9D4BFDD1F504F0DFF1EB9@AM7PR83MB0436.EURPRD83.prod.outlook.com>
 <423aed88f51b09d6342089f4b02dc9d62bbdb413.camel@gmail.com> <19d2ad76f9ea70218116aa82205cc56a3331520a.camel@gmail.com>
In-Reply-To: <19d2ad76f9ea70218116aa82205cc56a3331520a.camel@gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Thu, 29 Jul 2021 16:37:20 +0200
Message-ID: <CANNYZj-D_MzPHDYjFzBD79z4Mjs9Wvj0SELGdt_YDgUrjWacKQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] systemd: Fix build on musl
To: Luca Bocassi <luca.boccassi@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000000de32405c8440b13"

--0000000000000de32405c8440b13
Content-Type: text/plain; charset="UTF-8"

I have to wonder again if it would be better to maintain the musl spin of
systemd in a separate repo and provided via separate recipe?

Alex

On Thu, 29 Jul 2021 at 15:54, Luca Bocassi <luca.boccassi@gmail.com> wrote:

> On Thu, 2021-07-29 at 14:49 +0100, Luca Boccassi wrote:
> > On Thu, 2021-07-29 at 12:59 +0000, Khem Raj wrote:
> > > Latest upgrade to 249 broke a working build on musl, this is
> incremental
> > > fix to exisiting patches adapted to 249 release
> > >
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > Cc: Luca Boccassi <luca.boccassi@microsoft.com>
> > > ---
> > >  ...002-don-t-use-glibc-specific-qsort_r.patch |  24 +--
> > >  ...missing.h-check-for-missing-strndupa.patch | 173 +++++++++---------
> > >  .../0006-Include-netinet-if_ether.h.patch     | 147 ++++++++-------
> > >  ...OB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch |  20 +-
> > >  ...T_SYMLINK_NOFOLLOW-flag-to-faccessat.patch |  14 +-
> > >  ...-not-disable-buffer-in-writing-files.patch | 143 ++++++---------
> > >  .../systemd/0026-Handle-missing-gshadow.patch |  18 +-
> > >  7 files changed, 247 insertions(+), 292 deletions(-)
> > >
> >
> > Having a look at the patches, a few comments:
> >
> > - 0001-test-parse-argument-Include-signal.h.patch was merged upstream,
> > but never removed, I think because it was refactored so it applies
> > cleanly and doesn't raise errors?
> >
> > - 0005-src-basic-missing.h-check-for-missing-strndupa.patch this is
> > massive and will keep growing and breaking the build, wouldn't it be
> > better to just implement strndupa in musl? Even out-of-tree it sounds
> > like it would be easier to maintain than this
> >
> > - 0006-Include-netinet-if_ether.h.patch sounds like it should be doable
> > in a way that is compatible with both glibc and musl, and thus could be
> > upstreamed?
> >
> > - 0010-Use-uintmax_t-for-handling-rlim_t.patch can be upstreamed but
> > needs to be reworked slightly as explained in
> > https://github.com/systemd/systemd/pull/7199#issuecomment-358268647
> > which seems worth doing to me
> >
> > - 0012-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch I find
> > quite worrying, as it fundamentally changes access patterns, some of
> > which are done for security reasons. At best, this will cause
> > completely different runtime behaviours for the same filesystem
> > depending on the libc implementation, which doesn't sound great?
> >
> > - 0016-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch sounds
> > like a genuine bug, have you tried upstreaming it?
> >
> > - 0019-Handle-missing-LOCK_EX.patch I see no problem upstreaming this
> >
> > - 0028-missing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch should
> > also be fine to upstream I think, in src/basic/missing_syscall_def.h
>
> Also isn't 0001-binfmt-Don-t-install-dependency-links-at-install-
> tim.patch doable with two drop-ins and a post-install adjustment in the
> recipe, rather than with a patch?
>
> This also sounds like a good candidate for a drop-in, doesn't seem
> generally applicable to me:
>
>
> https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=f65757ad1791a46cc210141c84ccc51552171e98
>
> --
> Kind regards,
> Luca Boccassi
>
> 
>
>

--0000000000000de32405c8440b13
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I have to wonder again if it would be better to maint=
ain the musl spin of systemd in a separate repo and provided via separate r=
ecipe?</div><div><br></div><div>Alex<br></div></div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 29 Jul 2021 at 15:54,=
 Luca Bocassi &lt;<a href=3D"mailto:luca.boccassi@gmail.com">luca.boccassi@=
gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">On Thu, 2021-07-29 at 14:49 +0100, Luca Boccassi wrote:<br>
&gt; On Thu, 2021-07-29 at 12:59 +0000, Khem Raj wrote:<br>
&gt; &gt; Latest upgrade to 249 broke a working build on musl, this is inc=
remental<br>
&gt; &gt; fix to exisiting patches adapted to 249 release<br>
&gt; &gt; <br>
&gt; &gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com=
" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; &gt; Cc: Luca Boccassi &lt;<a href=3D"mailto:luca.boccassi@microsoft.=
com" target=3D"_blank">luca.boccassi@microsoft.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 ...002-don-t-use-glibc-specific-qsort_r.patch |=C2=A0 24 +=
--<br>
&gt; &gt;=C2=A0 ...missing.h-check-for-missing-strndupa.patch | 173 ++++++=
+++---------<br>
&gt; &gt;=C2=A0 .../0006-Include-netinet-if_ether.h.patch=C2=A0 =C2=A0 =C2=
=
=A0| 147 ++++++++-------<br>
&gt; &gt;=C2=A0 ...OB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch |=C2=A0 20 +=
-<br>
&gt; &gt;=C2=A0 ...T_SYMLINK_NOFOLLOW-flag-to-faccessat.patch |=C2=A0 14 +=
-<br>
&gt; &gt;=C2=A0 ...-not-disable-buffer-in-writing-files.patch | 143 ++++++=
---------<br>
&gt; &gt;=C2=A0 .../systemd/0026-Handle-missing-gshadow.patch |=C2=A0 18 +=
-<br>
&gt; &gt;=C2=A0 7 files changed, 247 insertions(+), 292 deletions(-)<br>
&gt; &gt; <br>
&gt; <br>
&gt; Having a look at the patches, a few comments:<br>
&gt; <br>
&gt; - 0001-test-parse-argument-Include-signal.h.patch was merged upstream=
,<br>
&gt; but never removed, I think because it was refactored so it applies<br=
>
&gt; cleanly and doesn&#39;t raise errors?<br>
&gt; <br>
&gt; - 0005-src-basic-missing.h-check-for-missing-strndupa.patch this is<b=
r>
&gt; massive and will keep growing and breaking the build, wouldn&#39;t it=
 be<br>
&gt; better to just implement strndupa in musl? Even out-of-tree it sounds=
<br>
&gt; like it would be easier to maintain than this<br>
&gt; <br>
&gt; - 0006-Include-netinet-if_ether.h.patch sounds like it should be doab=
le<br>
&gt; in a way that is compatible with both glibc and musl, and thus could =
be<br>
&gt; upstreamed?<br>
&gt; <br>
&gt; - 0010-Use-uintmax_t-for-handling-rlim_t.patch can be upstreamed but<=
br>
&gt; needs to be reworked slightly as explained in <br>
&gt; <a href=3D"https://github.com/systemd/systemd/pull/7199#issuecomment-=
358268647" rel=3D"noreferrer" target=3D"_blank">https://github.com/systemd/=
systemd/pull/7199#issuecomment-358268647</a><br>
&gt; which seems worth doing to me<br>
&gt; <br>
&gt; - 0012-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch I find<=
br>
&gt; quite worrying, as it fundamentally changes access patterns, some of<=
br>
&gt; which are done for security reasons. At best, this will cause<br>
&gt; completely different runtime behaviours for the same filesystem<br>
&gt; depending on the libc implementation, which doesn&#39;t sound great?<=
br>
&gt; <br>
&gt; - 0016-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch soun=
ds<br>
&gt; like a genuine bug, have you tried upstreaming it?<br>
&gt; <br>
&gt; - 0019-Handle-missing-LOCK_EX.patch I see no problem upstreaming this=
<br>
&gt; <br>
&gt; - 0028-missing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch shoul=
d<br>
&gt; also be fine to upstream I think, in src/basic/missing_syscall_def.h<=
br>
<br>
Also isn&#39;t 0001-binfmt-Don-t-install-dependency-links-at-install-<br>
tim.patch doable with two drop-ins and a post-install adjustment in the<br=
>
recipe, rather than with a patch?<br>
<br>
This also sounds like a good candidate for a drop-in, doesn&#39;t seem<br>
generally applicable to me:<br>
<br>
<a href=3D"https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=3Df6=
5757ad1791a46cc210141c84ccc51552171e98" rel=3D"noreferrer" target=3D"_blank=
">https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=3Df65757ad1791=
a46cc210141c84ccc51552171e98</a><br>
<br>
-- <br>
Kind regards,<br>
Luca Boccassi<br>
<br>
<br>
<br>
</blockquote></div>

--0000000000000de32405c8440b13--
