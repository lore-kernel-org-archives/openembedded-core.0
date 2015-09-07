Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 637F8762B4
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Sep 2015 11:50:21 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so81257025wic.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Sep 2015 04:50:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=o8USeE2Aaj8SfzxB5przblTy79cRZRdkwwIPRYBWxFw=;
	b=hAN2HKVUvzpVoC/vfcV980EXAgJ/HmMP8h5RPBqONB9bTaz2d75JV//9psjulkPhRp
	8PgwJ1JGVdvofczXxFFF8fNAwSWFZhapeRG+sTCJJLJMrpm4VxALAMBSwz6AZG1J4HXz
	Rtr5OzWrY8Pj8gw9Q8KRh/5t8YLGVSla5ViA99qJtRxqOm950oAJZHhx+iz/p04k2sju
	Bova0Mj995AyNHftNeWj6h0jxgKMhRREkbr7ocGUQ4CEAdKsY2TMyAwETIOrpUjVs1ln
	yxEr+zITj8vzg3pteQ2bAM+tGvvhnkZJkGeohD8dLZ8PLYaj8a1Jn7qxbJoGkr1j1iu2
	1trQ==
X-Gm-Message-State: ALoCoQkvy3QLsscc4lWZacEDL4xHzL1w7z3FU6ysnfoRbpui878XsztqA+GfvOTZGZ7mgEF+RSyv
X-Received: by 10.180.88.164 with SMTP id bh4mr31841314wib.18.1441626621568;
	Mon, 07 Sep 2015 04:50:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.27.77.212 with HTTP; Mon, 7 Sep 2015 04:49:52 -0700 (PDT)
In-Reply-To: <1441713069-15402-1-git-send-email-cristina-danielax.agurida@intel.com>
References: <1441713069-15402-1-git-send-email-cristina-danielax.agurida@intel.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Mon, 7 Sep 2015 14:49:52 +0300
Message-ID: <CAHiDW_Fnc+-9gWNB8UhqVtph4foHBAr9PTbWddAMSyrAg_R1eQ@mail.gmail.com>
To: Cristina Agurida <cristina-danielax.agurida@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] oeqa/parselogs: Updated error log whitelist.
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
X-List-Received-Date: Mon, 07 Sep 2015 11:50:22 -0000
Content-Type: multipart/alternative; boundary=f46d044303fcad8711051f26daa3

--f46d044303fcad8711051f26daa3
Content-Type: text/plain; charset=UTF-8

On 8 September 2015 at 14:51, Cristina Agurida <
cristina-danielax.agurida@intel.com> wrote:

