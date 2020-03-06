Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f67.google.com (mail-ua1-f67.google.com
	[209.85.222.67])
	by mail.openembedded.org (Postfix) with ESMTP id 4798B61B20
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Mar 2020 11:29:01 +0000 (UTC)
Received: by mail-ua1-f67.google.com with SMTP id q17so545779uao.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Mar 2020 03:29:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=zOP9HiZUDgux4YW89m2rb003wIlixbOii0oAkBcxoQg=;
	b=bqtfGdnp/6hn9U2tWz0Cnr6ZRPl0QU7aYYzugEMcgtlHbnb2d5V08rVNw1CG++1PSP
	4OJC2YJOR0CC2m/RkAr3Gb5PNdiBBEpL6YUkOJKeZoa1AeQKgSp+KEPht8d6SHuJH3rF
	/BsDuLQS4rHi58/F2FZkGCO02adzjKY5YeM3lH+dbZnmI0r5vUGes7+Q6zj13oukIGIy
	l+2Q9FbfVG91hOsbWuTWSE+lq9PtB3cuLO/W+bVsoh86nxrHVhOuBQ1gbxS8b6ao6/G+
	U7MG9VOxXhsHFbhF6/9rUGEGy/o2tc5h2Zew49x8zN4APvQX/k7lNjibiot2/uRcnEg3
	pb7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=zOP9HiZUDgux4YW89m2rb003wIlixbOii0oAkBcxoQg=;
	b=VSkm+hOgZWfSYhaLeWf2DpmPyreY2ELxRsrQaNfoDK2mHOg0rcrOsqoQhRoPKAd5XJ
	LYe3YfFzaPVmqCuzCfydU0V3niwuaVyyD7IWK2rGIvKg+cLfe68GQ41QSsDd3rVkoEaV
	3IozEuqK+mh6rzfqbZwAHixFLC6x0ftYNL+uVDaHISeRKrbXA9CXARmc3WT4+q6xorCs
	3NVyXcF/DiFnunQS+4ypYCTCv2iEs/7h95ESjtbvJcRtwqjeOaUPh2ifykdP+hG2YqMh
	tvGPIB32MlzF81pWLpNqGsuUYidIdrkfJsjA7kIiZvqJ5j70rldMpx1t2Sxebk2/ugod
	DYBA==
X-Gm-Message-State: ANhLgQ1mtRKKv809Yk2AI1jqBefIk2DFxCNHTV47V6yLlezINGTDbc1R
	nOScDHMvnau2GbGyzA9mS6iLq0qLFfJ80Crgp+KQHQ==
X-Google-Smtp-Source: ADFU+vtM+QQRTWS0xT8n02EjUqen7EWTqBS7v4AyLeNt+qLYXsvIY2vLAQq4TNyFe822wkgSRZthfzlsGpFadvvoVvg=
X-Received: by 2002:ab0:4aca:: with SMTP id t10mr1375162uae.89.1583494141999; 
	Fri, 06 Mar 2020 03:29:01 -0800 (PST)
MIME-Version: 1.0
References: <1583493916-432974-1-git-send-email-mingli.yu@windriver.com>
In-Reply-To: <1583493916-432974-1-git-send-email-mingli.yu@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 6 Mar 2020 12:28:50 +0100
Message-ID: <CANNYZj_ntzqYqw=99LwqFY9=ssQPkEHrVCjGs_ZUN-C1Mj-ywA@mail.gmail.com>
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] parselogs.py: ignore rdrand initialization failure
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
X-List-Received-Date: Fri, 06 Mar 2020 11:29:01 -0000
Content-Type: multipart/alternative; boundary="000000000000d6810d05a02df50e"

--000000000000d6810d05a02df50e
Content-Type: text/plain; charset="UTF-8"

qemux86_64 is used extensively on the autobuilder, so what are the
circumstances where this issue arises?

Alex

On Fri, 6 Mar 2020 at 12:25, <mingli.yu@windriver.com> wrote:

> From: Mingli Yu <mingli.yu@windriver.com>
>
> On the system whose cpu doesn't support rdrand,
> there comes below message when start rngd service
>  #systemctl status rngd
>  [snip]
>  Feb 25 05:08:14 qemux86-64 rngd[133]: [rdrand]: Initialization Failed
>  [snip]
>
> Actually the failed message doesn't matter as it
> only indicates one entropy source as rdrand fails
> to initialize and won't affect rngd function.
>
> So add to ignore the failure message to fix below
> error during do_testimage:
> NOTE:
> ======================================================================
> NOTE: FAIL: test_parselogs (parselogs.ParseLogsTest)
> NOTE:
> ----------------------------------------------------------------------
> NOTE: Traceback (most recent call last):
>   File
> "/buildarea/layers/oe-core/meta/lib/oeqa/core/decorator/__init__.py", line
> 36, in wrapped_f
>     return func(*args, **kwargs)
>   File
> "/buildarea/layers/oe-core/meta/lib/oeqa/runtime/cases/parselogs.py", line
> 370, in test_parselogs
>     self.assertEqual(errcount, 0, msg=self.msg)
> AssertionError: 1 != 0 : Log:
> /buildarea/tmp/work/qemux86-64-wrs-linux/wrlinux-image-std/1.0-r5/target_logs/daemon.log
> Central error: 2020-03-06T09:45:12.774286+00:00 qemux86-64 rngd[134]:
> [rdrand]: Initialization Failed
>
> Reference: https://github.com/nhorman/rng-tools/pull/84
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  meta/lib/oeqa/runtime/cases/parselogs.py | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/lib/oeqa/runtime/cases/parselogs.py
> b/meta/lib/oeqa/runtime/cases/parselogs.py
> index 3cad070..6444fe8 100644
> --- a/meta/lib/oeqa/runtime/cases/parselogs.py
> +++ b/meta/lib/oeqa/runtime/cases/parselogs.py
> @@ -56,7 +56,8 @@ common_errors = [
>      "error retry time-out =",
>      "logind: cannot setup systemd-logind helper (-61), using legacy
> fallback",
>      "Error changing net interface name 'eth0' to ",
> -    "Cannot find a map file"
> +    "Cannot find a map file",
> +    "[rdrand]: Initialization Failed"
>      ]
>
>  video_related = [
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000d6810d05a02df50e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>qemux86_64 is used extensively on the autobuilder, so=
 what are the circumstances where this issue arises?</div><div><br></div><d=
iv>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Fri, 6 Mar 2020 at 12:25, &lt;<a href=3D"mailto:mingli.=
yu@windriver.com">mingli.yu@windriver.com</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">From: Mingli Yu &lt;<a href=3D"mai=
lto:mingli.yu@windriver.com" target=3D"_blank">mingli.yu@windriver.com</a>&=
gt;<br>
<br>
On the system whose cpu doesn&#39;t support rdrand,<br>
there comes below message when start rngd service<br>
=C2=A0#systemctl status rngd<br>
=C2=A0[snip]<br>
=C2=A0Feb 25 05:08:14 qemux86-64 rngd[133]: [rdrand]: Initialization Failed=
<br>
=C2=A0[snip]<br>
<br>
Actually the failed message doesn&#39;t matter as it<br>
only indicates one entropy source as rdrand fails<br>
to initialize and won&#39;t affect rngd function.<br>
<br>
So add to ignore the failure message to fix below<br>
error during do_testimage:<br>
NOTE: =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
NOTE: FAIL: test_parselogs (parselogs.ParseLogsTest)<br>
NOTE: ---------------------------------------------------------------------=
-<br>
NOTE: Traceback (most recent call last):<br>
=C2=A0 File &quot;/buildarea/layers/oe-core/meta/lib/oeqa/core/decorator/__=
init__.py&quot;, line 36, in wrapped_f<br>
=C2=A0 =C2=A0 return func(*args, **kwargs)<br>
=C2=A0 File &quot;/buildarea/layers/oe-core/meta/lib/oeqa/runtime/cases/par=
selogs.py&quot;, line 370, in test_parselogs<br>
=C2=A0 =C2=A0 self.assertEqual(errcount, 0, msg=3Dself.msg)<br>
AssertionError: 1 !=3D 0 : Log: /buildarea/tmp/work/qemux86-64-wrs-linux/wr=
linux-image-std/1.0-r5/target_logs/daemon.log<br>
Central error: 2020-03-06T09:45:12.774286+00:00 qemux86-64 rngd[134]: [rdra=
nd]: Initialization Failed<br>
<br>
Reference: <a href=3D"https://github.com/nhorman/rng-tools/pull/84" rel=3D"=
noreferrer" target=3D"_blank">https://github.com/nhorman/rng-tools/pull/84<=
/a><br>
<br>
Signed-off-by: Mingli Yu &lt;<a href=3D"mailto:mingli.yu@windriver.com" tar=
get=3D"_blank">mingli.yu@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/lib/oeqa/runtime/cases/parselogs.py | 3 ++-<br>
=C2=A01 file changed, 2 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/lib/oeqa/runtime/cases/parselogs.py b/meta/lib/oeqa/runti=
me/cases/parselogs.py<br>
index 3cad070..6444fe8 100644<br>
--- a/meta/lib/oeqa/runtime/cases/parselogs.py<br>
+++ b/meta/lib/oeqa/runtime/cases/parselogs.py<br>
@@ -56,7 +56,8 @@ common_errors =3D [<br>
=C2=A0 =C2=A0 =C2=A0&quot;error retry time-out =3D&quot;,<br>
=C2=A0 =C2=A0 =C2=A0&quot;logind: cannot setup systemd-logind helper (-61),=
 using legacy fallback&quot;,<br>
=C2=A0 =C2=A0 =C2=A0&quot;Error changing net interface name &#39;eth0&#39; =
to &quot;,<br>
-=C2=A0 =C2=A0 &quot;Cannot find a map file&quot;<br>
+=C2=A0 =C2=A0 &quot;Cannot find a map file&quot;,<br>
+=C2=A0 =C2=A0 &quot;[rdrand]: Initialization Failed&quot;<br>
=C2=A0 =C2=A0 =C2=A0]<br>
<br>
=C2=A0video_related =3D [<br>
-- <br>
2.7.4<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--000000000000d6810d05a02df50e--
