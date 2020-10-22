Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
 by mx.groups.io with SMTP id smtpd.web10.20.1603402631766015167
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Oct 2020 14:37:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AD1OWGbM;
 spf=pass (domain: gmail.com, ip: 209.85.218.68, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f68.google.com with SMTP id k3so4476439ejj.10;
        Thu, 22 Oct 2020 14:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bIRfR1gc4T/RybYsh65SnZo+1zX3T7c/Dy8bUh8SVeo=;
        b=AD1OWGbM/fbQH6CoKuY2zstraT9E+EKEx8dmpa17Q66y4V2QJoAHSqXT7H9Z7wgHQp
         9kdNfN8AlwoYDJ1B/FMQwMKCA/AYTKE5ACSowWDz3hIi7cCUNpqzZuR8vN7nqQLWo0un
         JlfkkPcGOWT5KaOAR8cZE+/uuLN8BQP6RbvUllRlacB0A4dZmWdCXkZZikArjWqWXxP1
         Ji9kZMs+0g+tySWY58AFm5ZumHeOedY+v+xkDhneB6BTFseZorv7o/R2w3zAe5j3Qg5p
         AC50cXfzy8RlWMtw0kqYw3NHVQHfLWfNhTqMwflPsA0MPk9sDSmmcrBOlHrjDTOVwTGC
         AGTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bIRfR1gc4T/RybYsh65SnZo+1zX3T7c/Dy8bUh8SVeo=;
        b=XeQAmE/SfDnDB9Un5pVfurnCLVHjNhySghG+5KHtuB1pSkIYdPoS0tN3zf+d6GZQFD
         SD7CezhHsKIGiLB/8aAnPly4I07r5gBd51rlDWmPjcP2smTBMsurL5ua3yHw4AJ/MXAv
         xbwu9fZTd7aUFsqVcXIhJtT6Kmr9R2NFBIOFm3Sr1B8CAzNV1hc3nWIygOvSS/RqCoK1
         Nb3My6X2FDaq5QcG/wbzciG9Mk1Rv1Vr2Yy9IH0qbChGukELqKv9oknlQw/D5zQEykDF
         FYftl148sw0eTxzju6ieDPyYbktUNlUME9b7JcduK5yR29UespUZ/OEZZByN+tobuVT1
         Yp+w==
X-Gm-Message-State: AOAM5325l6WOHTOcFJ9ncxpRZvo4RwlIS+IfxUuJQdpf7bcrIhK4IeKH
	KnuOoezmoMMr4lki+8rFHiUjw8Evb45ldnJ2zGc=
X-Google-Smtp-Source: ABdhPJxW/VdRrYpDmGlJ9NrbYbv2Sjz9Y/SA6kPt/0P6tiOu2CVUisH8Kkmt+uhzH+T1tx6m+usmiLoUF+EOFgTyWDE=
X-Received: by 2002:a17:906:a454:: with SMTP id cb20mr4433273ejb.137.1603402630145;
 Thu, 22 Oct 2020 14:37:10 -0700 (PDT)
MIME-Version: 1.0
References: <CANx9H-DFtcdnZwDqHEPg4t5ySyJe++KS8hO9QDFX5r31KLz3Ww@mail.gmail.com>
In-Reply-To: <CANx9H-DFtcdnZwDqHEPg4t5ySyJe++KS8hO9QDFX5r31KLz3Ww@mail.gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Thu, 22 Oct 2020 23:36:59 +0200
Message-ID: <CA+chaQfL9RtRiJYph7=yGxMrgoiOPRovdfJOPf524vXY-bD7aQ@mail.gmail.com>
Subject: Re: [OE-core] Let me tell you how I really feel. Zero filter. If you need meta-python2, you need to become a maintainer. Immediately. Period.
To: Tim Orling <ticotimo@gmail.com>
Cc: Yocto-mailing-list <yocto@lists.yoctoproject.org>, 
	openembedded-core <openembedded-core@lists.openembedded.org>, 
	"openembedded-devel@lists.openembedded.org" <Openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000033ae5205b249441b"

--00000000000033ae5205b249441b
Content-Type: text/plain; charset="UTF-8"

There were only a few changes needed between dunfell and gatesgarth to keep
it building and I feel guilty for sending half of them - and pinging you on
FB :).

