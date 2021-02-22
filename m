Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web09.38274.1614012880535854748
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Feb 2021 08:54:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bawSI6/1;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id l12so22952389edt.3
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Feb 2021 08:54:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=39ZQqUkPDLAHkV9+lD4Bdj5EgUgLCDcLZKpJNjuCMJY=;
        b=bawSI6/1xGouVqLMgA0OyzhDmC2y0TUjr11jRigpz8x79MFOUY88LLs6QIfiOBbghP
         DJwGXDZokZlHzWX3Nz7NgV8Yh01SVB42StIMeOhNKSUdr+LcPIDbMZg6aFieF5N61gr1
         Tm177XWwcqpFaghxggyb732WzJNk03QXKuzgGEjEqhsjmD1+FBSEHJ92DrHe+TBx724k
         5hkT2DKLZrKTcYiUnE5oenlaiPo6iLl5SW6g1hTEkHTje1iOk9BOJaR/XavT6ovRYPQF
         acw3RBmmXv+q5atRnJkLeeZltoIweWL9+mQYnkKI9+XBDf5WKCe+lnFTX81SCaBESv77
         LQAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=39ZQqUkPDLAHkV9+lD4Bdj5EgUgLCDcLZKpJNjuCMJY=;
        b=YfHzMwqdpZ1yCOsAutujM2p6dPq18YPIFavGaAGva9MpuRRV0ORGrRDexAQo3XQNSM
         OVk0KOz4wMFXj0IV6Jy2uTEodguXbjC8JO8aDDL/v+P1VXYO8iA+695VOZyq5fG7OTlI
         tanh80rtlB3CfzQDEFdtdo9nPljse6qwQ/iTHch4j2NQphH+kAKOsfvlo7pdQws9Fuql
         oWJgBtL/O6pOWvu1PwZXy/jj5khn8p7bcAzKzhV3R1bF9N+mbxkg/Cx/lERdgdzPMdHl
         6r7mDd/Q0yPpc8OW2RtGtKiBPLduCahyzh4Hocv2Ro+QFqYGvZ+j9IAuOkZ5evQYRqan
         Ttjg==
X-Gm-Message-State: AOAM533lYsVx6CbNW/r6alxXAVq5rHY6TF/SpE+2AqNnUpnzfpP6EEPX
	JlLoRD7s5732CgrfRTGH0zvJPN5rpn8aFumqYAs=
X-Google-Smtp-Source: ABdhPJyYad3dU/FtzipYPZu9XJI+fQbYHR+kVNvUfvmpNviKDTivTAcl8LHeYDkjSOmVvrUeybD1joLKmYNFwVJ7wK4=
X-Received: by 2002:a05:6402:6c8:: with SMTP id n8mr14593345edy.27.1614012879179;
 Mon, 22 Feb 2021 08:54:39 -0800 (PST)
MIME-Version: 1.0
References: <20210208181747.44789-1-mcroce@linux.microsoft.com>
 <CADkTA4P-kS6UdgDmT9J=FtWGy0Tmu28RtDtXHOg0M_J8z41vAQ@mail.gmail.com>
 <CAFnufp1BS2mZxJ5TAu6bVX7h76_k2vrnbrLDj6o83UbOCb5M_w@mail.gmail.com>
 <CADkTA4OsXBJk-a29_=Sx6-FBOgRAR7M3X+=RdVqju7PDLBFnmw@mail.gmail.com> <CAFnufp1JF5te_Jq6HqYkvOT8rDJhEHKfn2V954X17gvH4p9eyA@mail.gmail.com>
In-Reply-To: <CAFnufp1JF5te_Jq6HqYkvOT8rDJhEHKfn2V954X17gvH4p9eyA@mail.gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Mon, 22 Feb 2021 11:54:28 -0500
Message-ID: <CADkTA4Pj0DboJJeN88_Ype7APo1FH2BLYiX7Qfke-Lb06yrAiA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] recipes-kernel: add libbpf
To: Matteo Croce <mcroce@linux.microsoft.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Khem Raj <raj.khem@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000053935705bbefa831"

--00000000000053935705bbefa831
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 18, 2021 at 6:05 PM Matteo Croce <mcroce@linux.microsoft.com>
wrote:

