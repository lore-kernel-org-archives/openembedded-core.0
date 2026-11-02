Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10149.1793617243799896766
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2026 03:00:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=I6WM7kJ0;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=Aos1rNM0;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.145, mailfrom: paul@pbarker.dev)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id B13A8EC0583
	for <openembedded-core@lists.openembedded.org>; Mon,  2 Nov 2026 06:00:42 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Mon, 02 Nov 2026 06:00:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1793617242;
	 x=1793703642; bh=yJeCsng/q/L7Yps45IVV1X7KGUqx55I2wiz/k8ZZUQE=; b=
	I6WM7kJ0m1aareoxnRXob2dsL5WsLxMaGNybz2vNihS7AZ5yIdj6FIhi9olGH8H7
	i5ycRr+I+mrtR42wQvEAV4mmwWOG4o7WR9BT+eOuWPzDg3RUYjAqa6HuwMqpmJfB
	Dx1bawSOhu2sKiJjbWiwbQyLbPNmjBliUrHl6BLyfcZongXGMVeW2YtfYChVpEro
	2fzQAz20QZ7xjUjQ4GARnOc4mNj1tsN6cwo6bLxUiLJ2QNSTMXqN/J4F+84psalG
	CULY0CXWwhCjfvwEKYPS6KvImQJuwm3HvrR3XX7tqClWyI8UXLmS1xY36XDguXAy
	W8OnRKL4uuTJoO3YQNb0ug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1793617242; x=1793703642; bh=y
	JeCsng/q/L7Yps45IVV1X7KGUqx55I2wiz/k8ZZUQE=; b=Aos1rNM0FyDE1ck7z
	QJfIJTEeYoCCMkI3rjw5VpgWSRTVaTSnCd2Fqq3i10OtC338ggOmkOkKJFaf/UBw
	+RD0TAakPuj1MswXayx4llJMykrZ8tgsI2vkuMNYqAVBlYT5WvX/lS0oLPGsEjDC
	MnlBsIBN2bYHGppbDbXVR1llrr12aVblkUL163WSC0Hn+Yk/iwBKvIlg66llDkWY
	yl0wHVRwnsvzCzzh+wcfgoTXWXlPTQknoVim6E1Sp9cOOSPxkc9gVCByCClPHUcj
	G/pk/onezzDuddpgN+rKyHwBkeJbiNrHaNzlvBckD1FJaSg+vLf+inPvlXkDiqxt
	Vj4xw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=pbarker.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793617242; d=pbarker.dev;
	mf=PHBhdWxAcGJhcmtlci5kZXY+;
	rt=PG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+;
	s=fm1:rsa-sha256:ZzjHZHAQ55Z+6o3GPlmEjiLyVt85oZSlCV1lBX/b18o7CmE
	LQZkSZdmyKZTPEoMWYr7s4urYIxl0mDIIu3EJack7Dg5ynbRmwgceKWtMgAA/zTu
	MoecBZPuR4PoA9xuwXO5ptmt/G72ixh1zYBS0s1ycKtjdry9dwCIowMxmENweVw8
	bFk4o5ycgqtilsrvonHn9jq3v9eGwWZUScmpUZHtYsG0NI4bf9fsXDoVXOyFYGaW
	rzTtZtC4xsjxtlvXsv5+49+F5PgJrInPdpkvM5RIvW315GRtJAiuO7pquygbhmau
	7w4DoU5daYWVhWHoeWLxHYE/0hpiStvfOFyUM8Q==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=content-transfer-encoding,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to,
	user-agent;
Message-Instance: m=1; h=sha256:3s0sX1sCJdbseUYT3rHxl1qf3+ypL7grAkAXYfawRnU=:5OfqyCHjTGVcaltCONfMsnCZItVBsl7j5HUjCadA0X8=;
X-ME-Sender: <xms:Wm3oahWJf9mVca9tvmiOZvHhidZn4mrvl88lZpelxQJG6lpC4VYtyA>
    <xme:Wm3oannbZZ6xBrwLSi-wdzqNcetc9ck6nBaae6hLuBOakMRzxB34jCTP8fH4iXx8-
    CApChWKzD7bSWQHQ6CuI58xOsHcEqKoOC566eA0CbJiCLQ5JowPvIop>
