Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6551FC282EC
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 09:13:39 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web11.4479.1741684410039196834
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Mar 2025 02:13:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CTtk8loz;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: rybczynska@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2ff80290e44so8266378a91.0
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Mar 2025 02:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741684409; x=1742289209; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bi/w18ON9urbLxO+BJPUimPdY3TCfktm6v5lYlXVsv0=;
        b=CTtk8loznNPiaGYhP/AoMwNePTV02JiydZtarzCH/cT2mkjWtoKqg4aJJ1fJstdttW
         gFiZ40CakXTiOWvhmHo2SKvL/zmDxFq4a2X/TL4rI/lfdNFIVqy4+x5ND2ejlpd1QDnz
         fM/Q/DaQ+RkceXP+Xc9RgPzkJS7jqIEFvyTuA4Yc52i7wpWKIjhnuXs38QfZxsMOSJPT
         OF7uaFREHzJkpDFIlN8GXepk7JYkrsuqIKZ2MzD33aIPl4Xil47qelC5bPqZMhzUphUH
         wHwVPHsEsuhZbnuy2A1jP3X/nPHcjIHUe6w9UfFFfm8al7qhR62o2Dg5KvqoxhgxIA6V
         7pAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741684409; x=1742289209;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bi/w18ON9urbLxO+BJPUimPdY3TCfktm6v5lYlXVsv0=;
        b=PP2UCKfPtcwcMVqyvDLmKYGC+h61ymGsGirJxXAQRmEJ2J+ALrjTbp08ziPAFUe3XG
         CIhBtjURTFoABIyaeDttcYhp+IywyUAur78C4KYdx0lnB02pmE5rSjFrvWJweCxPCK/v
         9YLwhhLPIJTC9S21BmOzW8wm7AqZeDuiIn0W8iK2LVpQh2OdQIGfnnABe0BR6oH9aJMN
         uNg55OBMQh9IY/1diUy4Vv9pensxzws7PhwAWRfVlLMs7C7sIDWbQy1qcIcJ9gqH5omI
         dY0Y69De1ZpneqrVdnGBnBDYknQwHggxF/utVa7ekBcxjFfxKoJXQ7tYpizKmG+rXYQ9
         GlWA==
X-Forwarded-Encrypted: i=1; AJvYcCWoZOIfhlNavDnjYuavGKITzvGEU1KbTGD/9YGZdGb195mGTWua+/sesjyOUYgEFgIv05E3j8IOSSImLfWMHG3qPA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxc6wUdKqXGVeM7AQ3Bw4KvTWfHHDZJAukwF1tuhAx8NcO+BbNo
	/B+mAjLbYAajz3sjIRMcxw6PogppOK+jiMQ1DsGugWtx/s1u0jwAPqyXb8bzBXadwqBsRaf573h
	mvRyXvsFwliKujtJWWZeeFmOo4C8=
X-Gm-Gg: ASbGncsNJPAIEa9n0aPxkJ3UCa1+B6tdJ4phWmOey1Cq07o0HJPvNC//BREezvNWLWy
	AYfyt3w7X2cqNFqY3QEHrHnrEgqxvJQSxzbCzALvTWKN5BSEFa85cGqPL7APorvnEtpsGwG4tGT
	UiqBjBa4PhUM98F2qDgeFIMpr7QW+D
X-Google-Smtp-Source: AGHT+IFmkx/mZVyz0Ph3M5NrVDIcGRkQ58MMAWdDBWd/tw+I1FHKu4waZHUZYnYy6vXGhzvSGaOsg0ZjIjJ8WLmVWZA=
X-Received: by 2002:a17:90b:5281:b0:2ff:6f8a:3a13 with SMTP id
 98e67ed59e1d1-2ff7cf167ecmr26732199a91.25.1741684409217; Tue, 11 Mar 2025
 02:13:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250311045911.3023271-1-hongxu.jia@windriver.com>
 <CAApg2=Sh+nbwEdX0B19GqFwzfYP=6LHqPRdrvmhvxfnbSyE35g@mail.gmail.com> <CANNYZj_uBe3wZ8gOqU1QRkbacBeF68TiJ1nrE0vFcCkx_namEA@mail.gmail.com>
