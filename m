Return-Path: <kergoth@gmail.com>
Received: from mail-lb0-f174.google.com (mail-lb0-f174.google.com
	[209.85.217.174])
	by mail.openembedded.org (Postfix) with ESMTP id EEE296B090
	for <openembedded-core@lists.openembedded.org>;
	Sat,  6 Jul 2013 22:57:19 +0000 (UTC)
Received: by mail-lb0-f174.google.com with SMTP id x10so2856962lbi.19
	for <openembedded-core@lists.openembedded.org>;
	Sat, 06 Jul 2013 15:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=rMaOq598WMBUJ2zbtSCJ6VqOI+1PGAA4WTFIdWGfdFY=;
	b=VDh2jxmUPRiR+Ic5NMdl6Q1kxb01chE1CCtUJWotQrrmf8+7M/ibBzGFJItvuAlSR/
	cEjb96sTqvrbGtjtHKYYY4QRjNAFQmzZOktdiQi/hZeN0O13SLMIcNnfSRoZkCVIFEWr
	SW/SvJzGlYW3bVfKkgUtu5tupWbak5824mdyz/79ITCbzDFh9fs6guPUc1jh/XvTq2Bd
	jcc/eS87MEnehyigeLM4M11i97IN30RCGww6Qn1QHHSoyvjY2RDCftSK2kHx9p0F/q8H
	CaUmROJsI6hUm0oVg9C5xl2AeWKwjCE0pdpECaQObuN/EUOvegDmvGVuDqEY4rVFeMkW
	p4eg==
X-Received: by 10.152.28.34 with SMTP id y2mr7712369lag.0.1373151439328; Sat,
	06 Jul 2013 15:57:19 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.3.5 with HTTP; Sat, 6 Jul 2013 15:56:59 -0700 (PDT)
In-Reply-To: <1373099962-19854-1-git-send-email-Martin.Jansa@gmail.com>
References: <20130705224311.GA3288@jama>
	<1373099962-19854-1-git-send-email-Martin.Jansa@gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Sat, 6 Jul 2013 15:56:59 -0700
X-Google-Sender-Auth: PwXv5pZWJgKR9X2yeFVRFZer_Vw
Message-ID: <CABcZANmrjid3veZXwq_jh24qDaXBjhf3MvNV5yY+6eCg+Gr5Aw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 1/2] eglibc-locale: add missing dependency on virtual/${TARGET_PREFIX}binutils
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
X-List-Received-Date: Sat, 06 Jul 2013 22:57:20 -0000
Content-Type: multipart/alternative; boundary=089e0158c57ac39aff04e0dfbbcc

--089e0158c57ac39aff04e0dfbbcc
Content-Type: text/plain; charset=UTF-8

On Sat, Jul 6, 2013 at 1:39 AM, Martin Jansa <martin.jansa@gmail.com> wrote:

> * eglibc-collateral.inc inhibits all default deps, but do_package needs
>   objcopy:
>   ERROR: objcopy failed with exit code 127 (cmd was
>   'i586-webos-linux-objcopy' --only-keep-debug
>   'eglibc-locale/2.17-r0/package/usr/lib/gconv/IBM1166.so'
>   'eglibc-locale/2.17-r0/package/usr/lib/gconv/.debug/IBM1166.so')
>   ERROR: Function failed: split_and_strip_files
>

Wouldn't it be better to add the necessary dep to the do_package[depends]
in package.bbclass?
-- 
Christopher Larson

--089e0158c57ac39aff04e0dfbbcc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On S=
at, Jul 6, 2013 at 1:39 AM, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&=
gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">* eglibc-collateral.inc in=
hibits all default deps, but do_package needs<br>
=C2=A0 objcopy:<br>
=C2=A0 ERROR: objcopy failed with exit code 127 (cmd was<br>
=C2=A0 &#39;i586-webos-linux-objcopy&#39; --only-keep-debug<br>
=C2=A0 &#39;eglibc-locale/2.17-r0/package/usr/lib/gconv/IBM1166.so&#39;<br>
=C2=A0 &#39;eglibc-locale/2.17-r0/package/usr/lib/gconv/.debug/IBM1166.so&#=
39;)<br>
=C2=A0 ERROR: Function failed: split_and_strip_files</div></blockquote></di=
v><br>Wouldn&#39;t it be better to add the necessary dep to the do_package[=
depends] in package.bbclass?</div><div class=3D"gmail_extra">-- <br>Christo=
pher Larson</div>

</div>

--089e0158c57ac39aff04e0dfbbcc--
