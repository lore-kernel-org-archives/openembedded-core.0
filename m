Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-oi0-f48.google.com (mail-oi0-f48.google.com
	[209.85.218.48])
	by mail.openembedded.org (Postfix) with ESMTP id ADD8F6FF60
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 08:09:16 +0000 (UTC)
Received: by mail-oi0-f48.google.com with SMTP id f189so186073119oig.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 01:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=xER4kbWnZdxRe+n4ytPkDZ7gfaSqLSgvClP0oqvLYbI=;
	b=vM+42GW/QFZv91X0rNNCoRyIXDQbzD8ek2wEYngNk0zoA1Xq+ofnnQH0DtLQ6kDmnl
	mMGaGZBPqOPHC7TqnYb6RaKWWaRNGxMMrnzVO9yZBFWGFbTOGH2hzKu8O7oqKay4ziL0
	iZ8ybqegp4hsQIpBUo0M0xpTTflmaY8SUoz2H+lb7dCVtalwsXZ4AYBXpQO8WqXJTY8Y
	SLAaiXe5wsb+D5lly0haQGtBRrylfnNH9kAvC9a7dk9vbMMUcF0e0Gj0IlFMxmUGP2pV
	+JznhVmGFhjoyk4Mcvg46YVXwtdUhHNr4epk09mgYInOmBp0QrXl5JWijeM4/Y9J9G89
	Yugg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=xER4kbWnZdxRe+n4ytPkDZ7gfaSqLSgvClP0oqvLYbI=;
	b=CGSErNxCkc1W8zMK2jGBnoaTfO6WtS5xx47ePBHw2Agmxw12puQ1mgVy2ZgWXkL4ox
	DzsozH5Bl1d8FaO58t7oawkBjqmXnfwKRMWs7KREKmGLeqyx8bvZRnIecGoeEZ+6ZRc+
	hOh3ahTujRdAfdswo/irVhnGGV2vMOgFQIAqx6fhNOZXKgeCc5xrpwT0tRr09ZFiRWUD
	dw3orM8u8QKeLkf2FMWVn91KfUiMX6Ywo/YtcqAVthaKtvDVpcyeDYjCEPgO0hQAUJei
	7qhVYY4aQQwIJPKLfpJP/dk8OW0tcq3ruJCBQGZ9NHcLScQxbC3DKkO+6J99eoNvQMRQ
	bRpw==
X-Gm-Message-State: AEkoouuwWQJk6e/fx/QH0YCKLN/C9FnOTmWEZTcx6wcBSl5sKFMGpWGzQ+ra9cT0P50kvsWtI7sggh69/jdc7751
X-Received: by 10.157.9.73 with SMTP id 67mr16771336otp.65.1471939756819; Tue,
	23 Aug 2016 01:09:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.241.11 with HTTP; Tue, 23 Aug 2016 01:08:46 -0700 (PDT)
In-Reply-To: <1471892273-5919-1-git-send-email-fabio.berton@ossystems.com.br>
References: <1471892273-5919-1-git-send-email-fabio.berton@ossystems.com.br>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Tue, 23 Aug 2016 11:08:46 +0300
Message-ID: <CAHiDW_HVkdb2dt=RiqrG+abyD1MqcnTkceZqm3ZspUPzh69GhA@mail.gmail.com>
To: Fabio Berton <fabio.berton@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] python-3.5-manifest: Rename Queue module to queue
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
X-List-Received-Date: Tue, 23 Aug 2016 08:09:19 -0000
Content-Type: multipart/alternative; boundary=94eb2c0442d2561b57053ab8ae57

--94eb2c0442d2561b57053ab8ae57
Content-Type: text/plain; charset=UTF-8

On 22 August 2016 at 21:57, Fabio Berton <fabio.berton@ossystems.com.br>
wrote:

> The Queue module has been renamed to queue in Python 3.
>
> Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
> ---
>  meta/recipes-devtools/python/python-3.5-manifest.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
>
This file is generated from scripts/contrib/python/generate-manifest-3.5.py,
please modify that file and run it to produce the new manifest.inc.

Jussi



