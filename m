Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web08.822.1619804094421007443
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Apr 2021 10:34:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=P8GAUXx/;
 spf=pass (domain: gmail.com, ip: 209.85.160.169, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id n22so12603408qtk.9
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Apr 2021 10:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Z3UD5gyw1/HK6Q3Bm2SUQfaIXxyZj3/+2BEY5mzbxNk=;
        b=P8GAUXx/wCSxgZyZQRQROLe3HPU9mnjv6MEPGYXydV5MfcIw3MxVs69gNQbRkH2Ez2
         wZ5ndErRZy0Q+GPBXiWqIUF31wTDGNG6YpXmcD1tgznr5TO06X9Sv8fjTRkLst7a7rHA
         nN8LPzS+iGiZKAibKvivg1dWZ81RpylTS80ULBHAs8D+jc8pPxNUSnO28P22X9kqD78E
         HEUkVt33WnjpObOJqR8SZxPj/pdMdik4EzmjPUNyJiRo7P+vk61bcP9Hz8ehbdG+e2sj
         YWBpXynBmsm1CSWEgKEb1HR4ZtgeJz7zFPf+yguYkXl3mLF2nBxqrQF1pIWuP25vC3ig
         TWRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Z3UD5gyw1/HK6Q3Bm2SUQfaIXxyZj3/+2BEY5mzbxNk=;
        b=kzK5CEPVRAstgxcgHAY2KjoXbyQyHG4ZJpDU+e8nWCvW1FwOAR5RN51QF/Py+UlYFO
         3ZwVaz4XajWg3dmpJylZp0xEsswuHxk1FZGa+JQOHlBtXgN4Fqg3y8RYFrSxwx99PhIr
         QKRRFAJ2CNDzwwJ5FyeLubqVFD4aQne2MV35jCoY0BtRr9aL6AQC4EtLF9Xj4OQh8lDm
         +1pGfjfeKrQ6KyTRNB9ytOygKUNcj5vYy+66hCvcvT8FZOVzXh2sNokjN5K1CO2c/Eey
         k4hw4mkAxxt5zmylnplFuvBpshE3ngqQ0UBZeVBsdR57WAeCUVEn4CHTW2QdyT1RjBCW
         u9tA==
X-Gm-Message-State: AOAM533nPN7tJ1JqFc4d+144yZdsQRBGTmEkeCTs+iVmslhsauHs+dwb
	7mFdNqV/uay0QznCbdmScM+xWOGwA7oQgNr9Nxg=
X-Google-Smtp-Source: ABdhPJwVP69L4nIS3jIrm9Qjm2kLa11rXrGh4iNj0Yjfg9uRgaFEFB/mPpXi+HJ8xqGh6F0uioYPcYXE/9LWoO/vg8I=
X-Received: by 2002:ac8:5cc4:: with SMTP id s4mr5423988qta.214.1619804093425;
 Fri, 30 Apr 2021 10:34:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210420182838.958151-1-raj.khem@gmail.com> <20210420182838.958151-2-raj.khem@gmail.com>
 <YIs5x0X89EfRXduW@piout.net> <CAMKF1sr4MCyKV-YfEA7FwSwQXbJq7hHMOGuqYokYPgMX+WkQEw@mail.gmail.com>
 <CAMKF1sqSZuBt1BjtbnW4AAXh_i2mAXWqTqbdv5k9eweZuqj4ug@mail.gmail.com> <CADfgfoYwUp51w4Rm=rRJJ=jB=XPfWeSow42pzGC3LFGs3mEO6w@mail.gmail.com>
In-Reply-To: <CADfgfoYwUp51w4Rm=rRJJ=jB=XPfWeSow42pzGC3LFGs3mEO6w@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 30 Apr 2021 10:34:41 -0700
Message-ID: <CAMKF1srnbw6__=7X12PQaopLWvcUg7phD5wph0m_xMrEdpzEbg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] go: Use dl.google.com for SRC_URI
To: Michael Halstead <mhalstead@linuxfoundation.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000009830c705c134078f"