X-ME-Received: <xmr:Wm3oarAeYmodBYzRtOH_faPPmzKZ100lN8RLAl308ld9gZt_eDsSrCGwmGpZZSCeC9I1VBgKkQDd7NhtdqCuEjnmyd6nxCykGVsCjiPq4r2o>
X-ME-Proxy-Cause: dmFkZTF4akQHmSPpBZSInmB+yuyJB1Z/GvIXe1Sd3fQuOkVVHVhy6W/SjLdtqrOliLskuB
    SI2oPkEQHJoknIaE0owrxnIiXDHz3EnU8zNQXzDgtGfT6djV/Qsx5vipMkYxogA3m4XBaR
    nf6XAEopBGdn9YLpG0e8CQbTjcCwzrJhB/zGNMimDDTODsNSOdvXLQmwTYg7wZneUQmUNF
    0Mt/WPAY8HWLDR1dU0EcmET1rJS9HlJv31bR3nX4zTQ3bMMd0vJW3s9VUyA8qVaXiBCqso
    C2BQWXx8r5oBbYJl7lNaawcg5BXT1L5gF7xWNuHDpSKPV20jnGUDuNs00RuagBRXIb4UBD
    m76cbIB7h4dmlMSW8kdWzj604kHMl4ZKVeaTk9S+azEnfb4qM99pYkD2iUrKfCbaMav6wH
    3mXSycsOQB972FqXMZAOcR10W4Dv5DKQZkIbBSdA4igYIVw4JrzgPJ9YK4R/NcL+oGsWwM
    ZC0hJINgCTh3gaoQKwTnVoP/6yoDk+XkBnoDZ7NlzelGVTo46DCwrtQKM7jgjWktIOsEe3
    r8cy0+RsI3ZFjuiePzS2rZ3j29hWyFIDoa2pckDxjOXMdHQuSueJ4chjpCkNcYQsEm9x2C
    bVq1eeTmfhVHod4DS4uxUQwvkIiJDsph6aZmAEx6w8WtON0AhEZ3GZ2sel8w
X-ME-Proxy: <xmx:Wm3oavd5c4UGu1WzlYkYhV_Y91BEu5GX2-bgejo3hg7RA30IVssk8A>
    <xmx:Wm3oauJVOR0wJZb-oh_qu21-zCKvOcgB27BtOWm5Mvny5MJeiYD4Xg>
    <xmx:Wm3oaqeIgrpTqH5LqEi4pkU0enatT4MLROlNxaPeT905GcGjefkN0g>
    <xmx:Wm3oat3r4ldk2EqmdT_DbwjsA5Hx0RYkkFyb4fHxq2iSIsOmnqRcGA>
    <xmx:Wm3oaj6Om6kvX50EHuqZ5imC9EYQ2LE-pv1HVgV2_B5_jSR5N_vEH9k3>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 2 Nov 2026 06:00:41 -0500 (EST)
Message-ID: <97d4996cd94c690b0a2578e6b7cd07d4ee854406.camel@pbarker.dev>
Subject: Re: [OE-core][scarthgap 18/55] libpcre2: update to latest release
 branch hash 50b3c0d7ce
From: Paul Barker <paul@pbarker.dev>
To: Yoann Congal <yoann.congal@smile.fr>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 02 Nov 2026 11:00:40 +0000
In-Reply-To: <dc683396c1a767e7f3125daa4a4335b850c58b67.1793405493.git.yoann.congal@smile.fr>
References: <cover.1793405493.git.yoann.congal@smile.fr>
	 <dc683396c1a767e7f3125daa4a4335b850c58b67.1793405493.git.yoann.congal@smile.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2026 11:00:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249201

