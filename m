Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web11.833.1588004736452917762
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Apr 2020 09:25:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista-com.20150623.gappssmtp.com header.s=20150623 header.b=UIG/1RfT;
 spf=permerror, err=parse error for token &{10 18 websitewelcome.com}: parse error for token &{10 18 _spf.google.com}: limit exceeded (domain: mvista.com, ip: 209.85.221.67, mailfrom: rahulk@mvista.com)
Received: by mail-wr1-f67.google.com with SMTP id b11so21276085wrs.6
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2020 09:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XuGtpmLfq6RgPVSsy/dd3Np3CiMku1yAsN1yaMdHSG0=;
        b=UIG/1RfTGS+54coPZp8qnbCd2MN8DzcS61/G4Vk9EeDUt1/yQo+a2L0e6lC70z0Ucf
         HbLUTZL9ytTfqU2Hn3QPRIgig1urAWOhz98F90fpWNGCTfblzAkISRW5UkJqY3+4rLra
         7qO1QOBLboaY3z6Ouw4WCl0MwGPdqak+P1lM8Mm1Z0BLCtoUB78Mg+F3GEfZStyY+ww2
         keN9zSC5Dl8+wIRbEnS98osLDoU4rlyRVIVtXv657pFxETH4Xtr+szhXlRVDw5QEsvFI
         wKqDUryczQQUIXkAHCC475+hR7JeW4qEhLLrELxR36EO11n9ghROJXQu5dIZ08kstorZ
         tNuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XuGtpmLfq6RgPVSsy/dd3Np3CiMku1yAsN1yaMdHSG0=;
        b=qdXyyWA9xgy3zAmiVFlTpRNiabywUR7aJy5r770E0DHXsqAzF4/ZBa5B5nb0Vwynmg
         7H0AIJ+V7B6kMLcRpBxOr5MnOn8epvrmKJDQAp+NJXLdYVyExJ3nus8G/Tq4tUYMZqfr
         n46WDj+qo8hp+ZoaEMtR9Oap2aFVE9xCfc6uyhQ3QTHLYIeJTocdYgBlklcskZ+f/20W
         h9yo+HdXyNkcwyH68fSQf8iV0YF3LRd20N/2tRG8ewvThLcQpOSbbVcUL726T7dnPeF2
         mhBBvVbmYnIqXSG5cyNniYmTV2crFtYaoi5w8PB7ipI0Istiho3KOrvcys7yzLUnZm1t
         NQuw==
X-Gm-Message-State: AGi0PuZeQNL/0MsQ6TawoQM7ucPq/kVgIlC9E0td6+Z+IxAs7rk/rsTp
	0bvGTsaEr9nYmUJ0F4V/ULPpIhoZejbbLWCTKU/0vQ==
X-Google-Smtp-Source: APiQypJnPVVwb4bjIVuucQD/UraLOIRvoHqhp4ZecahdbfwyqSPzM46XklIkZ7FZaUQ4GYByAjEm47LH9t56KbUtOdY=
X-Received: by 2002:a5d:688f:: with SMTP id h15mr28483083wru.352.1588004734884;
 Mon, 27 Apr 2020 09:25:34 -0700 (PDT)
MIME-Version: 1.0
References: <1587667187-14130-1-git-send-email-rahulk@mvista.com> <e4d2de1d300677bf61ec737d8847dd7dea967840.camel@linuxfoundation.org>
In-Reply-To: <e4d2de1d300677bf61ec737d8847dd7dea967840.camel@linuxfoundation.org>
From: "Rahul Kumar" <rahulk@mvista.com>
Date: Mon, 27 Apr 2020 21:55:23 +0530
Message-ID: <CANv91vNTDMES=ZCWUsEDWycsBW1kyy_dWNc62+93GozCMz1kUw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] bzip2: Add test suite for bzip2
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000001ff61405a4482a79"