--0000000000009830c705c134078f
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 30, 2021 at 9:50 AM Michael Halstead <
mhalstead@linuxfoundation.org> wrote:

> I've removed the following:
> go1.16.3.src.tar.gz ( 0 bytes)
> go1.16.3.src.tar.gz_bad-checksum_b298d29de9236ca47a023e382313bcc2d2eed31dfa706b60a04103ce83a71a25
> ( 20912861 bytes)
>
> I can add a job to check for 0 byte tarballs. Do you think that would be
> helpful?
>

Yes it will be very helpful and also remove the bad-checksum files too they
are bad downloads of corrupt tarballs

>
>
>
> On Thu, Apr 29, 2021 at 4:26 PM Khem Raj <raj.khem@gmail.com> wrote:
>
>> you also want to get rid of *.lock files as well.
>>
>> On Thu, Apr 29, 2021 at 4:24 PM Khem Raj <raj.khem@gmail.com> wrote:
>> >
>> > Adding Miachel as well.
>> >
>> > this seems to be running
>> > buildoptions.SourceMirroring.test_yocto_source_mirror selftest, which
>> > AFAICT should force downloads from yp mirror only
>> > when I check the YP mirror then this tarball exists there
>> >
>> > http://downloads.yoctoproject.org/mirror/sources/go1.16.3.src.tar.gz
>> >
>> > but problem is that its 0 sized.
>> >
>> > Secondly I also see a bad checksum file there
>> >
>> >
>> http://downloads.yoctoproject.org/mirror/sources/go1.16.3.src.tar.gz_bad-checksum_b298d29de9236ca47a023e382313bcc2d2eed31dfa706b60a04103ce83a71a25
>> >
>> > I am seeing that there are lot of *_bad-checksum_* files in YP src
>> > mirror http://downloads.yoctoproject.org/mirror/sources/
>> >
>> > Michael,
>> >
>> > Can we delete these *_bad-checksum_* files as well as zero-sized
>> > tarballs please?
>> >
>> > On Thu, Apr 29, 2021 at 3:57 PM Alexandre Belloni
>> > <alexandre.belloni@bootlin.com> wrote:
>> > >
>> > > Hello,
>> > >
>> > > On 20/04/2021 11:28:38-0700, Khem Raj wrote:
>> > > > golang.org/dl is resolving to this anyway
>> > > >
>> > >
>> > > Unfortunately, this is still an issue on the autobuilders:
>> > >
>> > > ERROR: go-cross-core2-32-1.16.3-r0 do_fetch: The URL: '
>> https://dl.google.com/go/go1.16.3.src.tar.gz;name=main' is not trusted
>> and cannot be used
>> > > ERROR: go-cross-core2-32-1.16.3-r0 do_fetch: Fetcher failure for URL:
>> 'https://dl.google.com/go/go1.16.3.src.tar.gz;name=main'. Unable to
>> fetch URL from any source.
>> > > ERROR: Logfile of failure stored in:
>> /home/pokybuild/yocto-worker/a-quick/build/build-st/tmp/work/x86_64-linux/go-cross-core2-32/1.16.3-r0/temp/log.do_fetch.525
>> > > ERROR: go-runtime-1.16.3-r0 do_fetch: The URL: '
>> https://dl.google.com/go/go1.16.3.src.tar.gz;name=main' is not trusted
>> and cannot be used
>> > > ERROR: go-runtime-1.16.3-r0 do_fetch: Fetcher failure for URL: '
>> https://dl.google.com/go/go1.16.3.src.tar.gz;name=main'. Unable to fetch
>> URL from any source.
>> > > ERROR: Logfile of failure stored in:
>> /home/pokybuild/yocto-worker/a-quick/build/build-st/tmp/work/core2-32-poky-linux/go-runtime/1.16.3-r0/temp/log.do_fetch.544
>> > >
>> > > This is fairly reproducible:
>> > >
>> > >
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/85/builds/1404/steps/23/logs/stdio
>> > >
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/85/builds/1403/steps/23/logs/stdio
>> > >
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/85/builds/1402/steps/23/logs/stdio
>> > >
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/85/builds/1401/steps/23/logs/stdio
>> > >
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/2076/steps/23/logs/stdio
>> > >
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/2074/steps/23/logs/stdio
>> > >
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/2070/steps/23/logs/stdio
>> > >
>> > >
>> > > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> > > > ---
>> > > >  meta/recipes-devtools/go/go-common.inc | 2 +-
>> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
>> > > >
>> > > > diff --git a/meta/recipes-devtools/go/go-common.inc
>> b/meta/recipes-devtools/go/go-common.inc
>> > > > index 39a681a712..c368b95b69 100644
>> > > > --- a/meta/recipes-devtools/go/go-common.inc
>> > > > +++ b/meta/recipes-devtools/go/go-common.inc
>> > > > @@ -14,7 +14,7 @@ LICENSE = "BSD-3-Clause"
>> > > >
>> > > >  inherit goarch
>> > > >
>> > > > -SRC_URI = "https://golang.org/dl/go${PV}.src.tar.gz;name=main"
>> > > > +SRC_URI = "https://dl.google.com/go/go${PV}.src.tar.gz;name=main"
>> > > >  S = "${WORKDIR}/go"
>> > > >  B = "${S}"
>> > > >  UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.src\.tar"
>> > > > --
>> > > > 2.31.1
>> > > >
>> > >
>> > > >
>> > > > 
>> > > >
>> > >
>> > >
>> > > --
>> > > Alexandre Belloni, co-owner and COO, Bootlin
>> > > Embedded Linux and Kernel engineering
>> > > https://bootlin.com
>>
>
>
> --
> Michael Halstead
> Linux Foundation / Yocto Project
> Systems Operations Engineer
>

