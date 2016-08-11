Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f53.google.com (mail-it0-f53.google.com
	[209.85.214.53])
	by mail.openembedded.org (Postfix) with ESMTP id 49CF1731D2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2016 16:26:23 +0000 (UTC)
Received: by mail-it0-f53.google.com with SMTP id x130so961870ite.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2016 09:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=mK1Sy18pDWpKP0+rUdk76Z8qeeo8mdjB9/+wFvRdQ7E=;
	b=wW6l1G8ZcRI11a8j/fRRnjXYEqmB3/GMEg/hC4aq5o64l7rZ7fU9U/uEZuEDCIjkKF
	6sIfDcAe1Pik4i73fmYRoOgLKnN3RZJtgaWQzUo7WfImgdrWM/6SyF9aYUN888z69XIt
	wvRVNwD1WORM5/v70W5db89Pjht/LHI+G493YdtjfWs8IcpcW0mjh8AhFoaj+HXVSVmB
	OozBy2eR4+b2OTjxYZtIdg3ZD3LRlDe93Zs5D2WGRbfmAB7aunQImzwq+nZIM//Ldg49
	CWiKpEy9fRwEyMGSzIzBfoLjx4N1tSI9l0O2NsLiIQyk5XwG//pf8vN9Vz9gkteYaM7w
	TQbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=mK1Sy18pDWpKP0+rUdk76Z8qeeo8mdjB9/+wFvRdQ7E=;
	b=kDNle14MjJXfCTeuFNA5RuBIFVtB7cJPOoe/Y0C00jkzsDnJPZCtAdAyb2onTIi1Gt
	dORwjtT8KjCMe/0hLdG3sYQFJmISZsI+PQ2uqZZXM+9gwwbpKc3GnTQdfACL1abiEhM/
	6FNMGDc/mfjt+Ik7MiRXUYJgoEsybPGlkmkOZ84LDBJ/TO78HTWnM7b7BcIz/t/xbvLO
	+vnGhzAq+JLxWF734RvAEu67/QGJ2rTZDwndWWJjw6zBaF9a77fSh6wjK0xwB8talxks
	/p9Ik8T41fCKxuTOvABqc8oh6xicnDtnrBnDaIklL1a4pewEcwOu8ahVCkXI/XD06g3/
	GAEA==
X-Gm-Message-State: AEkoouteNff6OmamleA4JL+Pwqwee/dOqgdlSZ7THAR+FpTUyo3qYZHc4dyqmPJ0hOu5iVfndIwVUZzbTGjBnO57
X-Received: by 10.36.129.213 with SMTP id q204mr11262506itd.38.1470932784229; 
	Thu, 11 Aug 2016 09:26:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Thu, 11 Aug 2016 09:26:03 -0700 (PDT)
In-Reply-To: <8374cee610f770f4e027f92785bc0bed13334fbb.1470636212.git.Qi.Chen@windriver.com>
References: <cover.1470636212.git.Qi.Chen@windriver.com>
	<8374cee610f770f4e027f92785bc0bed13334fbb.1470636212.git.Qi.Chen@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 11 Aug 2016 17:26:03 +0100
Message-ID: <CAJTo0LaULRXouHYMfKCMUmtFERseR9vZhWXeC-yK9GLrMTwofQ@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] bitbake.conf: change localedir
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
X-List-Received-Date: Thu, 11 Aug 2016 16:26:25 -0000
Content-Type: multipart/alternative; boundary=94eb2c08b1fc17e7020539ce3a22

--94eb2c08b1fc17e7020539ce3a22
Content-Type: text/plain; charset=UTF-8

On 8 August 2016 at 07:04, Chen Qi <Qi.Chen@windriver.com> wrote:

> Previously, localedir is set to "${libdir}/locale". This would result
> in locale database installed in '/usr/lib64/locale' in some multilib case.
> For example, if we build out a multilib x86-64 self-hosted image and we try
> to build projects on this host, things broke and the following error
> appears.
>
>   Please use a locale setting which supports utf-8.
>   Python can't change the filesystem locale after loading so we need a
> utf-8 when python starts or things won't work.
>
> This is because '/usr/lib/locale' is the default one. And actually the
> nativesdk-glibc is now set to use '/usr/lib/locale'.
>

This is irrelevant as nativesdk-glibc is configured to read the *hosts*
locale directory.


> Thus, we change the setting of 'localedir' to '${nonarch_libdir}/locale'
> to
> fix the above problem.
>

I see two issues here:
1) should binary locales be considered shared in multilib environments?
(libdir vs nonarch_libdir)
2) what packages are not respecting this variable and hard-coding
/usr/lib/locale?

I'm guessing WR think yes to (1), and is the glibc patch you also sent the
fundamental fix to (2)?

Ross

--94eb2c08b1fc17e7020539ce3a22
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 8 August 2016 at 07:04, Chen Qi <span dir=3D"ltr">&lt;<a href=3D"mailto:=
Qi.Chen@windriver.com" target=3D"_blank">Qi.Chen@windriver.com</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex"><div id=3D":1ir" class=3D"a3s a=
XjCH m15668c12753f49ff">Previously, localedir is set to &quot;${libdir}/<sp=
an class=3D"il">locale</span>&quot;. This would result<br>
in <span class=3D"il">locale</span> database installed in &#39;/usr/lib64/<=
span class=3D"il">locale</span>&#39; in some multilib case.<br>
For example, if we build out a multilib x86-64 self-hosted image and we try=
<br>
to build projects on this host, things broke and the following error appear=
s.<br>
<br>
=C2=A0 Please use a <span class=3D"il">locale</span> setting which supports=
 utf-8.<br>
=C2=A0 Python can&#39;t change the filesystem <span class=3D"il">locale</sp=
an> after loading so we need a utf-8 when python starts or things won&#39;t=
 work.<br>
<br>
This is because &#39;/usr/lib/<span class=3D"il">locale</span>&#39; is the =
default one. And actually the<br>
nativesdk-glibc is now set to use &#39;/usr/lib/<span class=3D"il">locale</=
span>&#39;.<br></div></blockquote><div><br></div><div>This is irrelevant as=
 nativesdk-glibc is configured to read the *hosts* locale directory.</div><=
div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1ir" class=3D"a3=
s aXjCH m15668c12753f49ff">
Thus, we change the setting of &#39;localedir&#39; to &#39;${nonarch_libdir=
}/<span class=3D"il">locale</span>&#39; to<br>
fix the above problem.</div></blockquote></div><br>I see two issues here:</=
div><div class=3D"gmail_extra">1) should binary locales be considered share=
d in multilib environments? (libdir vs nonarch_libdir)</div><div class=3D"g=
mail_extra">2) what packages are not respecting this variable and hard-codi=
ng /usr/lib/locale?</div><div class=3D"gmail_extra"><br></div><div class=3D=
"gmail_extra">I&#39;m guessing WR think yes to (1), and is the glibc patch =
you also sent the fundamental fix to (2)?</div><div class=3D"gmail_extra"><=
br></div><div class=3D"gmail_extra">Ross</div></div>

--94eb2c08b1fc17e7020539ce3a22--