> Okay, I've addressed all comments but the test one.
>
> I pushed it to a local fork of meta-oe here:
>
> https://github.com/teknoraver/meta-openembedded/commit/679944b06ffc564b4b99eae5d934f742bb2a9c09
>
> Which kind of test needs to be done here?
> A selftest to be run with oe-selftest? A ptest? A tool copied into the
> image?
>

Adding Richard, since he's the one that has the final decision if this gets
into oe-core and if the testing is sufficient.

I'd suggest looking at the valgrind and the systemtap tests. They are
similarly low level tools, with kernel bindings and they both have tests.

Something that exercises basic sanity, and runs a few basic tests. I'd
expect that the outcome would also be a user of the library in oe-core,
which is basically a pre-requisite to get it into core.

It doesn't have to be extensive, since it can be extended later.

Bruce


> If we just need to check if the bpf() syscall is supported, there is
> bpftool packaged already, which can list the loaded programs like:
>
> # bpftool prog
> 3: cgroup_device  tag 3a32ccd9e03ea87a  gpl
>        loaded_at 2021-02-17T11:50:08+0100  uid 0
>        xlated 504B  jited 309B  memlock 4096B
> 4: cgroup_skb  tag 6deef7357e7b4530  gpl
>        loaded_at 2021-02-17T11:50:08+0100  uid 0
>        xlated 64B  jited 54B  memlock 4096B
> ...
>
> Regards,
> --
> per aspera ad upstream
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--00000000000053935705bbefa831
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, Feb 18, 2021 at 6:05 PM Matteo Croce &lt;<a=
 href=3D"mailto:mcroce@linux.microsoft.com">mcroce@linux.microsoft.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Okay,=
 I&#39;ve addressed all comments but the test one.<br>
<br>
I pushed it to a local fork of meta-oe here:<br>
<a href=3D"https://github.com/teknoraver/meta-openembedded/commit/679944b06=
ffc564b4b99eae5d934f742bb2a9c09" rel=3D"noreferrer" target=3D"_blank">https=
://github.com/teknoraver/meta-openembedded/commit/679944b06ffc564b4b99eae5d=
934f742bb2a9c09</a><br>
<br>
Which kind of test needs to be done here?<br>
A selftest to be run with oe-selftest? A ptest? A tool copied into the imag=
e?<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=
=3D"font-size:small">Adding Richard, since he&#39;s the one that has the fi=
nal decision if this gets into oe-core and if the testing is sufficient.</d=
iv><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div cl=
ass=3D"gmail_default" style=3D"font-size:small">I&#39;d suggest looking at =
the valgrind and the systemtap tests. They are similarly low level tools, w=
ith kernel bindings and they both have tests.</div><div class=3D"gmail_defa=
ult" style=3D"font-size:small"><br></div></div><div class=3D"gmail_default"=
 style=3D"font-size:small">Something that exercises basic sanity, and runs =
a few basic tests. I&#39;d expect that the outcome would also be a user of =
the library in oe-core, which is basically a pre-requisite to get it into c=
ore.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div>=
<div class=3D"gmail_default" style=3D"font-size:small">It doesn&#39;t have =
to be extensive, since it can be extended later.</div><div class=3D"gmail_d=
efault" style=3D"font-size:small"><br></div><div class=3D"gmail_default" st=
yle=3D"font-size:small">Bruce</div><div class=3D"gmail_default" style=3D"fo=
nt-size:small"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
If we just need to check if the bpf() syscall is supported, there is<br>
bpftool packaged already, which can list the loaded programs like:<br>
<br>
# bpftool prog<br>
3: cgroup_device=C2=A0 tag 3a32ccd9e03ea87a=C2=A0 gpl<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0loaded_at 2021-02-17T11:50:08+0100=C2=A0 uid 0<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0xlated 504B=C2=A0 jited 309B=C2=A0 memlock 4096B=
<br>
4: cgroup_skb=C2=A0 tag 6deef7357e7b4530=C2=A0 gpl<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0loaded_at 2021-02-17T11:50:08+0100=C2=A0 uid 0<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0xlated 64B=C2=A0 jited 54B=C2=A0 memlock 4096B<b=
r>
...<br>
<br>
Regards,<br>
-- <br>
per aspera ad upstream<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for ch=
aos and madness await thee at its end<br>- &quot;Use the force Harry&quot; =
- Gandalf, Star Trek II<br><br></div></div>

--00000000000053935705bbefa831--
