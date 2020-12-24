Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web08.10368.1608815126707154920
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Dec 2020 05:05:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista-com.20150623.gappssmtp.com header.s=20150623 header.b=bElujvgB;
 spf=permerror, err=parse error for token &{10 18 websitewelcome.com}: parse error for token &{10 18 _spf.google.com}: limit exceeded (domain: mvista.com, ip: 209.85.208.47, mailfrom: mshah@mvista.com)
Received: by mail-ed1-f47.google.com with SMTP id y24so2071096edt.10
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Dec 2020 05:05:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eCDjGhRFwzH23VYZYQM4eqFu0Y/mPpIP1Fcww5RYZ+Y=;
        b=bElujvgBignDvQj4eXSlMgdkv2YRU59h2CLq0fzEZxHzwSSvq061bouhy1Sg3CtRYD
         pWRjoEJO5hJPbNbPbRXsYzDOi56pyG24Bp4q72Ju4BoEmhLM1w60yUuEp9qPJeK0GZQc
         nfIp3Xayylw33AH9mCkSekerFhEpdGJkj4rwUbjiTxzIcZx57N9VNYW2fJmyh9WjqQCI
         KkTlmqGEBSnjh5Jub8z4Thtw9+A7qQ/HCPjUDsk6gPsJ0G/RrCWlj7S6RkMVn2Pocu9z
         DmcVA9FHQyGupfSaKi6cr3BDZfuIGPvfiv9MdwDd5n3J8L9UXe82wLWFnLq62HhuBM55
         H6Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eCDjGhRFwzH23VYZYQM4eqFu0Y/mPpIP1Fcww5RYZ+Y=;
        b=oqkTvcnKI8l+dRhGdfgvZu63XbIKh2axictfpGP4oK6bsPyGSMRsNoMsm22axha+na
         47CtVWRtEnjyvDzC/q0JWqvIqWUlNO08Vic0KoFV0vBGbUeO5/1pFipyeDQ8xRebWinB
         UrxvkBkTVTSyiVhHm6y4NbcA0qxdUXG7M0TKbtVe9EEaqC0q+9MDBJXuyUrERQggQnOL
         r8sPPrwTzPlBoo5HKeNf2a6uvmov6NdK049sQmzGfbVlqZ7wWinXrcLOQklwSkUBcPRX
         8k6mFqVFc6cN74n6ILWBZC6nTK5pCXBnFlyoVuro+XGblxYXY16rAvWsISoVyCw+DkCj
         x6xw==
X-Gm-Message-State: AOAM530UVKSK5LlFqJlS/Jzgt1i8C15WJDqNr8ENCG55robPKSlALZDN
	efih6gEOTPM6KOc1eCKr2F49kXfzepretOJVCHxD9A==
X-Google-Smtp-Source: ABdhPJyRooBDNidyuZXYa/3tQ2zWTbuV26Y5bNc2b4OVnDNYLR7uXZrB9g7BhMwpT2vqpoMPWR82pFIfRXa2cjZOQcM=
X-Received: by 2002:a50:d552:: with SMTP id f18mr23892329edj.168.1608815124992;
 Thu, 24 Dec 2020 05:05:24 -0800 (PST)
MIME-Version: 1.0
References: <1608636285-20638-1-git-send-email-mshah@mvista.com> <CAM9ZRVu+iqZPignsv3pP49NgUceRopZJpxTJHo_Xg++EPUxbhA@mail.gmail.com>
In-Reply-To: <CAM9ZRVu+iqZPignsv3pP49NgUceRopZJpxTJHo_Xg++EPUxbhA@mail.gmail.com>
From: "Milan Shah" <mshah@mvista.com>
Date: Thu, 24 Dec 2020 18:34:49 +0530
Message-ID: <CA+=qD9PEHnjEiLMDgWKEhZT6FCP1neD1_DRnknU5oODqGs7WOA@mail.gmail.com>
Subject: Re: [OE-core] [meta-oe][PATCH] oe-pkgdata-util: Added a test to verify oe-pkgdata-util without parameters
To: Paul Barker <pbarker@konsulko.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000008ec5a05b7357682"

