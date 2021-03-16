Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web09.96.1615916779877341020
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Mar 2021 10:46:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kROIsGiK;
 spf=pass (domain: gmail.com, ip: 209.85.160.172, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id c6so12266164qtc.1
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Mar 2021 10:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yCw9f7gdvMj+0672TDGinTV8GE//FuMjU2H4SVRFGEA=;
        b=kROIsGiKOrrUB3k//motmLO4ErGoWRo28M8fM/vyulErhA0QfaVgtadGFbAOT+9DLf
         c1bvvWt3ruuhRkpHDoouZ0sKnGGuNRV7R/8kKml6feVCBdEUS3OeahnedajO+Gfc8/sp
         kjqd5czeeKHSr5ba/VpAUJ8udVkpRm5YnGjb1m7UD+bCoOS/KkewUoA1i9qx5ar5F0wg
         a7TQkTk8+uX7jclUsRvk67D54JdyN6QLYtZbaIze3OILRGBF3glFFBv7gd/wl/AjjfiC
         ISCZUh4Eko3ieY5Xywi9/0CDZMlZqrV1vyVWuRDGweacgUgYfF+Cf5PuKx5FNIF8nCTc
         uvlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yCw9f7gdvMj+0672TDGinTV8GE//FuMjU2H4SVRFGEA=;
        b=b8Bu1jHj7ocoYPBAco0A2KpVH6ukTW/LfAWdpX140WxorjyEv/CdblHHeowssdxcOr
         VFGg0xfWriVpymSoz4xpSYcX2wJHgyIPxaX0KM7X+2N8kUH8EaL6gCj727l9IZPZbJTo
         kh6fpsCprw1eSc4NX2T6TvgfUkdB8WUkoVbp+q66+miPPiW/CnIhVDHKkxvQtkYoJGp0
         gmd/j0eXdI2WyXpZYwkCyQ5tl0ZNrwkIugJUrgHvZh7um06m+rKz19SgHFiC3St8UonP
         0YlZumBpNIs0yA2UCXsQzUOFstPVW7x3KmthjhoQJc3yxPWrvbYL8yQe2bXWOIj/amVH
         Da0g==
X-Gm-Message-State: AOAM532/ntxPvnoBptB5ciNFWpqUBTZwo3g6up1Vnxoc+cLoAlETMMuv
	91Oo1eNsvWDav0RYbLMPR5ozY94V7eg72kf6/VM=
X-Google-Smtp-Source: ABdhPJw9BCw0cUSEuKKxdMl1BssItqT220TJAjdJJ9wcqOkbaf1C5rNA+vLHe02bmUFThiCO1nsRxArtw2t4j7KoTPc=
X-Received: by 2002:ac8:6e85:: with SMTP id c5mr17217qtv.299.1615916778767;
 Tue, 16 Mar 2021 10:46:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210311152128.41215-1-khairul.rohaizzat.jamaluddin@intel.com>
 <CAMKF1spX6z9vvv7QNbWhkapX-Z1=FWZVh0W2+OM2qSbxPqQgkQ@mail.gmail.com>
 <DM5PR11MB1322590C6E8F9272ECC912CFDE6F9@DM5PR11MB1322.namprd11.prod.outlook.com>
 <MWHPR11MB1326447A6A6AA12D09952A56DE6F9@MWHPR11MB1326.namprd11.prod.outlook.com>
 <f2d269853c88992f528419d5d20139a42728cada.camel@linux.microsoft.com>
 <20210315213606.GP4892@denix.org> <dd23f3e8-0db6-3f8b-466a-e9c9207c6604@linux.microsoft.com>
 <20210316174433.GF18041@denix.org>
In-Reply-To: <20210316174433.GF18041@denix.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 16 Mar 2021 10:46:08 -0700
Message-ID: <CAMKF1sohtjzU1WwTb6QzPmw_eF88-BYH0Gocka7BUoD-aqEp_A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] glibc: Fix CVE-2021-27645
To: Denys Dmytriyenko <denis@denix.org>
Cc: Anatol Belski <anbelski@linux.microsoft.com>, 
	"Jamaluddin, Khairul Rohaizzat" <khairul.rohaizzat.jamaluddin@intel.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000095c85905bdaaf1b4"

--00000000000095c85905bdaaf1b4
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 16, 2021 at 10:44 AM Denys Dmytriyenko <denis@denix.org> wrote:

> On Tue, Mar 16, 2021 at 01:56:43PM +0100, Anatol Belski wrote:
> > Hi,
> >
> > On 3/15/2021 10:36 PM, Denys Dmytriyenko wrote:
> > >
> https://wiki.yoctoproject.org/wiki/Stable_Release_and_LTS#Stable.2FLTS_Patch_Acceptance_Policies
> > >
> > >Stable/LTS Patch Acceptance Policies
> > >
> > >Potentially Acceptable:
> > >* Bug fix only version upgrades for upstreams with a good stable process
> > >
> > >Unacceptable:
> > >* General version upgrades
> > >
> > >
> > >So, unless there's a bugfix-only minor release of glibc, e.g. 2.31.1,
> > >upgrading to 2.32 or 2.33 in stable branches is highly unlikely, as both
> > >2.32 and 2.33 have long lists of major changes:
> > >
> > >https://sourceware.org/pipermail/libc-announce/2020/000029.html
> > >https://sourceware.org/pipermail/libc-announce/2021/000030.html
> >
> > thanks for linking the LTS doc.
> >
> > My suggestion was to pull the latest upstream from 2.31 actually,
> > not upgrading the glibc version. As per
> >
> >
> http://git.yoctoproject.org/clean/cgit.cgi/poky/tree/meta/recipes-core/glibc/glibc-version.inc?h=dunfell
> >
> > we consume from the branch release/2.31/master. It already contains
> > the backported patch fixing this CVE.
> >
> > There doesn't seem to be a release process in terms of versions, but
> > it regularly receives backports. In fact,
> >
> > there are already some bug and CVE fixes between the current SRCREV
> > used and HEAD.
>
> Thanks for clarifying. In this case HEAD of release/2.31/master might make
> sense.


This is considered a bug fix only release for 2.31 and we have done such
updates on releases in past

>
>
> --
> Regards,
> Denys Dmytriyenko <denis@denix.org>
> PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
> Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
>

--00000000000095c85905bdaaf1b4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Mar 16, 2021 at 10:44 AM Denys Dmytriyenko &lt;<a h=
ref=3D"mailto:denis@denix.org">denis@denix.org</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex">On Tue, Mar 16, 2021 at 01:56:43PM +0100, Anatol=
 Belski wrote:<br>
&gt; Hi,<br>
&gt; <br>
&gt; On 3/15/2021 10:36 PM, Denys Dmytriyenko wrote:<br>
&gt; &gt;<a href=3D"https://wiki.yoctoproject.org/wiki/Stable_Release_and_L=
TS#Stable.2FLTS_Patch_Acceptance_Policies" rel=3D"noreferrer" target=3D"_bl=
ank">https://wiki.yoctoproject.org/wiki/Stable_Release_and_LTS#Stable.2FLTS=
_Patch_Acceptance_Policies</a><br>
&gt; &gt;<br>
&gt; &gt;Stable/LTS Patch Acceptance Policies<br>
&gt; &gt;<br>
&gt; &gt;Potentially Acceptable:<br>
&gt; &gt;* Bug fix only version upgrades for upstreams with a good stable p=
rocess<br>
&gt; &gt;<br>
&gt; &gt;Unacceptable:<br>
&gt; &gt;* General version upgrades<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;So, unless there&#39;s a bugfix-only minor release of glibc, e.g. =
2.31.1,<br>
&gt; &gt;upgrading to 2.32 or 2.33 in stable branches is highly unlikely, a=
s both<br>
&gt; &gt;2.32 and 2.33 have long lists of major changes:<br>
&gt; &gt;<br>
&gt; &gt;<a href=3D"https://sourceware.org/pipermail/libc-announce/2020/000=
029.html" rel=3D"noreferrer" target=3D"_blank">https://sourceware.org/piper=
mail/libc-announce/2020/000029.html</a><br>
&gt; &gt;<a href=3D"https://sourceware.org/pipermail/libc-announce/2021/000=
030.html" rel=3D"noreferrer" target=3D"_blank">https://sourceware.org/piper=
mail/libc-announce/2021/000030.html</a><br>
&gt; <br>
&gt; thanks for linking the LTS doc.<br>
&gt; <br>
&gt; My suggestion was to pull the latest upstream from 2.31 actually,<br>
&gt; not upgrading the glibc version. As per<br>
&gt; <br>
&gt; <a href=3D"http://git.yoctoproject.org/clean/cgit.cgi/poky/tree/meta/r=
ecipes-core/glibc/glibc-version.inc?h=3Ddunfell" rel=3D"noreferrer" target=
=3D"_blank">http://git.yoctoproject.org/clean/cgit.cgi/poky/tree/meta/recip=
es-core/glibc/glibc-version.inc?h=3Ddunfell</a><br>
&gt; <br>
&gt; we consume from the branch release/2.31/master. It already contains<br=
>
&gt; the backported patch fixing this CVE.<br>
&gt; <br>
&gt; There doesn&#39;t seem to be a release process in terms of versions, b=
ut<br>
&gt; it regularly receives backports. In fact,<br>
&gt; <br>
&gt; there are already some bug and CVE fixes between the current SRCREV<br=
>
&gt; used and HEAD.<br>
<br>
Thanks for clarifying. In this case HEAD of release/2.31/master might make =
<br>
sense.</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">This is co=
nsidered a bug fix only release for 2.31 and we have done such updates on r=
eleases in past=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex" dir=3D"auto"><br>
<br>
-- <br>
Regards,<br>
Denys Dmytriyenko &lt;<a href=3D"mailto:denis@denix.org" target=3D"_blank">=
denis@denix.org</a>&gt;<br>
PGP: 0x420902729A92C964 - <a href=3D"https://denix.org/0x420902729A92C964" =
rel=3D"noreferrer" target=3D"_blank">https://denix.org/0x420902729A92C964</=
a><br>
Fingerprint: 25FC E4A5 8A72 2F69 1186=C2=A0 6D76 4209 0272 9A92 C964<br>
</blockquote></div></div>

--00000000000095c85905bdaaf1b4--
