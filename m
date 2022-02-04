Return-Path: <kergoth@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F0BEC433EF
	for <webhook@archiver.kernel.org>; Fri,  4 Feb 2022 21:17:27 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web11.15130.1644009445581499334
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Feb 2022 13:17:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WDd79dZf;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: kergoth@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id k25so22733226ejp.5
        for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Feb 2022 13:17:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=17zK9COjtc56XB9hcYgTPiNCdl0REpBuzD2HfDCEuK0=;
        b=WDd79dZfLLCikqAvWFm2BdUX3jP3E1rS3+X9idgqBsPouZERyjXmSXxXJYk4lNoi82
         Fgh+/eaUFXEwUbkd5im0G4iznqV6nsuBhAW/cc8ilAchDpf1UFgS6/Q5Wj1plLT2jdDo
         /zIHRwlwHfdpC3ILAWM13SsupGS/NfeWjpC63amVt78DBdR35s5n5+TQ1TYjN1WlHgBU
         wsoOIlc9QGo7szHN7RXkQBONQuWQnXSU2QkyzGc8RVGLdcFtbl7EizPe55wEJfHYn3ug
         d8trhSIsqQT4Bf7ynSaIP/YealHJrzwoCg+z9bYy1ejOFIxf0iEu4Zt/C/2Qt8E7J2SD
         V+QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=17zK9COjtc56XB9hcYgTPiNCdl0REpBuzD2HfDCEuK0=;
        b=PHrOh97HgtFWKQPketAsmp0Kwi9tL6cFA9dmxrCYvWz47k8eZKWnlp9f1qpLlg5s5I
         UrWAYPp2AjlPq3WStwreXAvLe1Yh4AoorfOe86ZaAELYqYi49ZNGPiQ3xUZMGaPN9hDP
         17DrWlZ2FmOL/ZWt9UzzbzEy3ftSx0/X9zPTm5SrKsgINtSy802BDvjZSayXAPvYdOfx
         6IclubHVCexSnHIutADvIv5yuMhp2HLopG0OMFy1H7ZNMtSuao6IJHwIJynAE5OZMQ/J
         ulz00YhLGHMeGU8dYP04SVwHShcCHzpzVz1GaKaozd6yf/5Zc/LaDznqReQoudW5VGfN
         pcNg==
X-Gm-Message-State: AOAM53349ckiqPsfkn1t7lTRuyb0ZlJW7UG2uis5XR7y/ea+yh2gPT0A
	2Sj7T1NAnKFMtdnP5cc93V1LxSez4x5ScUEb6jM=
X-Google-Smtp-Source: 
 ABdhPJxoh4v/1biVRnMdSfEtEFR3wvvKr55yVleyPwJtG8w7NFQos9+ZjqjeuAL71OCEf+mGuwuwJDzh6yUfMB6FtqI=
X-Received: by 2002:a17:907:3e1d:: with SMTP id
 hp29mr632836ejc.701.1644009443967;
 Fri, 04 Feb 2022 13:17:23 -0800 (PST)
MIME-Version: 1.0
References: <20220204204027.2323845-1-alex@linutronix.de>
In-Reply-To: <20220204204027.2323845-1-alex@linutronix.de>
From: Christopher Larson <kergoth@gmail.com>
Date: Fri, 4 Feb 2022 14:17:12 -0700
Message-ID: 
 <CABcZANmbN3PFXY1VWqgYY=p3emwWGWGDTRt9WOEPav3D9vK2zA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] runqemu: preload uninative libraries when host
 gl drivers are in use
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: multipart/alternative; boundary="000000000000ea824f05d737c69b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Feb 2022 21:17:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161384

--000000000000ea824f05d737c69b
Content-Type: text/plain; charset="UTF-8"

What will this do if uninative isn't enabled?