In-Reply-To: <CANNYZj_uBe3wZ8gOqU1QRkbacBeF68TiJ1nrE0vFcCkx_namEA@mail.gmail.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Tue, 11 Mar 2025 10:13:16 +0100
X-Gm-Features: AQ5f1JpEsQCU-kZ0MVDFX25OUZu9BwkptN6dpgKU1pfk_qTqm_EsFkZlV48v5q8
Message-ID: <CAApg2=QFSNxibC2A9rGKVi1YYdsX3=T9So3+v1=9bqgEWZegmg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] gnupg: 2.5.4 -> 2.5.5
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: hongxu.jia@eng.windriver.com, openembedded-core@lists.openembedded.org, 
	Steve Sakoman <steve@sakoman.com>
Content-Type: multipart/alternative; boundary="00000000000085bba506300d804c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Mar 2025 09:13:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212548

--00000000000085bba506300d804c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2.4 already has patches that smell CVEs.

I forgot they use that versioning scheme... In this case, from a security
perspective, it would be reasonable to move master and styhead back to 2.4.
I would even hesitate with kirkstone. Gnupg CVEs can cause much harm and
there will be security fixes. Let's make the update path easier.

My 0.02

Marta

On Tue, Mar 11, 2025 at 9:53=E2=80=AFAM Alexander Kanavin <alex.kanavin@gma=
il.com>
wrote:

