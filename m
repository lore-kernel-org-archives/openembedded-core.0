Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web08.10013.1609740337831927335
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Jan 2021 22:05:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista-com.20150623.gappssmtp.com header.s=20150623 header.b=G2F2aRF8;
 spf=permerror, err=parse error for token &{10 18 websitewelcome.com}: parse error for token &{10 18 _spf.google.com}: limit exceeded (domain: mvista.com, ip: 209.85.208.52, mailfrom: mshah@mvista.com)
Received: by mail-ed1-f52.google.com with SMTP id u19so26166719edx.2
        for <openembedded-core@lists.openembedded.org>; Sun, 03 Jan 2021 22:05:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/cYaVONC/M+CXtuSmcxjdx2OX9FSx9QvVuVq7TUGasM=;
        b=G2F2aRF8S6Y9EF7eh5hH8LLsq7UeLt3Gn+Ck0JRL/reqqp5L90JEsqzNUGizzH/ooM
         LlbRNMXJH0zAlAhimaIfGFHeyXby1XjUMaixV8AgR7fp1M+w5QHJRIYS6ld3EezY5Yf/
         w1bpGqND1j4szWBwynDS/hRNjc7yFhyN4RkMUWvL9HAdBcKJt3fcam7lXmCbh2JhPclz
         ts1nARLk0zyBJU30xi6TX9E3Cd3e6qOHiwlQwsBp0O3ffzQc/A4IomPWMp7Nw7lKNlMq
         XMEP/ES0H3RCw3viIP4kR2hRauuNVfNtcTgo0i6V03Rfa9UraILfXWejz3WJ/k09H2nd
         6jmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/cYaVONC/M+CXtuSmcxjdx2OX9FSx9QvVuVq7TUGasM=;
        b=mTJ7+GPIC7QcRzy7ZkeMcOGNrIAs87o0GJXORiY9/m8nEF2HrpV3y0gPp5sspZ+0AY
         TPM9qJZXoqYCsxEhuL+pFUIDRBF8pAi8Zpu+TwWobR5lqk4xCpLuQV5OOuwGH69oFZt2
         iUZsNW4PMEFCPIXNzILAqdaZDSJtjNVqfBC13IKXIRMOiymVpyR4Gs55IcRwvWJDCx5i
         Uq4+uO7DHHEO3fPyUSaqHQmC1B/46h0qwr43fd+OIB2ytLnlxtUWLsSyHlLIxHO77mYx
         LQ6XtsRcleJL6ubqROteGe6fOL6NEdngOQCqTp8XnLBdTnlCoBvTLujL1r1/9V0ryhjK
         yinw==
X-Gm-Message-State: AOAM531ZUpYHHZDuvuPvDgP2TCxnvQoDdJkoTFHmH+UCrgl+3O4eFipn
	1jEWZcm/+0MQ61AIYsml45TgpTIUXBBkxTowwSIpQg==
X-Google-Smtp-Source: ABdhPJzTWG4CdmCEhfPuMr6WFwhF8HlTaAIPw+AdQdSV8F9PhCFKXlhP69pxLcrkVeeHTR2pKv4LgAajwqRSLK1mEIA=
X-Received: by 2002:a50:d552:: with SMTP id f18mr64306897edj.168.1609740336125;
 Sun, 03 Jan 2021 22:05:36 -0800 (PST)
MIME-Version: 1.0
References: <1608804087-15784-1-git-send-email-mshah@mvista.com> <CAM9ZRVuPpM3HT0oRyMDo9viO7gpwsQONoQaY7MoaCkXahmWU1Q@mail.gmail.com>
In-Reply-To: <CAM9ZRVuPpM3HT0oRyMDo9viO7gpwsQONoQaY7MoaCkXahmWU1Q@mail.gmail.com>
From: "Milan Shah" <mshah@mvista.com>
Date: Mon, 4 Jan 2021 11:34:59 +0530
Message-ID: <CA+=qD9Os=9t1jPO70J2h3hH=3ad5-+QfoKibmO09E3iFhADb=Q@mail.gmail.com>
Subject: Re: [OE-Core][PATCH v2] oe-pkgdata-util: Added a test to verify oe-pkgdata-util without parameters
To: Paul Barker <pbarker@konsulko.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000ea68b105b80ce0e2"

--000000000000ea68b105b80ce0e2
Content-Type: text/plain; charset="UTF-8"

Hi Paul,

Thanks for the review. Review comments are addressed and the new Patch
<https://lists.openembedded.org/g/openembedded-core/topic/patch_v3_oe_pkgdata_util/79418977?p=,,,20,0,0,0::recentpostdate%2Fsticky,,,20,2,0,79418977>
is sent again for review.

-----------------------
Thanks & Regards,
*Milan Shah*
MontaVista Software, Bangalore, India


