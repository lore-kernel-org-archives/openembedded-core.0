Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 806C0773A0
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Feb 2016 14:18:54 +0000 (UTC)
Received: by mail-io0-f174.google.com with SMTP id 9so130163799iom.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Feb 2016 06:18:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=Ohpmm0g48GzVWVuj0wAiWjc/AQDkEDAYJCcXKEbp0Zs=;
	b=mtHeOQOEJ3O/24gf8aSwiWkLFZk+j8Yd/M7qZqL2/wC1USfALlvw5m3PBcBJve77Yo
	jD4foi8M3z90cmYNvA8/9fFeDaBufrlpii4tlvmQ3rkNNI7NRPLV+LY5XPtqM/mFb4iM
	tHo3gSABLLE8QxH5VcGI3iFDWuvdyAwWvvfQnFvq8nqH29HtOtom8qjRne4ZIDO1qyEZ
	pr4WIyYWzNXt9Cz7NiKlJqAfi+Gvdy20ucrE0bb60/XGSMalMoRdvfoL1aIfXON5GZ7X
	qyQdfUQtfRR/puwpCJ5UV24NLkFXQiwWoR3kYupp4cBqD7LSkcWquX5WVulbPY0IBftr
	z1BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Ohpmm0g48GzVWVuj0wAiWjc/AQDkEDAYJCcXKEbp0Zs=;
	b=HSWXOuwpvrB6gVKu1cGO5sD2xR9LbhFfOA9dMmNUrinVzItSk7h8qahKoooABliQZt
	837pmh4zhVAGy2kZyl+qQRuCPvHFqYqTbDNlUK+D4eeoBP5E+I7Cy8uANE8ig2Jt7JVU
	NRSCuMLKhF5efBWhxKAhgfyv5is97U3FA3C8XhRLAzngE/LJ2ho+XLnhskbzMLdEsM6B
	PNqiDjC/vOPq+njOstP6qxXocorkPuoi9B7MVY0jEDKVlcA1RJAnYt74KBWE2hR3G0tZ
	QymdmJwV4nfvBKgyQpib9kO0r/+YUrggZnssdjmpUHpbtAHxLzaMB5Xwpj0JWuXbXaBY
	Z9Pg==
X-Gm-Message-State: AG10YORNkhrb1ngsFIhZzDwhfu7XhEpS3LS2REIm9no5AL3aBNxrFQ3kUhZca8EwXbkCP8zZGvPIAaWmTW07ean+
X-Received: by 10.107.164.15 with SMTP id n15mr13842746ioe.148.1454681934979; 
	Fri, 05 Feb 2016 06:18:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Fri, 5 Feb 2016 06:18:35 -0800 (PST)
In-Reply-To: <8B858EC3-8702-4A62-9CBC-35BBFCC634C9@gmail.com>
References: <8B858EC3-8702-4A62-9CBC-35BBFCC634C9@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 5 Feb 2016 14:18:35 +0000
Message-ID: <CAJTo0LZu9Sd8Z=EY-5eD1XP3VtKPFCYLJsu+6D_zy1YxgJziXw@mail.gmail.com>
To: Jens Rehsack <rehsack@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][jethro] glibc: add patch from release/2.22/master fix memory corruption
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
X-List-Received-Date: Fri, 05 Feb 2016 14:18:54 -0000
Content-Type: multipart/alternative; boundary=001a11377682ff0000052b06873c

--001a11377682ff0000052b06873c
Content-Type: text/plain; charset=UTF-8

On 5 February 2016 at 10:26, Jens Rehsack <rehsack@gmail.com> wrote:

> +commit 3007f797a1a596e954f44879a5a7267966186ba4
> +Author: Mike Frysinger <vapier@gentoo.org>
> +Date:   Fri Aug 28 17:08:49 2015 -0400
> +
> +    getmntent: fix memory corruption w/blank lines [BZ #18887]
> +
> +    The fix for BZ #17273 introduced a single byte of memory corruption
> when
> +    the line is entirely blank.  It would walk back past the start of the
> +    buffer if the heap happened to be 0x20 or 0x09 and then write a NUL
> byte.
> +       buffer = '\n';
> +       end_ptr = buffer;
> +       while (end_ptr[-1] == ' ' || end_ptr[-1] == '\t')
> +               end_ptr--;
> +       *end_ptr = '\0';
> +
> +    Fix that and rework the tests.  Adding the testcase for BZ #17273 to
> the
> +    existing \040 parser does not really make sense as it's unrelated, and
> +    leads to confusing behavior: it implicitly relies on the new entry
> being
> +    longer than the previous entry (since it just rewinds the FILE*).
> Split
> +    it out into its own dedicated testcase instead.
> +
> +    (cherry picked from commit b0e805fa0d6fea33745952df7b7f5442ca4c374f)
> +
>

This patch needs to have your Signed-off-by and Upstream-Status (Backport)
tags in.

Ross

--001a11377682ff0000052b06873c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 5 February 2016 at 10:26, Jens Rehsack <span dir=3D"ltr">&lt;<a href=3D"=
mailto:rehsack@gmail.com" target=3D"_blank">rehsack@gmail.com</a>&gt;</span=
> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><div id=3D":dap" class=3D"a3s" s=
tyle=3D"overflow:hidden">+commit 3007f797a1a596e954f44879a5a7267966186ba4<b=
r>
+Author: Mike Frysinger &lt;<a href=3D"mailto:vapier@gentoo.org">vapier@gen=
too.org</a>&gt;<br>
+Date:=C2=A0 =C2=A0Fri Aug 28 17:08:49 2015 -0400<br>
+<br>
+=C2=A0 =C2=A0 getmntent: fix memory corruption w/blank lines [BZ #18887]<b=
r>
+<br>
+=C2=A0 =C2=A0 The fix for BZ #17273 introduced a single byte of memory cor=
ruption when<br>
+=C2=A0 =C2=A0 the line is entirely blank.=C2=A0 It would walk back past th=
e start of the<br>
+=C2=A0 =C2=A0 buffer if the heap happened to be 0x20 or 0x09 and then writ=
e a NUL byte.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0buffer =3D &#39;\n&#39;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0end_ptr =3D buffer;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0while (end_ptr[-1] =3D=3D &#39; &#39; || end_pt=
r[-1] =3D=3D &#39;\t&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0end_ptr--;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0*end_ptr =3D &#39;\0&#39;;<br>
+<br>
+=C2=A0 =C2=A0 Fix that and rework the tests.=C2=A0 Adding the testcase for=
 BZ #17273 to the<br>
+=C2=A0 =C2=A0 existing \040 parser does not really make sense as it&#39;s =
unrelated, and<br>
+=C2=A0 =C2=A0 leads to confusing behavior: it implicitly relies on the new=
 entry being<br>
+=C2=A0 =C2=A0 longer than the previous entry (since it just rewinds the FI=
LE*).=C2=A0 Split<br>
+=C2=A0 =C2=A0 it out into its own dedicated testcase instead.<br>
+<br>
+=C2=A0 =C2=A0 (cherry picked from commit b0e805fa0d6fea33745952df7b7f5442c=
a4c374f)<br>
+<br></div></blockquote></div><br>This patch needs to have your Signed-off-=
by and Upstream-Status (Backport) tags in.</div><div class=3D"gmail_extra">=
<br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11377682ff0000052b06873c--
