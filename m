Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f48.google.com (mail-qg0-f48.google.com
	[209.85.192.48])
	by mail.openembedded.org (Postfix) with ESMTP id C5576767B6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Aug 2015 15:00:12 +0000 (UTC)
Received: by qgdd90 with SMTP id d90so40439532qgd.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Aug 2015 08:00:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=J7I5RbQ1MyZSCoybQv59DQgVv1ItkDw/lHkTgsPsfuo=;
	b=FLhWE0xPBbnGiGUUhz5NbgeXITR2QUn+aMyq0r4comFYe+cVOQGKdFX2pPWcx2AlrR
	6d1IPc2ocba4eAHEJpTOdeevuIn5nTplPBhb1Xp0n3w71WGZ9I50461VY9YKc01hEe5R
	k7fpLpTm7zNSf1CEm3IcOWsRb5UJyYzP2y35VP5JwkG40BC+ZZdyefWeJkLc/4FqJsnm
	8mPfpqW9Zqfm7ovfokfSH9fivmWkAI8CIZeyo+XrSUWni0PigwohskxnHAu/KT5F93V0
	JhkTcmcjSxoJmOGzUJxdvq8EhxZm1eRJUkCBerc4C267GgaAzuxOGkvGs9VxMPQjpbQD
	unVg==
X-Gm-Message-State: ALoCoQkeihUnit+u2sh57y1CDkl2zdESPPh6sS9p6R/ddDZqtnqlkp+IME8xHpqZbnTVHI5QbBT7
X-Received: by 10.141.28.6 with SMTP id f6mr52534963qhe.64.1439305212326; Tue,
	11 Aug 2015 08:00:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.98.67 with HTTP; Tue, 11 Aug 2015 07:59:52 -0700 (PDT)
In-Reply-To: <1439305030-5911-1-git-send-email-anibal.limon@linux.intel.com>
References: <1439305030-5911-1-git-send-email-anibal.limon@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 11 Aug 2015 15:59:52 +0100
Message-ID: <CAJTo0LY_LepwMxG647pCOVWeFq=HywMmEL94b81z=5R=7Afz1A@mail.gmail.com>
To: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2] mc: Fix QA warning RDEPENDS of util-linux-libmount
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
X-List-Received-Date: Tue, 11 Aug 2015 15:00:16 -0000
Content-Type: multipart/alternative; boundary=001a11422ff4e79d44051d0a5be7

--001a11422ff4e79d44051d0a5be7
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 11 August 2015 at 15:57, An=C3=ADbal Lim=C3=B3n <anibal.limon@linux.inte=
l.com>
wrote:

> +RDEPENDS_${PN} =3D "ncurses-terminfo util-linux"
>

DEPENDS, no RDEPENDS.

Ross

--001a11422ff4e79d44051d0a5be7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 11 August 2015 at 15:57, An=C3=ADbal Lim=C3=B3n <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:anibal.limon@linux.intel.com" target=3D"_blank">anibal.limo=
n@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><=
div id=3D":1bg" class=3D"a3s" style=3D"overflow:hidden">+RDEPENDS_${PN} =3D=
 &quot;ncurses-terminfo util-linux&quot;<br></div></blockquote></div><br>DE=
PENDS, no RDEPENDS.</div><div class=3D"gmail_extra"><br></div><div class=3D=
"gmail_extra">Ross</div></div>

--001a11422ff4e79d44051d0a5be7--
