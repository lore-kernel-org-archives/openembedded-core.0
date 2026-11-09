Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6874.1794233706325841396
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2026 06:15:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=RBudujVa;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=tbAqhLoB;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.152, mailfrom: paul@pbarker.dev)
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 63BA61400159
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Nov 2026 09:15:05 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Mon, 09 Nov 2026 09:15:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1794233705;
	 x=1794320105; bh=qrzfW/KV1upHOjrNh6BHe4KKspsE2Zo/GqDV1lbrngE=; b=
	RBudujVaI4+tuqo9t8abqMKnV4hTLZXpKuz5onYwtMaibnEdwKQ72CXnMOpdTETp
	s7bGSAtFfLn6Pf2zNP4EDLlBai58TJQrdzw4D1AGZvkXouFdWAnpZy1Y6YksKtcH
	1QFGesOvMEkSyCU246yEroQzAR/emUrxmziF1iwk4XLJATEqqJ2fwk6doWCdhBYZ
	OZanhfVingHgphVddrmBMA6rQWVwK3drnEw2q+OjnmJ5jsdLD7LOfbgmmut8fCU+
	7FWOkf/4KydlxdGZyPDswiQo5xKJ721rsYoRwIJPcdN5JMF4GHgdYTC8lCQ1CLUM
	LN9inoqsO6IBMV6Mt24Qag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794233705; x=
	1794320105; bh=qrzfW/KV1upHOjrNh6BHe4KKspsE2Zo/GqDV1lbrngE=; b=t
	bAqhLoBpo7uPw+SU4JuUo6fJnKzyGqO9BT4UH3npW6IcnSg43QXdZdYzgTkcfd9R
	FNqHFPhYPOSrUulKdIZ1SMOgHK+sDwllnX9NbPsHY/p2uYoeRl2s8pn1mHBmzdpN
	8CmwwGAmju0Z3Ar+wRpVoHdttQ1OdodGo/rqKzysUv4G/oFSM1AZsfBEewYdIoZj
	KKbUb0ghM7CmXeSLGHQJgvyPJxDJIaH/7+03o3wU+p5xTfd5DulkjP88cBz6EqIf
	4YGAetIZlhLwLJvs10N9Iz4zLmTSuDBJFy0UdogTl9ZoQUFiTGcuJrHDpKx1/3Gx
	gw1OwFNwA4cGwz8OKAfOQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=pbarker.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794233705; d=pbarker.dev;
	mf=PHBhdWxAcGJhcmtlci5kZXY+;
	rt=PG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+;
	s=fm1:rsa-sha256:O9iE3gALZNyA2BQIoOYKWa7ftv9zw5hWxfqbGmjSS7aPv4F
	KFlzmf3lpgt9fnPQNihXBXdG+/t7a3RP3vWA05r+kcRMPw+jQZIWSw7PTLMa5ckr
	EF2wY40dWX5NFBmTRnlcycCxFsRlts6F6Il7dnsIr6Z0EACMdk3RiUoyYF3UVN94
	yH7Br6PWMCpgpcxG3+J5KrA0pCpCa9yFrZz9JSMA1IfwpUgRjSp/6Nasg4f4GQLP
	mJijh5szzWWu/DGG/jEtSnMG2e3FPx2s4drAkP0vFW1XA1XwDvJTVKW7W8LJ+qCD
	wB93QSKMqITh7zV1Skb6DKxpiZmcscuKvtg9jMg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:ReT8oBwQzQQ+BbsnE8ZNYVQ8QielBMcJp1pM3U4ZMvY=:E8RLqGZCnVjXZZy1e+sqov4ol+mNTYtnRlfPUXA2tLc=;
X-ME-Sender: <xms:aNXxaixAtJ_m8se-ltSWSfKZt_PfA19DtKc4CbrnE5BdLwNcI8gvOA>
    <xme:aNXxalLBI12ihMpmfJbHR41_qduEOEcOWjeSRkoGioqTpf5FYc8tIuX5N83OHpofM
    UlzSQXWL8EiyvEkeWLDYcI6edyLAffG-j9djGptkBzIr0G2_8wTXns>
