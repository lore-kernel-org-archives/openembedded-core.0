Return-Path: <kergoth@gmail.com>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id 67D1079164
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2018 21:29:48 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id s198-v6so10628828oih.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2018 14:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=WoYm9q1wP91POTWRvbtPd1OhGDRqyjwrSdgcjSKDGoA=;
	b=Xs7sgboWvTqMGGWHdVyIgc0x7S3G11zLqq+KvzjAGbn4WvGRsbvxlS33P97Cq+SCC+
	Wk8PquC0zXTda5LngOiNcabbpCo9IOCbOl2nudgQeWZHEb7NPhuFMCQBX0P2XkL5swA/
	8hYZdJbQzsKE/bYUn13WV7sOP29URb8T6KOdVrcY8z2/YsW1TAMM/f6DLguC1yWJtirj
	iaryLdOjjPFwh8MwH6yrSxiA4F0staTbPdeyeRR1jwXGRI3qZoXKmqwKYaQoxE07y7ax
	ZE8ymgr/5S0XemZCsCDXM42/soHA9aTQWqYENamKGFbaVfJesf2GdJhsCHc8GL+SCV88
	Ozyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=WoYm9q1wP91POTWRvbtPd1OhGDRqyjwrSdgcjSKDGoA=;
	b=Zhd/sQUYUaS/n4+TRDKgVP4X+K8Il8K5rJkU5P47vCHKakY53tCIk/a/OIXtVI/jsW
	U1tzVl8RSEkgYSlAcYMNNiOVH4qB1CIYiJtd2cegbEai+rkRPiUcH4G8h8AWaFBNmXdA
	THVUxZEFViKdo0UXZXHNqvFlU/G0wTxmQddLTloYzx/wCvKRjXqG7EfDDqAbimvgw7A9
	TMz00SUjNiUvtplwaPuSjz56HBXVkZFR8lGnnUg6ayjdAu/ndN04WVExw41gGtpzKZup
	1WfPBtpE5ee0a7S+Go9ZmdwyzhRFoaCbyAR1iYoQxB5Nfd5V+im+VEqt6L6bzZ+lN22g
	8j7Q==
X-Gm-Message-State: AOUpUlGgKfuSkLOyTYmzwbl1K4AO8wPSs1qAL9G71atnxq2kts5YFWfN
	Rj8RSTrCCCs9QB4lgMP1tg+cIC59hwJPy4s2gyh1Rg==
X-Google-Smtp-Source: AA+uWPwVPtKqQUxlM869eOQmV26/Lu0OikxspeqzvCL8eTJtWOh0E3wTLIxshI3BTnd4DOCc/mLm1kYwlF8VYjRa3U8=
X-Received: by 2002:aca:6cc6:: with SMTP id
	h189-v6mr33787024oic.140.1534454989396; 
	Thu, 16 Aug 2018 14:29:49 -0700 (PDT)
MIME-Version: 1.0
References: <1534441498-4659-1-git-send-email-jkrishnanjanappa@mvista.com>
In-Reply-To: <1534441498-4659-1-git-send-email-jkrishnanjanappa@mvista.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Thu, 16 Aug 2018 14:29:37 -0700
Message-ID: <CABcZAN=dEfDCWptBRUjO7MTK9Ym-eRt31E4Y-kGH9dXvisFuMw@mail.gmail.com>
To: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] oe-run-native: Add *-native directories under STAGING_BINDIR_NATIVE to PATH environment variable
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
X-List-Received-Date: Thu, 16 Aug 2018 21:29:48 -0000
Content-Type: multipart/alternative; boundary="000000000000911f8205739424b8"

--000000000000911f8205739424b8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 16, 2018 at 10:45 AM Jagadeesh Krishnanjanappa <
jkrishnanjanappa@mvista.com> wrote:

> It helps to find/use native tools under ${STAGING_BINDIR_NATIVE}/*-native=
.
>
> Solving below error:
>
> $ oe-run-native python3-native python3
> Running bitbake -e python3-native
> Error: Unable to find 'python3' in
> .../tmp/work/x86_64-linux/python3-native/3.5.5-r1.0/recipe-sysroot-native=
/usr/bin:.../tmp/work/x86_64-linux/python3-native/3.5.5-r1.0/recipe-sysroot=
-native/bin:.../tmp/work/x86_64-linux/python3-native/3.5.5-r1.0/recipe-sysr=
oot-native/usr/sbin:.../tmp/work/x86_64-linux/python3-native/3.5.5-r1.0/rec=
ipe-sysroot-native/sbin
> Error: Have you run 'bitbake python3-native -caddto_recipe_sysroot'?
> -- snip --
>
> After this change we have native python3 to be found:
>
> $ oe-run-native python3-native python3
> Running bitbake -e python3-native
> Python 3.5.5 (default, Aug  8 2018, 17:45:49)
> [GCC 4.8.5 20150623 (Red Hat 4.8.5-28)] on linux
> Type "help", "copyright", "credits" or "license" for more information.
> >>>
> -- snip --
>
> [YOCTO #12889]
>
> Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
> ---
>  scripts/oe-run-native | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/oe-run-native b/scripts/oe-run-native
> index bbdd1d8..8412b18 100755
> --- a/scripts/oe-run-native
> +++ b/scripts/oe-run-native
> @@ -55,7 +55,7 @@ fi
>  OLD_PATH=3D$PATH
>
>  # look for a tool only in native sysroot
>
> -PATH=3D$OECORE_NATIVE_SYSROOT/usr/bin:$OECORE_NATIVE_SYSROOT/bin:$OECORE=
_NATIVE_SYSROOT/usr/sbin:$OECORE_NATIVE_SYSROOT/sbin
> +PATH=3D$OECORE_NATIVE_SYSROOT/usr/bin:$OECORE_NATIVE_SYSROOT/bin:$OECORE=
_NATIVE_SYSROOT/usr/sbin:$OECORE_NATIVE_SYSROOT/sbin:$(find
> $OECORE_NATIVE_SYSROOT/usr/bin/*-native -maxdepth 1 -type d -printf ":%p"=
)
>

If I'm reading this right, this will leave an empty entry in PATH if no
-native subdirectories are found, which is harmful. I'd suggest reworking
that.
--=20
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Senior Software Engineer, Mentor Graphics

--000000000000911f8205739424b8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On Thu, Aug 16, 2018 at 10:45 AM Jagadeesh Krishnanjanappa=
 &lt;<a href=3D"mailto:jkrishnanjanappa@mvista.com">jkrishnanjanappa@mvista=
.com</a>&gt; wrote:<br><div class=3D"gmail_quote"><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex">It helps to find/use native tools under ${STAGING_BINDIR_NATIVE}/*-na=
tive.<br>
<br>
Solving below error:<br>
<br>
$ oe-run-native python3-native python3<br>
Running bitbake -e python3-native<br>
Error: Unable to find &#39;python3&#39; in .../tmp/work/x86_64-linux/python=
3-native/3.5.5-r1.0/recipe-sysroot-native/usr/bin:.../tmp/work/x86_64-linux=
/python3-native/3.5.5-r1.0/recipe-sysroot-native/bin:.../tmp/work/x86_64-li=
nux/python3-native/3.5.5-r1.0/recipe-sysroot-native/usr/sbin:.../tmp/work/x=
86_64-linux/python3-native/3.5.5-r1.0/recipe-sysroot-native/sbin<br>
Error: Have you run &#39;bitbake python3-native -caddto_recipe_sysroot&#39;=
?<br>
-- snip --<br>
<br>
After this change we have native python3 to be found:<br>
<br>
$ oe-run-native python3-native python3<br>
Running bitbake -e python3-native<br>
Python 3.5.5 (default, Aug=C2=A0 8 2018, 17:45:49)<br>
[GCC 4.8.5 20150623 (Red Hat 4.8.5-28)] on linux<br>
Type &quot;help&quot;, &quot;copyright&quot;, &quot;credits&quot; or &quot;=
license&quot; for more information.<br>
&gt;&gt;&gt;<br>
-- snip --<br>
<br>
[YOCTO #12889]<br>
<br>
Signed-off-by: Jagadeesh Krishnanjanappa &lt;<a href=3D"mailto:jkrishnanjan=
appa@mvista.com" target=3D"_blank">jkrishnanjanappa@mvista.com</a>&gt;<br>
---<br>
=C2=A0scripts/oe-run-native | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/scripts/oe-run-native b/scripts/oe-run-native<br>
index bbdd1d8..8412b18 100755<br>
--- a/scripts/oe-run-native<br>
+++ b/scripts/oe-run-native<br>
@@ -55,7 +55,7 @@ fi<br>
=C2=A0OLD_PATH=3D$PATH<br>
<br>
=C2=A0# look for a tool only in native sysroot<br>
-PATH=3D$OECORE_NATIVE_SYSROOT/usr/bin:$OECORE_NATIVE_SYSROOT/bin:$OECORE_N=
ATIVE_SYSROOT/usr/sbin:$OECORE_NATIVE_SYSROOT/sbin<br>
+PATH=3D$OECORE_NATIVE_SYSROOT/usr/bin:$OECORE_NATIVE_SYSROOT/bin:$OECORE_N=
ATIVE_SYSROOT/usr/sbin:$OECORE_NATIVE_SYSROOT/sbin:$(find $OECORE_NATIVE_SY=
SROOT/usr/bin/*-native -maxdepth 1 -type d -printf &quot;:%p&quot;)<br></bl=
ockquote><div><br></div><div>If I&#39;m reading this right, this will leave=
 an empty entry in PATH if no -native subdirectories are found, which is ha=
rmful. I&#39;d suggest reworking that.<br></div></div>-- <br><div dir=3D"lt=
r" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D=
"ltr"><div><div dir=3D"ltr">Christopher Larson<br>kergoth at gmail dot com<=
br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Senior Software Engineer,=
 Mentor Graphics</div></div></div></div></div>

--000000000000911f8205739424b8--
