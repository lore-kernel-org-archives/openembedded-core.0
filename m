Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f51.google.com (mail-it0-f51.google.com
	[209.85.214.51])
	by mail.openembedded.org (Postfix) with ESMTP id A174773189
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Aug 2016 13:27:50 +0000 (UTC)
Received: by mail-it0-f51.google.com with SMTP id u186so37300913ita.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Aug 2016 06:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=yt8UaIkHv1+KXB0v0JFn2XHc66+NsciP2ATSw4RsFKA=;
	b=kA6eqTw0wVX9ZdRPUJsZK2MvJLl0fg0Cd6vQxVaIMT1JSSxq6cwQLZgph1T6X+aHIL
	X73gly5fJ53HHmd2JJ6UbumeQGoYsOHgNF3BnEkRDCHglnh3/vMTaTs6jxEuanIt+hbR
	fwC6Eidpbxp3CrS8f2309yYXDMwsAYO2aog8hRtQMkpgJosp3RsNTuO3eBOofSn/6Y1R
	5LjahbVVJcuUz73/VORh0K1f4wm0jdgdviGqeT3E/vyGoM3vNqS8yPGAVI1S3pQW4WY7
	IdeM72/LyoAEvQ4BvtjkPzNtvStxFbqWha9eKlKbnS+et8iohMtdcJU/vfjT2GUmIzqu
	YGVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=yt8UaIkHv1+KXB0v0JFn2XHc66+NsciP2ATSw4RsFKA=;
	b=byFVKFL2Vp5sGMcoxUzf7CGIJLnyu4e9gOi2BzpwIGpZ8gwvHEd68KLmvetfMEmWPj
	HpFeNkomONMB7+x5evgMM/7598zc4lPlov8LwW/WBHnyBE/OIyjZUSY4eVTvW1ZWgfTT
	CdAQocrmCC00vklYAfkz6l92qP9tBKcccm7PCGsRaGf0jW9HnzcfhJTQDk0KiwmNu78U
	DEwZ2mSHFYUOekhIXoMahQsGIP+pijQ+Wi1GX2SN126Mdvt+k+kED6kcXXHZmFjeeEXI
	3aFQu1CMCulKeMk3BrzKooKvC7nS82s2MnTRf+hEGJhmZl4CV7bB1ld8PnGhwWG5xozs
	Rl7g==
X-Gm-Message-State: AEkooutdtx2WrAQ4PkIsdqAOISG25mJ2L++U4lZXorgO6urVAKsiEN021GeF9vUNa1ELjR/V+GloMKWe2RIw7GD1
X-Received: by 10.36.129.213 with SMTP id q204mr14421948itd.38.1471267671625; 
	Mon, 15 Aug 2016 06:27:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Mon, 15 Aug 2016 06:27:31 -0700 (PDT)
In-Reply-To: <5e7ef6c13822259be4c3a29b2a8105a9d02d7f08.1471026724.git.alejandro.hernandez@linux.intel.com>
References: <cover.1471026724.git.alejandro.hernandez@linux.intel.com>
	<5e7ef6c13822259be4c3a29b2a8105a9d02d7f08.1471026724.git.alejandro.hernandez@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 15 Aug 2016 14:27:31 +0100
Message-ID: <CAJTo0LZRJstnjZngeN8+JBesgcSa5QcAUVAmyNB3Wri-A4o62w@mail.gmail.com>
To: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] python3.5-manifest: Fixes several dependencies on the newest python3
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
X-List-Received-Date: Mon, 15 Aug 2016 13:27:52 -0000
Content-Type: multipart/alternative; boundary=94eb2c08b1fcefe86e053a1c32af

--94eb2c08b1fcefe86e053a1c32af
Content-Type: text/plain; charset=UTF-8

On 12 August 2016 at 22:03, Alejandro Hernandez <
alejandro.hernandez@linux.intel.com> wrote:

> +    m.addPackage( "${PN}-subprocess", "Python subprocess support",
> "${PN}-core ${PN}-io ${PN}-re ${PN}-fcntl ${PN}-pickle ${PN}-signal
> ${PN}-selectors",
> +    "subprocess.* lib-dynload/_posixsubprocess.*.so" )
>

This sort of thing is happening far more though, as the following are all
part of python3-misc:

        /usr/lib/python3.5/lib-dynload/_bz2.cpython-35m-x86_64-linux-gnu.so
        /usr/lib/python3.5/lib-dynload/_
crypt.cpython-35m-x86_64-linux-gnu.so
        /usr/lib/python3.5/lib-dynload/_
decimal.cpython-35m-x86_64-linux-gnu.so
        /usr/lib/python3.5/lib-dynload/_lzma.cpython-35m-x86_64-linux-gnu.so
        /usr/lib/python3.5/lib-dynload/_md5.cpython-35m-x86_64-linux-gnu.so
        /usr/lib/python3.5/lib-dynload/_
opcode.cpython-35m-x86_64-linux-gnu.so
        /usr/lib/python3.5/lib-dynload/_
pickle.cpython-35m-x86_64-linux-gnu.so
        /usr/lib/python3.5/lib-dynload/_sha1.cpython-35m-x86_64-linux-gnu.so
        /usr/lib/python3.5/lib-dynload/_
testbuffer.cpython-35m-x86_64-linux-gnu.so
        /usr/lib/python3.5/lib-dynload/_
testcapi.cpython-35m-x86_64-linux-gnu.so
        /usr/lib/python3.5/lib-dynload/_
testimportmultiple.cpython-35m-x86_64-linux-gnu.so
        /usr/lib/python3.5/lib-dynload/_
testmultiphase.cpython-35m-x86_64-linux-gnu.so
        /usr/lib/python3.5/lib-dynload/spwd.cpython-35m-x86_64-linux-gnu.so
        /usr/lib/python3.5/lib-dynload/
xxlimited.cpython-35m-x86_64-linux-gnu.so

Some of those look like test suites, some look like part of -core, some
should be in other modules.

When should we admit that arbitrary splitting of the core library isn't
working and maybe we should just do something similar to Ubuntu and have a
minimal/full split instead?

Ross

