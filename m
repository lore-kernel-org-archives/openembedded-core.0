Received: from mail-il1-f195.google.com (mail-il1-f195.google.com [209.85.166.195])
 by mx.groups.io with SMTP id smtpd.web12.5407.1589059829234885001
 for <openembedded-core@lists.openembedded.org>;
 Sat, 09 May 2020 14:30:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Wlxs2qZo;
 spf=pass (domain: gmail.com, ip: 209.85.166.195, mailfrom: ticotimo@gmail.com)
Received: by mail-il1-f195.google.com with SMTP id m5so4824864ilj.10
        for <openembedded-core@lists.openembedded.org>; Sat, 09 May 2020 14:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0vC0JUugVqhzX2CrNbuB7wJh3KZsjVDtuojZtAwebRY=;
        b=Wlxs2qZoDlWThFwVeBo5LXtrMEAWrogp/SBfntCxF6clX64ce66iWLzSjAIZ1yBfIq
         c1KqV+r00P61WKntBX4ahJSRYP3GXV2C+9jHqoTuUCxDsrj3b7woq8J38jHcOMn75slr
         FuhShonurQFwdqYG1OYIHw/siY8eYr9VwOwMk3hgj5Hf7F1c1S3R5XFZQAPj+wcDE5Cd
         LxwvL/W+jFYGJc17YlBQWJHi2Y4+cIq0f8ivbn8edmEFbqFFGTtpGPieGJgZxufSionO
         k8YDJkYk5qJaZORO5omkjEBAuYIuBLqhYCN0RrWf/A31BKAyAXTrLaUWxqwe8E9GRsa4
         AkVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0vC0JUugVqhzX2CrNbuB7wJh3KZsjVDtuojZtAwebRY=;
        b=rUaSL9mJm85CLUGw1zi1eTNVMnzTzJtl5+S3mKGED0gEkkJ3pQG7LIERzWjmTimwT3
         768wri4KuA0b6LWZuGPn9WaI14lB88L8SM/3sCS2J4x9oqHYKOkiwKfOjzb4tDGA/DVP
         GW/3PB2rF6/gO3GixFV5MlwOUOEHRfOtaUi4HzME5LUjMd5xv8UOLA6xnzOG0suBu30+
         8Z7CgEU63bpAyz4ZayaA6HAC5CP2gQEXy/kR8u/MhW/Q3RBly5ruS7UeaY9RzIn9/Prt
         vHm/BKlwkm6LRDqfegzsSQAW8S7ZdHg8yLx5XESRGmCW0aLfyvgARJYCHSxJB1q5Ys2A
         ckPQ==
X-Gm-Message-State: AGi0PuY+wFc0JXswbHSMAal/fXO+4l2yWz36WnnotLaz1T+6CvCAbkaz
	RTPab6dHhMWOPct0UjJCqfwAg9rVrFH2gS9Qzyc=
X-Google-Smtp-Source: APiQypJQHwzyk8IVKYdjRiNT6alaud+dgxQ1C1o8aSvh62Mb0YqTJhaKJOPngchyAoeA30zykcOuF3zrUtMQYSTAj7g=
X-Received: by 2002:a05:6e02:5c5:: with SMTP id l5mr9844086ils.170.1589059828691;
 Sat, 09 May 2020 14:30:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200509212312.8023-1-timothy.t.orling@linux.intel.com>
In-Reply-To: <20200509212312.8023-1-timothy.t.orling@linux.intel.com>
From: "Tim Orling" <ticotimo@gmail.com>
Date: Sat, 9 May 2020 14:30:17 -0700
Message-ID: <CANx9H-CXmR4iKEDimUD33aWgOzMfOATH_21duXLFwQdOjkXBNw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] pypi.bbclass: use new pypi UPSTREAM_CHECK_URI
To: Steve Sakoman <steve@sakoman.com>, Armin Kuster <akuster808@gmail.com>, 
	"Mittal, Anuj" <anuj.mittal@intel.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000009db68705a53dd296"

