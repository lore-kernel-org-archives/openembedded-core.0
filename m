Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21193.1793392462197121093
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 13:34:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=ImD8Ftay;
 spf=pass (domain: gmail.com, ip: 209.85.128.175, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-8871ada1a26so9283937b3.1
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 13:34:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793392461; cv=none;
        d=google.com; s=arc-20260327;
        b=n45TJA/8LEV+W9y868tIvubyycvvZbAyZhCokefy7mKi3iIRk433WeGFSxSuIzha9N
         HdTLyFJiEjXpXTu3TXBxpS7tZvbB+inW6+u1TZcqRY46+SFeKpdEXZbRomDg6xdL0kc/
         c+eMk66CabUhZ3F3ST+VwL2mZoBGdfsuN49X+k4u6dKxeir4ncL6B9R9IE2cX8B0l6BX
         g1Jwp7/Zl1LmC1dFlphFURPPq8uEg98tSit3XJU/woGNSlMGTpPHy9a75Ldnjkb+ZNTB
         s2IgnWvrC6WSZH8HhGG0ImcxECUbVBbjibKUCYq9vHIuVY4Z2AXv6uh7GH5oy8AIQ8OJ
         WMzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=MlcnK/P8C55EXr1KGmwTSz5z8rg16I/Y9iGCaPWQqRQ=;
        fh=C9smH8dbmvApy/i4TCVtxV+ZxR/rmGm4XnjO6ZsFK+0=;
        b=I3iBg3TOn9j6RJ1w73yDya3t9wRSTLRvrsrsQVjD4TCbtixRnzGIvEeFYeMa8H4CRI
         cbRbtR1YNIbJqActWhlyZK86+M6ab0jrNZmkRgS0JNqEwyeKsJjCMd84hU2OPdkdHdDQ
         3ZEdp1X2k8r93JJJhfOShIPs419DWLm8BlTDa3JGDpJydrlnFBuoYDqLisScvWxklIQB
         TDQh8J2vQc1eCrz1n6Z4ROzR43/fHUBfLQdMQFQOj8bVuosuwWFg9Tl2TkVal7n/CdEw
         fueALpLzE0gElJ1djW3i4qayph+pW+rLGVR60Ty8W9wjQe+MfygdaiOPum+0y7hcHJdj
         5pBA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793392461; x=1793997261; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MlcnK/P8C55EXr1KGmwTSz5z8rg16I/Y9iGCaPWQqRQ=;
        b=ImD8Ftay7dtv5ZhZ6oOrz3UxnZYxNkhKIFKwYK/ONNr/Lv2hiaC2DIc4n3SHGyuXL+
         q5ZNplO/tz/fzZYHEIzYAbI16Lxve9HOvXZq8EYAXd7+DmptoJLotcAbT42+8VLmo6ls
         ffXrzvqC/bbh47WsgJQiCBBxzcqh9WGNzYw/ey5PEH7WfHr2bQ4G0a7Vimv5lZ0EHJct
         GDfOjZQrrlN+MMBGpA5eRHuv7HC4EC6C01CgzbfRcBY5WEwT0TxhPOfK4tVNgqaWYXKb
         hyKmc9l8k6EG1oyGXW5Kjo598Ua23+tc+uZKaIe2WPdxM09VCyzfJ/eXOg4md20UPk3i
         hDPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793392461; x=1793997261;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MlcnK/P8C55EXr1KGmwTSz5z8rg16I/Y9iGCaPWQqRQ=;
        b=AxCNGB4EcnOgxv7e6Aj+v6HTRZuD6YZ+yBDXHkgynnbygJDDEooJZp7f6bv/sx2Smc
         auUEIe6dynogYp7DbD84//ovvyPkx6pAG7CeIwKKabQh1Y0tF3/ymDYgX/aZ+jI8abfW
         3ZTpdG3heBnLkjiNG69uicSGRaWdNyGO2Vvnunij28pv4p5zloTrQEZQHHQqevpfyjze
         b5GCOnjFwKjlQ8bBY80FZDa4kMjCAU6CBY/79BaJ8LW7DUUlj1eD3NIsVKuFNXR1ohpA
         DiN5k9jk1mS27DxjrTvPxL6FWDdhSycSchiJRWe1wDnYb2jQKfT6sOximlRKddnYItS4
         shgw==
X-Forwarded-Encrypted: i=1; AKwUvBxO9HZADR4T9/BvPeIyIFPxan6qwpbWrxhU59NVU5kUyoeDLCzUNxRme4X1rxifxChEpeYu/FaDRMvxhd1iL7tZMg==@lists.openembedded.org
X-Gm-Message-State: AFq9FYLFSD2s8AGoDbCu5bAP8yhjy6J8XjQqMO8/viXmhRylMvUI9nTN
	CCzOtjqOwal4zGP1x1sMS4EVTq1aKtkxsHTZqzrSi3tRHteeseD+ghC+IDWAQg90HCvSz+nSCi5
	iUstu2mWyFzAW4oQ8tatAde4L3I9Md1Y=
X-Gm-Gg: AYBFou1XKzIOaX+ZTl9egXKjcuamWw8jQiJ+zX5tz0ozuO8KqTRdvrp9VbmcST1kFp4
	O2I8CAR4R4cu+nkkq+XNRZPmHZxhh7oFK809cX4fyMvrPPx6Zw7h8cvktU+E/sNuo3v1NeYAuHM
	TGX0HWGbg/sGGFwXWx5Rfy/NesYDc4wJVkDFKIe3wdt4iHGVDrlPSTGXsVg1Zp78vZmzb9XDcPo
	Sm7qLq1WlksPOHTrzfu4l3vvTCUdtnKn8vFGKzNZUaw7gLjdBbcdjtH3ScWQjPzhaGTTJRl+AUt
	Y0kFItjfdshw8/GDFxV2b9oEFmjTytOyKBhiKuLvsLsMEDNA3T20nFiw4ZsEojEL+KE/47k634V
	CTFVLWd2a8CZzD55NrNOLA2uh/Ab5JlSiiW9vMqqH3DvJz5flOyKeagFvHSNjgeUU4B8BdTID3o
	at6hi20tST3ff0szydJJ6Vt5n4tH/buDMmzsIWVoxNfWq5XeKxA+dQT3ULE4Nn033X4oqCCXdup
	vW/UF1dvtpNFRlzPvzyN241+1/cHq6Vqk6EVVwJha6ifn7kkvB7PVtHVrPXEGvkZUdSSVPDuIcp
	U/Bi7VK9o6FGUwjw/RPVQ8o3k2UzuUkLNHjdwq80yH5K3o5wshGfyY3RladSniCZvgoulnMlg91
	ZQfLd+uM2Y/+1b34gXX1u23zVK1ZcpAqtIOGNRno+als=
X-Received: by 2002:a05:690c:e20a:10b0:8b0:e10d:1975 with SMTP id
 00721157ae682-8b2b66e9f1cmr12729687b3.29.1793392461083; Fri, 30 Oct 2026
 13:34:21 -0700 (PDT)
MIME-Version: 1.0
References: <20261030133350.20515-1-jaipaul.cheernam@est.tech> <65be739f-3883-4bf3-a8d7-6e826b036394@bootlin.com>
In-Reply-To: <65be739f-3883-4bf3-a8d7-6e826b036394@bootlin.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 30 Oct 2026 13:33:54 -0700
X-Gm-Features: AclHuK9zdj4KgaVdP-S5DbS3mgi-Kke4uwu_r2XGVdr2tnpSLgL9XlPBcJ4Dkb0
Message-ID: <CAMKF1sqaxYmO99MQS5aL9E8TwQNYDBDvnDgqHsFGa-WanUHVSg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] elfutils: skip run-stackprof-system.sh ptest
 under qemu