--94eb2c08b1fcefe86e053a1c32af
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 12 August 2016 at 22:03, Alejandro Hernandez <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:alejandro.hernandez@linux.intel.com" target=3D"_blank">alejand=
ro.hernandez@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border=
-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex"><div=
 id=3D":h7" class=3D"">+=C2=A0 =C2=A0 m.addPackage( &quot;${PN}-subprocess&=
quot;, &quot;<span class=3D"">Python</span> subprocess support&quot;, &quot=
;${PN}-core ${PN}-io ${PN}-re ${PN}-fcntl ${PN}-pickle ${PN}-signal ${PN}-s=
electors&quot;,<br>
+=C2=A0 =C2=A0 &quot;subprocess.* lib-dynload/_posixsubprocess.*<wbr>.so&qu=
ot; )<br></div></blockquote></div><br>This sort of thing is happening far m=
ore though, as the following are all part of python3-misc:</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra"><div class=3D"gmail_e=
xtra">=C2=A0 =C2=A0 =C2=A0 =C2=A0 /usr/lib/python3.5/lib-dynload/_<a href=
=3D"http://bz2.cpython-35m-x86_64-linux-gnu.so">bz2.cpython-35m-x86_64-linu=
x-gnu.so</a></div><div class=3D"gmail_extra">=C2=A0 =C2=A0 =C2=A0 =C2=A0 /u=
sr/lib/python3.5/lib-dynload/_<a href=3D"http://crypt.cpython-35m-x86_64-li=
nux-gnu.so">crypt.cpython-35m-x86_64-linux-gnu.so</a></div><div class=3D"gm=
ail_extra">=C2=A0 =C2=A0 =C2=A0 =C2=A0 /usr/lib/python3.5/lib-dynload/_<a h=
ref=3D"http://decimal.cpython-35m-x86_64-linux-gnu.so">decimal.cpython-35m-=
x86_64-linux-gnu.so</a></div><div class=3D"gmail_extra">=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 /usr/lib/python3.5/lib-dynload/_<a href=3D"http://lzma.cpython-3=
5m-x86_64-linux-gnu.so">lzma.cpython-35m-x86_64-linux-gnu.so</a></div><div =
class=3D"gmail_extra">=C2=A0 =C2=A0 =C2=A0 =C2=A0 /usr/lib/python3.5/lib-dy=
nload/_<a href=3D"http://md5.cpython-35m-x86_64-linux-gnu.so">md5.cpython-3=
5m-x86_64-linux-gnu.so</a></div><div class=3D"gmail_extra">=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 /usr/lib/python3.5/lib-dynload/_<a href=3D"http://opcode.cpyt=
hon-35m-x86_64-linux-gnu.so">opcode.cpython-35m-x86_64-linux-gnu.so</a></di=
v><div class=3D"gmail_extra">=C2=A0 =C2=A0 =C2=A0 =C2=A0 /usr/lib/python3.5=
/lib-dynload/_<a href=3D"http://pickle.cpython-35m-x86_64-linux-gnu.so">pic=
kle.cpython-35m-x86_64-linux-gnu.so</a></div><div class=3D"gmail_extra">=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 /usr/lib/python3.5/lib-dynload/_<a href=3D"http://=
sha1.cpython-35m-x86_64-linux-gnu.so">sha1.cpython-35m-x86_64-linux-gnu.so<=
/a></div><div class=3D"gmail_extra">=C2=A0 =C2=A0 =C2=A0 =C2=A0 /usr/lib/py=
thon3.5/lib-dynload/_<a href=3D"http://testbuffer.cpython-35m-x86_64-linux-=
gnu.so">testbuffer.cpython-35m-x86_64-linux-gnu.so</a></div><div class=3D"g=
mail_extra">=C2=A0 =C2=A0 =C2=A0 =C2=A0 /usr/lib/python3.5/lib-dynload/_<a =
href=3D"http://testcapi.cpython-35m-x86_64-linux-gnu.so">testcapi.cpython-3=
5m-x86_64-linux-gnu.so</a></div><div class=3D"gmail_extra">=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 /usr/lib/python3.5/lib-dynload/_<a href=3D"http://testimportm=
ultiple.cpython-35m-x86_64-linux-gnu.so">testimportmultiple.cpython-35m-x86=
_64-linux-gnu.so</a></div><div class=3D"gmail_extra">=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 /usr/lib/python3.5/lib-dynload/_<a href=3D"http://testmultiphase.cpy=
thon-35m-x86_64-linux-gnu.so">testmultiphase.cpython-35m-x86_64-linux-gnu.s=
o</a></div><div class=3D"gmail_extra">=C2=A0 =C2=A0 =C2=A0 =C2=A0 /usr/lib/=
python3.5/lib-dynload/<a href=3D"http://spwd.cpython-35m-x86_64-linux-gnu.s=
o">spwd.cpython-35m-x86_64-linux-gnu.so</a></div><div class=3D"gmail_extra"=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 /usr/lib/python3.5/lib-dynload/<a href=3D"http=
://xxlimited.cpython-35m-x86_64-linux-gnu.so">xxlimited.cpython-35m-x86_64-=
linux-gnu.so</a></div><div class=3D"gmail_extra"><br></div><div class=3D"gm=
ail_extra">Some of those look like test suites, some look like part of -cor=
e, some should be in other modules.</div><div class=3D"gmail_extra"><br></d=
iv><div class=3D"gmail_extra">When should we admit that arbitrary splitting=
 of the core library isn&#39;t working and maybe we should just do somethin=
g similar to Ubuntu and have a minimal/full split instead?</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div></div=
>

--94eb2c08b1fcefe86e053a1c32af--
