Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web12.10071.1611654870336712650
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jan 2021 01:54:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=1Nx50Jmx;
 spf=pass (domain: burtonini.com, ip: 209.85.167.46, mailfrom: ross@burtonini.com)
Received: by mail-lf1-f46.google.com with SMTP id a12so13796609lfb.1
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Jan 2021 01:54:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RavOdcrNrzXr1EzVp2EVLshzPa3JG1m1GlGGeS8tk0g=;
        b=1Nx50Jmx0vNtQ2Fw82T9ajj36KGgrEYRdb7cH52o38NoARV+3fDwNlDfMKJh/EefUb
         bm3lf//knnCJtUl0pZ7MK9Smpz7hrFZWjfXeOU6Z6NOC63S6Wb0TXfpOtiseJzVtrOAv
         IwTPNj3+lrYbfL/+GuEwZSTeiosikknUemjxybRofKowkJqWKG8UrqVbLBZSehYG74ig
         oZYiOfhtIAB9/k7sSNYhVrU4dqZk2Coe1FYH79ZY4mu5Nlc/AUT3aSGHW3BP6Se8WLyd
         ZSuVKgiQCxYNkxfF+q77mucUwLmy0LAbjxMjv7nWJz4hNF/qSxe00wnW7FlbDumXH6xo
         EdVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RavOdcrNrzXr1EzVp2EVLshzPa3JG1m1GlGGeS8tk0g=;
        b=KMTzM/THqBCPJLz9t0+CZR41cPvmY/0qUDzRINmAsAOaQR5btRBfrWG4IYCacywLFZ
         MXSfdi8UhbV2+wT4+7DzwqbOpThePRqKgxI/7dM+RQpAqihLdhxFKJbWvJwet/g7mlwM
         eRptgBYm+jDv/GMncKbkomNfyFQNsu/EdI5hP8F4HLHmC+9r2NMlfJvTqB1ptKOsezru
         Xa0HdU0K7h+yLJfpWeatz6qBg2UucX784TnNlnadc7aXXzthUjro3bqR8QQA9OYbaybK
         GJLMXE99Fj0Mdm5myMyz6Sn5Q/pPuVV3H8KPtcJWgi3IxCuzmlCOzTQ8LF6LL5zjTJSy
         CFxw==
X-Gm-Message-State: AOAM532yYeXizkxoiAWaMk97FwnQxk/9P5TmJzE9aoI3aovbdcybXMZb
	BhtKh29oHo5rYuPZwadG+buq1MP4h1KFe4ui/6E9lw==
X-Google-Smtp-Source: ABdhPJxbvSk47HF+XY9i5ZaaKmxP8QYeieLsRriMd47BZRrZl3TPj8kYfaNhoZc/nJAnsKkAhqsGDXHwiM+Z6kvMWLw=
X-Received: by 2002:a05:6512:695:: with SMTP id t21mr2234523lfe.61.1611654868328;
 Tue, 26 Jan 2021 01:54:28 -0800 (PST)
MIME-Version: 1.0
References: <20210124171809.D838F960256@nuc.router0800d9.com>
 <cc80f8541aeef99a4625420fbf7d27dcc6abf341.camel@linuxfoundation.org>
 <MWHPR11MB20005F089BE21737CFA246E7B9BD9@MWHPR11MB2000.namprd11.prod.outlook.com>
 <0d314728a5aceabe78e9d61bfe257d69396b23e3.camel@linuxfoundation.org> <MWHPR11MB2000D61465E2D74D9209E7DDB9BC9@MWHPR11MB2000.namprd11.prod.outlook.com>
In-Reply-To: <MWHPR11MB2000D61465E2D74D9209E7DDB9BC9@MWHPR11MB2000.namprd11.prod.outlook.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Tue, 26 Jan 2021 09:54:17 +0000
Message-ID: <CAAnfSTuE45wUNr2BSDa3GfL2etkEvh9GDpEThCju5B-wFYD6Ew@mail.gmail.com>
Subject: Re: [OE-core] [yocto-security] OE-core CVE metrics for master on Sun 24 Jan 2021 07:15:01 AM HST
To: Lee Chee Yang <chee.yang.lee@intel.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, Steve Sakoman <steve@sakoman.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"yocto-security@lists.yoctoproject.org" <yocto-security@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000ed769405b9caa3e5"

--000000000000ed769405b9caa3e5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Versions using a single character for patch level isn=E2=80=99t rare, and O=
penSSL
is high impact. Can we special case these in the parser?

Ross

On Tue, 26 Jan 2021 at 03:55, Lee Chee Yang <chee.yang.lee@intel.com> wrot=
e:

> for this case the new changes only consider 1.1.1 from both 1.1.1i  and
> 1.1.1b , do not takes the trailing "i" and "b" when comparing them , so
> these 2 version are treated as same version ( 1.1.1 ) when comparing the=
m.
>
> I expected this although knowing that compare version in this way can
> falsely report more CVE, but this can capture some corner case.
>
> >-----Original Message-----
> >From: Richard Purdie <richard.purdie@linuxfoundation.org>
> >Sent: Tuesday, 26 January, 2021 6:10 AM
> >To: Lee, Chee Yang <chee.yang.lee@intel.com>; Steve Sakoman
> ><steve@sakoman.com>; openembedded-core@lists.openembedded.org; yocto-
> >security@lists.yoctoproject.org
> >Subject: Re: [yocto-security] OE-core CVE metrics for master on Sun 24
> Jan 2021
> >07:15:01 AM HST
> >
> >I'm not sure its working. For example:
> >
> >https://nvd.nist.gov/vuln/detail/CVE-2019-1543
> >
> >which says it applies to:
> >
> >1.1.0 to 1.1.0j
> >and
> >1.1.1 to 1.1.1b
> >
> >Master has 1.1.1i which is greater than 1.1.1b so we shouldn't be shown
> as at risk
> >yet the CVE is listed.
> >
> >Cheers,
> >
> >Richard
> >
> >On Mon, 2021-01-25 at 02:39 +0000, Lee, Chee Yang wrote:
> >> The changes expose these, it ignored trailing character in this
> >> version compare ( "i" in this case for openssl_1.1.1i )
> >> (CVE-2019-1543, CVE-2019-1547, CVE-2019-1549, CVE-2019-1551,
> >> CVE-2019-1552, CVE-2019-1563, CVE-2020-1967, CVE-2020-1971) behave
> >> this way because its difficult to define the trailing characters (lik=
e
> >> version 1.1b can be 1.1 beta or patched release 1.1b)
> >>
> >>
> >> NVD just updated these recently
> >> CVE-2013-0800, CVE-2020-14409, CVE-2020-14410
> >>
> >>
> >>
> >> > -----Original Message-----
> >> > From: Richard Purdie <richard.purdie@linuxfoundation.org>
> >> > Sent: Monday, 25 January, 2021 7:21 AM
> >> > To: Steve Sakoman <steve@sakoman.com>; openembedded-
> >> > core@lists.openembedded.org; yocto-security@lists.yoctoproject.org
> >> > Cc: Lee, Chee Yang <chee.yang.lee@intel.com>
> >> > Subject: Re: [yocto-security] OE-core CVE metrics for master on Sun
> >> > 24 Jan 2021
> >> > 07:15:01 AM HST
> >> >
> >> > On Sun, 2021-01-24 at 07:18 -1000, Steve Sakoman wrote:
> >> > > Branch: master
> >> > >
> >> > > New this week:
> >> > > CVE-2013-0800: pixman
> >> > > https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2013-0800 =
*
> >> > > CVE-2019-1543: openssl
> >> > > https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2019-1543 =
*
> >> > > CVE-2019-1547: openssl
> >> > > https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2019-1547 =
*
> >> > > CVE-2019-1549: openssl
> >> > > https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2019-1549 =
*
> >> > > CVE-2019-1551: openssl
> >> > > https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2019-1551 =
*
> >> > > CVE-2019-1552: openssl
> >> > > https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2019-1552 =
*
> >> > > CVE-2019-1563: openssl
> >> > > https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2019-1563 =
*
> >> > > CVE-2020-14409: libsdl2
> >> > > https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2020-14409=
 *
> >> > > CVE-2020-14410: libsdl2
> >> > > https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2020-14410=
 *
> >> > > CVE-2020-1967: openssl
> >> > > https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2020-1967 =
*
> >> > > CVE-2020-1971: openssl
> >> > > https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2020-1971 =
*
> >> >
> >> > Adding Chee Yang, did the recent cve-check change mean some version
> >> > comparisons regressed and exposed CVEs that shouldn't be in this
> >> > list, or were we making some we need to fix? Or did some other chan=
ge
> >expose these?
> >> >
> >> > Cheers,
> >> >
> >> > Richard
> >> >
> >> >
> >>
> >>
> >
>
>
>=20
>
>

--000000000000ed769405b9caa3e5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Versions using a single character for patch level isn=E2=
=80=99t rare, and OpenSSL is high impact. Can we special case these in the=
 parser?</div><div dir=3D"auto"><br></div><div dir=3D"auto">Ross</div><div>=
