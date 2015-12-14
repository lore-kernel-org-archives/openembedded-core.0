Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id CDDE860761
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 20:43:26 +0000 (UTC)
Received: by pabur14 with SMTP id ur14so109912445pab.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 12:43:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=v1lSA1o7CZ+xVuaOQGGywbCQnY82AZm4+nyjth4PhAE=;
	b=UodpOIpXw/gbSc0HCMoBzWfDTJmMMZKnomiXtxXGmTo3tnuhSIwEjURAEDTPT6BCcq
	IWXRMuW1aBJXqTnELbOiJ1+Cp2fVueU6sVE3aOkp8ZvsRoMRlUD4RpILb9TlHRymTH44
	au//e9UztTDNzX+Il/Fo6vYkzuA86P/HhJcujow9H/MBXJfBympSYNWYsQr4YQ2D8n5N
	u4om3WlHi7RW9wQFCX8iRJsRTcHWLcLMM5TAsblwtB8wX+2bx0PObH4DwYlcRFjb4tGw
	J0mqAh+vOxlIyc6QoyDBlalIGJ9/peH/s1+MpNNHtbDxVqUtFQhvsPbFJoAIWJHOYBtF
	d4dA==
X-Received: by 10.66.102.70 with SMTP id fm6mr49039212pab.80.1450125807287;
	Mon, 14 Dec 2015 12:43:27 -0800 (PST)
Received: from ?IPv6:2601:647:4c02:cc6:c1af:4877:6898:e1ea?
	([2601:647:4c02:cc6:c1af:4877:6898:e1ea])
	by smtp.gmail.com with ESMTPSA id
	y22sm44225873pfi.95.2015.12.14.12.43.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 14 Dec 2015 12:43:26 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAJTo0LbqBEGMkfS+9AFHimvDvg5evE55R5yoxkWqQRPwx3QtTg@mail.gmail.com>
Date: Mon, 14 Dec 2015 12:43:22 -0800
Message-Id: <838C35D6-1588-4139-A4E9-C9D8382D95F1@gmail.com>
References: <cover.1450073907.git.raj.khem@gmail.com>
	<2ae1ec09a656b0401bdc399ac0b8fb7d488c4106.1450073907.git.raj.khem@gmail.com>
	<CAJTo0LbqBEGMkfS+9AFHimvDvg5evE55R5yoxkWqQRPwx3QtTg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.3112)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/6] uclibc: Switch to using uclibc-ng
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
X-List-Received-Date: Mon, 14 Dec 2015 20:43:28 -0000
X-Groupsio-MsgNum: 74749
Content-Type: multipart/signed;
	boundary="Apple-Mail=_73D8B713-37ED-4BAD-BFE5-5D392578FC48";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_73D8B713-37ED-4BAD-BFE5-5D392578FC48
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_77FE27E1-2167-406A-B116-ACC684FEB802"

--Apple-Mail=_77FE27E1-2167-406A-B116-ACC684FEB802
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Dec 14, 2015, at 4:25 AM, Burton, Ross <ross.burton@intel.com> =
wrote:
>=20
> On 14 December 2015 at 06:23, Khem Raj <raj.khem@gmail.com =
<mailto:raj.khem@gmail.com>> wrote:
> --- /dev/null
> +++ =
b/meta/recipes-core/uclibc/uclibc-git/0001-Revert-glibc-compat-bump-glibc-=
minor-version.patch
> @@ -0,0 +1,26 @@
> +=46rom f9f566849ad0785b2fd3fd6c4c5d324f9f822aac Mon Sep 17 00:00:00 =
2001
> +From: Khem Raj <raj.khem@gmail.com <mailto:raj.khem@gmail.com>>
> +Date: Sun, 13 Dec 2015 17:25:11 +0000
> +Subject: [PATCH] Revert "glibc compat: bump glibc minor version"
> +
> +This reverts commit 4ff3a6c8eb91db71d6dc3d2932b66e848bd20ac3.
>=20
> No explanation, no signed-off-by, no upstream-status.
>=20
> diff --git =
a/meta/recipes-core/uclibc/uclibc-git/libc-stdlib-canonicalize_file_name-m=
emory-leak.patch =
b/meta/recipes-core/uclibc/uclibc-git/libc-stdlib-canonicalize_file_name-m=
emory-leak.patch
> new file mode 100644
> index 0000000..8b36cfc
> --- /dev/null
> +++ =
b/meta/recipes-core/uclibc/uclibc-git/libc-stdlib-canonicalize_file_name-m=
emory-leak.patch
> @@ -0,0 +1,36 @@
> +diff --git a/libc/stdlib/canonicalize.c b/libc/stdlib/canonicalize.c
> +index 06e710a..da09d58 100644
> +--- a/libc/stdlib/canonicalize.c
> ++++ b/libc/stdlib/canonicalize.c
>=20
> No comment, no upstream-status, no signed-off-by.

