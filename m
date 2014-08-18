Return-Path: <kergoth@gmail.com>
Received: from mail-la0-f54.google.com (mail-la0-f54.google.com
	[209.85.215.54])
	by mail.openembedded.org (Postfix) with ESMTP id 89326610F5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Aug 2014 14:36:43 +0000 (UTC)
Received: by mail-la0-f54.google.com with SMTP id hz20so4658159lab.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Aug 2014 07:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=jQBbsZKTspo0zDbuPQDfWy+JS6EfUpX8P3IFHKKDnH8=;
	b=zLsoDJlNpOPTaP/Y0vFFK33y+kDN99fYskjhEUl4dw4tZaSz/L1bkbclWQX1AB3xu+
	ehVRqFHnbZa4V167B63zWQP1XeAresPvGoreP63iT8SIkqoN9seXxzqiW0UTGjm3X7ia
	vmNy3ds4dmITX20kJBdL6CnQTar6P8nXwYRHmaM/CY3g75MdOkORtP42hydnB5+Xdo65
	mdmeHaaJIfFaAhX6H7PegK+PwMYES1Sp4IP1DDr7mHXrkT0ocilufKhDFy7JPObHEjVJ
	KZUqIqnpNZtXlzYjrLbLfmgpHy4StFm8ngRatQbIsYSGo07FmhZDl0hfluRAw5kNkUv8
	FDOA==
X-Received: by 10.152.5.194 with SMTP id u2mr13333538lau.68.1408372604393;
	Mon, 18 Aug 2014 07:36:44 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.43.42 with HTTP; Mon, 18 Aug 2014 07:36:24 -0700 (PDT)
In-Reply-To: <1408356737-8743-1-git-send-email-jackie.huang@windriver.com>
References: <1408356737-8743-1-git-send-email-jackie.huang@windriver.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Mon, 18 Aug 2014 07:36:24 -0700
X-Google-Sender-Auth: ppO_-NgjsCrUnedAMBNjN2RUJqk
Message-ID: <CABcZAN=w5G2126KMhoEPZBuM7bmeNZG+FAG2kyfUfVyMYpvCCw@mail.gmail.com>
To: jackie.huang@windriver.com
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] openssl: add DEPENDS on openssl-native for rehash
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
X-List-Received-Date: Mon, 18 Aug 2014 14:36:46 -0000
Content-Type: multipart/alternative; boundary=089e013d173acbe1900500e84ca5

--089e013d173acbe1900500e84ca5
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 18, 2014 at 3:12 AM, <jackie.huang@windriver.com> wrote:

>  DEPENDS = "perl-native-runtime"
> +DEPENDS_class-target = "openssl-native"
>

This is removing the perl-native-runtime dependency for the target recipe,
is that really the intent?
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--089e013d173acbe1900500e84ca5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Mon, Aug 18, 2014 at 3:12 AM,  <span dir=3D"ltr">&lt;<a href=3D"mailto:j=
ackie.huang@windriver.com" target=3D"_blank">jackie.huang@windriver.com</a>=
&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div id=3D":1ex" class=3D"a3s" style=3D"over=
flow:hidden">=C2=A0DEPENDS =3D &quot;perl-native-runtime&quot;<br>
+DEPENDS_class-target =3D &quot;openssl-native&quot;</div></blockquote></di=
v><br></div><div class=3D"gmail_extra">This is removing the perl-native-run=
time dependency for the target recipe, is that really the intent?<br>-- <br=
>

Christopher Larson<br>clarson at kergoth dot com<br>Founder - BitBake, Open=
Embedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engineer, Men=
tor Graphics
</div></div>

--089e013d173acbe1900500e84ca5--