> We erroneously updated gnupg from stable (2.4.x) to development series
> (2.5.x) in master and styhead, as it actually follows the odd-even
> version scheme. So for styhead it's not that straightforward.
>
> Scarthgap is on 2.4.x (which is fine and supported, but needs to be
> updated to latest 2.4.x), kirkstone is on 2.3.x, sadly, which has the
> same issue as styhead.
>
> Alex
>
> On Tue, 11 Mar 2025 at 06:32, Marta Rybczynska via
> lists.openembedded.org <rybczynska=3Dgmail.com@lists.openembedded.org>
> wrote:
> >
> > Thanks for the update patch. First two items from the changelog looks
> like CVE material (haven't been released as CVEs as of today).
> > I vote for a backport to stable branches (with Steve in copy).
> >
> > Kind regards,
> > Marta
> >
> > On Tue, Mar 11, 2025 at 5:59=E2=80=AFAM hongxu via lists.openembedded.o=
rg
> <hongxu.jia=3Deng.windriver.com@lists.openembedded.org> wrote:
> >>
> >> Noteworthy changes in version 2.5.5 (2025-03-07)
> >> ------------------------------------------------
> >>
> >>   * gpg: Fix a verification DoS due to a malicious subkey in the
> >>     keyring.  [T7527]
> >>
> >>   * dirmngr: Fix possible hangs due to blocking connection requests.
> >>     [T6606, T7434]
> >>
> >>   * w32: On socket nonce mismatch close the socket.  [T7434]
> >>
> >>   * w32: Print more detailed diagnostics for IPC errors.
> >>
> >>   * GPGME is not any more distributed with the Windows installer.
> >>     Please install gpg4win to get gpgme version.
> >>
> >>   See-also: gnupg-announce/2025q1/000491.html
> >>   Release-info: https://dev.gnupg.org/T7530
> >>
> >> https://dev.gnupg.org/source/gnupg/browse/master/NEWS
> >>
> >> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> >> ---
> >>  meta/recipes-support/gnupg/{gnupg_2.5.4.bb =3D> gnupg_2.5.5.bb} | 2 +=
-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>  rename meta/recipes-support/gnupg/{gnupg_2.5.4.bb =3D> gnupg_2.5.5.bb=
}
> (97%)
> >>
> >> diff --git a/meta/recipes-support/gnupg/gnupg_2.5.4.bb
> b/meta/recipes-support/gnupg/gnupg_2.5.5.bb
> >> similarity index 97%
> >> rename from meta/recipes-support/gnupg/gnupg_2.5.4.bb
> >> rename to meta/recipes-support/gnupg/gnupg_2.5.5.bb
> >> index e6a7e3fb407..a9ab486f6bf 100644
> >> --- a/meta/recipes-support/gnupg/gnupg_2.5.4.bb
> >> +++ b/meta/recipes-support/gnupg/gnupg_2.5.5.bb
> >> @@ -23,7 +23,7 @@ SRC_URI:append:class-native =3D "
> file://0001-configure.ac-use-a-custom-value-for-
> >>                                  file://relocate.patch"
> >>  SRC_URI:append:class-nativesdk =3D " file://relocate.patch"
> >>
> >> -SRC_URI[sha256sum] =3D
> "f8cb2ac6c9f17f81e3541c62158764910fad5c3a0765e00b398c41a32bc4e0ea"
> >> +SRC_URI[sha256sum] =3D
> "7afa71d72ff9aaff75a6810b87b486bc492fd752e4f77b07c41759ce4ef36b31"
> >>
> >>  EXTRA_OECONF =3D "--disable-ldap \
> >>                 --disable-ccid-driver \
> >> --
> >> 2.34.1
> >>
> >>
> >>
> >>
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#212542):
> https://lists.openembedded.org/g/openembedded-core/message/212542
> > Mute This Topic: https://lists.openembedded.org/mt/111634573/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--00000000000085bba506300d804c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>2.4 already has patches that smell CVEs.</div><div><b=
r></div><div>I forgot they use that versioning scheme... In this case, from=
 a security perspective, it would be reasonable to move master and styhead =
back to 2.4. I would even hesitate with kirkstone. Gnupg CVEs can cause muc=
h harm and there will be security fixes. Let&#39;s make the update path eas=
ier.<br></div><div><br></div><div>My 0.02</div><div><br></div><div>Marta<br=
></div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr=
" class=3D"gmail_attr">On Tue, Mar 11, 2025 at 9:53=E2=80=AFAM Alexander Ka=
navin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">W=
e erroneously updated gnupg from stable (2.4.x) to development series<br>
(2.5.x) in master and styhead, as it actually follows the odd-even<br>
version scheme. So for styhead it&#39;s not that straightforward.<br>
<br>
Scarthgap is on 2.4.x (which is fine and supported, but needs to be<br>
updated to latest 2.4.x), kirkstone is on 2.3.x, sadly, which has the<br>
same issue as styhead.<br>
<br>
Alex<br>
<br>
On Tue, 11 Mar 2025 at 06:32, Marta Rybczynska via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a> &lt;rybczynska=3D<a href=3D"mailto:gmail.com=
@lists.openembedded.org" target=3D"_blank">gmail.com@lists.openembedded.org=
</a>&gt;<br>
wrote:<br>
&gt;<br>
&gt; Thanks for the update patch. First two items from the changelog looks =
like CVE material (haven&#39;t been released as CVEs as of today).<br>
&gt; I vote for a backport to stable branches (with Steve in copy).<br>
&gt;<br>
&gt; Kind regards,<br>
&gt; Marta<br>
&gt;<br>
&gt; On Tue, Mar 11, 2025 at 5:59=E2=80=AFAM hongxu via <a href=3D"http://l=
ists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembed=
ded.org</a> &lt;hongxu.jia=3D<a href=3D"mailto:eng.windriver.com@lists.open=
embedded.org" target=3D"_blank">eng.windriver.com@lists.openembedded.org</a=
>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; Noteworthy changes in version 2.5.5 (2025-03-07)<br>
&gt;&gt; ------------------------------------------------<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0* gpg: Fix a verification DoS due to a malicious subke=
y in the<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0keyring.=C2=A0 [T7527]<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0* dirmngr: Fix possible hangs due to blocking connecti=
on requests.<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0[T6606, T7434]<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0* w32: On socket nonce mismatch close the socket.=C2=
=A0 [T7434]<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0* w32: Print more detailed diagnostics for IPC errors.=
<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0* GPGME is not any more distributed with the Windows i=
nstaller.<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0Please install gpg4win to get gpgme version.<br=
>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0See-also: gnupg-announce/2025q1/000491.html<br>
&gt;&gt;=C2=A0 =C2=A0Release-info: <a href=3D"https://dev.gnupg.org/T7530" =
rel=3D"noreferrer" target=3D"_blank">https://dev.gnupg.org/T7530</a><br>
&gt;&gt;<br>
&gt;&gt; <a href=3D"https://dev.gnupg.org/source/gnupg/browse/master/NEWS" =
rel=3D"noreferrer" target=3D"_blank">https://dev.gnupg.org/source/gnupg/bro=
wse/master/NEWS</a><br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriv=
er.com" target=3D"_blank">hongxu.jia@windriver.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 meta/recipes-support/gnupg/{<a href=3D"http://gnupg_2.5.4.bb=
" rel=3D"noreferrer" target=3D"_blank">gnupg_2.5.4.bb</a> =3D&gt; <a href=
=3D"http://gnupg_2.5.5.bb" rel=3D"noreferrer" target=3D"_blank">gnupg_2.5.5=
.bb</a>} | 2 +-<br>
&gt;&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;&gt;=C2=A0 rename meta/recipes-support/gnupg/{<a href=3D"http://gnupg_2=
.5.4.bb" rel=3D"noreferrer" target=3D"_blank">gnupg_2.5.4.bb</a> =3D&gt; <a=
 href=3D"http://gnupg_2.5.5.bb" rel=3D"noreferrer" target=3D"_blank">gnupg_=
2.5.5.bb</a>} (97%)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/recipes-support/gnupg/<a href=3D"http://gnupg_2.=
5.4.bb" rel=3D"noreferrer" target=3D"_blank">gnupg_2.5.4.bb</a> b/meta/reci=
pes-support/gnupg/<a href=3D"http://gnupg_2.5.5.bb" rel=3D"noreferrer" targ=
et=3D"_blank">gnupg_2.5.5.bb</a><br>
&gt;&gt; similarity index 97%<br>
&gt;&gt; rename from meta/recipes-support/gnupg/<a href=3D"http://gnupg_2.5=
.4.bb" rel=3D"noreferrer" target=3D"_blank">gnupg_2.5.4.bb</a><br>
&gt;&gt; rename to meta/recipes-support/gnupg/<a href=3D"http://gnupg_2.5.5=
.bb" rel=3D"noreferrer" target=3D"_blank">gnupg_2.5.5.bb</a><br>
&gt;&gt; index e6a7e3fb407..a9ab486f6bf 100644<br>
&gt;&gt; --- a/meta/recipes-support/gnupg/<a href=3D"http://gnupg_2.5.4.bb"=
 rel=3D"noreferrer" target=3D"_blank">gnupg_2.5.4.bb</a><br>
&gt;&gt; +++ b/meta/recipes-support/gnupg/<a href=3D"http://gnupg_2.5.5.bb"=
 rel=3D"noreferrer" target=3D"_blank">gnupg_2.5.5.bb</a><br>
&gt;&gt; @@ -23,7 +23,7 @@ SRC_URI:append:class-native =3D &quot; file://00=
01-configure.ac-use-a-custom-value-for-<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://relocate.patch&=
quot;<br>
&gt;&gt;=C2=A0 SRC_URI:append:class-nativesdk =3D &quot; file://relocate.pa=
tch&quot;<br>
&gt;&gt;<br>
&gt;&gt; -SRC_URI[sha256sum] =3D &quot;f8cb2ac6c9f17f81e3541c62158764910fad=
5c3a0765e00b398c41a32bc4e0ea&quot;<br>
&gt;&gt; +SRC_URI[sha256sum] =3D &quot;7afa71d72ff9aaff75a6810b87b486bc492f=
d752e4f77b07c41759ce4ef36b31&quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 EXTRA_OECONF =3D &quot;--disable-ldap \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--dis=
able-ccid-driver \<br>
&gt;&gt; --<br>
&gt;&gt; 2.34.1<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#212542): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/212542" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/212542</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/11163457=
3/1686489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/111634573/1686489</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.co=
m" target=3D"_blank">alex.kanavin@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div></div>

--00000000000085bba506300d804c--