X-ME-Received: <xmr:aNXxasqOk768jU0DWNmr8SNmLv0LVK_4iBuxqH7U8Lv8QwzspJ2sfnc6nfoIJHe-VCCWEMMVwFHrgaaPR2XmPrcZ0z_J>
X-ME-Proxy-Cause: dmFkZTF28TzpFysfJISWxP2NOPpiEahRSCBg9Ni87m/MlYr7kWiWV3grbVr65MB5NP7mGH
    rJAKt/lGPkflESmjc68JHeIGPA8pbpYIV4jJVTuelGZLbtLNwpT4mPSlBTC3rRyrx5pS11
    n+U+HweE2zJCE6H+zSEAfrpdQXlhC3BZNwfN492iqwqJNfsdyVuJDIjzTwqM0cQ1Lfr83T
    r6Af2CJ8PZRT25TUFS8bCcmA5T/OgZg8xxBP8a7pR1ZpTPVgV3APjp4vXayLHxHAjEC2Z+
    rFPE32hK5gVEwwC7LyDU0Wg/WhRzEzLBOqEe6U6LL5TiihnuNXHYlccLIKNf3IZoQFgahH
    sBS/mVpEOw6dHi47Btetl3+YVeQBxtQGc4QVKHeDhHzhpz10+9t/39VfcOm7kV8pm8qruc
    dAxs+sj14LSlwAoG6d6H1Bzj6AL3xLdxOPdZJnCzHUOw++veSGJCugyMzzQGlbRtN9+dsN
    QWqyNC4oz8eviakDRwZAGWkrESqn37eIroqC4n4RDi2sneAqQsqCsEl6Mhm+gR7veAQqBc
    rjsWcW3MnTANQKki5z0oKL8245+KKw6VPH2mz6YYtpFdpUoSLJajxIR2+0mzJTKLAodn2T
    yaby4LG64XFZbTSHTRuApJJeB9KJVf1B7Aw8J0Xi+bQqn+HyzBFib/4l4FIg
