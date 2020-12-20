Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
 by mx.groups.io with SMTP id smtpd.web09.22267.1608456874741278934
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Dec 2020 01:34:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TT5nr/eg;
 spf=pass (domain: gmail.com, ip: 209.85.217.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f54.google.com with SMTP id e15so3832617vsa.0
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Dec 2020 01:34:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OLE+qaR2Hii2a6DxXkIAkN5F13eocKREeAyuhSe8nqU=;
        b=TT5nr/egLbxv7x2xPay4stN76jxvL8+0sdD27/7dhq/KS22eJ5lFmsbhuykEet/KzG
         iLPwr0thWdmIzqjwUxtKCrxo9gXkmxWEypE6fLSFL4k/+0pE3eZD+Gn19JI6Y22ws8sO
         SN/IXOG2lEONWAg7l57f/rE7uFkbxHdZTXFkReJGWIGwfXGxEcRORM/Xwhsa8x5tc3Hf
         YtySLhiTLFPIkmau5RFLyiWL4WIXfBEZh9xPq5vSUvRi27PDA1USuHygzaW38yR/641Q
         GHas230mF1TXDL45+4p9oCbUEp+sS63LC3ZNiOqKengsRWIh7015AJDRu2Nvu3RnQXpP
         Dhiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OLE+qaR2Hii2a6DxXkIAkN5F13eocKREeAyuhSe8nqU=;
        b=mGXNcVv3/2go8Fcd0rLpdB+ETipV0Ng8goci5+SOgZpjoS4HRJdD186q/YljSmEJ/R
         pdW3OGv0P0xu8YRdSI9hrZ/R7W72RjI25b5ripo/DPuHrmYruHGCiOeC0dxezS/DFg/N
         O1teMEYKXJfcAO/hV9/Y1fEP3jDUuUVkvsdvFL6sTfjTp5U2yoNkjZaefRp3mOeOY/ge
         44Rx+mGGUTBklAvC/+3nT7UsQID7hV01lhZSG7A+WkgcVfr4zJXJnu2c7CeM7egrxLuA
         Ug/3gZwXvG6VqKTWamSq6E/SQV1i39qSm6xQutpHaglhG8m08F/o4xx7YElJrAjr3ODA
         1FGw==
X-Gm-Message-State: AOAM532Lzs7JGqjKYFDywNfCNbE9/J7YKYC2b9ktlBeIzfWY3XFNx6OQ
	WYoyUeRKHJqxp1uhOntDJ6ctZasRoEhZyLhHPbk=
X-Google-Smtp-Source: ABdhPJyo37RwjtjRrPq9RCSi0dST2UcpYrLRr1JuCHoztXWGx4T26SLiNgH3tUQNldw46Ekz3Z+JUNbM8AtuizmVtKM=
X-Received: by 2002:a67:6044:: with SMTP id u65mr9543228vsb.31.1608456873820;
 Sun, 20 Dec 2020 01:34:33 -0800 (PST)
MIME-Version: 1.0
References: <20201219172908.7338-1-alex.kanavin@gmail.com> <63389aced6ca3dc8f76203b5c7aad2436ee66473.camel@linuxfoundation.org>
In-Reply-To: <63389aced6ca3dc8f76203b5c7aad2436ee66473.camel@linuxfoundation.org>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Sun, 20 Dec 2020 10:34:22 +0100
Message-ID: <CANNYZj8yVP6Du4Y1emnaTL0Mb-O9AXEMNmyALH3jxWnuWaj6ag@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] oeqa/ptest: print a warning if ptests failed
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>, Jon Mason <Jon.Mason@arm.com>, 
	Ross Burton <ross.burton@arm.com>
Content-Type: multipart/alternative; boundary="00000000000099d0bc05b6e20cef"

--00000000000099d0bc05b6e20cef
Content-Type: text/plain; charset="UTF-8"