I don't have interest in python2, but it's still used by quite a few
components included in other layers are care about (e.g. qtwebengine in
meta-qt5, chromium in meta-browser -
https://bugs.chromium.org/p/chromium/issues/detail?id=942720 is still quite
far from finished) and at LGE we maintain meta-ros
https://github.com/ros/meta-ros which contains support for ROS 1 Melodic
which is usually used with python2 and support ends May 2023 (together with
Ubuntu Bionic it's usually used with: http://wiki.ros.org/Distributions -
just today I've separated meta-ros-python2 layer with python2 recipes which
disappeared from oe-core in warrior and were never re-introduced in
meta-python2 (like nose and numpy).

If you're looking for someone just keeping it buildable, then you can sign
me up. If it gets more annoying to maintain in future we can also split it
for pythonnative.bbclass and python recipe itself - to keep just the bare
minimum of recipes which are actively being used without all the other junk.

Cheers,

On Wed, Oct 21, 2020 at 2:48 AM Tim Orling <ticotimo@gmail.com> wrote:

> I have absolutely no need for python2, I made this abundantly clear when I
> created the meta-python2 layer.
>
> If you depend upon continuing support of python2 via the meta-python2
> layer, this is your call to arms.
>
> I was originally intending to abdicate any support after the 3.1 "dunfell"
> release, but managed to somehow continue supporting it into the crest of
> the 3.2 "gatesgarth" release.
>
> I will stop all support and actively refuse lo respond to any emails and
> this layer will be dead and I have zero care in the world that it stops
> being useful. I do not use it. I do not depend upon it. You are not paying
> me to do this. You cannot pay me enough to do this. Period. Support
> yourself.
>
> If this is not clear enough, I am happy to have a virtual video call with
> you that you will not like.
>
> --moto-timo
>
> 
>
>

--00000000000033ae5205b249441b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">There were only a few changes needed between dunfell and g=
atesgarth to keep it building and I feel guilty for sending half of them - =
and pinging you on FB :).<div><br></div><div>I don&#39;t have interest in p=
ython2, but it&#39;s still used by quite a few components included in other=
 layers are care about (e.g. qtwebengine in meta-qt5, chromium in meta-brow=
ser -=C2=A0<a href=3D"https://bugs.chromium.org/p/chromium/issues/detail?id=
=
=3D942720">https://bugs.chromium.org/p/chromium/issues/detail?id=3D942720<=
/a> is still quite far from finished) and at LGE we maintain meta-ros=C2=A0=
<a href=3D"https://github.com/ros/meta-ros">https://github.com/ros/meta-ros=
</a> which contains support for ROS 1 Melodic which is usually used with py=
thon2 and support ends May 2023 (together with Ubuntu Bionic it&#39;s usual=
ly used with: <a href=3D"http://wiki.ros.org/Distributions">http://wiki.ros=
.org/Distributions</a> - just today I&#39;ve separated meta-ros-python2 lay=
er with python2 recipes which disappeared from oe-core in warrior and were =
never re-introduced in meta-python2 (like nose and numpy).</div><div><br></=
div><div>If you&#39;re looking for someone just keeping it buildable, then =
you can sign me up. If it gets more annoying to maintain in future we can a=
lso split it for pythonnative.bbclass and python recipe itself - to keep ju=
st the bare minimum of recipes which are actively being used without all th=
e other junk.</div><div><br></div><div>Cheers,</div></div><br><div class=3D=
"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Oct 21, 2020 at=
 2:48 AM Tim Orling &lt;<a href=3D"mailto:ticotimo@gmail.com">ticotimo@gmai=
l.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex"><div dir=3D"ltr">I have absolutely no need for python2, I made this ab=
undantly clear when I created the meta-python2 layer.<div><br></div><div>If=
 you depend upon continuing support of python2 via the meta-python2 layer, =
this is your call to arms.</div><div><br></div><div>I was originally intend=
ing to abdicate any support after the 3.1 &quot;dunfell&quot; release, but =
managed to somehow continue supporting it into the crest of the 3.2 &quot;g=
atesgarth&quot; release.</div><div><br></div><div>I will stop all support a=
nd actively refuse lo respond to any emails and this layer will be dead and=
 I have zero care in the world that it stops being useful. I do not use it.=
 I do not depend upon it. You are not paying me to do this. You cannot pay =
me enough to do this. Period. Support yourself.</div><div><br></div><div>If=
 this is not clear enough, I am happy to have a virtual video call with you=
 that you will not like.</div><div><br></div><div>--moto-timo</div></div>
<br>
<br>
<br>
</blockquote></div>

--00000000000033ae5205b249441b--