On Fri, Feb 4, 2022 at 1:40 PM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> Some of the host distributions build the drivers in a way (RPATH/RUNPATH)
> that tricks uninative loader into loading pieces of the host libc, if
> the same pieces haven't been previously loaded by native binaries. Mixing
> the two libc versions leads to failures.
>
> This change ensures that the correct (uninative) versions are always in
> use.
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  meta/classes/qemuboot.bbclass | 2 +-
>  scripts/runqemu               | 4 ++++
>  2 files changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/qemuboot.bbclass b/meta/classes/qemuboot.bbclass
> index cc1cbce69d..229bd88527 100644
> --- a/meta/classes/qemuboot.bbclass
> +++ b/meta/classes/qemuboot.bbclass
> @@ -109,7 +109,7 @@ def qemuboot_vars(d):
>      build_vars = ['MACHINE', 'TUNE_ARCH', 'DEPLOY_DIR_IMAGE',
>                  'KERNEL_IMAGETYPE', 'IMAGE_NAME', 'IMAGE_LINK_NAME',
>                  'STAGING_DIR_NATIVE', 'STAGING_BINDIR_NATIVE',
> -                'STAGING_DIR_HOST', 'SERIAL_CONSOLES']
> +                'STAGING_DIR_HOST', 'SERIAL_CONSOLES', 'UNINATIVE_LOADER']
>      return build_vars + [k for k in d.keys() if k.startswith('QB_')]
>
>  do_write_qemuboot_conf[vardeps] += "${@' '.join(qemuboot_vars(d))}"
> diff --git a/scripts/runqemu b/scripts/runqemu
> index 4e05c1bb15..7d1f85f357 100755
> --- a/scripts/runqemu
> +++ b/scripts/runqemu
> @@ -460,6 +460,10 @@ class BaseConfig(object):
>          except subprocess.CalledProcessError as e:
>              raise RunQemuError("Could not determine the path to dri
> drivers on the host via pkg-config.\nPlease install Mesa development files
> (particularly, dri.pc) on the host machine.")
>          os.environ['LIBGL_DRIVERS_PATH'] = dripath.decode('utf-8').strip()
> +        uninative_path = os.path.dirname(self.get("UNINATIVE_LOADER"))
> +        preload_items = ['libdl.so.2', 'librt.so.1', 'libpthread.so.0']
> +        preload_paths = [os.path.join(uninative_path, i) for i in
> preload_items]
> +        os.environ['LD_PRELOAD'] = " ".join(preload_paths)
>
>      def check_args(self):
>          for debug in ("-d", "--debug"):
> --
> 2.20.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#161382):
> https://lists.openembedded.org/g/openembedded-core/message/161382
> Mute This Topic: https://lists.openembedded.org/mt/88916306/3617123
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> kergoth@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Senior Software Engineer, Mentor Graphics

--000000000000ea824f05d737c69b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">What will this do if uninative isn&#39;t enabled?</div><br=
><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, F=
eb 4, 2022 at 1:40 PM Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@=
gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Some of the host distributions build the d=
rivers in a way (RPATH/RUNPATH)<br>
that tricks uninative loader into loading pieces of the host libc, if<br>
the same pieces haven&#39;t been previously loaded by native binaries. Mixi=
ng<br>
the two libc versions leads to failures.<br>
<br>
This change ensures that the correct (uninative) versions are always in use=
.<br>
<br>
Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix.de" =
target=3D"_blank">alex@linutronix.de</a>&gt;<br>
---<br>
=C2=A0meta/classes/qemuboot.bbclass | 2 +-<br>
=C2=A0scripts/runqemu=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 4 ++++<br>
=C2=A02 files changed, 5 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/classes/qemuboot.bbclass b/meta/classes/qemuboot.bbclass<=
br>
index cc1cbce69d..229bd88527 100644<br>
--- a/meta/classes/qemuboot.bbclass<br>
+++ b/meta/classes/qemuboot.bbclass<br>
@@ -109,7 +109,7 @@ def qemuboot_vars(d):<br>
=C2=A0 =C2=A0 =C2=A0build_vars =3D [&#39;MACHINE&#39;, &#39;TUNE_ARCH&#39;,=
 &#39;DEPLOY_DIR_IMAGE&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;KERNEL_I=
MAGETYPE&#39;, &#39;IMAGE_NAME&#39;, &#39;IMAGE_LINK_NAME&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;STAGING_=
DIR_NATIVE&#39;, &#39;STAGING_BINDIR_NATIVE&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;STAGING_DIR_H=
OST&#39;, &#39;SERIAL_CONSOLES&#39;]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;STAGING_DIR_H=
OST&#39;, &#39;SERIAL_CONSOLES&#39;, &#39;UNINATIVE_LOADER&#39;]<br>
=C2=A0 =C2=A0 =C2=A0return build_vars + [k for k in d.keys() if k.startswit=
h(&#39;QB_&#39;)]<br>
<br>
=C2=A0do_write_qemuboot_conf[vardeps] +=3D &quot;${@&#39; &#39;.join(qemubo=
ot_vars(d))}&quot;<br>
diff --git a/scripts/runqemu b/scripts/runqemu<br>
index 4e05c1bb15..7d1f85f357 100755<br>
--- a/scripts/runqemu<br>
+++ b/scripts/runqemu<br>
@@ -460,6 +460,10 @@ class BaseConfig(object):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0except subprocess.CalledProcessError as e=
:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise RunQemuError(&quot;Co=
uld not determine the path to dri drivers on the host via pkg-config.\nPlea=
se install Mesa development files (particularly, dri.pc) on the host machin=
e.&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0os.environ[&#39;LIBGL_DRIVERS_PATH&#39;] =
=3D dripath.decode(&#39;utf-8&#39;).strip()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uninative_path =3D os.path.dirname(self.get(&q=
uot;UNINATIVE_LOADER&quot;))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 preload_items =3D [&#39;libdl.so.2&#39;, &#39;=
librt.so.1&#39;, &#39;libpthread.so.0&#39;]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 preload_paths =3D [os.path.join(uninative_path=
, i) for i in preload_items]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 os.environ[&#39;LD_PRELOAD&#39;] =3D &quot; &q=
uot;.join(preload_paths)<br>
<br>
=C2=A0 =C2=A0 =C2=A0def check_args(self):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for debug in (&quot;-d&quot;, &quot;--deb=
ug&quot;):<br>
-- <br>
2.20.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#161382): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/161382" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/161382</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/88916306/3617=
123" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/88916306/3617123</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:kergoth@gmail.com" target=
=3D"_blank">kergoth@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr">Christoph=
er Larson<br>kergoth at gmail dot com<br>Founder - BitBake, OpenEmbedded, O=
penZaurus<br>Senior Software Engineer, Mentor Graphics</div></div></div></d=
iv>

--000000000000ea824f05d737c69b--