--00000000000008ec5a05b7357682
Content-Type: text/plain; charset="UTF-8"

Thanks, Paul for the review.

All review comments are fixed and the patch
<https://lists.openembedded.org/g/openembedded-core/topic/patch_v2_oe_pkgdata_util/79199395?p=,,,20,0,0,0::recentpostdate%2Fsticky,,,20,2,0,79199395>
is sent again for the review.

-----------------------
Thanks & Regards,
*Milan Shah*
MontaVista Software, Bangalore, India


On Tue, Dec 22, 2020 at 7:14 PM Paul Barker <pbarker@konsulko.com> wrote:

> On Tue, 22 Dec 2020 at 11:25, Milan Shah <mshah@mvista.com> wrote:
> >
> > A test is implemented on poky/meta/lib/oeqa/selftest/pkgdata.py to test
> > the scenario when oe-pkgdata-util is executed without parameters and
> > help is displayed.
> >
> > See [YOCTO #10726] for detailed bug information.
> >
> > Upstream-Status: Submitted
>
> This tag doesn't make sense here, you can just drop it. We only need
> this tag for actual patch files added to the repository to be applied
> to upstream software.
>
> >
> > Signed-off-by: Milan Shah <mshah@mvista.com>
> > ---
> >  meta/lib/oeqa/selftest/cases/pkgdata.py | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/meta/lib/oeqa/selftest/cases/pkgdata.py
> b/meta/lib/oeqa/selftest/cases/pkgdata.py
> > index 833a180..d3a5519 100644
> > --- a/meta/lib/oeqa/selftest/cases/pkgdata.py
> > +++ b/meta/lib/oeqa/selftest/cases/pkgdata.py
> > @@ -218,3 +218,9 @@ class OePkgdataUtilTests(OESelftestTestCase):
> >      def test_specify_pkgdatadir(self):
> >          result = runCmd('oe-pkgdata-util -p %s lookup-pkg zlib' %
> get_bb_var('PKGDATA_DIR'))
> >          self.assertEqual(result.output, 'libz1')
> > +
> > +    def test_no_param(self):
> > +        result = runCmd('oe-pkgdata-util', ignore_status=True)
> > +        self.assertEqual(result.status, 2, "Status different than 2.
> output: %s" % result.output)
> > +        self.assertIn('oe-pkgdata-util: error: the following arguments
> are required: <subcommand>', result.output)
> > +        self.assertIn('usage: oe-pkgdata-util [-h] [-d] [-p
> PKGDATA_DIR] <subcommand>', result.output)
>
> I don't like these assertln calls - they just make it more difficult
> to change the help output of the oe-pkgdata-util tool if additional
> options are added in the future.
>
> I'm not really sure what this test case is expected to catch but
> perhaps just checking for the return code of 2 and the string "usage:
> oe-pkgdata-util" somewhere in the output is enough.
>
> Thanks,
>
> --
> Paul Barker
> Konsulko Group
>

--00000000000008ec5a05b7357682
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks, Paul for the review. <br></div><div><br></div=
><div>All review comments are fixed and the <a href=3D"https://lists.openem=
bedded.org/g/openembedded-core/topic/patch_v2_oe_pkgdata_util/79199395?p=3D=
,,,20,0,0,0::recentpostdate%2Fsticky,,,20,2,0,79199395">patch</a> is sent a=
gain for the review. <br></div><div><div><div dir=3D"ltr" class=3D"gmail_si=
gnature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=
=3D"ltr"><font face=3D"times new roman, serif"><br></font></div><div dir=3D=
"ltr"><font face=3D"times new roman, serif">-----------------------<br></fo=
nt></div><div dir=3D"ltr"><font face=3D"times new roman, serif">Thanks &amp=
; Regards,</font><div><font face=3D"times new roman, serif"><b>Milan Shah</=
b></font></div><div><span style=3D"background-color:rgb(255,255,255)"><font=
 color=3D"#ff0000"><font face=3D"times new roman, serif">MontaVista Softwar=
e, </font></font></span><span style=3D"background-color:rgb(255,255,255)"><=
font color=3D"#ff0000"><font face=3D"times new roman, serif"><span style=3D=
"font-family:&quot;times new roman&quot;,serif">Bangalore</span></font><spa=
n style=3D"font-family:&quot;times new roman&quot;,serif">, India</span></f=
ont></span><br></div></div></div></div></div></div><br></div></div><br><div=
 class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Dec 22=
, 2020 at 7:14 PM Paul Barker &lt;<a href=3D"mailto:pbarker@konsulko.com">p=
barker@konsulko.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">On Tue, 22 Dec 2020 at 11:25, Milan Shah &lt;<a href=3D"=
mailto:mshah@mvista.com" target=3D"_blank">mshah@mvista.com</a>&gt; wrote:<=
br>
&gt;<br>
&gt; A test is implemented on poky/meta/lib/oeqa/selftest/pkgdata.py to tes=
t<br>
&gt; the scenario when oe-pkgdata-util is executed without parameters and<b=
r>
&gt; help is displayed.<br>
&gt;<br>
&gt; See [YOCTO #10726] for detailed bug information.<br>
&gt;<br>
&gt; Upstream-Status: Submitted<br>
<br>
This tag doesn&#39;t make sense here, you can just drop it. We only need<br=
>
this tag for actual patch files added to the repository to be applied<br>
to upstream software.<br>
<br>
&gt;<br>
&gt; Signed-off-by: Milan Shah &lt;<a href=3D"mailto:mshah@mvista.com" targ=
et=3D"_blank">mshah@mvista.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/lib/oeqa/selftest/cases/pkgdata.py | 6 ++++++<br>
&gt;=C2=A0 1 file changed, 6 insertions(+)<br>
&gt;<br>
&gt; diff --git a/meta/lib/oeqa/selftest/cases/pkgdata.py b/meta/lib/oeqa/s=
elftest/cases/pkgdata.py<br>
&gt; index 833a180..d3a5519 100644<br>
&gt; --- a/meta/lib/oeqa/selftest/cases/pkgdata.py<br>
&gt; +++ b/meta/lib/oeqa/selftest/cases/pkgdata.py<br>
&gt; @@ -218,3 +218,9 @@ class OePkgdataUtilTests(OESelftestTestCase):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 def test_specify_pkgdatadir(self):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 result =3D runCmd(&#39;oe-pkgdata-ut=
il -p %s lookup-pkg zlib&#39; % get_bb_var(&#39;PKGDATA_DIR&#39;))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(result.output, &#39=
;libz1&#39;)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 def test_no_param(self):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 result =3D runCmd(&#39;oe-pkgdata-util&#3=
9;, ignore_status=3DTrue)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(result.status, 2, &quot;=
Status different than 2. output: %s&quot; % result.output)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertIn(&#39;oe-pkgdata-util: error=
: the following arguments are required: &lt;subcommand&gt;&#39;, result.out=
put)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertIn(&#39;usage: oe-pkgdata-util=
 [-h] [-d] [-p PKGDATA_DIR] &lt;subcommand&gt;&#39;, result.output)<br>
<br>
I don&#39;t like these assertln calls - they just make it more difficult<br=
>
to change the help output of the oe-pkgdata-util tool if additional<br>
options are added in the future.<br>
<br>
I&#39;m not really sure what this test case is expected to catch but<br>
perhaps just checking for the return code of 2 and the string &quot;usage:<=
br>
oe-pkgdata-util&quot; somewhere in the output is enough.<br>
<br>
Thanks,<br>
<br>
-- <br>
Paul Barker<br>
Konsulko Group<br>
</blockquote></div>

--00000000000008ec5a05b7357682--