On Sun, 20 Dec 2020 at 00:56, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Sat, 2020-12-19 at 18:29 +0100, Alexander Kanavin wrote:
> > This allows spotting ptest regressions without having hard ptest failures
> > (for that full ptest stability should be achieved).
> >
> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > ---
> >  meta/lib/oeqa/runtime/cases/ptest.py | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/meta/lib/oeqa/runtime/cases/ptest.py
> b/meta/lib/oeqa/runtime/cases/ptest.py
> > index a9572c81f0..0800f3c27f 100644
> > --- a/meta/lib/oeqa/runtime/cases/ptest.py
> > +++ b/meta/lib/oeqa/runtime/cases/ptest.py
> > @@ -108,4 +108,5 @@ class PtestRunnerTest(OERuntimeTestCase):
> >              failmsg = failmsg + "Failed ptests:\n%s" %
> pprint.pformat(failed_tests)
> >
> >          if failmsg:
> > +            self.logger.warning("There were failing ptests.")
> >              self.fail(failmsg)
>
> Have you looked at this on the arm worker? That seems to have four
> failing tests over three recipes:
>
> {'libinput': ['libinput-test-suite'],
>  'strace': ['qual_fault-syscall.test', 'qual_fault.test'],
>  'valgrind': ['drd/tests/std_list']}
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/1355
>
> Not sure if these always fail or are intermittent?
>

libinput failure should be addressed by Bruce's patch to enable UINPUT
kernel option (I think I saw that in master-next, but now I don't).

The rest are intermittent, as latest master build only shows one different
intermittent failure in glib (which I'm trying to reproduce with additional
diagnostics):
https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/1356

Alex

--00000000000099d0bc05b6e20cef
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Sun, 20 Dec 2020 at 00:56, Richard Pur=
die &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdi=
e@linuxfoundation.org</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">On Sat, 2020-12-19 at 18:29=
 +0100, Alexander Kanavin wrote:<br>
&gt; This allows spotting ptest regressions without having hard ptest failu=
res<br>
&gt; (for that full ptest stability should be achieved).<br>
&gt; <br>
&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gm=
ail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/lib/oeqa/runtime/cases/ptest.py | 1 +<br>
&gt;=C2=A0 1 file changed, 1 insertion(+)<br>
&gt; <br>
&gt; diff --git a/meta/lib/oeqa/runtime/cases/ptest.py b/meta/lib/oeqa/runt=
ime/cases/ptest.py<br>
&gt; index a9572c81f0..0800f3c27f 100644<br>
&gt; --- a/meta/lib/oeqa/runtime/cases/ptest.py<br>
&gt; +++ b/meta/lib/oeqa/runtime/cases/ptest.py<br>
&gt; @@ -108,4 +108,5 @@ class PtestRunnerTest(OERuntimeTestCase):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 failmsg =3D failmsg + =
&quot;Failed ptests:\n%s&quot; % pprint.pformat(failed_tests)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if failmsg:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.logger.warning(&quot;T=
here were failing ptests.&quot;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.fail(failmsg)<br>
<br>
Have you looked at this on the arm worker? That seems to have four<br>
failing tests over three recipes:<br>
<br>
{&#39;libinput&#39;: [&#39;libinput-test-suite&#39;],<br>
=C2=A0&#39;strace&#39;: [&#39;qual_fault-syscall.test&#39;, &#39;qual_fault=
.test&#39;],<br>
=C2=A0&#39;valgrind&#39;: [&#39;drd/tests/std_list&#39;]}<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/82/build=
s/1355" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/82/builds/1355</a><br>
<br>
Not sure if these always fail or are intermittent?<br></blockquote><div><br=
></div><div>libinput failure should be addressed by Bruce&#39;s patch to en=
able UINPUT kernel option (I think I saw that in master-next, but now I don=
&#39;t).</div><div><br></div><div>The rest are intermittent, as latest mast=
er build only shows one different intermittent failure in glib (which I&#39=
;m trying to reproduce with additional diagnostics):</div><div><a href=3D"h=
ttps://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/1356">http=
s://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/1356</a></div=
><div><br></div><div>Alex<br></div></div></div>

--00000000000099d0bc05b6e20cef--
