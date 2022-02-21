Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96465C433F5
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 15:00:09 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web11.11724.1645455608607202805
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 07:00:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YavzkwxV;
 spf=pass (domain: gmail.com, ip: 209.85.208.173,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id bn33so15006406ljb.6
        for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 07:00:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5dRP9OPS5rXQMSH+FKaKfo0TBVkkx9AxFmUwwg5Y20Q=;
        b=YavzkwxVfilbKiOaP94H0+Fh4oVkqz/6Qa2pCHIi5HpJxjxdQHONIZdoshN62KxpqM
         n6Dz2/TCKTVIpyNY4dJWQti7zLzpJn9/VoBh2TbKbgMe+a3Dz+QNlJwKRs2BAIZ3XhHA
         YBVZ5ulPgaDixvLMOkXLN7S2gb09bBd75w5BC1da85A8OxOUO0+h2i1Vw8TfsF0hiGvG
         FNzA5WjPCfsIgg4PDzfLn2NhzH2fHGBiF+6B6bS00ahWhDMFhe/yyex/MkIo1kaVZLOy
         9RITh8r7hU4e8ARs5ltj8pDwriJVuB3q/G2RfpPebtFCj9sAYysXsxEeFYV42bDRv00I
         JNLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5dRP9OPS5rXQMSH+FKaKfo0TBVkkx9AxFmUwwg5Y20Q=;
        b=0MTOtIbNyXkKRgLUc2UTvSKe+VGYirRjJLZq8m1fxvmHwuCJZ9CG6PE9YVbRdbhqwD
         scfM6Y7sFa4siEHdItkNOsQvQ6q8wTQeRnC7uLrZAr/BPSF3NEc4D7R39ENkou64Phe0
         eLorQf8ON+R9AXM7ZYR/BIKj6FQ6fWHio3fSSFFyvpJJjYVa+RBrc2hv1vjI/A0/KjgB
         9GLucxAHA0/rvOdZAYOoAaMaJPuj0/z20LP6jGFs+4AX52q1/01u7swHo907capZeH/+
         JkUkQQfRxZ31Q3/Bm+grp+ujIa6hVzuWSlDJkFpeStWStrumsT1iuU8yFNFBRk+0VjEM
         fasA==
X-Gm-Message-State: AOAM531NMlpS/icxZ4znTuRW3KUrnivga5I/vrZThizHXQ9BEC53kooo
	YRH0vyNwQAtmygw7avGuBFI+5q1VQsTHaOWpEfhMl82zaHg=
X-Google-Smtp-Source: 
 ABdhPJyOP3jbicCCbmTWeHCY6TeS33NLk/Sd1krF3G4uMoXvToJMrriMV1Eo1EvzfO6mQBq1DDQGDi3LgqGuwua4Z6w=
X-Received: by 2002:a2e:b90e:0:b0:239:3332:c83c with SMTP id
 b14-20020a2eb90e000000b002393332c83cmr14575886ljb.426.1645455606505; Mon, 21
 Feb 2022 07:00:06 -0800 (PST)
MIME-Version: 1.0
References: <20220221085118.2267900-1-quaresma.jose@gmail.com>
 <CAAnfSTuxOD2LVkod3wTk7K=w_Q_6KjbYoa_-FqD1WHy0hqy0jA@mail.gmail.com>
In-Reply-To: 
 <CAAnfSTuxOD2LVkod3wTk7K=w_Q_6KjbYoa_-FqD1WHy0hqy0jA@mail.gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Mon, 21 Feb 2022 14:59:56 +0000
Message-ID: 
 <CANPvuRm1t9fn1Voa=yLL+MPogq2nGDu51AEEyubCxOwMY3j=ag@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 1/2] meson.bbclass: add support for running
 the meson tests at build time
To: Ross Burton <ross@burtonini.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000eb658005d8887c58"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Feb 2022 15:00:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162055

--000000000000eb658005d8887c58
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ross,

Ross Burton <ross@burtonini.com> escreveu no dia segunda, 21/02/2022 =C3=A0=
(s)
14:24:

> There are *so many* limitations of qemu-user I'm not sure this is
> actually useful.
>
> (speaking as someone who tried this with Python a while ago).
>

Can you please point me to your previous work if it is public,
I would like to see what has already been done in this regard.


> What recipes has this successfully worked on?
>

It works on pulseaudio that has only one test and some others that I don't
remember now,
but the tests run successfully only when there are few.
I use it extensively with gstreamer and the failures is mainly because of
files that are not
found inside the qemu user mode.

I think that this feature is useful for some other people, it helps me a
lot in debug some tests in gstreamer.
Anyway the feature is disabled by default so for sure it will
not introduce any regression on OE-core.

Jose


>
> Ross
>
> On Mon, 21 Feb 2022 at 08:51, Jose Quaresma <quaresma.jose@gmail.com>
> wrote:
> >
> > The generic exe_wrapper introcuced in 40349dc5 can be used to run the
> > meson tests when build the receipe. This patch add the meson_test task
> > on the meson bbclass that adds this possibility.
> >
> > The exe_wrapper will run using the qemu usermode and because of that it
> > has some limitations, so don't expect the same results when it runs
> > natively on target.
> >
> > Running the tests at build time is upstream way for testing but is not
> > possible in OE as we always croos-compile. This can be useful in some
> > integration processes and for debuging and it adds the possibility to
> > run the test in an interactive way using the devtool build for example.
> >
> > There are two variable for that:
> >  MESON_QEMU_WRAPPER_TEST_ENABLED: this enables the test when it's "1"
> >  EXTRA_OEMESON_TEST: this is used to add extra args
> >
> > Some results when using this patch in the bigest meson project
> > on OE-core are the folloing:
> >
> > cat <<'EOF' >>conf/local.conf
> > MESON_QEMU_WRAPPER_TEST_ENABLED:pn-systemd-boot =3D "1"
> > EOF
> >
> > bitbake -c do_meson_test -v systemd-boot
> >
> > Ok:                 821
> > Expected Fail:      0
> > Fail:               95
> > Unexpected Pass:    0
> > Skipped:            33
> > Timeout:            0
> >
> > cat <<'EOF' >>conf/local.conf
> > MESON_QEMU_WRAPPER_TEST_ENABLED:pn-glib-2.0 =3D "1"
> > EOF
> >
> > bitbake -c do_meson_test -v glib-2.0
> >
> > Ok:                 197
> > Expected Fail:      0
> > Fail:               76
> > Unexpected Pass:    0
> > Skipped:            0
> > Timeout:            2
> >
> > cat <<'EOF' >>conf/local.conf
> > MESON_QEMU_WRAPPER_TEST_ENABLED:pn-gstreamer1.0 =3D "1"
> > EOF
> >
> > bitbake -c do_meson_test -v gstreamer1.0
> >
> > Ok:                 95
> > Expected Fail:      0
> > Fail:               10
> > Unexpected Pass:    0
> > Skipped:            1
> > Timeout:            0
> >
> > Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> > ---
> >  meta/classes/meson.bbclass | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> >
> > diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
> > index 0bfe945811..020a59a3c0 100644
> > --- a/meta/classes/meson.bbclass
> > +++ b/meta/classes/meson.bbclass
> > @@ -179,3 +179,19 @@ meson_do_install() {
> >  }
> >
> >  EXPORT_FUNCTIONS do_configure do_compile do_install
> > +
> > +EXTRA_OEMESON_TEST ?=3D ""
> > +
> > +do_meson_test() {
> > +    bbwarn "don't expect the same results when it runs natively as it
> will run in qemu usermode (that has its own limitations)"
> > +    meson test -C ${B} ${EXTRA_OEMESON_TEST}
> > +}
> > +do_meson_test[vardeps] +=3D "EXTRA_OEMESON_TEST"
> > +
> > +MESON_QEMU_WRAPPER_RUNTEST =3D ""
> > +MESON_QEMU_WRAPPER_RUNTEST:class-target =3D
> "${@d.getVar('MESON_QEMU_WRAPPER_TEST_ENABLED') =3D=3D '1' and
> d.getVar('EXEWRAPPER_ENABLED') =3D=3D 'True'}"
> > +
> > +python() {
> > +    if d.getVar('MESON_QEMU_WRAPPER_RUNTEST') =3D=3D 'True':
> > +       bb.build.addtask('meson_test', 'do_install', 'do_compile', d)
> > +}
> > --
> > 2.35.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#162019):
> https://lists.openembedded.org/g/openembedded-core/message/162019
> > Mute This Topic: https://lists.openembedded.org/mt/89289917/1676615
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ross@burtonini.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>


