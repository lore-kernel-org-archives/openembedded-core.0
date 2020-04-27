Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.1865.1588013675929284421
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Apr 2020 11:54:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista-com.20150623.gappssmtp.com header.s=20150623 header.b=kBEdf4v2;
 spf=permerror, err=parse error for token &{10 18 websitewelcome.com}: parse error for token &{10 18 _spf.google.com}: limit exceeded (domain: mvista.com, ip: 209.85.128.45, mailfrom: rahulk@mvista.com)
Received: by mail-wm1-f45.google.com with SMTP id e26so50931wmk.5
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2020 11:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=HTNcbThxgBRC1bwRvUAxsPRhlTqUQzT6b9TpWFLqBTg=;
        b=kBEdf4v2BGfFEnj8zMuyI+9sO5omrdHHv7fF0S+eOemGFcSqZn2GH1dJ3+HhBNZ743
         t5M65FUDrZthEKba3etPJVpnKNwOqk8bZpvZRCp8lScx6jemu8MuavN64hN8NuhloYhN
         HEMPjh+uOwo7yBjdITbbFh6TQWPZar3MyZPnGeSSsFfnp+hkHq6Rsd+8sWJURfVPZesZ
         zrK1IlB9XICuYLxPsy8ZrCxo9UsdEe1BTD+JElX6a1SYladWAycr6j8zPnMmHWjj4oqd
         WbR6w0v1XZtjUoCGty5A9crfYg4QzsCscZ6M13yJPMZYcJujK7GS4hXL9draJg/vJwO9
         VuUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=HTNcbThxgBRC1bwRvUAxsPRhlTqUQzT6b9TpWFLqBTg=;
        b=B1ho8U1BXvUMBWJzNegQZoYIlgBkCJzVa96vo1lhohFM1va9TeU3uP+oFtdgH9vc2F
         Crw75vmmM7QHo1FnvgZOsXMsHAzNIEJ8qaQ42nNsFl/dDd5VzlygA4uP7vpFFHPcROdA
         cH/a3MM0AU8hi8PBLG68SD90a5DJClVh7fqfXSHVQF6z6lkgPu36W7ztz7aCgLMCZEKS
         mw3fLBhbznYZEPMrGVvEtbKeRYBFTOH2vGFK1IUviG2HJhKxv5sCmJYkDNcc3l1eC0UA
         yJ3AxvJrjmvFYoITHPKM8hwCISh2Oi6THkAliEbQHZPBg3n8xLGVbQ51KUXXlrekh6kM
         insA==
X-Gm-Message-State: AGi0PuY+BX/weNRJGJIJKMV64htXoaRfrdShNUZFdngjIrlkMRFGigr6
	waYltULIHryxWKJY9VqgfvpwbnNcDRH2l4GxL5aR2g==
X-Google-Smtp-Source: APiQypKSFQJlnSkW7wMMcMd16M5UtaKqlc4Z6kba+m5b6BagxwcmqYscLB8X6h0RcFvZuxNMLokVOVetgsfGfHgzNDk=
X-Received: by 2002:a1c:9e51:: with SMTP id h78mr58915wme.177.1588013674457;
 Mon, 27 Apr 2020 11:54:34 -0700 (PDT)
MIME-Version: 1.0
References: <1587667187-14130-1-git-send-email-rahulk@mvista.com>
 <e4d2de1d300677bf61ec737d8847dd7dea967840.camel@linuxfoundation.org>
 <CANv91vNTDMES=ZCWUsEDWycsBW1kyy_dWNc62+93GozCMz1kUw@mail.gmail.com>
 <CANNYZj_61NP5ZSVHA5UWJN_s86esbc-1nEu2gDdmvMn6AGqRAg@mail.gmail.com> <543d70c2321008a46e4f21bf84fd3963624e655b.camel@linuxfoundation.org>
In-Reply-To: <543d70c2321008a46e4f21bf84fd3963624e655b.camel@linuxfoundation.org>
From: "Rahul Kumar" <rahulk@mvista.com>
Date: Tue, 28 Apr 2020 00:24:22 +0530
Message-ID: <CANv91vOeLhAdf5RVzQ6Ftc+Y4eQH963BYcEVfmMJaKcYg_GFTw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] bzip2: Add test suite for bzip2
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Alexander Kanavin <alex.kanavin@gmail.com>, OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000f6ff7e05a44a3ebb"

--000000000000f6ff7e05a44a3ebb
Content-Type: text/plain; charset="UTF-8"

Hi Richard/Alexander,

I am not able to understand how I can use the below file.
http://git.yoctoproject.org/cgit/cgit.cgi/yocto-autobuilder-helper/tree/config.json

did you mean to say that i have to set MACRO in local.conf based on this
file.

*Thanks & Regards,*
Rahul Kumar
Software Engineer,Linux Solutions Engineering
Group,Montavista Software LLC
Email Id: rahulk@mvista.com
<https://plus.google.com/+CodeTwoSoftware>


On Mon, Apr 27, 2020 at 11:46 PM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Mon, 2020-04-27 at 18:30 +0200, Alexander Kanavin wrote:
> > You need to look at configurations defined here:
> >
> http://git.yoctoproject.org/cgit/cgit.cgi/yocto-autobuilder-helper/tree/config.json
> > and replicate them locally. Then you can reproduce the failures that
> > the AB gets in those configurations.
>
> That start of the failing logs on the autobuilder also list out the
> configuration options for that build.
>
> Cheers,
>
> Richard
>
>

--000000000000f6ff7e05a44a3ebb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:verdana,=
sans-serif;color:#0b5394">Hi Richard/Alexander,<br><br>I am not able to und=
erstand how I can use the below file.<br><a href=3D"http://git.yoctoproject=
.org/cgit/cgit.cgi/yocto-autobuilder-helper/tree/config.json">http://git.yo=
ctoproject.org/cgit/cgit.cgi/yocto-autobuilder-helper/tree/config.json</a><=
br><br>did you mean to say that i have to set MACRO in local.conf based on =
this file.<br clear=3D"all"></div><div class=3D"gmail_default" style=3D"fon=
t-family:verdana,sans-serif;color:#0b5394"><br></div><div><div dir=3D"ltr" =
class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"lt=
r"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><=
div dir=3D"ltr"><div><div dir=3D"ltr"><div><span style=3D"color:rgb(111,168=
,220)">	=09
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
 2020 at 11:46 PM Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linux=
foundation.org">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">On Mon, 2020-04-27 at 18:=
30 +0200, Alexander Kanavin wrote:<br>
&gt; You need to look at configurations defined here:<br>
&gt; <a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/yocto-autobuilder=
-helper/tree/config.json" rel=3D"noreferrer" target=3D"_blank">http://git.y=
octoproject.org/cgit/cgit.cgi/yocto-autobuilder-helper/tree/config.json</a>=
<br>
&gt; and replicate them locally. Then you can reproduce the failures that<b=
r>
&gt; the AB gets in those configurations.<br>
<br>
That start of the failing logs on the autobuilder also list out the<br>
configuration options for that build.<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div>

--000000000000f6ff7e05a44a3ebb--
