Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f44.google.com (mail-it0-f44.google.com
	[209.85.214.44])
	by mail.openembedded.org (Postfix) with ESMTP id A526C71AAB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2016 11:30:30 +0000 (UTC)
Received: by mail-it0-f44.google.com with SMTP id 4so47333297itv.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2016 04:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=gG/UEo8ymVDkObyADsJh/xROr6ri9Bwzo6f5vAD5WsY=;
	b=Fvmkk1sIBQAkA712qo0bYZFLmwYLp/vvW3ZxFjpwfAI6Gd3uj7+TS+LzBvPPqaco7r
	eZ4f1il/TkOGR8cPlDNf/wvQ1RjprthKZnq7sGwmEDdQhpoQjsuSenicyg5IBGbMoOW0
	qYQm6GAwin5lRl/DCdR+X9wHcZ92kK/hSPJPfTwWHpksS8oDFYaQD7TDNcchulVEJh5Z
	PL1x33JXgm1pbE9CaEOtJlvdFHond/RXAKQdXBUY3EMd97C/iKsWdgIRDapcPuqvlSPT
	Bp+yfjCXrIT8fnRveOrZRoNGu5D+LhridLry6vfsCHyiFw353DsLANsjJyJT/19njdaY
	5aSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=gG/UEo8ymVDkObyADsJh/xROr6ri9Bwzo6f5vAD5WsY=;
	b=h1gb9Wo56YNiOruC8BXrg3PxIWpAafoJLEokCTHeIMvKSPWcRLIVn8V9XNwjkoW8hf
	A3ecVAUt3fLi4VWLtZ6JdSzkQxkTmgfXR+EQjzSQXc6XElVLGtukZ/spt2F1JmSXsH+m
	wbmYbyygdJRNZP3Xy9cHVK+jZbmXCF4El0lAWXwTdEBnjmLpCnChPF52VAxl7QiOYxMz
	/KehmVUqteR1keg8vcrvbKPq0T6h59Dj5wkyKQoUUTFxIx8I64cO/i5nELk3SjImhzhv
	3QUFEwjv8rk+RES2wtwJfI6vqDseWzTRKXW055h1yFvAI8uPrPiJg1gCIfoUxSs0Q58g
	Qulw==
X-Gm-Message-State: AA6/9RlifQZVo7WfFs2MSZzM8AD/53Tur7XPuU8sDPi5m4D9PQr3oWhDzoFozGQAFAn8EPBymnNGxgglik30Y6pL
X-Received: by 10.36.153.194 with SMTP id a185mr7402497ite.70.1476703831773;
	Mon, 17 Oct 2016 04:30:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.168.146 with HTTP; Mon, 17 Oct 2016 04:30:11 -0700 (PDT)
In-Reply-To: <4139c9aa1622a83597d0b6ea336923686f844bd1.1476462963.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1476462963.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<4139c9aa1622a83597d0b6ea336923686f844bd1.1476462963.git.leonardo.sandoval.gonzalez@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 17 Oct 2016 12:30:11 +0100
Message-ID: <CAJTo0LYQucFaMjB1qksJtEfpp6-UJdek_3K4jrjM72LDO3+4jA@mail.gmail.com>
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/9] selftest: set correct linux-yocto recipe when distro is poky-tiny
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
X-List-Received-Date: Mon, 17 Oct 2016 11:30:30 -0000
Content-Type: multipart/alternative; boundary=94eb2c08e51854e6d8053f0de743

--94eb2c08e51854e6d8053f0de743
Content-Type: text/plain; charset=UTF-8

On 14 October 2016 at 17:40, <leonardo.sandoval.gonzalez@linux.intel.com>
wrote:

>          result = runCmd('bitbake-layers show-recipes -i kernel')
> -        self.assertIn('linux-yocto:', result.output)
> +        linux_yocto = 'linux-yocto-tiny' if distro == 'poky-tiny' else
> 'linux-yocto'
> +        self.assertIn(linux_yocto, result.output)
>

If we want this test to be distro- and machine-agnostic then we should
handle other BSPs that don't use linux-yocto.  As this is just a test for
bitbake-layers, I'd say we can just delete the "inherits kernel" block.

Ross

--94eb2c08e51854e6d8053f0de743
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 14 October 2016 at 17:40,  <span dir=3D"ltr">&lt;<a href=3D"mailto:leona=
rdo.sandoval.gonzalez@linux.intel.com" target=3D"_blank">leonardo.sandoval.=
gonzalez@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex"><div id=3D":1d9" class=3D"a3s aXjCH m157c41063d8bb95e">=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0result =3D runCmd(&#39;bitbake-layers show-recipes -i k=
ernel&#39;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertIn(&#39;linux-yocto:&#39;, result.o=
utput)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 linux_yocto =3D &#39;linux-yocto-tiny&#39; if =
distro =3D=3D &#39;poky-tiny&#39; else &#39;linux-yocto&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertIn(linux_yocto, result.output)</div=
></blockquote></div><br>If we want this test to be distro- and machine-agno=
stic then we should handle other BSPs that don&#39;t use linux-yocto.=C2=A0=
 As this is just a test for bitbake-layers, I&#39;d say we can just delete =
the &quot;inherits kernel&quot; block.</div><div class=3D"gmail_extra"><br>=
</div><div class=3D"gmail_extra">Ross</div></div>

--94eb2c08e51854e6d8053f0de743--