To: joaomarcos.costa@bootlin.com
Cc: Jaipaul Cheernam <jaipaul.cheernam@est.tech>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000095f832065f14b8de"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 20:34:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249072

--00000000000095f832065f14b8de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I am carrying some patches to fix them, see if they can help and you can
consolidate. -
https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dyoe/mut&=
id=3D0d9347b760902b451e02ccda31c34abdc2c62acb

On Fri, Oct 30, 2026 at 7:52=E2=80=AFAM Joao Marcos Costa via openembedded-=
core
<joaomarcos.costa=3Dbootlin.com@lists.openembedded.org> wrote:

> Hello, Jaipaul
>
> On 10/30/26 2:33 PM, Jaipaul Cheernam wrote:
> > Non-deterministic under qemu as needs userspace perf samples in a fixed
> window
> > Issue already reported upstream and updated ticket with details
> >
> > Reported upstream: https://sourceware.org/bugzilla/show_bug.cgi?id=3D34=
544
> >
> > Skip test case via ELFUTILS_PTEST_SKIP
> >
> > ptest results:
> > Before:
> > glibc: 263 PASSED, 45 SKIPPED, 0 FAILED
> > musl: 255 PASSED, 44 SKIPPED, 0 FAILED
> > clang: 263 PASSED, 45 SKIPPED, 0 FAILED
> >
> > with change:
> > glibc: 262 PASSED, 46 SKIPPED, 0 FAILED
> > musl: 254 PASSED, 45 SKIPPED, 0 FAILED,
> > clang: 262 PASSED, 46 SKIPPED, 0 FAILED
> >
> > [YOCTO #16473]
> >
> > Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> > ---
> >   meta/recipes-devtools/elfutils/elfutils_0.197.bb | 10 ++++++++++
> >   1 file changed, 10 insertions(+)
> (...)
>
> Thanks for the patch.
>
> Out of curiosity, why using an :append (unconditional) for
> do_install_ptest() instead of simply adding the chunk of code into the
> task itself?
>
> Reviewed-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
> --
> Best regards,
> Jo=C3=A3o Marcos Costa
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#249051):
> https://lists.openembedded.org/g/openembedded-core/message/249051
> Mute This Topic: https://lists.openembedded.org/mt/122011114/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000095f832065f14b8de
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I am carrying some patches to fix them, see if they can he=
lp and you=C2=A0can consolidate. -=C2=A0<a href=3D"https://git.openembedded=
.org/openembedded-core-contrib/commit/?h=3Dyoe/mut&amp;id=3D0d9347b760902b4=
51e02ccda31c34abdc2c62acb">https://git.openembedded.org/openembedded-core-c=
ontrib/commit/?h=3Dyoe/mut&amp;id=3D0d9347b760902b451e02ccda31c34abdc2c62ac=
b</a></div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D=
"ltr" class=3D"gmail_attr">On Fri, Oct 30, 2026 at 7:52=E2=80=AFAM Joao Mar=
cos Costa via openembedded-core &lt;joaomarcos.costa=3D<a href=3D"mailto:bo=
otlin.com@lists.openembedded.org">bootlin.com@lists.openembedded.org</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hello, =
Jaipaul<br>
<br>
On 10/30/26 2:33 PM, Jaipaul Cheernam wrote:<br>
&gt; Non-deterministic under qemu as needs userspace perf samples in a fixe=
d window<br>
&gt; Issue already reported upstream and updated ticket with details<br>
&gt; <br>
&gt; Reported upstream: <a href=3D"https://sourceware.org/bugzilla/show_bug=
.cgi?id=3D34544" rel=3D"noreferrer" target=3D"_blank">https://sourceware.or=
g/bugzilla/show_bug.cgi?id=3D34544</a><br>
&gt; <br>
&gt; Skip test case via ELFUTILS_PTEST_SKIP<br>
&gt; <br>
&gt; ptest results:<br>
&gt; Before:<br>
&gt; glibc: 263 PASSED, 45 SKIPPED, 0 FAILED<br>
&gt; musl: 255 PASSED, 44 SKIPPED, 0 FAILED<br>
&gt; clang: 263 PASSED, 45 SKIPPED, 0 FAILED<br>
&gt; <br>
&gt; with change:<br>
&gt; glibc: 262 PASSED, 46 SKIPPED, 0 FAILED<br>
&gt; musl: 254 PASSED, 45 SKIPPED, 0 FAILED,<br>
&gt; clang: 262 PASSED, 46 SKIPPED, 0 FAILED<br>
&gt; <br>
&gt; [YOCTO #16473]<br>
&gt; <br>
&gt; Signed-off-by: Jaipaul Cheernam &lt;jaipaul.cheernam@est.tech&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0meta/recipes-devtools/elfutils/<a href=3D"http://elfutils_=
0.197.bb" rel=3D"noreferrer" target=3D"_blank">elfutils_0.197.bb</a> | 10 +=
+++++++++<br>
&gt;=C2=A0 =C2=A01 file changed, 10 insertions(+)<br>
(...)<br>
<br>
Thanks for the patch.<br>
<br>
Out of curiosity, why using an :append (unconditional) for <br>
do_install_ptest() instead of simply adding the chunk of code into the <br>
task itself?<br>
<br>
Reviewed-by: Jo=C3=A3o Marcos Costa &lt;<a href=3D"mailto:joaomarcos.costa@=
bootlin.com" target=3D"_blank">joaomarcos.costa@bootlin.com</a>&gt;<br>
-- <br>
Best regards,<br>
Jo=C3=A3o Marcos Costa<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#249051): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/249051" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/249051</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/122011114/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/122011114/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000095f832065f14b8de--