<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue=
, 26 Jan 2021 at 03:55, Lee Chee Yang &lt;<a href=3D"mailto:chee.yang.lee@i=
ntel.com">chee.yang.lee@intel.com</a>&gt; wrote:<br></div><blockquote class=
=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex">for this case the new changes only consider 1.1.1 from both =
1.1.1i=C2=A0 and 1.1.1b , do not takes the trailing &quot;i&quot; and &quot=
;b&quot; when comparing them , so these 2 version are treated as same versi=
on ( 1.1.1 ) when comparing them. <br>
<br>
I expected this although knowing that compare version in this way can fals=
ely report more CVE, but this can capture some corner case.<br>
<br>
&gt;-----Original Message-----<br>
&gt;From: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundat=
ion.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<br>
&gt;Sent: Tuesday, 26 January, 2021 6:10 AM<br>
&gt;To: Lee, Chee Yang &lt;<a href=3D"mailto:chee.yang.lee@intel.com" targ=
et=3D"_blank">chee.yang.lee@intel.com</a>&gt;; Steve Sakoman<br>
&gt;&lt;<a href=3D"mailto:steve@sakoman.com" target=3D"_blank">steve@sakom=
an.com</a>&gt;; <a href=3D"mailto:openembedded-core@lists.openembedded.org"=
 target=3D"_blank">openembedded-core@lists.openembedded.org</a>; yocto-<br>
&gt;<a href=3D"mailto:security@lists.yoctoproject.org" target=3D"_blank">s=
ecurity@lists.yoctoproject.org</a><br>
&gt;Subject: Re: [yocto-security] OE-core CVE metrics for master on Sun 24=
 Jan 2021<br>
&gt;07:15:01 AM HST<br>
&gt;<br>
&gt;I&#39;m not sure its working. For example:<br>
&gt;<br>
&gt;<a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2019-1543" rel=3D"nore=
ferrer" target=3D"_blank">https://nvd.nist.gov/vuln/detail/CVE-2019-1543</a=
><br>
&gt;<br>
&gt;which says it applies to:<br>
&gt;<br>
&gt;1.1.0 to 1.1.0j<br>
&gt;and<br>
&gt;1.1.1 to 1.1.1b<br>
&gt;<br>
&gt;Master has 1.1.1i which is greater than 1.1.1b so we shouldn&#39;t be =
shown as at risk<br>
&gt;yet the CVE is listed.<br>
&gt;<br>
&gt;Cheers,<br>
&gt;<br>
&gt;Richard<br>
&gt;<br>
&gt;On Mon, 2021-01-25 at 02:39 +0000, Lee, Chee Yang wrote:<br>
&gt;&gt; The changes expose these, it ignored trailing character in this<b=
r>
&gt;&gt; version compare ( &quot;i&quot; in this case for openssl_1.1.1i )=
<br>
&gt;&gt; (CVE-2019-1543, CVE-2019-1547, CVE-2019-1549, CVE-2019-1551,<br>
&gt;&gt; CVE-2019-1552, CVE-2019-1563, CVE-2020-1967, CVE-2020-1971) behav=
e<br>
&gt;&gt; this way because its difficult to define the trailing characters =
(like<br>
&gt;&gt; version 1.1b can be 1.1 beta or patched release 1.1b)<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; NVD just updated these recently<br>
&gt;&gt; CVE-2013-0800, CVE-2020-14409, CVE-2020-14410<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; &gt; -----Original Message-----<br>
&gt;&gt; &gt; From: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@li=
nuxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>=
&gt;<br>
&gt;&gt; &gt; Sent: Monday, 25 January, 2021 7:21 AM<br>
&gt;&gt; &gt; To: Steve Sakoman &lt;<a href=3D"mailto:steve@sakoman.com" t=
arget=3D"_blank">steve@sakoman.com</a>&gt;; openembedded-<br>
&gt;&gt; &gt; <a href=3D"mailto:core@lists.openembedded.org" target=3D"_bl=
ank">core@lists.openembedded.org</a>; <a href=3D"mailto:yocto-security@list=
s.yoctoproject.org" target=3D"_blank">yocto-security@lists.yoctoproject.org=
</a><br>
&gt;&gt; &gt; Cc: Lee, Chee Yang &lt;<a href=3D"mailto:chee.yang.lee@intel=
.com" target=3D"_blank">chee.yang.lee@intel.com</a>&gt;<br>
&gt;&gt; &gt; Subject: Re: [yocto-security] OE-core CVE metrics for master=
 on Sun<br>
