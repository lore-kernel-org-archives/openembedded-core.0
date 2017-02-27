Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f170.google.com (mail-qk0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id D287871AD9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2017 11:51:05 +0000 (UTC)
Received: by mail-qk0-f170.google.com with SMTP id s186so92643570qkb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2017 03:51:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=bBpvqZuTgRwIMqHdBCiJNvM80/afLbOBERXjGuildaE=;
	b=NxI2oA8W/RT2KIw0sWl2SwCuRP3xd2opm/oayLKEidlVXXihWBbOHC41Xzi2HN0Txp
	exCxlHoutvtsgbby6de3kLb/idkAU8gVZUPNIk5dL9Pes61FFeG2K/KLVN4UdnuBWiz+
	FHADPkEowjiSF+ZnLu1r7GVJb0VJelneII5mCC3MVcTsycw7w24PYj0lIWBcQ1vaEZ3F
	K5971QJSn9QP8vJZSI5DclNi60UWKfiwSRAHKxpCilm84zMg20pNt3waoGeGycknT3Dp
	GTW/bjcSGzM+sbA4MWn1CElbPwh5n5LePpnHpezG96y4Tgr0sKJPGIna8kKmgeIufrSN
	OWtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=bBpvqZuTgRwIMqHdBCiJNvM80/afLbOBERXjGuildaE=;
	b=Zvc3ngMcgYFCUudddoHlMB4+fk4c8/20To8y3a1a56Ro9gh/n7hmbvQfCe3GiA7aT1
	Ef8akAuxofoK45fHsIT1NtM5uZYIPp7u01b3eIO8SDtJj3ToAGxtVWPu9joinsNQbBpu
	Ac4nnoHjdFFsSs7j5kNC7MnUOXbw9iLZS8dNSv1c/I3FXtliZHjN1v97eEwnDEbhDnz5
	qGvZ/hxxR46KkVVb6esZsievP56urpARyxy2XSb/o2KBjhyd3tL+NoBy2gm2LwE6jdeu
	1AQ2dW0Bj6Eld5kWiG8nt0xnYrudGt2H/dtkSheWLQHQXp+BNHgSJkx8K2bSj4oCVLjk
	aOog==
X-Gm-Message-State: AMke39nf9AoHRRk51S/U6O+K3N036xyVOQbe451EuBWnSL2clPQl0l6K1W6l0bgv9zE/4q70lMvkwkH7V/SSSN0a
X-Received: by 10.237.32.230 with SMTP id 93mr14899283qtb.144.1488196266674;
	Mon, 27 Feb 2017 03:51:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Mon, 27 Feb 2017 03:50:46 -0800 (PST)
In-Reply-To: <20170223222004.GA23285@jama>
References: <20170223222004.GA23285@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 27 Feb 2017 11:50:46 +0000
Message-ID: <CAJTo0LZy--6KGkcfumi=_mkRpW9YryFFfAofK5T7jkuO3hik3Q@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: State of bitbake world, Failed tasks 2017-02-23
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
X-List-Received-Date: Mon, 27 Feb 2017 11:51:06 -0000
Content-Type: multipart/alternative; boundary=94eb2c0c9b9cd4e152054981b1dc

--94eb2c0c9b9cd4e152054981b1dc
Content-Type: text/plain; charset=UTF-8

On 23 February 2017 at 22:20, Martin Jansa <martin.jansa@gmail.com> wrote:

> === common (2) ===
>     * openembedded-core/meta/recipes-extended/parted/parted_3.2.bb:
> do_compile_ptest_base
>     * openembedded-core/meta/recipes-support/apr/apr_1.5.2.
> bb:do_compile_ptest_base
>

FWIW neither me nor the yocto autobuilder sees these, so I suspect they're
ld-is-gold related.

Ross

--94eb2c0c9b9cd4e152054981b1dc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 23 February 2017 at 22:20, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D=
"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":6ef" clas=
s=3D"a3s aXjCH m15a6d0fb201895ee">=3D=3D=3D common (2) =3D=3D=3D<br>
=C2=A0 =C2=A0 * openembedded-core/meta/<wbr>recipes-extended/parted/<wbr>pa=
rted_3.2.bb:do_compile_<wbr>ptest_base<br>
=C2=A0 =C2=A0 * openembedded-core/meta/<wbr>recipes-support/apr/apr_1.5.2.<=
wbr>bb:do_compile_ptest_base<br></div></blockquote></div><br>FWIW neither m=
e nor the yocto autobuilder sees these, so I suspect they&#39;re ld-is-gold=
 related.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_ext=
ra">Ross</div></div>

--94eb2c0c9b9cd4e152054981b1dc--
