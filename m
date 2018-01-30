Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id 33FBD7855C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jan 2018 12:03:39 +0000 (UTC)
Received: by mail-io0-f180.google.com with SMTP id d13so11213275iog.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jan 2018 04:03:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=RpYVSd0i+XbhEI7COwocml1iaXJlLLoOxavmz9tSRJQ=;
	b=1Wrlt4sX2DyzA+hBZlz7EkBTAW0vBO6xFT2MM1zqW3L6xW7+YS4yB+qN6PgaSVpw0t
	z296ptoclrjYz26pXtQTtTeUpUaB62E7jPV6aPea5uGj310yH96+zzz8BumNEdVLk4TE
	OdC/zeWgn1jHTM1fR0Ko30DEz+B48l5r+UJ1GrluHNyHYYrRGb85Ifmg9U0nodKF1rob
	FMDgTpAkD01yn9QiqNA4uCyd1l699qHKJpIJoLy0Je9UrXTu7MqmrOCh/+Hgo5u6ZMfZ
	EB7nBXeh7kyEpxA9OkxTUbZZA18GfJ1YfoIl/IW6e/e9WxLqB3mH2Y+uhkzF2v766YBM
	1YtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=RpYVSd0i+XbhEI7COwocml1iaXJlLLoOxavmz9tSRJQ=;
	b=QyWnnXOSS47aq5CfHn/fs882mv7nv9Ew0g8c9B+mCEAbWEEBp/jEz0hkdShv/G7QBe
	AGO5a91fx/mtwiN3CxwYnPM66m21DkEUFOmqTUeVxjGbNhSJ95zqt720Uxrh9jisZ2Bw
	MAGm04CS4ayhwjXqRXHFGKPsRcBMzEw7ZFc6teOPAtFePSG+wM0yVFWIMk8EGdeYK0aI
	bNlULDSJ/5CRWoyOXWjS8pBafSYBoke8VL5dCeAZ/SeajZLOkBw0PwHTm/eiRIJGZQYP
	jSLGvEa21RVwxTT42BqB4kTzPb3VWEbahl0uJX958lnv/mM2gJdC4P/1fr/wQsu3rSWU
	M+WA==
X-Gm-Message-State: AKwxytcXLwVpaHS3FtSklqG3uX6UWagsEmS396ZqWbrnpq9OuFJneg5/
	ycnbcRQH46AGq/2KAiJu94qcjf30kJ284gpEEvIMHw==
X-Google-Smtp-Source: AH8x226c41XVPXiCDAqMt386B4bv7w+1KLVkuHbRQPGVv0IFh+az8sQTS3UOGJ9rnJFAc9yqC+P65vVfGlh9Tpe3YTo=
X-Received: by 10.107.133.75 with SMTP id h72mr29131162iod.227.1517313821117; 
	Tue, 30 Jan 2018 04:03:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.206 with HTTP; Tue, 30 Jan 2018 04:03:20 -0800 (PST)
In-Reply-To: <20180130083003.39-1-Martin.Jansa@gmail.com>
References: <20180130083003.39-1-Martin.Jansa@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 30 Jan 2018 12:03:20 +0000
Message-ID: <CAJTo0LYmP0iqbm5X50FPi80=LB+tUD90JVzYPf8uah=c0ysiew@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] waf.bbclass: check that waf exists before trying to execute it
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 30 Jan 2018 12:03:40 -0000
Content-Type: multipart/alternative; boundary="001a113ec5e452369f0563fd27dc"

--001a113ec5e452369f0563fd27dc
Content-Type: text/plain; charset="UTF-8"

Why would they do that?  Shouldn't it be a fatal bug if waf isn't found?

On 30 January 2018 at 08:30, Martin Jansa <martin.jansa@gmail.com> wrote:

> * there are some recipes like jack and other which inherit waf-samba
> which inherits waf, but they don't use waf for configure, strange isn't
> it?
>
> * fixes:
> WARNING: libldb-1.1.29-r0 do_configure: Unable to execute waf --version,
> exit code 127. Assuming waf version without bindir/libdir support.
> WARNING: samba-4.6.7-r0 do_configure: Unable to execute waf --version,
> exit code 127. Assuming waf version without bindir/libdir support.
> WARNING: libtalloc-2.1.9-r0 do_configure: Unable to execute waf --version,
> exit code 127. Assuming waf version without bindir/libdir
> support.
> WARNING: jack-1.9.10+gitAUTOINC+2d1d323505-r0 do_configure: Unable to
> execute waf --version, exit code 1. Assuming waf version without
> bindir/libdir support.
> WARNING: libtevent-0.9.31-r0 do_configure: Unable to execute waf
> --version, exit code 127. Assuming waf version without bindir/libdir
> support.
> WARNING: libtdb-1.3.14-r0 do_configure: Unable to execute waf --version,
> exit code 127. Assuming waf version without bindir/libdir support.
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/classes/waf.bbclass | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/classes/waf.bbclass b/meta/classes/waf.bbclass
> index c3e744e5de..eec4d9496d 100644
> --- a/meta/classes/waf.bbclass
> +++ b/meta/classes/waf.bbclass
> @@ -29,6 +29,9 @@ python waf_preconfigure() {
>      from distutils.version import StrictVersion
>      srcsubdir = d.getVar('S')
>      wafbin = os.path.join(srcsubdir, 'waf')
> +    if not os.path.isfile(wafbin):
> +        bb.note("%s doesn't exist, cannot check whether it supports
> --bindir/--libdir" % wafbin)
> +        return
>      status, result = oe.utils.getstatusoutput(wafbin + " --version")
>      if status != 0:
>          bb.warn("Unable to execute waf --version, exit code %d. Assuming
> waf version without bindir/libdir support." % status)
> --
> 2.15.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a113ec5e452369f0563fd27dc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Why would they do that?=C2=A0 Shouldn&#39;t it be a fatal =
bug if waf isn&#39;t found?</div><div class=3D"gmail_extra"><br><div class=
=3D"gmail_quote">On 30 January 2018 at 08:30, Martin Jansa <span dir=3D"ltr=
">&lt;<a href=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.ja=
nsa@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">* the=
re are some recipes like jack and other which inherit waf-samba<br>
which inherits waf, but they don&#39;t use waf for configure, strange isn&#=
39;t<br>
it?<br>
<br>
* fixes:<br>
WARNING: libldb-1.1.29-r0 do_configure: Unable to execute waf --version, ex=
it code 127. Assuming waf version without bindir/libdir support.<br>
WARNING: samba-4.6.7-r0 do_configure: Unable to execute waf --version, exit=
 code 127. Assuming waf version without bindir/libdir support.<br>
WARNING: libtalloc-2.1.9-r0 do_configure: Unable to execute waf --version, =
exit code 127. Assuming waf version without bindir/libdir<br>
support.<br>
WARNING: jack-1.9.10+gitAUTOINC+<wbr>2d1d323505-r0 do_configure: Unable to =
execute waf --version, exit code 1. Assuming waf version without bindir/lib=
dir support.<br>
WARNING: libtevent-0.9.31-r0 do_configure: Unable to execute waf --version,=
 exit code 127. Assuming waf version without bindir/libdir support.<br>
WARNING: libtdb-1.3.14-r0 do_configure: Unable to execute waf --version, ex=
it code 127. Assuming waf version without bindir/libdir support.<br>
<br>
Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com">M=
artin.Jansa@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/waf.bbclass | 3 +++<br>
=C2=A01 file changed, 3 insertions(+)<br>
<br>
diff --git a/meta/classes/waf.bbclass b/meta/classes/waf.bbclass<br>
index c3e744e5de..eec4d9496d 100644<br>
--- a/meta/classes/waf.bbclass<br>
+++ b/meta/classes/waf.bbclass<br>
@@ -29,6 +29,9 @@ python waf_preconfigure() {<br>
=C2=A0 =C2=A0 =C2=A0from distutils.version import StrictVersion<br>
=C2=A0 =C2=A0 =C2=A0srcsubdir =3D d.getVar(&#39;S&#39;)<br>
=C2=A0 =C2=A0 =C2=A0wafbin =3D os.path.join(srcsubdir, &#39;waf&#39;)<br>
+=C2=A0 =C2=A0 if not os.path.isfile(wafbin):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.note(&quot;%s doesn&#39;t exist, cannot che=
ck whether it supports --bindir/--libdir&quot; % wafbin)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
=C2=A0 =C2=A0 =C2=A0status, result =3D oe.utils.getstatusoutput(<wbr>wafbin=
 + &quot; --version&quot;)<br>
=C2=A0 =C2=A0 =C2=A0if status !=3D 0:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.warn(&quot;Unable to execute waf --ver=
sion, exit code %d. Assuming waf version without bindir/libdir support.&quo=
t; % status)<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.15.1<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--001a113ec5e452369f0563fd27dc--