On Sun, Jan 3, 2021 at 5:18 PM Paul Barker <pbarker@konsulko.com> wrote:

> On Thu, 24 Dec 2020 at 10:01, Milan Shah <mshah@mvista.com> wrote:
> >
> > A test is implemented on poky/meta/lib/oeqa/selftest/pkgdata.py to test
> > the scenario when oe-pkgdata-util is executed without parameters and
> > help is displayed.
> >
> > See [YOCTO #10726] for detailed bug information.
> >
> > Signed-off-by: Milan Shah <mshah@mvista.com>
> > ---
> >  meta/lib/oeqa/selftest/cases/pkgdata.py | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/meta/lib/oeqa/selftest/cases/pkgdata.py
> b/meta/lib/oeqa/selftest/cases/pkgdata.py
> > index 833a180..94ee1f5 100644
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
> > +        currpos = result.output.find('usage: oe-pkgdata-util [-h] [-d]
> [-p PKGDATA_DIR] <subcommand>')
>
> In my opinion this is still too restrictive a test, it would need
> updating when any further arguments are added to the oe-pkgdata-util
> tool. I'd recommend just checking for "usage: oe-pkgdata-util" and
> ignoring the rest of the line.
>
> Thanks,
>
> --
> Paul Barker
> Konsulko Group
>

--000000000000ea68b105b80ce0e2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Paul,</div><div><br></div><div>Thanks for the revi=
ew. Review comments are addressed and the new <a href=3D"https://lists.open=
embedded.org/g/openembedded-core/topic/patch_v3_oe_pkgdata_util/79418977?p=
=3D,,,20,0,0,0::recentpostdate%2Fsticky,,,20,2,0,79418977">Patch</a> is sen=
t again for review.<br></div><div><div><div dir=3D"ltr" class=3D"gmail_sign=
ature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D=
"ltr"><font face=3D"times new roman, serif"><br></font></div><div dir=3D"lt=
r"><font face=3D"times new roman, serif">-----------------------<br></font>=
</div><div dir=3D"ltr"><font face=3D"times new roman, serif">Thanks &amp; R=
egards,</font><div><font face=3D"times new roman, serif"><b>Milan Shah</b><=
/font></div><div><span style=3D"background-color:rgb(255,255,255)"><font co=
lor=3D"#ff0000"><font face=3D"times new roman, serif">MontaVista Software, =
</font></font></span><span style=3D"background-color:rgb(255,255,255)"><fon=
t color=3D"#ff0000"><font face=3D"times new roman, serif"><span style=3D"fo=
nt-family:&quot;times new roman&quot;,serif">Bangalore</span></font><span s=
tyle=3D"font-family:&quot;times new roman&quot;,serif">, India</span></font=
></span><br></div></div></div></div></div></div><br></div></div><br><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Jan 3, 20=
21 at 5:18 PM Paul Barker &lt;<a href=3D"mailto:pbarker@konsulko.com">pbark=
er@konsulko.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">On Thu, 24 Dec 2020 at 10:01, Milan Shah &lt;<a href=3D"mail=
to:mshah@mvista.com" target=3D"_blank">mshah@mvista.com</a>&gt; wrote:<br>
&gt;<br>
&gt; A test is implemented on poky/meta/lib/oeqa/selftest/pkgdata.py to tes=
t<br>
&gt; the scenario when oe-pkgdata-util is executed without parameters and<b=
r>
&gt; help is displayed.<br>
&gt;<br>
&gt; See [YOCTO #10726] for detailed bug information.<br>
&gt;<br>
&gt; Signed-off-by: Milan Shah &lt;<a href=3D"mailto:mshah@mvista.com" targ=
et=3D"_blank">mshah@mvista.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/lib/oeqa/selftest/cases/pkgdata.py | 6 ++++++<br>
&gt;=C2=A0 1 file changed, 6 insertions(+)<br>
&gt;<br>
&gt; diff --git a/meta/lib/oeqa/selftest/cases/pkgdata.py b/meta/lib/oeqa/s=
elftest/cases/pkgdata.py<br>
&gt; index 833a180..94ee1f5 100644<br>
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
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 currpos =3D result.output.find(&#39;usage=
: oe-pkgdata-util [-h] [-d] [-p PKGDATA_DIR] &lt;subcommand&gt;&#39;)<br>
<br>
In my opinion this is still too restrictive a test, it would need<br>
updating when any further arguments are added to the oe-pkgdata-util<br>
tool. I&#39;d recommend just checking for &quot;usage: oe-pkgdata-util&quot=
; and<br>
ignoring the rest of the line.<br>
<br>
Thanks,<br>
<br>
-- <br>
Paul Barker<br>
Konsulko Group<br>
</blockquote></div>

--000000000000ea68b105b80ce0e2--