> [YOCTO #7898]
> [YOCTO #7760]
> [YOCTO #7761]
> [YOCTO #7804]
>
> Signed-off-by: Cristina Agurida <cristina-danielax.agurida@intel.com>
> ---
>  meta/lib/oeqa/runtime/parselogs.py | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/meta/lib/oeqa/runtime/parselogs.py
> b/meta/lib/oeqa/runtime/parselogs.py
> index ed43510..367ee6d 100644
> --- a/meta/lib/oeqa/runtime/parselogs.py
> +++ b/meta/lib/oeqa/runtime/parselogs.py
> @@ -88,6 +88,7 @@ ignore_errors = {
>          '(EE) AIGLX: reverting to software rendering',
>          ] + x86_common,
>      'core2_32' : [
> +        'ACPI: No _BQC method, cannot determine initial brightness',
>          '[Firmware Bug]: ACPI: No _BQC method, cannot determine initial
> brightness',
>          '(EE) Failed to load module "psb"',
>          '(EE) Failed to load module psb',
> @@ -96,6 +97,14 @@ ignore_errors = {
>          '(EE) open /dev/fb0: No such file or directory',
>          '(EE) AIGLX: reverting to software rendering',
>          ] + x86_common,
> +    'intel-corei7-64' : [
> +        'Failed to find URL:http://ipv4.connman.net/online/status.html',
> +        'Online check failed for',
>

These two should not be corei7 specific.


> +        "controller can't do DEVSLP, turning off",
> +        ] + common_errors,
> +    'nuc' : [
> +        '(EE) Failed to load module "fbdev"',
>
+        ] + common_errors,
>

Maybe I've misunderstood how the whitelist grep works but shouldn't this be
caught by this case already in common errors:
    "Failed to load module \"fbdev\""



>      'crownbay' : x86_common,
>      'genericx86' : x86_common,
>      'genericx86-64' : x86_common,
> --
> 2.1.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--f46d044303fcad8711051f26daa3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On 8 September 2015 at 14:51, Cristina Agurida <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:cristina-danielax.agurida@intel.com" target=3D"_blank">cris=
tina-danielax.agurida@intel.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;bo=
rder-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex">=
[YOCTO #7898]<br>
[YOCTO #7760]<br>
[YOCTO #7761]<br>
[YOCTO #7804]<br>
<br>
Signed-off-by: Cristina Agurida &lt;<a href=3D"mailto:cristina-danielax.agu=
rida@intel.com">cristina-danielax.agurida@intel.com</a>&gt;<br>
---<br>
=C2=A0meta/lib/oeqa/runtime/parselogs.py | 9 +++++++++<br>
=C2=A01 file changed, 9 insertions(+)<br>
<br>
diff --git a/meta/lib/oeqa/runtime/parselogs.py b/meta/lib/oeqa/runtime/par=
selogs.py<br>
index ed43510..367ee6d 100644<br>
--- a/meta/lib/oeqa/runtime/parselogs.py<br>
+++ b/meta/lib/oeqa/runtime/parselogs.py<br>
@@ -88,6 +88,7 @@ ignore_errors =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;(EE) AIGLX: reverting to software re=
ndering&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0] + x86_common,<br>
=C2=A0 =C2=A0 =C2=A0&#39;core2_32&#39; : [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;ACPI: No _BQC method, cannot determine in=
itial brightness&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;[Firmware Bug]: ACPI: No _BQC method=
, cannot determine initial brightness&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;(EE) Failed to load module &quot;psb=
&quot;&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;(EE) Failed to load module psb&#39;,=
<br>
@@ -96,6 +97,14 @@ ignore_errors =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;(EE) open /dev/fb0: No such file or =
directory&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;(EE) AIGLX: reverting to software re=
ndering&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0] + x86_common,<br>
+=C2=A0 =C2=A0 &#39;intel-corei7-64&#39; : [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;Failed to find URL:<a href=3D"http://ipv4=
.connman.net/online/status.html" rel=3D"noreferrer" target=3D"_blank">http:=
//ipv4.connman.net/online/status.html</a>&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;Online check failed for&#39;,<br>
</blockquote><div><br></div><div>These two should not be corei7 specific.</=
div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);bord=
er-left-style:solid;padding-left:1ex">+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;co=
ntroller can&#39;t do DEVSLP, turning off&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ] + common_errors,<br>
+=C2=A0 =C2=A0 &#39;nuc&#39; : [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;(EE) Failed to load module &quot;fbdev&qu=
ot;&#39;,<br></blockquote><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204)=
;border-left-style:solid;padding-left:1ex">+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ] +=
 common_errors,<br></blockquote><div><br class=3D"">Maybe I&#39;ve misunder=
stood how the whitelist grep works but shouldn&#39;t this be caught by this=
 case already in common errors:</div><div>=C2=A0 =C2=A0 &quot;Failed to loa=
d module \&quot;fbdev\&quot;&quot;<br></div><div><br></div><div>=C2=A0</div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;=
padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0&#39;crownbay&#39; : x86_common,<br>
=C2=A0 =C2=A0 =C2=A0&#39;genericx86&#39; : x86_common,<br>
=C2=A0 =C2=A0 =C2=A0&#39;genericx86-64&#39; : x86_common,<br>
<span class=3D""><font color=3D"#888888">--<br>
2.1.4<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</font></span></blockquote></div><br></div></div>

--f46d044303fcad8711051f26daa3--
