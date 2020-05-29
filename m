Received: from mail-vs1-f68.google.com (mail-vs1-f68.google.com [209.85.217.68])
 by mx.groups.io with SMTP id smtpd.web12.31380.1590744991898346731
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 May 2020 02:36:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ncX0V6By;
 spf=pass (domain: gmail.com, ip: 209.85.217.68, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f68.google.com with SMTP id c1so1092481vsc.11
        for <openembedded-core@lists.openembedded.org>; Fri, 29 May 2020 02:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jllwK0EEyy3doZIKhvCoQFTuL5oLrBMdiIsJ1uLsqFs=;
        b=ncX0V6ByAsR1fmGbSinZMoXS4fxCTF1CJT0T7kqFjFReuYFYz2t/CiEOvWF/cs+LSb
         HFZWMYSh1oXS/fAYE7EB1L3rY8kfqj8BJu8st+xrXud95oHeutiO/WCJVkCtLafbaeCd
         +Ckyq43pssWdx3HwRspuhPdhtBX2nCfqjQxcpz9OszvtMQjTnhp1CfUD+N/pOghqG5gf
         SJ04iHkGTcVUo5rxRfTDvV6WHMpBkGGdz+0o0vReGVlED3Ppx2nVYeisUBs2rM9Q+Gzi
         uXOEfUwDhGzv5Cko+XZnzLSSHMg9IVOwlBqUF6FclWJPDZDzzu9ZGIwApqzKImZs7xse
         qqDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jllwK0EEyy3doZIKhvCoQFTuL5oLrBMdiIsJ1uLsqFs=;
        b=D8ZfqQCgFQOrZY7l5ZloICubQRH0UxRs5ltOID0GjhwrwQwtuwr25helLQPqWOGP2q
         TqP7XO5wpJXWOrTz7zaHNZz3i1YyxWftKFwF/zs3ANHo8PV3Omv1fKIo2Nfn3Jtagqhr
         kSqGgnhdVduhq6yW6YUgu1R6ZB3/GQAUt0kt3hUjnOQanQckfeIPWfImeeYpkGgwRXtM
         KTe5WGztMPYIJlcXQDrpB2tqVbCxmEzW8xj2vvDlYPcuTkh+M6WxgRhkyYQh6QlK37BD
         SXpWfmEqMT3Cvjg7WAC3AptwmPi8sGcmHvNLZ1Elu0iR5VZFkqJILZdVSdBZIPmpEjhV
         rlvw==
X-Gm-Message-State: AOAM533n1sJRyu8y+Z5XHRWjN0kVNzwFxgTdcK1b3SHzMnP/NTxCpDSy
	+Ge8+pgveUrWg4V2RcvMswnGH2rq5yFFYa5oxbY=
X-Google-Smtp-Source: ABdhPJzbeftcUIDicHhp0Aq1gwZy25vqDwdpCyNSONq+3h+d+mGBwch6ICzcIiE8wwp0svR33QZ6zbfmnN2iTyYWEPc=
X-Received: by 2002:a67:d098:: with SMTP id s24mr5194798vsi.25.1590744991045;
 Fri, 29 May 2020 02:36:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200523191238.1224501-1-gzatko@gmail.com> <0f497fa917b7831dff5cf53553758d96c18e30a4.camel@linuxfoundation.org>
 <bb3f3198b359a4533193c61736823fd750c04e10.camel@gmail.com>
In-Reply-To: <bb3f3198b359a4533193c61736823fd750c04e10.camel@gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Fri, 29 May 2020 11:36:18 +0200
Message-ID: <CANNYZj_gp8p1s-UyEktvaZcx7EPpyw9m=U1oHaM2XFrZUpZjFA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] docbook-xml: update recipe to stick with the upstream
To: Gregor Zatko <gzatko@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000001e9b1405a6c62eda"

--0000000000001e9b1405a6c62eda
Content-Type: text/plain; charset="UTF-8"

Perhaps directly is simplest, with a note on their origin above SRC_URI.

Alex

On Thu, 28 May 2020 at 23:12, Gregor Zatko <gzatko@gmail.com> wrote:

> On Sun, 2020-05-24 at 16:24 +0100, Richard Purdie wrote:
>
> On Sat, 2020-05-23 at 21:12 +0200, Gregor Zatko wrote:
>
> From: Gregor Zatko <
>
> gzatko@zoznam.sk
>
> >
>
>
> Until now a Debian package has been used as a source.
>
> This change just switches it to project's upstream.
>
>
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=13270
>
>
>
> Signed-off-by: Gregor Zatko <
>
> gzatko@gmail.com
>
> >
>
> ---
>
>  .../docbook-xml-update-catalog.xml.patch      | 515 ------------------
>
>  .../docbook-xml/docbook-xml-dtd4_4.5.bb       |  65 ++-
>
>  2 files changed, 36 insertions(+), 544 deletions(-)
>
>  delete mode 100644 meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/docbook-xml-update-catalog.xml.patch
>
>
> Unfortunately test builds failed:
>
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/23/builds/2176
>
>
>
> Cheers,
>
>
> Richard
>
>
>
> The catalogs of versions 4.0 and 4.1.2 are not present standalone in the docbook.org page.
>
> A question is what is the best choice to include them into the file tree:
>
> 1) add them directly
>
> 2) add them as a patch
>
> 3) extract from a Ubuntu/Debian package where they are present
>
> 
>

--0000000000001e9b1405a6c62eda
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Perhaps directly is simplest, with a note on their or=
igin above SRC_URI.</div><div><br></div><div>Alex<br></div></div><br><div c=
lass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 28 May 2=
020 at 23:12, Gregor Zatko &lt;<a href=3D"mailto:gzatko@gmail.com">gzatko@g=
mail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex"><div style=3D"text-align:left;direction:ltr"><div>On Sun, 2020-05-2=
4 at 16:24 +0100, Richard Purdie wrote:</div><blockquote type=3D"cite" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:2px solid rgb(114,159,207);paddin=
g-left:1ex"><pre>On Sat, 2020-05-23 at 21:12 +0200, Gregor Zatko wrote:</pr=
e><blockquote type=3D"cite" style=3D"margin:0px 0px 0px 0.8ex;border-left:2=
px solid rgb(114,159,207);padding-left:1ex"><pre>From: Gregor Zatko &lt;</p=
re><a href=3D"mailto:gzatko@zoznam.sk" target=3D"_blank"><pre>gzatko@zoznam=
.sk</pre></a><pre>&gt;</pre><pre><br></pre><pre>Until now a Debian package =
has been used as a source.</pre><pre>This change just switches it to projec=
t&#39;s upstream.</pre><pre><br></pre><a href=3D"https://bugzilla.yoctoproj=
ect.org/show_bug.cgi?id=3D13270" target=3D"_blank"><pre>https://bugzilla.yo=
ctoproject.org/show_bug.cgi?id=3D13270</pre></a><pre><br></pre><pre><br></p=
re><pre>Signed-off-by: Gregor Zatko &lt;</pre><a href=3D"mailto:gzatko@gmai=
l.com" target=3D"_blank"><pre>gzatko@gmail.com</pre></a><pre>&gt;</pre><pre=
>---</pre><pre> .../docbook-xml-update-catalog.xml.patch      | 515 -------=
-----------</pre><pre> .../docbook-xml/<a href=3D"http://docbook-xml-dtd4_4=
.5.bb" target=3D"_blank">docbook-xml-dtd4_4.5.bb</a>       |  65 ++-</pre><=
pre> 2 files changed, 36 insertions(+), 544 deletions(-)</pre><pre> delete =
mode 100644 meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/docbook-xml-=
update-catalog.xml.patch</pre></blockquote><pre><br></pre><pre>Unfortunatel=
y test builds failed:</pre><pre><br></pre><a href=3D"https://autobuilder.yo=
ctoproject.org/typhoon/#/builders/23/builds/2176" target=3D"_blank"><pre>ht=
tps://autobuilder.yoctoproject.org/typhoon/#/builders/23/builds/2176</pre><=
/a><pre><br></pre><pre><br></pre><pre>Cheers,</pre><pre><br></pre><pre>Rich=
ard</pre><pre><br></pre></blockquote><pre><br></pre><pre>The catalogs of ve=
rsions 4.0 and 4.1.2 are not present standalone in the <a href=3D"http://do=
cbook.org" target=3D"_blank">docbook.org</a> page.</pre><pre>A question is =
what is the best choice to include them into the file tree:</pre><pre>1) ad=
d them directly</pre><pre>2) add them as a patch</pre><pre>3) extract from =
a Ubuntu/Debian package where they are present</pre></div>
<br>
</blockquote></div>

--0000000000001e9b1405a6c62eda--