--0000000000009db68705a53dd296
Content-Type: text/plain; charset="UTF-8"

This is a candidate for backport to stable once it lands in master.

On Sat, May 9, 2020 at 2:23 PM Tim Orling <timothy.t.orling@linux.intel.com>
wrote:

> Upstream https://pypi.python.org/pypi/${PYPI_PACKAGE}/
> redirects to https://pypi.org/project/${PYPI_PACKAGE}/
>
> Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
> ---
>  meta/classes/pypi.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/pypi.bbclass b/meta/classes/pypi.bbclass
> index ffa8aa3ff44..87b4c85fc09 100644
> --- a/meta/classes/pypi.bbclass
> +++ b/meta/classes/pypi.bbclass
> @@ -22,5 +22,5 @@ SECTION = "devel/python"
>  SRC_URI += "${PYPI_SRC_URI}"
>  S = "${WORKDIR}/${PYPI_PACKAGE}-${PV}"
>
> -UPSTREAM_CHECK_URI ?= "https://pypi.python.org/pypi/${PYPI_PACKAGE}/"
> +UPSTREAM_CHECK_URI ?= "https://pypi.org/project/${PYPI_PACKAGE}/"
>  UPSTREAM_CHECK_REGEX ?= "/${PYPI_PACKAGE}/(?P<pver>(\d+[\.\-_]*)+)/"
> --
> 2.24.0
>
> 
>

--0000000000009db68705a53dd296
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This is a candidate for backport to stable once it lands i=
n master.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gma=
il_attr">On Sat, May 9, 2020 at 2:23 PM Tim Orling &lt;<a href=3D"mailto:ti=
mothy.t.orling@linux.intel.com">timothy.t.orling@linux.intel.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Upstream <a=
 href=3D"https://pypi.python.org/pypi/$%7BPYPI_PACKAGE%7D/" rel=3D"noreferr=
er" target=3D"_blank">https://pypi.python.org/pypi/${PYPI_PACKAGE}/</a><br>
redirects to <a href=3D"https://pypi.org/project/$%7BPYPI_PACKAGE%7D/" rel=
=
=3D"noreferrer" target=3D"_blank">https://pypi.org/project/${PYPI_PACKAGE}=
/</a><br>
<br>
Signed-off-by: Tim Orling &lt;<a href=3D"mailto:timothy.t.orling@linux.int=
el.com" target=3D"_blank">timothy.t.orling@linux.intel.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/pypi.bbclass | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/classes/pypi.bbclass b/meta/classes/pypi.bbclass<br>
index ffa8aa3ff44..87b4c85fc09 100644<br>
--- a/meta/classes/pypi.bbclass<br>
+++ b/meta/classes/pypi.bbclass<br>
@@ -22,5 +22,5 @@ SECTION =3D &quot;devel/python&quot;<br>
=C2=A0SRC_URI +=3D &quot;${PYPI_SRC_URI}&quot;<br>
=C2=A0S =3D &quot;${WORKDIR}/${PYPI_PACKAGE}-${PV}&quot;<br>
<br>
-UPSTREAM_CHECK_URI ?=3D &quot;<a href=3D"https://pypi.python.org/pypi/$%7=
BPYPI_PACKAGE%7D/" rel=3D"noreferrer" target=3D"_blank">https://pypi.python=
.org/pypi/${PYPI_PACKAGE}/</a>&quot;<br>
+UPSTREAM_CHECK_URI ?=3D &quot;<a href=3D"https://pypi.org/project/$%7BPYP=
I_PACKAGE%7D/" rel=3D"noreferrer" target=3D"_blank">https://pypi.org/projec=
t/${PYPI_PACKAGE}/</a>&quot;<br>
=C2=A0UPSTREAM_CHECK_REGEX ?=3D &quot;/${PYPI_PACKAGE}/(?P&lt;pver&gt;(\d+=
[\.\-_]*)+)/&quot;<br>
-- <br>
2.24.0<br>
<br>
<br>
</blockquote></div>

--0000000000009db68705a53dd296--
