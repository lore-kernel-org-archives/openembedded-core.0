Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f54.google.com (mail-it0-f54.google.com
	[209.85.214.54])
	by mail.openembedded.org (Postfix) with ESMTP id 09AA7766E1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Aug 2016 19:35:24 +0000 (UTC)
Received: by mail-it0-f54.google.com with SMTP id f6so97405106ith.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Aug 2016 12:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=5lQ60zn8ifaBFlWDUXh6+2Q0GdbPMJg511I6rcAyZoQ=;
	b=MK0QbntOMBV6TVORFLmXO0h8da0ctEyp1S5ebwQsISK+O3tOsurmArv2zJUjmIypi5
	zj37BwsXP/OCrcfp9lN3pE/S2/c94hwkItNm9zs2gEjsGYe5jrfxnKQ84/p6EXnGaKLj
	oUUuS+s2vDgL6ryvK0Hfokj5CEJ5nRCvdKbRCtor3rKGIDMlJLhe1H1PblFWUbGL31EQ
	sxfN3sH+jBf/B2iFnDCU6PtxUaouhSoCERIm9CyTbzbqW1b872O46wOSZHwQuzWmNNC1
	3pDJVYkTPYLtcSg7vTpLMBG0ouyTlJriRJdxG3mIKsm75xF3siq8zqGbhhZ8pBZ2enVY
	tbfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=5lQ60zn8ifaBFlWDUXh6+2Q0GdbPMJg511I6rcAyZoQ=;
	b=g2xH/TDgj9/RtXx00PbTLm4zc1j01pm2CAJVedJBS3DhEX1lvgv0ysOmW05WRgRawl
	bi/kd83G9e95N/s9XBNPWZPfUYje6Eq8Lk2I/6Dg+9Quo9RKR+LYSCb5K0JQpgmUuXaH
	ehZl80CcelPuJKfEGku1ei7WwI8mAqPXdEQO8u8rV+Fp3MqOox6FbeDEjIYyP4o+9wyx
	HvUXPYZ/TA2fbqXemj9MKs6V14JHSb4DsKkOFdbXPOB/3BMWlSadrB/r9c++k4HfU/dP
	Q4IT6DZywqiAEnK293NMBHQOSIfDti9xWgEge1xWBTJ5h1jRBDIaqnUnEzph8PbN70M+
	Z6Ww==
X-Gm-Message-State: AEkoouvk5X/xKuZAi8F53axE/iUvouRlMyIwl8IRp6cdJwiDkIJpEpm+rT/unAxabmUz8HrypEYHxF95zh/8cLxe
X-Received: by 10.36.20.204 with SMTP id 195mr16212239itg.83.1471894525548;
	Mon, 22 Aug 2016 12:35:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Mon, 22 Aug 2016 12:35:05 -0700 (PDT)
In-Reply-To: <1471892273-5919-1-git-send-email-fabio.berton@ossystems.com.br>
References: <1471892273-5919-1-git-send-email-fabio.berton@ossystems.com.br>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 22 Aug 2016 20:35:05 +0100
Message-ID: <CAJTo0Lat=0OP-r9aO=SLMc_PcO-Z2wGEihUN7NifDzouAiR6-w@mail.gmail.com>
To: Fabio Berton <fabio.berton@ossystems.com.br>
Cc: OE-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Mon, 22 Aug 2016 19:35:25 -0000
Content-Type: multipart/alternative; boundary=001a1143e4e457bc08053aae26ad

--001a1143e4e457bc08053aae26ad
Content-Type: text/plain; charset=UTF-8

As per the comment at the top of the file, please modify the script and
then re-generate the manifest.

Also when adding new modules, please give a rationale for a new module
(i.e. was previously in -misc) and why it can't be added to an existing
package.

Ross

On 22 August 2016 at 19:57, Fabio Berton <fabio.berton@ossystems.com.br>
wrote:

> The Queue module has been renamed to queue in Python 3.
>
> Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
> ---
>  meta/recipes-devtools/python/python-3.5-manifest.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
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

--001a1143e4e457bc08053aae26ad
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">As per the comment at the top of the file, please modify t=
he script and then re-generate the manifest.<div><br></div><div>Also when a=
dding new modules, please give a rationale for a new module (i.e. was previ=
ously in -misc) and why it can&#39;t be added to an existing package.</div>=
<div><br></div><div>Ross</div></div><div class=3D"gmail_extra"><br><div cla=
ss=3D"gmail_quote">On 22 August 2016 at 19:57, Fabio Berton <span dir=3D"lt=
r">&lt;<a href=3D"mailto:fabio.berton@ossystems.com.br" target=3D"_blank">f=
abio.berton@ossystems.com.br</a>&gt;</span> wrote:<br><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex">The Queue module has been renamed to queue in Python 3.<br>
<br>
Signed-off-by: Fabio Berton &lt;<a href=3D"mailto:fabio.berton@ossystems.co=
m.br">fabio.berton@ossystems.com.br</a><wbr>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/python/<wbr>python-3.5-manifest.inc | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
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
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
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
</font></span></blockquote></div><br></div>

--001a1143e4e457bc08053aae26ad--