&gt;&gt; &gt; 24 Jan 2021<br>
&gt;&gt; &gt; 07:15:01 AM HST<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; On Sun, 2021-01-24 at 07:18 -1000, Steve Sakoman wrote:<br>
&gt;&gt; &gt; &gt; Branch: master<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; New this week:<br>
&gt;&gt; &gt; &gt; CVE-2013-0800: pixman<br>
&gt;&gt; &gt; &gt; <a href=3D"https://web.nvd.nist.gov/view/vuln/detail?vu=
lnId=3DCVE-2013-0800" rel=3D"noreferrer" target=3D"_blank">https://web.nvd.=
nist.gov/view/vuln/detail?vulnId=3DCVE-2013-0800</a> *<br>
&gt;&gt; &gt; &gt; CVE-2019-1543: openssl<br>
&gt;&gt; &gt; &gt; <a href=3D"https://web.nvd.nist.gov/view/vuln/detail?vu=
lnId=3DCVE-2019-1543" rel=3D"noreferrer" target=3D"_blank">https://web.nvd.=
nist.gov/view/vuln/detail?vulnId=3DCVE-2019-1543</a> *<br>
&gt;&gt; &gt; &gt; CVE-2019-1547: openssl<br>
&gt;&gt; &gt; &gt; <a href=3D"https://web.nvd.nist.gov/view/vuln/detail?vu=
lnId=3DCVE-2019-1547" rel=3D"noreferrer" target=3D"_blank">https://web.nvd.=
nist.gov/view/vuln/detail?vulnId=3DCVE-2019-1547</a> *<br>
&gt;&gt; &gt; &gt; CVE-2019-1549: openssl<br>
&gt;&gt; &gt; &gt; <a href=3D"https://web.nvd.nist.gov/view/vuln/detail?vu=
lnId=3DCVE-2019-1549" rel=3D"noreferrer" target=3D"_blank">https://web.nvd.=
nist.gov/view/vuln/detail?vulnId=3DCVE-2019-1549</a> *<br>
&gt;&gt; &gt; &gt; CVE-2019-1551: openssl<br>
&gt;&gt; &gt; &gt; <a href=3D"https://web.nvd.nist.gov/view/vuln/detail?vu=
lnId=3DCVE-2019-1551" rel=3D"noreferrer" target=3D"_blank">https://web.nvd.=
nist.gov/view/vuln/detail?vulnId=3DCVE-2019-1551</a> *<br>
&gt;&gt; &gt; &gt; CVE-2019-1552: openssl<br>
&gt;&gt; &gt; &gt; <a href=3D"https://web.nvd.nist.gov/view/vuln/detail?vu=
lnId=3DCVE-2019-1552" rel=3D"noreferrer" target=3D"_blank">https://web.nvd.=
nist.gov/view/vuln/detail?vulnId=3DCVE-2019-1552</a> *<br>
&gt;&gt; &gt; &gt; CVE-2019-1563: openssl<br>
&gt;&gt; &gt; &gt; <a href=3D"https://web.nvd.nist.gov/view/vuln/detail?vu=
lnId=3DCVE-2019-1563" rel=3D"noreferrer" target=3D"_blank">https://web.nvd.=
nist.gov/view/vuln/detail?vulnId=3DCVE-2019-1563</a> *<br>
&gt;&gt; &gt; &gt; CVE-2020-14409: libsdl2<br>
&gt;&gt; &gt; &gt; <a href=3D"https://web.nvd.nist.gov/view/vuln/detail?vu=
lnId=3DCVE-2020-14409" rel=3D"noreferrer" target=3D"_blank">https://web.nvd=
.nist.gov/view/vuln/detail?vulnId=3DCVE-2020-14409</a> *<br>
&gt;&gt; &gt; &gt; CVE-2020-14410: libsdl2<br>
&gt;&gt; &gt; &gt; <a href=3D"https://web.nvd.nist.gov/view/vuln/detail?vu=
lnId=3DCVE-2020-14410" rel=3D"noreferrer" target=3D"_blank">https://web.nvd=
.nist.gov/view/vuln/detail?vulnId=3DCVE-2020-14410</a> *<br>
&gt;&gt; &gt; &gt; CVE-2020-1967: openssl<br>
&gt;&gt; &gt; &gt; <a href=3D"https://web.nvd.nist.gov/view/vuln/detail?vu=
lnId=3DCVE-2020-1967" rel=3D"noreferrer" target=3D"_blank">https://web.nvd.=
nist.gov/view/vuln/detail?vulnId=3DCVE-2020-1967</a> *<br>
&gt;&gt; &gt; &gt; CVE-2020-1971: openssl<br>
&gt;&gt; &gt; &gt; <a href=3D"https://web.nvd.nist.gov/view/vuln/detail?vu=
lnId=3DCVE-2020-1971" rel=3D"noreferrer" target=3D"_blank">https://web.nvd.=
nist.gov/view/vuln/detail?vulnId=3DCVE-2020-1971</a> *<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Adding Chee Yang, did the recent cve-check change mean some =
version<br>
&gt;&gt; &gt; comparisons regressed and exposed CVEs that shouldn&#39;t be=
 in this<br>
&gt;&gt; &gt; list, or were we making some we need to fix? Or did some oth=
er change<br>
&gt;expose these?<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Cheers,<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Richard<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;<br>
<br>
<br>
<br>
<br>
</blockquote></div></div>

--000000000000ed769405b9caa3e5--