> diff --git a/meta/recipes-devtools/python/python-3.5-manifest.inc
> b/meta/recipes-devtools/python/python-3.5-manifest.inc
> index b9c2fec..3e07a11 100644
> --- a/meta/recipes-devtools/python/python-3.5-manifest.inc
> +++ b/meta/recipes-devtools/python/python-3.5-manifest.inc
> @@ -247,7 +247,7 @@ FILES_${PN}-textutils="${
> libdir}/python3.5/lib-dynload/_csv.*.so ${libdir}/pytho
>
>  SUMMARY_${PN}-threading="Python threading & synchronization support"
>  RDEPENDS_${PN}-threading="${PN}-core ${PN}-lang"
> -FILES_${PN}-threading="${libdir}/python3.5/_threading_local.*
> ${libdir}/python3.5/dummy_thread.* ${libdir}/python3.5/dummy_threading.*
> ${libdir}/python3.5/mutex.* ${libdir}/python3.5/threading.*
> ${libdir}/python3.5/Queue.* "
> +FILES_${PN}-threading="${libdir}/python3.5/_threading_local.*
> ${libdir}/python3.5/dummy_thread.* ${libdir}/python3.5/dummy_threading.*
> ${libdir}/python3.5/mutex.* ${libdir}/python3.5/threading.*
> ${libdir}/python3.5/queue.* "
>
>  SUMMARY_${PN}-tkinter="Python Tcl/Tk bindings"
>  RDEPENDS_${PN}-tkinter="${PN}-core"
> --
> 2.1.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--94eb2c0442d2561b57053ab8ae57
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 2=
2 August 2016 at 21:57, Fabio Berton <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:fabio.berton@ossystems.com.br" target=3D"_blank">fabio.berton@ossystems.c=
om.br</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">The Queue module has been renamed to queue in Python 3.<br>
<br>
Signed-off-by: Fabio Berton &lt;<a href=3D"mailto:fabio.berton@ossystems.co=
m.br">fabio.berton@ossystems.com.br</a><wbr>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/python/<wbr>python-3.5-manifest.inc | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br></blockquote><div><br></div><div>This file is generated from scripts/co=
ntrib/python/<a href=3D"http://generate-manifest-3.5.py">generate-manifest-=
3.5.py</a>, please modify that file and run it to produce the new manifest.=
inc.</div><div><br></div><div>Jussi</div><div><br></div><div>=C2=A0</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
diff --git a/meta/recipes-devtools/<wbr>python/python-3.5-manifest.inc b/me=
ta/recipes-devtools/<wbr>python/python-3.5-manifest.inc<br>
index b9c2fec..3e07a11 100644<br>
--- a/meta/recipes-devtools/<wbr>python/python-3.5-manifest.inc<br>
+++ b/meta/recipes-devtools/<wbr>python/python-3.5-manifest.inc<br>
@@ -247,7 +247,7 @@ FILES_${PN}-textutils=3D&quot;${<wbr>libdir}/python3.5/=
lib-dynload/<wbr>_csv.*.so ${libdir}/pytho<br>
<br>
=C2=A0SUMMARY_${PN}-threading=3D&quot;<wbr>Python threading &amp; synchroni=
zation support&quot;<br>
=C2=A0RDEPENDS_${PN}-threading=3D&quot;${<wbr>PN}-core ${PN}-lang&quot;<br>
-FILES_${PN}-threading=3D&quot;${<wbr>libdir}/python3.5/_threading_<wbr>loc=
al.* ${libdir}/python3.5/dummy_<wbr>thread.* ${libdir}/python3.5/dummy_<wbr=
>threading.* ${libdir}/python3.5/mutex.* ${libdir}/python3.5/threading.<wbr=
>* ${libdir}/python3.5/Queue.* &quot;<br>
+FILES_${PN}-threading=3D&quot;${<wbr>libdir}/python3.5/_threading_<wbr>loc=
al.* ${libdir}/python3.5/dummy_<wbr>thread.* ${libdir}/python3.5/dummy_<wbr=
>threading.* ${libdir}/python3.5/mutex.* ${libdir}/python3.5/threading.<wbr=
>* ${libdir}/python3.5/queue.* &quot;<br>
<br>
=C2=A0SUMMARY_${PN}-tkinter=3D&quot;Python Tcl/Tk bindings&quot;<br>
=C2=A0RDEPENDS_${PN}-tkinter=3D&quot;${PN}-<wbr>core&quot;<br>
<span class=3D""><font color=3D"#888888">--<br>
2.1.4<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div></div>

--94eb2c0442d2561b57053ab8ae57--