X-ME-Proxy: <xmx:aNXxakJy9grAIvTU2taaR7sdcMxArGeYYKxcAaa3hZ72OY96Y_olHA>
    <xmx:aNXxahSvg9sax_Eh74infNc6KCS3O5nP9PZ6g5LLD6576oQ680HyWQ>
    <xmx:aNXxajvdyYhxG_vGUVeQ18EaJBZ0nkiAn7dpjxNk0to0AZtptHHY4A>
    <xmx:aNXxaiZ8Uw1I0jYEszsm49EADK8tPkh3OpbEdFHIRzlcfbX14xYnEQ>
    <xmx:adXxah7FL1kzB8TvpwcJKZEQ0_pSSjaMsU5VGBmbqmmhkaOAdmnB9UDo>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 9 Nov 2026 09:15:04 -0500 (EST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Nov 2026 14:15:02 +0000
Message-Id: <DMQQRJRZA9CX.3IQWB93UOC2QQ@pbarker.dev>
Subject: Re: [PATCH v2 1/2] rust: package rust-analyzer for the SDK
From: "Paul Barker" <paul@pbarker.dev>
To: "Benhur Tessele" <benhur.tessele@est.tech>,
 <openembedded-core@lists.openembedded.org>
Cc: "Randy MacLeod" <Randy.MacLeod@windriver.com>, <paul@pbarker.dev>,
 <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.22.0
References: <20261006111230.1478039-1-benhur.tessele@est.tech>
 <20261006111230.1478039-2-benhur.tessele@est.tech>
In-Reply-To: <20261006111230.1478039-2-benhur.tessele@est.tech>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 14:15:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249847

On Tue Oct 6, 2026 at 12:12 PM BST, Benhur Tessele wrote:
> rust-analyzer is built alongside the other Rust tools (clippy, rustfmt)
> but was not installed or packaged. Install it for the nativesdk variant
> and add a rust-tools-analyzer package so it is available in the Rust SDK.
>
> Two additional pieces are required for the tool to be usable:
>
>  - The proc-macro server, rust-analyzer-proc-macro-srv, which
>    rust-analyzer looks up under <sysroot>/libexec. Install it into
>    ${libexecdir}; without it, analysis of any crate using a derive or
>    attribute macro fails with "cannot find proc-macro server in sysroot".
>
>  - The standard library sources, which rust-analyzer analyses from source
>    rather than from the compiled rlibs. Add an RDEPENDS on ${PN}-src-lib
>    so that core/std items resolve.
>
> Both binaries link against librustc_driver from the main package, so the
> package also RDEPENDS on ${PN}.
>
> rust-analyzer is deliberately not built for the target: it adds build
> time, is unlikely to be a use case on a target device, and fails to build
> on NEON arm32 tunes (beaglebone-alt, qemuarm-alt) because it pulls its ow=
n
> simd-adler32 that uses the unstable feature in 1.98
> "stdarch_arm_neon_intrinsics".
>
> Signed-off-by: Benhur Tessele <benhur.tessele@est.tech>
> ---
>  meta/recipes-devtools/rust/rust_1.98.1.bb | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/rust/rust_1.98.1.bb b/meta/recipes-dev=
tools/rust/rust_1.98.1.bb
> index 1f4ce5ebdb..f9d68ea986 100644
> --- a/meta/recipes-devtools/rust/rust_1.98.1.bb
> +++ b/meta/recipes-devtools/rust/rust_1.98.1.bb
> @@ -262,17 +262,21 @@ do_test_compile () {
>  ALLOW_EMPTY:${PN} =3D "1"
> =20
>  PACKAGES =3D+ "${PN}-rustdoc ${PN}-tools-clippy ${PN}-tools-rustfmt ${PN=
}-src-lib"
> +PACKAGES:prepend:class-nativesdk =3D "${PN}-tools-analyzer "
>  FILES:${PN}-rustdoc =3D "${bindir}/rustdoc"
>  FILES:${PN}-tools-clippy =3D "${bindir}/cargo-clippy ${bindir}/clippy-dr=
iver"
>  FILES:${PN}-tools-rustfmt =3D "${bindir}/rustfmt"
> +FILES:${PN}-tools-analyzer =3D "${bindir}/rust-analyzer ${libexecdir}/ru=
st-analyzer-proc-macro-srv"
>  FILES:${PN}-src-lib =3D "${libdir}/rustlib/src/rust"
> =20
>  RDEPENDS:${PN}-rustdoc =3D "${PN}"
>  RDEPENDS:${PN}-tools-clippy =3D "${PN}"
>  RDEPENDS:${PN}-tools-rustfmt =3D "${PN}"
> +RDEPENDS:${PN}-tools-analyzer =3D "${PN} ${PN}-src-lib"
> =20
>  SUMMARY:${PN}-tools-clippy =3D "A collection of lints to catch common mi=
stakes and improve your Rust code"
>  SUMMARY:${PN}-tools-rustfmt =3D "A tool for formatting Rust code accordi=
ng to style guidelines"
> +SUMMARY:${PN}-tools-analyzer =3D "A language server providing IDE featur=
es for Rust"
> =20
>  do_install () {
>      rust_do_install
> @@ -294,14 +298,19 @@ rust_do_install:class-nativesdk() {
>      rust_runx install
>      rust_runx install clippy
>      rust_runx install rustfmt
> +    rust_runx install rust-analyzer

Is it possible to use a PACKAGECONFIG to enable/disable this as
mentioned previously [1]?

[1]: https://lore.kernel.org/openembedded-core/279396b65a17a09d66e6f191bab1=
e1be7082d589.camel@pbarker.dev/

Best regards,

--=20
Paul Barker