On Sat, 2026-10-31 at 01:14 +0100, Yoann Congal wrote:
> From: Peter Marko <peter.marko@siemens.com>
>=20
> Handles CVE-2026-103111, CVE-2026-86145, CVE-2026-89158, CVE-2026-89160,
> CVE-2026-89157, CVE-2026-89156 and CVE-2026-89161.
>=20
> The project committed to have 5 year security support for each release
> on a dedicated release branch.
> Switch from release tarball to git fetcher to use this feature.
>=20
> Git log with all changes and manually created CVE annotations:
> $ git log --oneline pcre2-10.43..50b3c0d7ceaf23578d04e644c02781c322ef6cb0
> 50b3c0d7 Backport of pcre2-10.49-Fix-large-stack-allocation.patch [CVE-20=
26-103111]
> b7d3ffd4 Backport of pcre2-10.48-Fix-DFA-workspace-overflows.patch [CVE-2=
026-86145]
> 9c11f0dc Backport of pcre2-10.48-Fix-compiler-integer-overflows.patch [CV=
E-2026-89158]
> 2866e543 Backport of pcre2-10.48-Fix-invalid-UTF-backwards-scans.patch [C=
VE-2026-89160]
> 714e1062 Backport of pcre2-10.48-Fix-allocation-byte-sizing.patch [CVE-20=
26-89157]
> 91759151 Backport of pcre2-10.48-Check-JIT-mode-before-validation.patch [=
CVE-2026-89156]
> 87f50503 Backport of pcre2-10.48-Fix-JIT-match-context-reuse.patch [CVE-2=
026-89161]
> ed0e58f5 Backport of pcre2-10.48-Fix-JIT-STR_END.patch
> dc733f56 Backport of pcre2-10.44-Fix-incorrect-compiling.patch
> 7f3e5400 Backport of pcre2-10.44-Fix-locking-region.patch
>=20
> Diff of release tarball and git repository is:
> Only in pcre2-10.43/: aclocal.m4
> Only in pcre2-10.43/: ar-lib
> Only in libpcre2-10.43+git/: autogen.sh
> Only in libpcre2-10.43+git/: .bazelrc
> Only in libpcre2-10.43+git/: BUILD.bazel
> Only in libpcre2-10.43+git/: build.zig
> Only in pcre2-10.43/: compile
> Only in pcre2-10.43/: config.guess
> Only in pcre2-10.43/: config.sub
> Only in pcre2-10.43/: configure
> Only in pcre2-10.43/: depcomp
> Only in libpcre2-10.43+git/: .git
> Only in libpcre2-10.43+git/: .github
> Only in libpcre2-10.43+git/: .gitignore
> Only in libpcre2-10.43+git/: index.md
> Only in pcre2-10.43/: INSTALL
> Only in pcre2-10.43/: install-sh
> Only in pcre2-10.43/: ltmain.sh
> Only in pcre2-10.43/m4: libtool.m4
> Only in pcre2-10.43/m4: lt~obsolete.m4
> Only in pcre2-10.43/m4: ltoptions.m4
> Only in pcre2-10.43/m4: ltsugar.m4
> Only in pcre2-10.43/m4: ltversion.m4
> Only in libpcre2-10.43+git/: maint
> Only in pcre2-10.43/: Makefile.in
> Only in pcre2-10.43/: missing
> Only in libpcre2-10.43+git/: MODULE.bazel
> Only in libpcre2-10.43+git/: pcre2_fuzzer_16.dict
> Only in libpcre2-10.43+git/: pcre2_fuzzer_16.options
> Only in libpcre2-10.43+git/: pcre2_fuzzer_32.dict
> Only in libpcre2-10.43+git/: pcre2_fuzzer_32.options
> Only in libpcre2-10.43+git/: pcre2_fuzzer.dict
> Only in libpcre2-10.43+git/: pcre2_fuzzer.options
> Only in libpcre2-10.43+git/: README.md
> Only in pcre2-10.43/: test-driver
> Only in libpcre2-10.43+git/: WORKSPACE.bazel
>=20
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> ---
>  .../recipes-support/libpcre/libpcre2_10.43.bb | 20 +++++++++++--------
>  1 file changed, 12 insertions(+), 8 deletions(-)
>=20
> diff --git a/meta/recipes-support/libpcre/libpcre2_10.43.bb b/meta/recipe=
s-support/libpcre/libpcre2_10.43.bb
> index f744df88fad..743b0ec04e5 100644
> --- a/meta/recipes-support/libpcre/libpcre2_10.43.bb
> +++ b/meta/recipes-support/libpcre/libpcre2_10.43.bb
> @@ -10,23 +10,27 @@ SECTION =3D "devel"
>  LICENSE =3D "BSD-3-Clause"
>  LIC_FILES_CHKSUM =3D "file://LICENCE;md5=3D321a5eb46acae6b6c1ff2c7a866d8=
36a"
> =20
> -SRC_URI =3D "${GITHUB_BASE_URI}/download/pcre2-${PV}/pcre2-${PV}.tar.bz2=
"
> -
> -GITHUB_BASE_URI =3D "https://github.com/PCRE2Project/pcre2/releases"
> -UPSTREAM_CHECK_REGEX =3D "releases/tag/pcre2-(?P<pver>\d+(\.\d+)+)$"
> -
> -SRC_URI[sha256sum] =3D "e2a53984ff0b07dfdb5ae4486bbb9b21cca8e7df2434096c=
c9bf1b728c350bcb"
> +BASE_VER =3D "${@d.getVar('PV').split('+')[0]}"
> +SRC_URI =3D "git://github.com/PCRE2Project/pcre2;protocol=3Dhttps;branch=
=3Drelease/pcre2-${BASE_VER}"

Nitpick: Can we just use the fixed branch name `release/pcre2-10.43`
here? This isn't going to change on scarthgap.

Best regards,

--=20
Paul Barker

