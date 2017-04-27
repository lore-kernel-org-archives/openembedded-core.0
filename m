Return-Path: <avery.brian@gmail.com>
Received: from mail-pf0-f176.google.com (mail-pf0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id 01FF277D89
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Apr 2017 16:37:35 +0000 (UTC)
Received: by mail-pf0-f176.google.com with SMTP id 194so31852266pfv.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Apr 2017 09:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=jvLJ7VGZvGfVsBIPWwyeN0CV4dC7yVW/tnXRUW7p5gM=;
	b=SQ90X2ISuRoa2uC1LExGypeG6ye/YgegShHyHMDsuChonKW6oSRL/0UbGvMELwGfB3
	1cRnsfheZBJJfZOa6v2gC1zengBD9orzNdcg0Jc4OaQx3rKsW6ntfRGU2g33FWRBpd52
	xBEsTx26LWfOj02ojABKXH5NCak6IcMf7W+ZWA6BiIVRweoHeWM/hZ7mFNf/Z1U8FKna
	qRZ36hJ7X8kerKRMlHJzMzyOwwdX5M0dpPiXQEkglPaNLGRScfurDfCEjv1yCAL62pp5
	XG28eRuv3Z12uo+m2+mdg1abbBD9OTuQ2Nz8wOLVflmEJQ2AskGIjrjtMHAJyf283yae
	z3OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=jvLJ7VGZvGfVsBIPWwyeN0CV4dC7yVW/tnXRUW7p5gM=;
	b=qOG+f2QC6eGvVye6LYHi4P2Q7elfF27NRNZJCBBqziWY0jYmac2TcIk0XnAi8HcDZQ
	S03rkzcB8iAwM5l0R1NxAAUEbEIfOeM+kF1odf6fFOZlfd5LI6S69nShgBTxGtB1pPGQ
	Yu7diPmIHw5lcXPripPFw8294jpQabOlg/aI/V5KQuWMxllEtWShKj/i8UC1/57LyZ6F
	FSbYg3fS9siptLS87zSbLbDx8BucuhLlXK1uITT1Q3itvxZY0wTFaIyyltlpk7v11SnF
	+zvyZzbaNet2Na2eIB8+HVkeaCcgD+th83YENzpek+2EsvYgK1+EndbF9as+HUmw7GR1
	QkqQ==
X-Gm-Message-State: AN3rC/4lGpQintgJryjCFwKoIHkz91FURhwpset2V2En7MLCMXeuEfRK
	hWEkyKQbKZZbikgZNfEIBQ6Da9QSJA==
X-Received: by 10.98.24.213 with SMTP id 204mr6757776pfy.237.1493311057192;
	Thu, 27 Apr 2017 09:37:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.151.140 with HTTP; Thu, 27 Apr 2017 09:37:36 -0700 (PDT)
In-Reply-To: <c9098bff2a960a58a56c51d91e3ca5813cb3b852.1493091283.git.liezhi.yang@windriver.com>
References: <cover.1493091283.git.liezhi.yang@windriver.com>
	<c9098bff2a960a58a56c51d91e3ca5813cb3b852.1493091283.git.liezhi.yang@windriver.com>
From: Brian Avery <avery.brian@gmail.com>
Date: Thu, 27 Apr 2017 09:37:36 -0700
Message-ID: <CAKV_0egyFeLyk6S1WezKs5Dw18mVVnNME90KkvqLz4OK00EXxA@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] oe-find-native-sysroot: don't clear OECORE_NATIVE_SYSROOT
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
X-List-Received-Date: Thu, 27 Apr 2017 16:37:36 -0000
Content-Type: multipart/alternative; boundary=94eb2c03b6561a6e32054e2893cc

--94eb2c03b6561a6e32054e2893cc
Content-Type: text/plain; charset=UTF-8

This worked for me. Tested on sdk and esdk and bitbake std build. Also
added info to bug https://bugzilla.yoctoproject.org/show_bug.cgi?id=11409.
-brian
an intel employee

On Mon, Apr 24, 2017 at 8:35 PM, Robert Yang <liezhi.yang@windriver.com>
wrote:

> The OECORE_NATIVE_SYSROOT may come from environment vars, so don't clear
> it, otherwise it broke runqemu-extract-sdk on sdk.
>
> [YOCTO #11409]
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  scripts/oe-find-native-sysroot | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/scripts/oe-find-native-sysroot b/scripts/oe-find-native-
> sysroot
> index 5c8681e..235a67c 100755
> --- a/scripts/oe-find-native-sysroot
> +++ b/scripts/oe-find-native-sysroot
> @@ -47,7 +47,6 @@ fi
>
>  # Global vars
>  BITBAKE_E=""
> -OECORE_NATIVE_SYSROOT=""
>  set_oe_native_sysroot(){
>      echo "Running bitbake -e $1"
>      BITBAKE_E="`bitbake -e $1`"
> --
> 2.10.2
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--94eb2c03b6561a6e32054e2893cc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This worked for me. Tested on sdk and esdk and bitbake std=
 build. Also added info to bug=C2=A0<a href=3D"https://bugzilla.yoctoprojec=
t.org/show_bug.cgi?id=3D11409">https://bugzilla.yoctoproject.org/show_bug.c=
gi?id=3D11409</a>.<div>-brian</div><div>an intel employee</div></div><div c=
lass=3D"gmail_extra"><br><div class=3D"gmail_quote">On Mon, Apr 24, 2017 at=
 8:35 PM, Robert Yang <span dir=3D"ltr">&lt;<a href=3D"mailto:liezhi.yang@w=
indriver.com" target=3D"_blank">liezhi.yang@windriver.com</a>&gt;</span> wr=
ote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex">The OECORE_NATIVE_SYSROOT may come f=
rom environment vars, so don&#39;t clear<br>
it, otherwise it broke runqemu-extract-sdk on sdk.<br>
<br>
[YOCTO #11409]<br>
<br>
Signed-off-by: Robert Yang &lt;<a href=3D"mailto:liezhi.yang@windriver.com"=
>liezhi.yang@windriver.com</a>&gt;<br>
---<br>
<span class=3D"">=C2=A0scripts/oe-find-native-sysroot | 1 -<br>
=C2=A01 file changed, 1 deletion(-)<br>
<br>
</span>diff --git a/scripts/oe-find-native-<wbr>sysroot b/scripts/oe-find-n=
ative-<wbr>sysroot<br>
index 5c8681e..235a67c 100755<br>
--- a/scripts/oe-find-native-<wbr>sysroot<br>
+++ b/scripts/oe-find-native-<wbr>sysroot<br>
@@ -47,7 +47,6 @@ fi<br>
<br>
=C2=A0# Global vars<br>
=C2=A0BITBAKE_E=3D&quot;&quot;<br>
-OECORE_NATIVE_SYSROOT=3D&quot;&quot;<br>
=C2=A0set_oe_native_sysroot(){<br>
=C2=A0 =C2=A0 =C2=A0echo &quot;Running bitbake -e $1&quot;<br>
=C2=A0 =C2=A0 =C2=A0BITBAKE_E=3D&quot;`bitbake -e $1`&quot;<br>
<div class=3D"HOEnZb"><div class=3D"h5">--<br>
2.10.2<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br></div>

--94eb2c03b6561a6e32054e2893cc--
