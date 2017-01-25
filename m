Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f169.google.com (mail-qk0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id 8A92C60107
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2017 15:05:58 +0000 (UTC)
Received: by mail-qk0-f169.google.com with SMTP id s140so74937174qke.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2017 07:05:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=WiRQvdG37iYnzfHO/+6tI4PomvaA7w4k+i3nnapYZAQ=;
	b=17Mz2fnk5rCD/saOgTP+MULbr0pvWvmgtoYGtGBPuHkemiLiRusuQpq5ljDYBCd4on
	Ws/G3NlJXUkHlM/9GH/eYKwqazyQvtzZY4vWEoQVNFTiq8QJbp2cj4xdAnsoblS2b1iD
	Hyj8IWFclKbJS/KNqcIFYUszN7xXj0YHZNnA0suasDZWdBm//+QZHrBNvFvJ+YSFkMIC
	hkPZlFwIWqpM5JQrZSmVs+Dau4MHiT8M41IKw6ibUaFYzIhuO803YypwrU8X55hP1/ly
	F/KvIGaoUDKp8RSd2xoNyXheec7om1hHaq0FxqiYFnF92mQKSmELNrLRzTf9DgCH3RZV
	41Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=WiRQvdG37iYnzfHO/+6tI4PomvaA7w4k+i3nnapYZAQ=;
	b=bpxtAoGKF2f8yMLafLEhseZfcrrjPIwJaIMn9pYZ/6VnGma6OtTKRuoAZwPBbM8Szi
	tosmF8p6bscbmYWZYDAS4n5azPh4XAHvDAISPF/7qmRel0P5QTuJt8LvyToYV4xf5UjD
	Byulq92c15O6tW/SXPKDGCfn5MAH+CER5XCS/M0su4HjIE6oDLIaIV8d2z8o60JZrH7w
	sfljiRqtC7UrphCFjWJYOu6ABNonDKwi9bwne0gPjpzm7WM0udRu6GAmtnoFfheejKaa
	iJOeGyi2rrECsrl6jWZxvZCFPLVf5PIytVSOz9SYWT5OpnTRtqPSNEKISjzh8kP98nR/
	YAnw==
X-Gm-Message-State: AIkVDXKm14B+PnUA9DyzLC7jE0nqKeqsOTIe+MzrWfmTpyICqA39vZQu1Nhz31qSed3JrEbfy3t/WS1Y/IWXnxeX
X-Received: by 10.55.31.24 with SMTP id f24mr33098471qkf.221.1485356758481;
	Wed, 25 Jan 2017 07:05:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Wed, 25 Jan 2017 07:05:38 -0800 (PST)
In-Reply-To: <20170125130336.20833-2-ismo.puustinen@intel.com>
References: <20170125130336.20833-1-ismo.puustinen@intel.com>
	<20170125130336.20833-2-ismo.puustinen@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 25 Jan 2017 15:05:38 +0000
Message-ID: <CAJTo0LZER1NAzStxeQiCZxZxvf_32iiy-55_a36vQZNpdLvMvA@mail.gmail.com>
To: Ismo Puustinen <ismo.puustinen@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] python3: make readline, gdbm, and db support conditional.
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
X-List-Received-Date: Wed, 25 Jan 2017 15:05:59 -0000
Content-Type: multipart/alternative; boundary=001a1147e2baf45cc80546ec9136

--001a1147e2baf45cc80546ec9136
Content-Type: text/plain; charset=UTF-8

On 25 January 2017 at 13:03, Ismo Puustinen <ismo.puustinen@intel.com>
wrote:

> +PACKAGECONFIG ??= "readline gdbm db"
> +PACKAGECONFIG[readline] = ",,readline"
> +PACKAGECONFIG[gdbm] = ",,gdbm"
> +PACKAGECONFIG[db] = ",,db"
>

Whilst recipe-specific-sysroots makes this mostly moot, if the configure
script uses AC_CHECK_LIB or similar then you can seed the result of that
with the right cache variable (such as something like ac_cv_readline=no).

Ross

--001a1147e2baf45cc80546ec9136
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 25 January 2017 at 13:03, Ismo Puustinen <span dir=3D"ltr">&lt;<a href=
=3D"mailto:ismo.puustinen@intel.com" target=3D"_blank">ismo.puustinen@intel=
.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":aa=
" class=3D"a3s aXjCH m159d5ba50e2c2fb2">+PACKAGECONFIG ??=3D &quot;readline=
 gdbm db&quot;<br>
+PACKAGECONFIG[readline] =3D &quot;,,readline&quot;<br>
+PACKAGECONFIG[gdbm] =3D &quot;,,gdbm&quot;<br>
+PACKAGECONFIG[db] =3D &quot;,,db&quot;</div></blockquote></div><br>Whilst =
recipe-specific-sysroots makes this mostly moot, if the configure script us=
es AC_CHECK_LIB or similar then you can seed the result of that with the ri=
ght cache variable (such as something like ac_cv_readline=3Dno).</div><div =
class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1147e2baf45cc80546ec9136--