--0000000000001ff61405a4482a79
Content-Type: text/plain; charset="UTF-8"

Hi Richard,

With this patch I am able to build core-image-minimal without any
Error/Warning in my system.
Can you please suggest to me, how can i reproduce this issue in my system
during build?

*Thanks & Regards,*
Rahul Kumar
Software Engineer,Linux Solutions Engineering
Group,Montavista Software LLC
Email Id: rahulk@mvista.com
<https://plus.google.com/+CodeTwoSoftware>


On Mon, Apr 27, 2020 at 8:39 PM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Fri, 2020-04-24 at 00:09 +0530, Rahul Kumar wrote:
> > Source: git://sourceware.org/git/bzip2-tests.git
> > Type: Enhancement
> > Description:
> > bzip2 now has a test suite available at
> > git://sourceware.org/git/bzip2-tests.git.
> >
> > This is a collection of "interesting" .bz2 files that can be used to
> > test bzip2 works correctly. They come from different projects.
> >
> > Some files are deliberately bad, and are use to see how bzip2 handles
> > corrupt files. They are explicitly not intended to decompress
> > correctly,
> > but to catch errors in bzip2 trying to deal with deliberately bad
> > data.
> > All such files have a name ending in .bz2.bad.
> >
> > All non-bad files end in bz2. And should come with a .md5 file for
> > the original input file. The .md5 file is used to check that bzip2
> > could correctly decompress the file. The original (non-compressed)
> > files are deliberately not checked in.
> >
> > It will by default test with the command 'bzip2', running under
> > valgrind (if installed on the system).
> >
> > For each .bz2 file found it is decompressed, recompressed and
> > decompressed again. Once with the default bzip2 settings and
> > once in --small (-s) mode.
> >
> > For each .bz2.bad file decompression is tried twice also. In
> > default mode and small mode. The bzip2 binary is expected to
> > return either 1 or 2 as exit status. Any other exit code is
> > interpreted as failure.
>
> I did try running this on the autobuilder. There are a few issues.
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/62/builds/1816
> step1b
> <https://autobuilder.yoctoproject.org/typhoon/#/builders/62/builds/1816step1b>:
> ERROR: bzip2-1.0.8-r0 do_package_qa: QA Issue:
> /usr/lib/bzip2/ptest/bzip2-tests/.git/hooks/fsmonitor-watchman.sample
> contained in package bzip2-ptest requires /usr/bin/perl, but no providers
> found in RDEPENDS_bzip2-ptest? [file-rdeps]
> step1b: ERROR: bzip2-1.0.8-r0 do_package_qa: QA run found fatal errors.
> Please consider fixing them.
>
> also, the new license (GPLv3) causes problems:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/75/builds/1814
>
> Cheers,
>
> Richard
>
>
>
>

--0000000000001ff61405a4482a79
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:verdana,=
sans-serif;color:#0b5394">Hi Richard,<br><br>With this patch I am able to b=
uild core-image-minimal without any Error/Warning in my system.<br>Can you =
please suggest to me, how can=C2=A0i reproduce this issue in my system duri=
ng=C2=A0build?<br><br clear=3D"all"></div><div><div dir=3D"ltr" data-smartm=
ail=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div di=
r=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"=
><div><span style=3D"color:rgb(111,168,220)">	=09
  =09
 =20
   <b><span style=3D"color:rgb(11,83,148)">Thanks &amp; Regards,</span></b>=
