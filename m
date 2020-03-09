Return-Path: <persaur@gmail.com>
Received: from mail-yw1-f51.google.com (mail-yw1-f51.google.com
	[209.85.161.51])
	by mail.openembedded.org (Postfix) with ESMTP id 78C5161999;
	Mon,  9 Mar 2020 10:01:47 +0000 (UTC)
Received: by mail-yw1-f51.google.com with SMTP id j186so9619291ywe.0;
	Mon, 09 Mar 2020 03:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=content-transfer-encoding:from:mime-version:subject:message-id:date
	:cc:to; bh=Gb1IVL0kP1wRKu1dC+ii/od1Br4Mw6z2Z6b4R9kNYIQ=;
	b=tDT9yXsp8PbWzjwczhUzcivKcW6u/m43yobet6nXrlSF7LEK+wWX8Pl0YtwYaNoQG5
	duJ/FuRLjfdW+RtFI9kvET8BmqyC9hZH250gE2tVVxbE/E3fO/wOiwHuiPaR4ofIqycp
	qK5MoJXwCzwDgnzSk/V0DJLU1FxA/wOkc+ewhZK343ZopQrZ2NhFY/Vbsq+5XMmvoXyY
	tJwn+ZtYY7naTuxyhatX+G+8FWlVHcJnqNVDl3U2p0VI7khPdNGDSIe9ODjjThi7Ibnl
	1g8xs3EyApGxmOtgr6NWK8IoYHIdjKSUvo4460oFecrcXJjiAzjLh6dDAgSOhkofp6H5
	PLhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:content-transfer-encoding:from:mime-version
	:subject:message-id:date:cc:to;
	bh=Gb1IVL0kP1wRKu1dC+ii/od1Br4Mw6z2Z6b4R9kNYIQ=;
	b=d4pidONlKFR2RfDJdzbsbVf6ZopMpOQGt9AH/wvHNpxEYaLbj+sciRVpi6rbkkuKMH
	wx/0Nt1vBP+IebTxrKWdgMnTck4pQwr/B9r5HABs/Aa8M+pez5Q4en8OtmL6t4FIHn8I
	6CH4K345Qy+9c2NQk7AJfc6CTWCb+8CJO9eKbJL/weg8DoeVvgiaZzxEv3qe5yc+BaYw
	IXU2aQNtRja5GeNwSwTBF56iN3istxscoJbHJVjc3N6N2Rs/WVdp37wVF1HkwZmhD7Hg
	CJlJhDBZLgYPOgKUOZ/qvV0dulVG2oypdPUf181W2zMdzgnLa5eBou7XwupVpeJLs5vS
	hc1Q==
X-Gm-Message-State: ANhLgQ1edra3awqJyYC7jCLsOpjDvK89ixLM8XFB2vCggGnDPaRaVDH0
	evm/Sap/xCwsFHLbXYu/8CSqY40h
X-Google-Smtp-Source: ADFU+vteMWiJ2pHZpaCX7L5QQfGoC3ddFuqwPjCR+H7gOhntK9sllDThICtsnjsZo0o+etzy0plNFg==
X-Received: by 2002:a25:2ac4:: with SMTP id q187mr16434755ybq.76.1583748108180;
	Mon, 09 Mar 2020 03:01:48 -0700 (PDT)
Received: from [100.64.72.98] ([173.245.215.240])
	by smtp.gmail.com with ESMTPSA id
	v133sm17288515ywb.86.2020.03.09.03.01.47
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 09 Mar 2020 03:01:47 -0700 (PDT)
From: Rich Persaud <persaur@gmail.com>
Mime-Version: 1.0 (1.0)
Message-Id: <0C4A6E55-81B1-4AC1-B143-19AED076F2F4@gmail.com>
Date: Mon, 9 Mar 2020 06:01:47 -0400
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: iPad Mail (17D50)
Cc: openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [Openembedded-architecture] buildtools-extended-tarball wrapping builds
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
X-List-Received-Date: Mon, 09 Mar 2020 10:01:47 -0000
Content-Type: multipart/alternative;
	boundary=Apple-Mail-0DCD183B-03A6-449B-AA11-AC677AA4FF26