Ross

Addressed all comments. Updated the pull branch.


>=20
> Ross


--Apple-Mail=_77FE27E1-2167-406A-B116-ACC684FEB802
Content-Transfer-Encoding: 7bit
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv="Content-Type" content="text/html charset=us-ascii"></head><body style="word-wrap: break-word; -webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" class=""><br class=""><div><blockquote type="cite" class=""><div class="">On Dec 14, 2015, at 4:25 AM, Burton, Ross &lt;<a href="mailto:ross.burton@intel.com" class="">ross.burton@intel.com</a>&gt; wrote:</div><br class="Apple-interchange-newline"><div class=""><div dir="ltr" class="">On 14 December 2015 at 06:23, Khem Raj <span dir="ltr" class="">&lt;<a href="mailto:raj.khem@gmail.com" target="_blank" class="">raj.khem@gmail.com</a>&gt;</span> wrote:<div class="gmail_extra"><div class="gmail_quote"><blockquote class="gmail_quote" style="margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
--- /dev/null<br class="">
+++ b/meta/recipes-core/uclibc/uclibc-git/0001-Revert-glibc-compat-bump-glibc-minor-version.patch<br class="">
@@ -0,0 +1,26 @@<br class="">
+From f9f566849ad0785b2fd3fd6c4c5d324f9f822aac Mon Sep 17 00:00:00 2001<br class="">
+From: Khem Raj &lt;<a href="mailto:raj.khem@gmail.com" class="">raj.khem@gmail.com</a>&gt;<br class="">
+Date: Sun, 13 Dec 2015 17:25:11 +0000<br class="">
+Subject: [PATCH] Revert "glibc compat: bump glibc minor version"<br class="">
+<br class="">
+This reverts commit 4ff3a6c8eb91db71d6dc3d2932b66e848bd20ac3.<br class=""></blockquote><div class=""><br class=""></div><div class="">No explanation, no signed-off-by, no upstream-status.</div><div class="">&nbsp;</div><blockquote class="gmail_quote" style="margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
diff --git a/meta/recipes-core/uclibc/uclibc-git/libc-stdlib-canonicalize_file_name-memory-leak.patch b/meta/recipes-core/uclibc/uclibc-git/libc-stdlib-canonicalize_file_name-memory-leak.patch<br class="">
new file mode 100644<br class="">
index 0000000..8b36cfc<br class="">
--- /dev/null<br class="">
+++ b/meta/recipes-core/uclibc/uclibc-git/libc-stdlib-canonicalize_file_name-memory-leak.patch<br class="">
@@ -0,0 +1,36 @@<br class="">
+diff --git a/libc/stdlib/canonicalize.c b/libc/stdlib/canonicalize.c<br class="">
+index 06e710a..da09d58 100644<br class="">
+--- a/libc/stdlib/canonicalize.c<br class="">
++++ b/libc/stdlib/canonicalize.c<br class=""></blockquote><div class=""><br class=""></div><div class="">No comment, no upstream-status, no signed-off-by.</div></div></div></div></div></blockquote><div><br class=""></div><div>Ross</div><div><br class=""></div><div>Addressed all comments. Updated the pull branch.</div><div><br class=""></div><br class=""><blockquote type="cite" class=""><div class=""><div dir="ltr" class=""><div class="gmail_extra"><div class="gmail_quote"><div class=""><br class=""></div><div class="">Ross</div></div></div></div>
</div></blockquote></div><br class=""></body></html>

--Apple-Mail=_77FE27E1-2167-406A-B116-ACC684FEB802--

--Apple-Mail=_73D8B713-37ED-4BAD-BFE5-5D392578FC48
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlZvKe4ACgkQuwUzVZGdMxSUWQCeN8CDpRrCPf9LoNsEEYE4Tjsd
Q+sAniDonBlUtfMT9Qa7XD9Pe/6+LobQ
=HP3b
-----END PGP SIGNATURE-----

--Apple-Mail=_73D8B713-37ED-4BAD-BFE5-5D392578FC48--
