Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
 by mx.groups.io with SMTP id smtpd.web08.22053.1629927625157975694
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Aug 2021 14:40:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Oo6BQEk1;
 spf=pass (domain: gmail.com, ip: 209.85.222.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f45.google.com with SMTP id x6so482263uai.11
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Aug 2021 14:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ygudRwypFUvzlxblAbp5J6j04LEDUmhmnMRhR9yHZMs=;
        b=Oo6BQEk1cV/orn0Bx0Kli9s6iQzaNxbyCt6okV5bv4+02kzMLx/kHPrQhkNsk82Hbz
         2qYfmTi0Py8jHX+l1ixApWsayZYJ8qTvKjVnNm08K4q6zWwkxOIgfjkW/ueCbg+K2vpj
         R6F66v51BccfqeVmAYcqDVSPZFq0UZ717xA9N0qUxaptnoCYSG4fONNxuRtkCLRmw+Yj
         mGiulh2D1rdQZ8UUj6ie4M6FDXCy/qZZonHEzZY5dEK/gUuqazSJZdwJjdeM6+w0bBxG
         BcDM0EeMV6SBtC4qo+lBnxMoVtc5e3u/kagAkcGWolmFNuyUZuhhHjP1+EB1oSwPWKba
         3DQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ygudRwypFUvzlxblAbp5J6j04LEDUmhmnMRhR9yHZMs=;
        b=tBflJR20jG7lukDQA9SKGnwaNbELeUWBHO6ToWCd28g9fSMthx0wUFPqvcSw85DoBi
         gtkMT/BeNqMtN4vSMK6RL99JuGx+CeNg364MZpEajnpTHGnBaF/MT3H+PyUbJXcef+o7
         oHXfRbojJLBSRR3HwYJ7qfAq43SI4Gx6OmsWOvefu/tca3rrX6ZZmZu1fjS/sF0pSGcd
         CsBWLNxUnqPZYgC8DAfrDcPdrlvn02U9JKw909nsT5hyFbscVD4aSvXVIIYzQ4LEsWs8
         vYeAePyncU0hF3s4s+Z3zhPU1NKZ4HLuMuR/8xDT1/kYtSQJRjw5IQMv7+mVFO3RGF/N
         Qehw==
X-Gm-Message-State: AOAM530XTOirUPSmcx+eaMJoaKBmC7pHRAeHs7NHZIgDpxL+rJLh5SG6
	3KEdht50EX94eLdkNGafK15or2u5IeMsydANVcs0scoW
X-Google-Smtp-Source: ABdhPJwMXXcmyDayk2Dj4LYtXzl7ZjWcHYZkjmpSb1w54BB1jaRECQWUhe22565wwY7MLq0JaING+PwlZ60ZYL35dqU=
X-Received: by 2002:ab0:2381:: with SMTP id b1mr256551uan.93.1629927624276;
 Wed, 25 Aug 2021 14:40:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210825163520.Horde.SwfJDAmwq6x_Wn-Vf4FoTSG@crashcourse.ca>
 <CANNYZj-PJQTLydecmn9EpWdci5wWce_9Tkw_QkOGkProY6t_fQ@mail.gmail.com>
 <20210825171222.Horde.pjbNvErvPswYBwDudrNTUaM@crashcourse.ca>
 <3FDCF22A-7038-4B36-B15D-D59C31F61C86@pbcl.net> <20210825172741.Horde.jIEgB_nsmjiBqRKP9mvFgOd@crashcourse.ca>
In-Reply-To: <20210825172741.Horde.jIEgB_nsmjiBqRKP9mvFgOd@crashcourse.ca>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Wed, 25 Aug 2021 23:40:12 +0200
Message-ID: <CANNYZj9bFhHg3tf7pZwTU97XaWcYf6NTMWUY1CvSdu53xBHi0g@mail.gmail.com>
Subject: Re: [OE-core] what means the test 'if [ -z "$D" ]' in a pkg_postinst routine?
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Phil Blundell <pb@pbcl.net>, OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000000dfe9405ca691975"

--0000000000000dfe9405ca691975
Content-Type: text/plain; charset="UTF-8"

_ontarget() is basically syntactic sugar for $D test, but yes it's the new
preferred form. If you see $D, that means the recipe hasn't been converted.

Alex

On Wed, 25 Aug 2021 at 23:27, Robert P. J. Day <rpjday@crashcourse.ca>
wrote:

>
> Quoting Phil Blundell <pb@pbcl.net>:
>
> > That's testing for offline installation. If $D is not set, it's
> > running on the target.
> >
> > p.
>
>    right, that's exactly what i suspected in my original posting,
> i just wanted to make sure, which raises a couple issues.
>
>    first, that distinction doesn't seem to be mentioned in the
> docs, so i'll ponder writing something.
>
>    second, is that simply an old form that would be superseded
> by using "pkg_postinst_ontarget()" instead?
>
>    anyway, more questions later as i work on some lengthier docs
> on this.
>
> rday
>
>
> 
>
>

--0000000000000dfe9405ca691975
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>_ontarget() is basically syntactic sugar for $D test,=
 but yes it&#39;s the new preferred form. If you see $D, that means the rec=
ipe hasn&#39;t been converted.<br></div><div><br></div><div>Alex<br></div><=
/div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">O=
n Wed, 25 Aug 2021 at 23:27, Robert P. J. Day &lt;<a href=3D"mailto:rpjday@=
crashcourse.ca">rpjday@crashcourse.ca</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex"><br>
Quoting Phil Blundell &lt;<a href=3D"mailto:pb@pbcl.net" target=3D"_blank">=
pb@pbcl.net</a>&gt;:<br>
<br>
&gt; That&#39;s testing for offline installation. If $D is not set, it&#39;=
s=C2=A0 <br>
&gt; running on the target.<br>
&gt;<br>
&gt; p.<br>
<br>
=C2=A0 =C2=A0right, that&#39;s exactly what i suspected in my original post=
ing,<br>
i just wanted to make sure, which raises a couple issues.<br>
<br>
=C2=A0 =C2=A0first, that distinction doesn&#39;t seem to be mentioned in th=
e<br>
docs, so i&#39;ll ponder writing something.<br>
<br>
=C2=A0 =C2=A0second, is that simply an old form that would be superseded<br=
>
by using &quot;pkg_postinst_ontarget()&quot; instead?<br>
<br>
=C2=A0 =C2=A0anyway, more questions later as i work on some lengthier docs<=
br>
on this.<br>
<br>
rday<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--0000000000000dfe9405ca691975--