--0000000000009830c705c134078f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Apr 30, 2021 at 9:50 AM Michael Halstead &lt;<a hr=
ef=3D"mailto:mhalstead@linuxfoundation.org">mhalstead@linuxfoundation.org</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div=
>I&#39;ve removed the following:</div>go1.16.3.src.tar.gz ( 0 bytes)<br>go1=
.16.3.src.tar.gz_bad-checksum_b298d29de9236ca47a023e382313bcc2d2eed31dfa706=
b60a04103ce83a71a25 (=C2=A020912861 bytes)<div><br></div><div>I can add a j=
ob to check for 0 byte tarballs. Do you think that would be helpful?</div><=
/div></blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Yes it will=
 be very helpful and also remove the bad-checksum files too they are bad do=
wnloads of corrupt tarballs=C2=A0</div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div =
dir=3D"ltr"><div dir=3D"auto"><br><div><br></div></div></div><br><div class=
=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Apr 29, 202=
1 at 4:26 PM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_=
blank">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">you also want to get rid of *.lock files as well.<=
br>
<br>
On Thu, Apr 29, 2021 at 4:24 PM Khem Raj &lt;<a href=3D"mailto:raj.khem@gm=
ail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Adding Miachel as well.<br>
&gt;<br>
&gt; this seems to be running<br>
&gt; buildoptions.SourceMirroring.test_yocto_source_mirror selftest, which=
<br>
&gt; AFAICT should force downloads from yp mirror only<br>
&gt; when I check the YP mirror then this tarball exists there<br>
&gt;<br>
&gt; <a href=3D"http://downloads.yoctoproject.org/mirror/sources/go1.16.3.=
src.tar.gz" rel=3D"noreferrer" target=3D"_blank">http://downloads.yoctoproj=
ect.org/mirror/sources/go1.16.3.src.tar.gz</a><br>
&gt;<br>
&gt; but problem is that its 0 sized.<br>
&gt;<br>
&gt; Secondly I also see a bad checksum file there<br>
&gt;<br>
&gt; <a href=3D"http://downloads.yoctoproject.org/mirror/sources/go1.16.3.=
src.tar.gz_bad-checksum_b298d29de9236ca47a023e382313bcc2d2eed31dfa706b60a04=
103ce83a71a25" rel=3D"noreferrer" target=3D"_blank">http://downloads.yoctop=
roject.org/mirror/sources/go1.16.3.src.tar.gz_bad-checksum_b298d29de9236ca4=
7a023e382313bcc2d2eed31dfa706b60a04103ce83a71a25</a><br>
&gt;<br>
&gt; I am seeing that there are lot of *_bad-checksum_* files in YP src<br=
>
&gt; mirror <a href=3D"http://downloads.yoctoproject.org/mirror/sources/" =
rel=3D"noreferrer" target=3D"_blank">http://downloads.yoctoproject.org/mirr=
or/sources/</a><br>
&gt;<br>
&gt; Michael,<br>
&gt;<br>
&gt; Can we delete these *_bad-checksum_* files as well as zero-sized<br>
&gt; tarballs please?<br>
&gt;<br>
&gt; On Thu, Apr 29, 2021 at 3:57 PM Alexandre Belloni<br>
&gt; &lt;<a href=3D"mailto:alexandre.belloni@bootlin.com" target=3D"_blank=
">alexandre.belloni@bootlin.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; Hello,<br>
&gt; &gt;<br>
&gt; &gt; On 20/04/2021 11:28:38-0700, Khem Raj wrote:<br>
&gt; &gt; &gt; <a href=3D"http://golang.org/dl" rel=3D"noreferrer" target=
=3D"_blank">golang.org/dl</a> is resolving to this anyway<br>
&gt; &gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; Unfortunately, this is still an issue on the autobuilders:<br>
&gt; &gt;<br>
&gt; &gt; ERROR: go-cross-core2-32-1.16.3-r0 do_fetch: The URL: &#39;<a hr=
ef=3D"https://dl.google.com/go/go1.16.3.src.tar.gz;name=3Dmain" rel=3D"nore=
ferrer" target=3D"_blank">https://dl.google.com/go/go1.16.3.src.tar.gz;name=
=
=3Dmain</a>&#39; is not trusted and cannot be used<br>
&gt; &gt; ERROR: go-cross-core2-32-1.16.3-r0 do_fetch: Fetcher failure for=
 URL: &#39;<a href=3D"https://dl.google.com/go/go1.16.3.src.tar.gz;name=3Dm=