</span></div><div><span style=3D"color:rgb(111,168,220)"><span style=3D"col=
or:rgb(11,83,148)"></span></span><span style=3D"color:rgb(111,168,220)"><sp=
an style=3D"color:rgb(11,83,148)"></span></span></div><div><span style=3D"c=
olor:rgb(111,168,220)"><span style=3D"color:rgb(11,83,148)">Rahul Kumar</sp=
an></span></div><div><span style=3D"color:rgb(11,83,148)">Software Engineer=
,Linux Solutions Engineering</span></div><div><span style=3D"color:rgb(11,8=
3,148)"> Group,Montavista Software LLC</span></div><div><span style=3D"colo=
r:rgb(11,83,148)">Email Id: <span style=3D"font-size:10pt"><a href=3D"mailt=
o:rahulk@mvista.com" target=3D"_blank">rahulk@mvista.com</a></span></span><=
span><a href=3D"https://plus.google.com/+CodeTwoSoftware" rel=3D"noopener" =
target=3D"_blank"><span style=3D"font-family:Verdana,sans-serif;font-size:1=
0pt;color:rgb(42,42,42)"><br></span></a></span></div></div></div></div></di=
v></div></div></div></div></div></div></div></div></div><br></div><br><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Apr 27,=
 2020 at 8:39 PM Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxf=
oundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Fri, =
2020-04-24 at 00:09 +0530, Rahul Kumar wrote:<br>
&gt; Source: git://<a href=3D"http://sourceware.org/git/bzip2-tests.git" re=
l=3D"noreferrer" target=3D"_blank">sourceware.org/git/bzip2-tests.git</a><b=
r>
&gt; Type: Enhancement<br>
&gt; Description:<br>
&gt; bzip2 now has a test suite available at<br>
&gt; git://<a href=3D"http://sourceware.org/git/bzip2-tests.git" rel=3D"nor=
eferrer" target=3D"_blank">sourceware.org/git/bzip2-tests.git</a>.<br>
&gt; <br>
&gt; This is a collection of &quot;interesting&quot; .bz2 files that can be=
 used to<br>
&gt; test bzip2 works correctly. They come from different projects.<br>
&gt; <br>
&gt; Some files are deliberately bad, and are use to see how bzip2 handles<=
br>
&gt; corrupt files. They are explicitly not intended to decompress<br>
&gt; correctly,<br>
&gt; but to catch errors in bzip2 trying to deal with deliberately bad<br>
&gt; data.<br>
&gt; All such files have a name ending in .bz2.bad.<br>
&gt; <br>
&gt; All non-bad files end in bz2. And should come with a .md5 file for<br>
&gt; the original input file. The .md5 file is used to check that bzip2<br>
&gt; could correctly decompress the file. The original (non-compressed)<br>
&gt; files are deliberately not checked in.<br>
&gt; <br>
&gt; It will by default test with the command &#39;bzip2&#39;, running unde=
r<br>
&gt; valgrind (if installed on the system).<br>
&gt; <br>
&gt; For each .bz2 file found it is decompressed, recompressed and<br>
&gt; decompressed again. Once with the default bzip2 settings and<br>
&gt; once in --small (-s) mode.<br>
&gt; <br>
&gt; For each .bz2.bad file decompression is tried twice also. In<br>
&gt; default mode and small mode. The bzip2 binary is expected to<br>
&gt; return either 1 or 2 as exit status. Any other exit code is<br>
&gt; interpreted as failure.<br>
<br>
I did try running this on the autobuilder. There are a few issues.<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/62/build=
s/1816step1b" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoct=
oproject.org/typhoon/#/builders/62/builds/1816<br>
step1b</a>: ERROR: bzip2-1.0.8-r0 do_package_qa: QA Issue: /usr/lib/bzip2/p=
test/bzip2-tests/.git/hooks/fsmonitor-watchman.sample contained in package =
bzip2-ptest requires /usr/bin/perl, but no providers found in RDEPENDS_bzip=
2-ptest? [file-rdeps]<br>
step1b: ERROR: bzip2-1.0.8-r0 do_package_qa: QA run found fatal errors. Ple=
ase consider fixing them.<br>
<br>
also, the new license (GPLv3) causes problems:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/75/build=
s/1814" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/75/builds/1814</a><br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
<br>
</blockquote></div>

--0000000000001ff61405a4482a79--