Content-Transfer-Encoding: 7bit

--Apple-Mail-0DCD183B-03A6-449B-AA11-AC677AA4FF26
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mar 7, 2020, at 11:17, Richard Purdie <richard.purdie@linuxfoundation.org=
> wrote:
> =EF=BB=BFHi,
>=20
> I just wanted to mention that we now have the ability to wrap builds on
> specific workers with specific buildtools tarballs.
>=20
> Currently this functionality is in master, we do have the option of
> porting the helper code to other stable branches.
>=20
> We have had multiple issues, with the infrastucture internal url/cert
> handling, git/cert environment issues, an issue with eSDK testing (next
> has a fix in testing), the crypt fix already submitted (meaning M2's
> tarball doesn't help)  and so on, I'm hoping we've gotten to the bottom
> of those.
>=20
> This does mean we could drop gcc 4.8/4.9 support if we wanted to and
> rely on the tarball support for centos7/debian8. I'm torn on that, we
> are still missing:
>=20
> a) Support for wrapping a build with buildtools more auotmatically
> (like we do with uninative)
>=20
> b) documentation of buildtools-extended-tarball

This would be valuable to wrap older Haskell [1] and Ocaml [2] compilers, wh=
ich are often challenging to support with newer versions of OE.  I've tested=
 buildtools-extended-tarball with an OpenXT build, but we would need to use a=
n older tarball for the Haskell/Ocaml native compilers.

Rich

[1] https://github.com/OpenXT/meta-openxt-haskell-platform
[2] https://github.com/OpenXT/meta-openxt-ocaml-platform


--Apple-Mail-0DCD183B-03A6-449B-AA11-AC677AA4FF26
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><div dir=3D"ltr">On Mar 7, 2020, at 11:17, R=
ichard Purdie &lt;richard.purdie@linuxfoundation.org&gt; wrote:<div dir=3D"l=
tr"><blockquote type=3D"cite"><br></blockquote></div><blockquote type=3D"cit=
e"><div dir=3D"ltr">=EF=BB=BF<span>Hi,</span><br><span></span><br><span>I ju=
st wanted to mention that we now have the ability to wrap builds on</span><b=
r><span>specific workers with specific buildtools tarballs.</span><br><span>=
</span><br><span>Currently this functionality is in master, we do have the o=
ption of</span><br><span>porting the helper code to other stable branches.</=
span><br><span></span><br><span>We have had multiple issues, with the infras=
tucture internal url/cert</span><br><span>handling, git/cert environment iss=
ues, an issue with eSDK testing (next</span><br><span>has a fix in testing),=
 the crypt fix already submitted (meaning M2's</span><br><span>tarball doesn=
't help) &nbsp;and so on, I'm hoping we've gotten to the bottom</span><br><s=
pan>of those.</span><br><span></span><br><span>This does mean we could drop g=
cc 4.8/4.9 support if we wanted to and</span><br><span>rely on the tarball s=
upport for centos7/debian8. I'm torn on that, we</span><br><span>are still m=
issing:</span><br><span></span><br><span>a) Support for wrapping a build wit=
h buildtools more auotmatically</span><br><span>(like we do with uninative)<=
/span><br><span></span><br><span>b) documentation of buildtools-extended-tar=
ball</span><br></div></blockquote><br><div>This would be valuable to wrap ol=
der Haskell [1] and Ocaml [2] compilers, which are often challenging to supp=
ort with newer versions of OE. &nbsp;I've tested buildtools-extended-tarball=
 with an OpenXT build, but we would need to use an older tarball for the Has=
kell/Ocaml native compilers.</div><div><br></div><div>Rich</div><div><br></d=
iv><div>[1]&nbsp;<a href=3D"https://github.com/OpenXT/meta-openxt-haskell-pl=
atform">https://github.com/OpenXT/meta-openxt-haskell-platform</a></div><div=
>[2]&nbsp;<a href=3D"https://github.com/OpenXT/meta-openxt-ocaml-platform">h=
ttps://github.com/OpenXT/meta-openxt-ocaml-platform</a></div><div><br></div>=
</div></body></html>=

--Apple-Mail-0DCD183B-03A6-449B-AA11-AC677AA4FF26--
