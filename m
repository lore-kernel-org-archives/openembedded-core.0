Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web09.33383.1610367593969407899
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Jan 2021 04:19:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista-com.20150623.gappssmtp.com header.s=20150623 header.b=fzJpD57c;
 spf=permerror, err=parse error for token &{10 18 websitewelcome.com}: parse error for token &{10 18 _spf.google.com}: limit exceeded (domain: mvista.com, ip: 209.85.208.45, mailfrom: mshah@mvista.com)
Received: by mail-ed1-f45.google.com with SMTP id cm17so18588801edb.4
        for <openembedded-core@lists.openembedded.org>; Mon, 11 Jan 2021 04:19:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=kcxeM4vFx1macvikq5rWO1zV+X/T2Ncwqa0PZDvt4Xg=;
        b=fzJpD57c8wubOfodp+JCP05DBCRObp8ieTI136KFcI2XJmuFuoF5kG2HvO7iJXlr/b
         rwCJTvp1ZkC83Sv2w2/yabY4U4vjloK4DadClQpsBQzb0FdDkjgt5M6UvaQcIQKw6sYG
         qCxeMi1Mx66Ha0RKUmXgB2o0l6ULa9OtnvdaeSf9z/F/WY0KOkicLwMmNpDEBUGVaXtS
         CyhEXlD4dP005x0g50Zybhe+8N3/OeS/QoyEw4e/ORA/AXkSGJ/CsnHj/PRADwyMp9zF
         n2Mqxo0Kat7rHFBBnXKAmDsLm8L3oiS3tTpoSMW/CzXEuCrHlxzvKBSxYIFcLHH/Frx5
         Uk4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=kcxeM4vFx1macvikq5rWO1zV+X/T2Ncwqa0PZDvt4Xg=;
        b=qGpmlB20Nor7ykNDt5PdVPHh50Zcu3exQnIqs2lknR2qeYFW15A6YG61yfT33JB3Hl
         B0trKbXtoycm50RFi38vE0uS1lQOQgpwi0ox0UxZ3k0Ht2cP523UkkeR1Vhwsu+SjHMR
         SWiM7rLcLakw4tREoWk7Vj7yC6Re9aUKq452kMw363lGyAqE2l9NOc5YftR9rhM4uaoV
         0LOT0j86cE7cQNLfd3vki+eVABI8ca2I4duVtK9MVmRDQwBBPZxPYzQxt3UDnskaB9Ed
         hEMOXUsOWiv1c+opogEpAvYPkhxxcmhmULFDf6LH/DhxFRmjuMm4HBD2qd3RprN85EiX
         9TWA==
X-Gm-Message-State: AOAM533cgBHXnOM8RAD+Zn41getHF5+6PCrLXxEBg3Dtz/ASFmDo+DY8
	R7ssk6YTYR2cPwJgZNlqzoE7I/sHjQm2iG/d5HYtJqeHBos=
X-Google-Smtp-Source: ABdhPJzOi/1D3fClaO5e22FHllKQqzkcfUObezhkFV1rBnjBS/XqO6nymEb+6X6ql+Agcy6BgGYi74jZCE2MQshfCKY=
X-Received: by 2002:a50:f40e:: with SMTP id r14mr13457093edm.5.1610367592152;
 Mon, 11 Jan 2021 04:19:52 -0800 (PST)
MIME-Version: 1.0
References: <1609739642-25372-1-git-send-email-mshah@mvista.com>
In-Reply-To: <1609739642-25372-1-git-send-email-mshah@mvista.com>
From: "Milan Shah" <mshah@mvista.com>
Date: Mon, 11 Jan 2021 17:49:16 +0530
Message-ID: <CA+=qD9MRuL5902aOE+An63_ScRN-je9Q0kecdeMJ_HQsz882gw@mail.gmail.com>
Subject: Re: [OE-Core][PATCH v3] oe-pkgdata-util: Added a test to verify oe-pkgdata-util without parameters
To: openembedded-core <openembedded-core@lists.openembedded.org>, 
	Paul Barker <pbarker@konsulko.com>, jose.perez.carranza@intel.com, 
	Randy MacLeod <randy.macleod@windriver.com>, stephano.cetola@intel.com, 
	paul.eggleton@linux.intel.com, joshua.g.lock@intel.com, 
	benjamin.esquivel@intel.com
Content-Type: multipart/alternative; boundary="00000000000049d5c505b89eec1b"

--00000000000049d5c505b89eec1b
Content-Type: text/plain; charset="UTF-8"

Hi All,

This is a gentle reminder to review this patch.

-----------------------
Thanks & Regards,
*Milan Shah*
MontaVista Software, Bangalore, India


On Mon, Jan 4, 2021 at 11:24 AM Milan Shah <mshah@mvista.com> wrote:

> A test is implemented on poky/meta/lib/oeqa/selftest/pkgdata.py to test
> the scenario when oe-pkgdata-util is executed without parameters and
> help is displayed.
>
> See [YOCTO #10726] for detailed bug information.
>
> Signed-off-by: Milan Shah <mshah@mvista.com>
> ---
>  meta/lib/oeqa/selftest/cases/pkgdata.py | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/meta/lib/oeqa/selftest/cases/pkgdata.py
> b/meta/lib/oeqa/selftest/cases/pkgdata.py
> index 833a180..254abc4 100644
> --- a/meta/lib/oeqa/selftest/cases/pkgdata.py
> +++ b/meta/lib/oeqa/selftest/cases/pkgdata.py
> @@ -218,3 +218,9 @@ class OePkgdataUtilTests(OESelftestTestCase):
>      def test_specify_pkgdatadir(self):
>          result = runCmd('oe-pkgdata-util -p %s lookup-pkg zlib' %
> get_bb_var('PKGDATA_DIR'))
>          self.assertEqual(result.output, 'libz1')
> +
> +    def test_no_param(self):
> +        result = runCmd('oe-pkgdata-util', ignore_status=True)
> +        self.assertEqual(result.status, 2, "Status different than 2.
> output: %s" % result.output)
> +        currpos = result.output.find('usage: oe-pkgdata-util')
> +        self.assertTrue(currpos != -1, msg = "Test is Failed. Help is not
> Displayed in %s" % result.output)
> --
> 2.7.4
>
>

--00000000000049d5c505b89eec1b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi All,</div><div><br></div><div>This is a gentle rem=
inder to review this patch.<br clear=3D"all"></div><div dir=3D"ltr"><div><d=
iv dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"=
><div dir=3D"ltr"><div><div dir=3D"ltr"><font face=3D"times new roman, seri=
f"><br></font></div><div dir=3D"ltr"><font face=3D"times new roman, serif">=
-----------------------<br></font></div><div dir=3D"ltr"><font face=3D"time=
s new roman, serif">Thanks &amp; Regards,</font><div><font face=3D"times ne=
w roman, serif"><b>Milan Shah</b></font></div><div><span style=3D"backgroun=
d-color:rgb(255,255,255)"><font color=3D"#ff0000"><font face=3D"times new r=
oman, serif">MontaVista Software, </font></font></span><span style=3D"backg=
round-color:rgb(255,255,255)"><font color=3D"#ff0000"><font face=3D"times n=
ew roman, serif"><span style=3D"font-family:&quot;times new roman&quot;,ser=
if">Bangalore</span></font><span style=3D"font-family:&quot;times new roman=
&quot;,serif">, India</span></font></span><br></div></div></div></div></div=
></div><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">On Mon, Jan 4, 2021 at 11:24 AM Milan Shah &lt;<a href=3D"mailto=
:mshah@mvista.com">mshah@mvista.com</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">A test is implemented on poky/meta/lib/o=
eqa/selftest/pkgdata.py to test<br>
the scenario when oe-pkgdata-util is executed without parameters and<br>
help is displayed.<br>
<br>
See [YOCTO #10726] for detailed bug information.<br>
<br>
Signed-off-by: Milan Shah &lt;<a href=3D"mailto:mshah@mvista.com" target=3D=
"_blank">mshah@mvista.com</a>&gt;<br>
---<br>
=C2=A0meta/lib/oeqa/selftest/cases/pkgdata.py | 6 ++++++<br>
=C2=A01 file changed, 6 insertions(+)<br>
<br>
diff --git a/meta/lib/oeqa/selftest/cases/pkgdata.py b/meta/lib/oeqa/selfte=
st/cases/pkgdata.py<br>
index 833a180..254abc4 100644<br>
--- a/meta/lib/oeqa/selftest/cases/pkgdata.py<br>
+++ b/meta/lib/oeqa/selftest/cases/pkgdata.py<br>
@@ -218,3 +218,9 @@ class OePkgdataUtilTests(OESelftestTestCase):<br>
=C2=A0 =C2=A0 =C2=A0def test_specify_pkgdatadir(self):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0result =3D runCmd(&#39;oe-pkgdata-util -p=
 %s lookup-pkg zlib&#39; % get_bb_var(&#39;PKGDATA_DIR&#39;))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertEqual(result.output, &#39;libz=
1&#39;)<br>
+<br>
+=C2=A0 =C2=A0 def test_no_param(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 result =3D runCmd(&#39;oe-pkgdata-util&#39;, i=
gnore_status=3DTrue)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(result.status, 2, &quot;Statu=
s different than 2. output: %s&quot; % result.output)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 currpos =3D result.output.find(&#39;usage: oe-=
pkgdata-util&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue(currpos !=3D -1, msg =3D &quot=
;Test is Failed. Help is not Displayed in %s&quot; % result.output)<br>
-- <br>
2.7.4<br>
<br>
</blockquote></div></div>

--00000000000049d5c505b89eec1b--
