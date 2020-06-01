Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
 by mx.groups.io with SMTP id smtpd.web12.34191.1591008810583930315
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2020 03:53:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dXZrd8vj;
 spf=pass (domain: gmail.com, ip: 209.85.221.179, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f179.google.com with SMTP id f126so2282006vkb.13
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2020 03:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ck0I7zSWwTgp/sCMI8mo3MzVVpyVEX6CMGhW9MGDLlY=;
        b=dXZrd8vjsOwSmp4bSez4CnNPR6+0EG74chQeqBLayEChxqcDHFrDE3gjpk2HOJGOwT
         RwzZdUePUFIPi3gE4elhiWYbZVd7sVL+xZhK8nADgcfb5Jj9/jdLp5uiwJOsxQfce+9a
         +Mut1k7c47nEp2Wwv6K93LTff8nw5DVZiOzA4t10Hy46JRlVmDz6vmXFguAg43zU0PV+
         zYLdqv6Q6i3oxE4bsf/4SkbrhTBUbej9KNGtreU9kQNNYCyLaHxtGsGIm+wbUtKR+s9o
         V93yMhSCVujC2RtDg9LfBA7ZDMCzT+mkqChv6Yb7Tj1+ytaMQ/btY0N5UQY4PriNS10I
         Vd2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ck0I7zSWwTgp/sCMI8mo3MzVVpyVEX6CMGhW9MGDLlY=;
        b=M79saZ9RPCA6hPhQWZ5bO3Uc3qDTbU2ebjpFrLuRDBIYlA9woPbETy6nejcpLJv6ZI
         gAVV5it0BuTl5XeYF0CMTQFud3LEtXuLFgybrM3L4GUFkn4jSlfGvVtJ37Vl9ROTcfJ4
         /5AOXNamJKeRJEpF8IoaUZxKo4PvFGdhsWxrBJe4wvN/XKqS+thyXAMTaAtRkgt63z1S
         sfDmST8KGmJQ/NssFEgiMxBuU630H25J19+BH9wPdXon/OrVjUmQvf+DK1PlVH/RTvOc
         6XnmyoVniXrtlGevbEmsbaqMq0PjlCkxTLAaneKIh0V/oEmSSIGB6Ie5WQLUocvgWtpp
         VgmQ==
X-Gm-Message-State: AOAM532PSyiR8m3Szk1Ds2GpAMvMMxftdQhvhTxFnTFzM7QGqMlTSo/g
	p5rZUcvHbOwf6PNtaL4Kbv2QKQJP+Nxldcdbm2s=
X-Google-Smtp-Source: ABdhPJz000GmaaoTuZ337Et06QLYIngktgFwg8wZ8wCy34bC64uvIycgzRzc5oOl/zmGocOspt00k3cwWRRyLAoQzaA=
X-Received: by 2002:a1f:a3d8:: with SMTP id m207mr13976685vke.0.1591008809458;
 Mon, 01 Jun 2020 03:53:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200531155254.10283-1-alex.kanavin@gmail.com>
 <20200531155254.10283-41-alex.kanavin@gmail.com> <cc365da8a2269d150ed2854c5eafea71c108b2be.camel@intel.com>
In-Reply-To: <cc365da8a2269d150ed2854c5eafea71c108b2be.camel@intel.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Mon, 1 Jun 2020 12:53:18 +0200
Message-ID: <CANNYZj-rXODGtejn13KtYtUyHy083SeVtM7Gd6S3hmAsLuqPew@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 41/70] x264: upgrade to latest revision
To: "Mittal, Anuj" <anuj.mittal@intel.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000ec202705a7039af7"

--000000000000ec202705a7039af7
Content-Type: text/plain; charset="UTF-8"

On Mon, 1 Jun 2020 at 03:37, Mittal, Anuj <anuj.mittal@intel.com> wrote:

> >  UPSTREAM_CHECK_COMMITS = "1"
> >
> > -SRCREV = "1771b556ee45207f8711744ccbd5d42a3949b14c"
> > +SRCREV = "296494a4011f58f32adc54304a2654627558c59a"
> >
> >  PV = "r2991+git${SRCPV}"
>
> PV will also need to be changed in this case to r2999+git${SRCPV}.
>

I wonder if basing PV on svn revisions is still beneficial - we pull
directly from github, rather than svn, and I don't think anyone is
interested in what the svn revision is. Upstream does not tag releases.

Alex

--000000000000ec202705a7039af7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, 1 Jun 2020 at 03:37, Mittal, Anuj=
 &lt;<a href=3D"mailto:anuj.mittal@intel.com">anuj.mittal@intel.com</a>&gt;=
 wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">&gt;=C2=A0 UPSTREAM_CHECK_COMMITS =3D &quot;1&quot;<br>
&gt;=C2=A0 <br>
&gt; -SRCREV =3D &quot;1771b556ee45207f8711744ccbd5d42a3949b14c&quot;<br>
&gt; +SRCREV =3D &quot;296494a4011f58f32adc54304a2654627558c59a&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 PV =3D &quot;r2991+git${SRCPV}&quot;<br>
<br>
PV will also need to be changed in this case to r2999+git${SRCPV}.<br></blo=
ckquote><div><br></div><div>I wonder if basing PV on svn revisions is still=
 beneficial - we pull directly from github, rather than svn, and I don&#39;=
t think anyone is interested in what the svn revision is. Upstream does not=
 tag releases.</div><div><br></div><div>Alex<br></div></div></div>

--000000000000ec202705a7039af7--
