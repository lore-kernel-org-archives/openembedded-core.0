Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com [209.85.217.65])
 by mx.groups.io with SMTP id smtpd.web10.5911.1604177760149185866
 for <openembedded-core@lists.openembedded.org>;
 Sat, 31 Oct 2020 13:56:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TwO0FKqD;
 spf=pass (domain: gmail.com, ip: 209.85.217.65, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f65.google.com with SMTP id b3so5356080vsc.5
        for <openembedded-core@lists.openembedded.org>; Sat, 31 Oct 2020 13:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rFZTZgtLysfk0eK2qQmxt2j+sDPbO/dxgyU15/d2th0=;
        b=TwO0FKqDdpf72u9A4UkLIZEN/RTXIYTRvXQL3zIi5cxjR+raS1KNLi2r0WcOVaVmCs
         GQKuQ4pjTEFpIaP5EvEqVyuWh0zqm3NMEJEx9UsYp2/CBRBlEG2C8xALKGZYqO6DReky
         CPqFB5Xv3AIuiQ2fUQO6VMrI5T3CSSMLoB4enonuQWkiqq2EEDxIFNyee4oIRtadKXtp
         zYjr+63a5iXRyAhIkgWh3jEwtDCY9vAQHOlpSMfn9ngAXq06+K0VPRDcyXahl2B8eyVM
         LNSm8Ori8UL3kTWGh6kof9iHpEWFehJ4XHX1vXxAcVdI+K0z4/dEQwm2RCg+0VfFzzgS
         w/6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rFZTZgtLysfk0eK2qQmxt2j+sDPbO/dxgyU15/d2th0=;
        b=Co1pblmcdK6ny11hjrmsLkpudvAfHq84yqeg++2Qa2GBlkKrBXUHmgL0qnZbSpAh4h
         IQ9hmOBOxR6QITf6JenPF9TtrdJO8wrWMdG8wpo91NipbfRN5B4+A/dv/lWcrXMZxoZL
         WLlX43+DeEFKq7D1rdFF8/ErH5MqTanKXAa9KqleHmWEnux0pSe7ChafdRU1dYxFCmGU
         ic3f3hxJuuEbQZPCJgzBol1htN7tmUqDXkbUsNREAW6He+qsq2ueoU0CR+yWWWNwtyBJ
         UTs3j+npSrVaPqclRGmpXF+OOEREPEDuCVI1NLtCYeiXLzwzl/s222K04EQhlJtd2xvs
         VDIQ==
X-Gm-Message-State: AOAM533He2t61Sp3Q1PGGUortYkcVBlaLXThd/cOl+QWdya52XNQc9Wr
	BTS6FFvDPR7hdO7YSq8b1S42VagoW3Vq6pIJ2LQ=
X-Google-Smtp-Source: ABdhPJwxXWFE60bgYdJSzxs1r0/r1zV39nij7iFRlTtFHQDthTSeodSUMqwo1kQ4CWza1AYQuEiIrIbL7kvhvcgVSsg=
X-Received: by 2002:a05:6102:119:: with SMTP id z25mr11333558vsq.51.1604177759314;
 Sat, 31 Oct 2020 13:55:59 -0700 (PDT)
MIME-Version: 1.0
References: <20201031204709.22065-1-andrey.zhizhikin@leica-geosystems.com>
In-Reply-To: <20201031204709.22065-1-andrey.zhizhikin@leica-geosystems.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Sat, 31 Oct 2020 21:55:47 +0100
Message-ID: <CANNYZj_AdtSWo8xjCV6EYoD8xZ40L6khosv8r-XF6iLAkmYYLQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] insane: add GitLab /archive/ tests
To: Andrey Zhizhikin <andrey.z@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>, 
	Martin Jansa <martin.jansa@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000080285205b2fdbd37"

--00000000000080285205b2fdbd37
Content-Type: text/plain; charset="UTF-8"

Has this been tested?

>>> print(re.search(r"github|gitlab\.com/.+/.+/archive/.+",
"github/random/url/will/match"))
<re.Match object; span=(0, 6), match='github'>

Alex

On Sat, 31 Oct 2020 at 21:47, Andrey Zhizhikin <andrey.z@gmail.com> wrote:

> Archives produced by GitLab should be avoided in the same way as those
> produced by GitHub.
>
> Extend SRC_URI check to include GitLab and inform user that recipe
> should be converted to use git protocol.
>
> Link:
> https://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg73109.html
> Link: https://lists.openembedded.org/g/openembedded-core/message/144035
> Cc: Martin Jansa <martin.jansa@gmail.com>
> Signed-off-by: Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>
> ---
>  meta/classes/insane.bbclass | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> index c6dff9659c..66c34abc95 100644
> --- a/meta/classes/insane.bbclass
> +++ b/meta/classes/insane.bbclass
> @@ -976,8 +976,8 @@ def package_qa_check_src_uri(pn, d, messages):
>          package_qa_handle_error("src-uri-bad", "%s: SRC_URI uses PN not
> BPN" % pn, d)
>
>      for url in d.getVar("SRC_URI").split():
> -        if re.search(r"github\.com/.+/.+/archive/.+", url):
> -            package_qa_handle_error("src-uri-bad", "%s: SRC_URI uses
> unstable GitHub archives" % pn, d)
> +        if re.search(r"github|gitlab\.com/.+/.+/archive/.+", url):
> +            package_qa_handle_error("src-uri-bad", "%s: SRC_URI uses
> unstable GitHub/GitLab archives, convert recipe to use git protocol" % pn,
> d)
>
>  QARECIPETEST[unhandled-features-check] =
> "package_qa_check_unhandled_features_check"
>  def package_qa_check_unhandled_features_check(pn, d, messages):
> --
> 2.17.1
>
>
> 
>
>

--00000000000080285205b2fdbd37
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Has this been tested? <br></div><div><br></div><div><=
span style=3D"font-family:monospace"><span style=3D"color:rgb(0,0,0);backgr=
ound-color:rgb(255,255,255)">&gt;&gt;&gt; print(re.search(r&quot;github|git=
lab\.com/.+/.+/archive/.+&quot;, &quot;github/random/url/will/match&quot;))
</span><br>&lt;re.Match object; span=3D(0, 6), match=3D&#39;github&#39;&gt=
;<br>
<br></span></div><div><span style=3D"font-family:monospace">Alex<br></span=
></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Sat, 31 Oct 2020 at 21:47, Andrey Zhizhikin &lt;<a href=3D"mailto=
:andrey.z@gmail.com">andrey.z@gmail.com</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">Archives produced by GitLab should b=
e avoided in the same way as those<br>
produced by GitHub.<br>
<br>
Extend SRC_URI check to include GitLab and inform user that recipe<br>
should be converted to use git protocol.<br>
<br>
Link: <a href=3D"https://www.mail-archive.com/openembedded-devel@lists.ope=
nembedded.org/msg73109.html" rel=3D"noreferrer" target=3D"_blank">https://w=
ww.mail-archive.com/openembedded-devel@lists.openembedded.org/msg73109.html=
</a><br>
Link: <a href=3D"https://lists.openembedded.org/g/openembedded-core/messag=
e/144035" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/g/openembedded-core/message/144035</a><br>
Cc: Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com" target=3D"_=
blank">martin.jansa@gmail.com</a>&gt;<br>
Signed-off-by: Andrey Zhizhikin &lt;<a href=3D"mailto:andrey.zhizhikin@lei=
ca-geosystems.com" target=3D"_blank">andrey.zhizhikin@leica-geosystems.com<=
/a>&gt;<br>
---<br>
=C2=A0meta/classes/insane.bbclass | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass<br>
index c6dff9659c..66c34abc95 100644<br>
--- a/meta/classes/insane.bbclass<br>
+++ b/meta/classes/insane.bbclass<br>
@@ -976,8 +976,8 @@ def package_qa_check_src_uri(pn, d, messages):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0package_qa_handle_error(&quot;src-uri-ba=
d&quot;, &quot;%s: SRC_URI uses PN not BPN&quot; % pn, d)<br>
<br>
=C2=A0 =C2=A0 =C2=A0for url in d.getVar(&quot;SRC_URI&quot;).split():<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if re.search(r&quot;github\.com/.+/.+/archive=
/.+&quot;, url):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 package_qa_handle_error(&quot;s=
rc-uri-bad&quot;, &quot;%s: SRC_URI uses unstable GitHub archives&quot; % p=
n, d)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if re.search(r&quot;github|gitlab\.com/.+/.+/=
archive/.+&quot;, url):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 package_qa_handle_error(&quot;s=
rc-uri-bad&quot;, &quot;%s: SRC_URI uses unstable GitHub/GitLab archives, c=
onvert recipe to use git protocol&quot; % pn, d)<br>
<br>
=C2=A0QARECIPETEST[unhandled-features-check] =3D &quot;package_qa_check_un=
handled_features_check&quot;<br>
=C2=A0def package_qa_check_unhandled_features_check(pn, d, messages):<br>
-- <br>
2.17.1<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--00000000000080285205b2fdbd37--