--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000eb658005d8887c58
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Ross,<div><br></div></div><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Ross Burton &lt;<a h=
ref=3D"mailto:ross@burtonini.com">ross@burtonini.com</a>&gt; escreveu no di=
a segunda, 21/02/2022 =C3=A0(s) 14:24:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">There are *so many* limitations of qemu-user I&#39;m=
 not sure this is<br>
actually useful.<br>
<br>
(speaking as someone who tried this with Python a while ago).<br></blockquo=
te><div><br></div><div>Can you=C2=A0please point me to your previous work i=
f it is public,</div><div>I would like to see what has already been done in=
 this regard.<br></div><div><br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">
<br>
What recipes has this successfully worked on?<br></blockquote><div><br></di=
v><div>It works on pulseaudio that has only one test and some others that I=
 don&#39;t remember now,</div><div>but the tests run successfully only when=
 there are few.</div><div>I use it extensively=C2=A0with gstreamer and the =
failures is mainly because=C2=A0of files that are not</div><div>found insid=
e the qemu user=C2=A0mode.</div><div><br></div><div>I think that this featu=
re=C2=A0is useful=C2=A0for some other people, it helps me a lot in debug so=
me tests in gstreamer.</div><div>Anyway the feature is disabled by default =
so for sure it will not=C2=A0introduce=C2=A0any regression=C2=A0on OE-core.=
<br></div><div></div><div><br></div><div>Jose</div><div>=C2=A0</div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">
<br>
Ross<br>
<br>
On Mon, 21 Feb 2022 at 08:51, Jose Quaresma &lt;<a href=3D"mailto:quaresma.=
jose@gmail.com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt; wrote:<br=
>
&gt;<br>
&gt; The generic exe_wrapper introcuced in 40349dc5 can be used to run the<=
br>
&gt; meson tests when build the receipe. This patch add the meson_test task=
<br>
&gt; on the meson bbclass that adds this possibility.<br>
&gt;<br>
&gt; The exe_wrapper will run using the qemu usermode and because of that i=
t<br>
&gt; has some limitations, so don&#39;t expect the same results when it run=
s<br>
&gt; natively on target.<br>
&gt;<br>
&gt; Running the tests at build time is upstream way for testing but is not=
<br>
&gt; possible in OE as we always croos-compile. This can be useful in some<=
br>
&gt; integration processes and for debuging and it adds the possibility to<=
br>
&gt; run the test in an interactive way using the devtool build for example=
.<br>
&gt;<br>
&gt; There are two variable for that:<br>
&gt;=C2=A0 MESON_QEMU_WRAPPER_TEST_ENABLED: this enables the test when it&#=
39;s &quot;1&quot;<br>
&gt;=C2=A0 EXTRA_OEMESON_TEST: this is used to add extra args<br>
&gt;<br>
&gt; Some results when using this patch in the bigest meson project<br>
&gt; on OE-core are the folloing:<br>
&gt;<br>
&gt; cat &lt;&lt;&#39;EOF&#39; &gt;&gt;conf/local.conf<br>
&gt; MESON_QEMU_WRAPPER_TEST_ENABLED:pn-systemd-boot =3D &quot;1&quot;<br>
&gt; EOF<br>
&gt;<br>
&gt; bitbake -c do_meson_test -v systemd-boot<br>
&gt;<br>
&gt; Ok:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0821<b=
r>
&gt; Expected Fail:=C2=A0 =C2=A0 =C2=A0 0<br>
&gt; Fail:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A095<br>
&gt; Unexpected Pass:=C2=A0 =C2=A0 0<br>
&gt; Skipped:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 33<br>
&gt; Timeout:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0<br>
&gt;<br>
&gt; cat &lt;&lt;&#39;EOF&#39; &gt;&gt;conf/local.conf<br>
&gt; MESON_QEMU_WRAPPER_TEST_ENABLED:pn-glib-2.0 =3D &quot;1&quot;<br>
&gt; EOF<br>
&gt;<br>
&gt; bitbake -c do_meson_test -v glib-2.0<br>
&gt;<br>
&gt; Ok:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0197<b=
r>
&gt; Expected Fail:=C2=A0 =C2=A0 =C2=A0 0<br>
&gt; Fail:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A076<br>
&gt; Unexpected Pass:=C2=A0 =C2=A0 0<br>
&gt; Skipped:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0<br>
&gt; Timeout:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 2<br>
&gt;<br>
&gt; cat &lt;&lt;&#39;EOF&#39; &gt;&gt;conf/local.conf<br>
&gt; MESON_QEMU_WRAPPER_TEST_ENABLED:pn-gstreamer1.0 =3D &quot;1&quot;<br>
&gt; EOF<br>
&gt;<br>
&gt; bitbake -c do_meson_test -v gstreamer1.0<br>
&gt;<br>
&gt; Ok:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A095<br=
>
&gt; Expected Fail:=C2=A0 =C2=A0 =C2=A0 0<br>
&gt; Fail:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A010<br>
&gt; Unexpected Pass:=C2=A0 =C2=A0 0<br>
&gt; Skipped:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1<br>
&gt; Timeout:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0<br>
&gt;<br>
&gt; Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:quaresma.jose@gmail=
.com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes/meson.bbclass | 16 ++++++++++++++++<br>
&gt;=C2=A0 1 file changed, 16 insertions(+)<br>
&gt;<br>
&gt; diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass<b=
r>
&gt; index 0bfe945811..020a59a3c0 100644<br>
&gt; --- a/meta/classes/meson.bbclass<br>
&gt; +++ b/meta/classes/meson.bbclass<br>
&gt; @@ -179,3 +179,19 @@ meson_do_install() {<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt;=C2=A0 EXPORT_FUNCTIONS do_configure do_compile do_install<br>
&gt; +<br>
&gt; +EXTRA_OEMESON_TEST ?=3D &quot;&quot;<br>
&gt; +<br>
&gt; +do_meson_test() {<br>
&gt; +=C2=A0 =C2=A0 bbwarn &quot;don&#39;t expect the same results when it =
runs natively as it will run in qemu usermode (that has its own limitations=
)&quot;<br>
&gt; +=C2=A0 =C2=A0 meson test -C ${B} ${EXTRA_OEMESON_TEST}<br>
&gt; +}<br>
&gt; +do_meson_test[vardeps] +=3D &quot;EXTRA_OEMESON_TEST&quot;<br>
&gt; +<br>
&gt; +MESON_QEMU_WRAPPER_RUNTEST =3D &quot;&quot;<br>
&gt; +MESON_QEMU_WRAPPER_RUNTEST:class-target =3D &quot;${@d.getVar(&#39;ME=
SON_QEMU_WRAPPER_TEST_ENABLED&#39;) =3D=3D &#39;1&#39; and d.getVar(&#39;EX=
EWRAPPER_ENABLED&#39;) =3D=3D &#39;True&#39;}&quot;<br>
&gt; +<br>
&gt; +python() {<br>
&gt; +=C2=A0 =C2=A0 if d.getVar(&#39;MESON_QEMU_WRAPPER_RUNTEST&#39;) =3D=
=3D &#39;True&#39;:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0bb.build.addtask(&#39;meson_test&#39;, &#3=
9;do_install&#39;, &#39;do_compile&#39;, d)<br>
&gt; +}<br>
&gt; --<br>
&gt; 2.35.1<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#162019): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/162019" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/162019</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/89289917=
/1676615" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/89289917/1676615</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:ross@burtonini.com" t=
arget=3D"_blank">ross@burtonini.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div></div>

--000000000000eb658005d8887c58--

