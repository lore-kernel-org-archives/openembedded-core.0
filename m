Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id CC33D6E630
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Aug 2017 14:41:16 +0000 (UTC)
Received: by mail-io0-f182.google.com with SMTP id g71so14437129ioe.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Aug 2017 07:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=b1abBsxUbS8zYm9XYQMw79eZwyMOTxHSuiQ8u43COFo=;
	b=PHgM+XaJ9eS3LwFDEPH37rJoBetcRPQhQGOsGMOed+KdFjfKxkyJO+m7+bEjfNc7G8
	q4FxlppQ3zP0F6q3Q2ORzfYoT+12Lq/+5aoEHvXLitgamKOrIkBw86XWVG/pyi3uWuVF
	yulGe+iEQpKCgYAdv8dXjFDGGAhYOqBkMio9lYrE17qA81T/JXnQtEjyTCemfW5rpQh7
	6QaKgme08Pgn6gT/2sNYJzjGPvKpYpXq7DF1cKZzNtexDl/O42BnkrIlhxFAsvtpRLAi
	zhh3QfOu0m0hSYQrRJL/gdyzeHNPI8XYF2O57MzDg216NVbD5PlYWd92bBfZifjgnkQM
	F61A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=b1abBsxUbS8zYm9XYQMw79eZwyMOTxHSuiQ8u43COFo=;
	b=IKAZCp/a4vnrlRdF/0dmUZzQTgpuOoZaCJAFjSu6U3Fw2QoxrUPJn4+txS1tdxJQ3H
	/wgh4BnLhDtKvzPBPryPeRL/pJj5ocIVpc443TJ4gu8o6UgndFzZAmz7ZnrOY9hBdzsv
	By+pCL9RrCcYz1TMUPV331BdtcAp+LsKMCuSxZxwpjfwxdbO6aKc/6SnCv2etB7K3jvO
	m2MQhuwVl2HeBbiYISGv4J7f8eZID9/LUyzuXfyN9YZuIv6wCBiqGnOAekl8NwMGDutC
	T1fwiQhM/44uOx8Zcf5n7QBtNb2Ab2p5mz5eqFU/A+SbCUdODvihJfmdYwWG1beg9abc
	4r1w==
X-Gm-Message-State: AIVw112oavQ54jEZWMlfmc6/lbIgUQf0BQBwrzRP+3W4H9IEXh2X5LIQ
	TTsHGcCECNc7+Nt8XD1OOa6V0YnmU9Nl
X-Received: by 10.107.170.170 with SMTP id g42mr4005468ioj.19.1502203277893;
	Tue, 08 Aug 2017 07:41:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.135.234 with HTTP; Tue, 8 Aug 2017 07:40:57 -0700 (PDT)
In-Reply-To: <20170807213351.600-2-leonardo.sandoval.gonzalez@linux.intel.com>
References: <20170807213351.600-1-leonardo.sandoval.gonzalez@linux.intel.com>
	<20170807213351.600-2-leonardo.sandoval.gonzalez@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 8 Aug 2017 15:40:57 +0100
Message-ID: <CAJTo0LbdP=cQCXd1k5ogPnz3Rn7tcwY5sMhWEKWApvo_VMgCOw@mail.gmail.com>
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 2/2] sstatetests: limit the number of signature comparisons when differ
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
X-List-Received-Date: Tue, 08 Aug 2017 14:41:16 -0000
Content-Type: multipart/alternative; boundary="001a114260bac2b56905563ef4f8"

--001a114260bac2b56905563ef4f8
Content-Type: text/plain; charset="UTF-8"

On 7 August 2017 at 22:33, <leonardo.sandoval.gonzalez@linux.intel.com>
wrote:

> From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
>
> For perfomance reasons, limit the number of signature comparisons when
> stamps differ. The limit set is hardcoded to 20.
>
> [YOCTO #11651]
>
> Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@
> linux.intel.com>
> ---
>  meta/lib/oeqa/selftest/cases/sstatetests.py | 40
> +++++++++++++++++++----------
>  1 file changed, 26 insertions(+), 14 deletions(-)
>
> diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py
> b/meta/lib/oeqa/selftest/cases/sstatetests.py
> index 0b36027918..6298443a18 100644
> --- a/meta/lib/oeqa/selftest/cases/sstatetests.py
> +++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
> @@ -458,6 +458,25 @@ http_proxy = "http://example.com/"
>                      base = os.sep.join(root.rsplit(os.sep, 2)[-2:] +
> [name])
>                      f[base] = shash
>              return f
> +
> +        def compare_sigfiles(files, files1, files2, compare=False):
> +            for k in files:
> +                if k in files1 and k in files2:
> +                    i_sigfile += 1
>

Surely this is going to produce an i_sigfile is not defined error?

Ross

--001a114260bac2b56905563ef4f8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 7 August 2017 at 22:33,  <span dir=3D"ltr">&lt;<a href=
=3D"mailto:leonardo.sandoval.gonzalez@linux.intel.com" target=3D"_blank">le=
onardo.sandoval.gonzalez@linux.intel.com</a>&gt;</span> wrote:<br><div clas=
s=3D"gmail_extra"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
><span class=3D"">From: Leonardo Sandoval &lt;<a href=3D"mailto:leonardo.sa=
ndoval.gonzalez@linux.intel.com">leonardo.sandoval.gonzalez@<wbr>linux.inte=
l.com</a>&gt;<br>
<br>
For perfomance reasons, limit the number of signature comparisons when<br>
stamps differ. The limit set is hardcoded to 20.<br>
<br>
[YOCTO #11651]<br>
<br>
Signed-off-by: Leonardo Sandoval &lt;<a href=3D"mailto:leonardo.sandoval.go=
nzalez@linux.intel.com">leonardo.sandoval.gonzalez@<wbr>linux.intel.com</a>=
&gt;<br>
---<br>
</span>=C2=A0meta/lib/oeqa/selftest/cases/<wbr>sstatetests.py | 40 ++++++++=
+++++++++++----------<br>
=C2=A01 file changed, 26 insertions(+), 14 deletions(-)<br>
<br>
diff --git a/meta/lib/oeqa/selftest/<wbr>cases/sstatetests.py b/meta/lib/oe=
qa/selftest/<wbr>cases/sstatetests.py<br>
index 0b36027918..6298443a18 100644<br>
--- a/meta/lib/oeqa/selftest/<wbr>cases/sstatetests.py<br>
+++ b/meta/lib/oeqa/selftest/<wbr>cases/sstatetests.py<br>
@@ -458,6 +458,25 @@ http_proxy =3D &quot;<a href=3D"http://example.com/" r=
el=3D"noreferrer" target=3D"_blank">http://example.com/</a>&quot;<br>
<span class=3D"">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0base =3D os.sep.join(root.rsplit(os.<wbr>sep, 2)[-2:] +=
 [name])<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0f[base] =3D shash<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return f<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 def compare_sigfiles(files, files1, files2, co=
mpare=3DFalse):<br>
</span>+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for k in files:<br>
<span class=3D"">+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i=
f k in files1 and k in files2:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i_si=
gfile +=3D 1<br></span></blockquote><div><br></div><div>Surely this is goin=
g to produce an i_sigfile is not defined error?</div><div><br></div><div>Ro=
ss=C2=A0</div></div></div></div>

--001a114260bac2b56905563ef4f8--