ain" rel=3D"noreferrer" target=3D"_blank">https://dl.google.com/go/go1.16.3=
.src.tar.gz;name=3Dmain</a>&#39;. Unable to fetch URL from any source.<br>
&gt; &gt; ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worke=
r/a-quick/build/build-st/tmp/work/x86_64-linux/go-cross-core2-32/1.16.3-r0/=
temp/log.do_fetch.525<br>
&gt; &gt; ERROR: go-runtime-1.16.3-r0 do_fetch: The URL: &#39;<a href=3D"h=
ttps://dl.google.com/go/go1.16.3.src.tar.gz;name=3Dmain" rel=3D"noreferrer"=
 target=3D"_blank">https://dl.google.com/go/go1.16.3.src.tar.gz;name=3Dmain=
</a>&#39; is not trusted and cannot be used<br>
&gt; &gt; ERROR: go-runtime-1.16.3-r0 do_fetch: Fetcher failure for URL: &=
#39;<a href=3D"https://dl.google.com/go/go1.16.3.src.tar.gz;name=3Dmain" re=
l=3D"noreferrer" target=3D"_blank">https://dl.google.com/go/go1.16.3.src.ta=
r.gz;name=3Dmain</a>&#39;. Unable to fetch URL from any source.<br>
&gt; &gt; ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worke=
r/a-quick/build/build-st/tmp/work/core2-32-poky-linux/go-runtime/1.16.3-r0/=
temp/log.do_fetch.544<br>
&gt; &gt;<br>
&gt; &gt; This is fairly reproducible:<br>
&gt; &gt;<br>
&gt; &gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builde=
rs/85/builds/1404/steps/23/logs/stdio" rel=3D"noreferrer" target=3D"_blank"=
>https://autobuilder.yoctoproject.org/typhoon/#/builders/85/builds/1404/ste=
ps/23/logs/stdio</a><br>
&gt; &gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builde=
rs/85/builds/1403/steps/23/logs/stdio" rel=3D"noreferrer" target=3D"_blank"=
>https://autobuilder.yoctoproject.org/typhoon/#/builders/85/builds/1403/ste=
ps/23/logs/stdio</a><br>
&gt; &gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builde=
rs/85/builds/1402/steps/23/logs/stdio" rel=3D"noreferrer" target=3D"_blank"=
>https://autobuilder.yoctoproject.org/typhoon/#/builders/85/builds/1402/ste=
ps/23/logs/stdio</a><br>
&gt; &gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builde=
rs/85/builds/1401/steps/23/logs/stdio" rel=3D"noreferrer" target=3D"_blank"=
>https://autobuilder.yoctoproject.org/typhoon/#/builders/85/builds/1401/ste=
ps/23/logs/stdio</a><br>
&gt; &gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builde=
rs/83/builds/2076/steps/23/logs/stdio" rel=3D"noreferrer" target=3D"_blank"=
>https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/2076/ste=
ps/23/logs/stdio</a><br>
&gt; &gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builde=
rs/83/builds/2074/steps/23/logs/stdio" rel=3D"noreferrer" target=3D"_blank"=
>https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/2074/ste=
ps/23/logs/stdio</a><br>
&gt; &gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builde=
rs/83/builds/2070/steps/23/logs/stdio" rel=3D"noreferrer" target=3D"_blank"=
>https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/2070/ste=
ps/23/logs/stdio</a><br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; &gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmai=
l.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt;=C2=A0 meta/recipes-devtools/go/go-common.inc | 2 +-<br>
&gt; &gt; &gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; diff --git a/meta/recipes-devtools/go/go-common.inc b/meta/=
recipes-devtools/go/go-common.inc<br>
&gt; &gt; &gt; index 39a681a712..c368b95b69 100644<br>
&gt; &gt; &gt; --- a/meta/recipes-devtools/go/go-common.inc<br>
&gt; &gt; &gt; +++ b/meta/recipes-devtools/go/go-common.inc<br>
&gt; &gt; &gt; @@ -14,7 +14,7 @@ LICENSE =3D &quot;BSD-3-Clause&quot;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 inherit goarch<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; -SRC_URI =3D &quot;<a href=3D"https://golang.org/dl/go$%7BP=
V%7D.src.tar.gz;name=3Dmain" rel=3D"noreferrer" target=3D"_blank">https://g=
olang.org/dl/go${PV}.src.tar.gz;name=3Dmain</a>&quot;<br>
&gt; &gt; &gt; +SRC_URI =3D &quot;<a href=3D"https://dl.google.com/go/go$%=
7BPV%7D.src.tar.gz;name=3Dmain" rel=3D"noreferrer" target=3D"_blank">https:=
//dl.google.com/go/go${PV}.src.tar.gz;name=3Dmain</a>&quot;<br>
&gt; &gt; &gt;=C2=A0 S =3D &quot;${WORKDIR}/go&quot;<br>
&gt; &gt; &gt;=C2=A0 B =3D &quot;${S}&quot;<br>
&gt; &gt; &gt;=C2=A0 UPSTREAM_CHECK_REGEX =3D &quot;(?P&lt;pver&gt;\d+(\.\=
d+)+)\.src\.tar&quot;<br>
&gt; &gt; &gt; --<br>
&gt; &gt; &gt; 2.31.1<br>
&gt; &gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; --<br>
&gt; &gt; Alexandre Belloni, co-owner and COO, Bootlin<br>
&gt; &gt; Embedded Linux and Kernel engineering<br>
&gt; &gt; <a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_bl=
ank">https://bootlin.com</a><br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr=
"><div dir=3D"ltr">Michael Halstead<div>Linux Foundation / Yocto Project</d=
iv><div>Systems Operations Engineer</div></div></div>
</blockquote></div></div>

--0000000000009830c705c134078f--
