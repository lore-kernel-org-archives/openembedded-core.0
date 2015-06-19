Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f51.google.com (mail-qg0-f51.google.com
	[209.85.192.51])
	by mail.openembedded.org (Postfix) with ESMTP id 8BECB759DC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jun 2015 09:06:27 +0000 (UTC)
Received: by qgeu36 with SMTP id u36so34304660qge.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jun 2015 02:06:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=oI8NUteDD//AuG1gORPyZhD/r0nFt+ZV9OyZ4pkhegA=;
	b=ju+zghuA/WGgtAvI/HsNTi5eATmyxuY2LPtXMX2wAj6zppV7lNvNUjxYHySD/ppD00
	6/6V48jE0JDDlKLQ9SJ7saB13Wr7elVffRzjSzibyZtkz9VqKdKkp3IwRiNsSRm+GfEi
	yHR9x1f0YvFKRuXxbA++kLRZRy+FZwG1hSJsDCtIEf+qGcdOXRNyW5JNZH7VyFMOZS2Y
	8x3LA6NALEcrIMKGlLHIQhB1QCdbC1GxMlCuHxxq1OCpi7ZpQX/ha4gfTbOOo8ZXNRIp
	FlBoDFqrIBWj85yfJ6tNaG6KceXv4fE4Bph1U82Of20RsAa8qFxtO9XvyEH9qf9RazGI
	BWNw==
X-Gm-Message-State: ALoCoQl//SSiesi4iUPZOPPRfCyOIRpzh9Fy4EogsbUyOAiS8Mvo449fgU3RlM9+DvBnlHMACeWF
X-Received: by 10.140.20.99 with SMTP id 90mr19866646qgi.87.1434704788707;
	Fri, 19 Jun 2015 02:06:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Fri, 19 Jun 2015 02:06:08 -0700 (PDT)
In-Reply-To: <3911744e218766f685c9957a57d415cd9839a66e.1434601375.git.akuster808@gmail.com>
References: <cover.1434601375.git.akuster808@gmail.com>
	<3911744e218766f685c9957a57d415cd9839a66e.1434601375.git.akuster808@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 19 Jun 2015 10:06:08 +0100
Message-ID: <CAJTo0LZ31Sa8O83bzGEHi_=4KCaqW0nf_rjs6OhT0J2VePs-SQ@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] gnutls: update to 3.4.1
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
X-List-Received-Date: Fri, 19 Jun 2015 09:06:31 -0000
Content-Type: multipart/alternative; boundary=001a11c125d44a0a630518db3d98

--001a11c125d44a0a630518db3d98
Content-Type: text/plain; charset=UTF-8

On 18 June 2015 at 05:50, Armin Kuster <akuster808@gmail.com> wrote:

> +PACKAGECONFIG[openssl_compat] = "--enable-openssl-compatibility,,"
> +PACKAGECONFIG[libind] = ",--without-idn, libidn"
>

For clarity always pass both enable and disable options, in case upstream
changes their default behaviour.  The autoconf macros AC_ARG_WITH and
_ENABLE always support both their enable/disable and with/without forms.

Ross

--001a11c125d44a0a630518db3d98
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 18 June 2015 at 05:50, Armin Kuster <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:akuster808@gmail.com" target=3D"_blank">akuster808@gmail.com</a>&gt;</s=
pan> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":48" class=3D"a3s"=
 style=3D"overflow:hidden">+PACKAGECONFIG[openssl_compat] =3D &quot;--enabl=
e-openssl-compatibility,,&quot;<br>
+PACKAGECONFIG[libind] =3D &quot;,--without-idn, libidn&quot;</div></blockq=
uote></div><br>For clarity always pass both enable and disable options, in =
case upstream changes their default behaviour.=C2=A0 The autoconf macros AC=
_ARG_WITH and _ENABLE always support both their enable/disable and with/wit=
hout forms.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_e=
xtra">Ross</div></div>

--001a11c125d44a0a630518db3d98--
