Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10163.1793617329207273879
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2026 03:02:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=aeRWL924;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=jfXVqOTc;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.157, mailfrom: paul@pbarker.dev)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 4A26B14000CB
	for <openembedded-core@lists.openembedded.org>; Mon,  2 Nov 2026 06:02:08 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Mon, 02 Nov 2026 06:02:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1793617328;
	 x=1793703728; bh=0jT44KO6uuww+fdVXLZhK0GWQSBjUWrIa1F//kmbb4s=; b=
	aeRWL924c35Zi0zvZw4LFPKrVHShElUMedt/rGbjlqiBC5LGA4d2qTOKnYCw43Ng
	DyQT4s8RswbdaF+91a8oc74h1peyjKkrbdW2KbNBkKO0GQwJ26m1Kg6tuOGpMX/0
	NRGCHXtJmelhCPsCFs0dUY5X/S953WCEFxoebqHv9YOJZnfe72piMLIGYt8wiowJ
	kbN0dj+zN4DQL4qp4DC1rjReoXXIcizaG8GnWjVSqkOUIO18TBriyTiPGBJgvSWA
	kTElj2AOubEE53Jzml6NEnx7pqSxiUuMZhz7+dqHYSWYeZyw3rUZF0Auz4bK7bI+
	l9KzWgZ+XMWMLHP+1uP9ig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1793617328; x=1793703728; bh=0
	jT44KO6uuww+fdVXLZhK0GWQSBjUWrIa1F//kmbb4s=; b=jfXVqOTclDMaLQ2r9
	iW36SPszuR3dkbZkcbQ905Bgcer6Sjd0RDSMEpLEQ+3lTwBSeD0wrE9QISa/Pvx0
	ALFpHfyMAkhq2vt0zU6TdVrt/Dy6z5ihelOfU6U2GeZuv541QP5Qa5xsbT+KvcAa
	Ks+fv94LeMfFdVIHxUMpEdGK2x3zdkQkEsZG6huYL9pQyt370tMQrjnumLzafmja
	eZgLqz8t/auhselUSfaWXVclGLeGRaywJvmdqoRRvjQUSlRqBgx1BZSnx380vLPX
	5XM7owBHWDmYf1N5uIAKBFAaJkiK/lNzz5svyIsneoFzwPNRHYeyobOZcYqVwdio
	V/UiA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=pbarker.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793617328; d=pbarker.dev;
	mf=PHBhdWxAcGJhcmtlci5kZXY+;
	rt=PG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+;
	s=fm1:rsa-sha256:jZaR908ZveH//WmZdPkBqAvP9oESgF3QKANHIpUhAjo6zGy
	EXJFRACPe2Nw3KhCwe+8ZU7hDaj3DSZVkXsDS2M690wSM/70Nd+9UMBpgPc//5oA
	ZlpC+/R/5TWlS1ZRHrKwO7yR84nYFh2zIzEzsN4Z2nXuWZSPBnfctJcv2AqmsbGW
	ojGbmPrkUvPsK3pX4GTl7Bh1VPJCE33YbsTbm2EoANz/yUrKTQqOA8G7mlDyTFRf
	pW2cY0zElCM8WNl7FvD5uCYTd1T6w/KTg9oFGu2Q1eByMGH6ttwovJJw1S9srps2
	eG9mf0adcVpOJWHbURPDpCa1UIVz+RRpm7f3g1g==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=content-transfer-encoding,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to,
	user-agent;
Message-Instance: m=1; h=sha256:AgLd4+k1S7FgAtPL2tArdiijMKddN/W04E35lM2lMNY=:E77ipakZ8QjIkOjEOwyR/XG5mQjIj97qLVX9TU4JVN0=;
X-ME-Sender: <xms:sG3oarQklLAkBH17HpmcUZO69vptJkVC3tB_J7f6zY3-4GfqOOMY-w>
    <xme:sG3oaiz4kA53t6tuoqLTrxNWsZjLc0aV9LEE9oieHJIyFZFJ-3FbY1G7n2FlNn1Sb
    zUQ925nhxqIPjvrbu8G7V39hk4KYaAZDrozx_w_A9hgu2jYHH7qXEWQ>
X-ME-Received: <xmr:sG3oaucoipf4z91i531QA6A2xoD6PnPgFsgJEU3H2Z4AXbM7QC-pD64pDRUGqjRk-YAS-kHbB9dNkHtUGRJZcV2skP3z62nVMtWp34skLWsS>
X-ME-Proxy-Cause: dmFkZTF2fixVjmKkMHYGERE+Qg8uZXjH7UixYMj4E/wRdeb0EzMrQwxsI3FQwXruPWy1N8
    CR71AZx13tkN5w+yuzpsCRxkyG5CWaX3NoLlK2oBQMwu8uqjDI/F5rITeXsDPoP/L0S+wJ
    4WfGOn9end+yYjSoYkzZ/XMSWxsl5uG1hP8D47zh6kK1kGdhqUehK/AdjRpz+DxIJut8l6
    L+o3I8jKyRc7NujkB0mXNbODyURiHcsuBCIyd741vpnauDYmrF/32mwik2gtmCLm2RB9bi
    qBYQvxPLL2m5Uhgm07bT4U/dMe+TBxMCk2Ao/Z6IHbMlujvnDMESzLvr+YQRL3ajHmpapB
    hX6EwwO3Ia8LCl88Le1F6ZdsrQHjcZ1Gv0eT0xjDWiRRGhvVwgU5a9CmNL8QxiM0vF7SAJ
    pS+h+ZxdS3rOEF6sc9tIaawpE3cg33lFUYsyUnB+K+Te0fff4/TfJZtl9GPGDgzlZASFug
    41fv4Xb3jo0/r6EtnKQIj6xHtNuCD68yN43vYqTj83azb9IhxsiD/SmftFGIsqbArT/wC7
    my3cFpGh/wkbc2/1PlVKB6Nk94j2Vro95aFxFNQ5MYVsLZoyspKAFIy/cKiyxL9oWN1HRn
    ID2uSi19id77a6qDEHDAaX1lqvoXqUDxp+JWO4aAwEMh4W0NXMqnYcKuaE7w
X-ME-Proxy: <xmx:sG3oamI9YdV1LxXhvGg3uQa-UXHAc4pbZVfFiTOzbK0GfiBAzj6GUw>
    <xmx:sG3oanGsq7NXq5cJWC-kLzr8iQJVl5vnv67I2ArOfWxnbthwDlbg2g>
    <xmx:sG3oaordyVCOxgY1AiLKjtMXCmFWuZtq2duBDdUdd8L1q9Gptpqh9g>
    <xmx:sG3oaoQCyoWaN_hTpCFfBXiilM54NcrsSi46Oa-qvX90qZtEr5s4og>
    <xmx:sG3oan1TgSwxHMjvWPkfGa471goed51lHpRLNnacKojOnW960lj7Xyxh>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 2 Nov 2026 06:02:07 -0500 (EST)
Message-ID: <64d8e8dcb939b38d9a3fb4999000a56138aa4f79.camel@pbarker.dev>
Subject: Re: [OE-core][scarthgap 19/55] python3-urllib3: Fix CVE-2026-97689
From: Paul Barker <paul@pbarker.dev>
To: Yoann Congal <yoann.congal@smile.fr>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 02 Nov 2026 11:02:07 +0000
In-Reply-To: <a24491466f8796015bd1146d874f4be52f10ad42.1793405493.git.yoann.congal@smile.fr>
References: <cover.1793405493.git.yoann.congal@smile.fr>
	 <a24491466f8796015bd1146d874f4be52f10ad42.1793405493.git.yoann.congal@smile.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2026 11:02:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249202

On Sat, 2026-10-31 at 01:14 +0100, Yoann Congal wrote:
> From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
>=20
> Backport the upstream fix [1] as mentioned in [2]
>=20
> [1] https://github.com/urllib3/urllib3/commit/cd770b059b543be29298ea5c52a=
fb0b1b090f5ed
> [2] https://nvd.nist.gov/vuln/detail/cve-2026-97689
>=20
> Testing:
>   - test_response.py::test_chunk_size_line_too_long - passed
>   - test_response.py::test_chunk_trailer_line_length (6 cases) - passed
>   - test_socketlevel.py::test_chunked_size_line_too_long_does_not_buffer =
- passed
>   - Full test_response.py: 161 passed, 45 skipped (no regressions)
>=20
> Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> ---
>  .../python3-urllib3/CVE-2026-97689.patch      | 251 ++++++++++++++++++
>  .../python/python3-urllib3_2.2.2.bb           |  14 +-
>  2 files changed, 258 insertions(+), 7 deletions(-)
>  create mode 100644 meta/recipes-devtools/python/python3-urllib3/CVE-2026=
-97689.patch
>=20
> diff --git a/meta/recipes-devtools/python/python3-urllib3/CVE-2026-97689.=
patch b/meta/recipes-devtools/python/python3-urllib3/CVE-2026-97689.patch
> new file mode 100644
> index 00000000000..98b007324cf
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3-urllib3/CVE-2026-97689.patch
> @@ -0,0 +1,251 @@
> +From 5d5fac45ff18a8159c5a4aa973ed9fc2f5dd35ad Mon Sep 17 00:00:00 2001
> +From: Quentin Pradet <quentin.pradet@gmail.com>
> +Date: Tue, 15 Sep 2026 22:33:41 +0400
> +Subject: [PATCH] Merge commit from fork
> +
> +* Bound chunk-size line reads to prevent memory exhaustion DoS
> +
> +The streaming chunked path (HTTPResponse.stream() / read_chunked()) read
> +each chunk-size line with an unbounded readline(), unlike the plain read=
()
> +path which delegates to http.client's _MAXLINE-capped reader. A maliciou=
s
> +server could advertise Transfer-Encoding: chunked and then send a very l=
ong
> +run of bytes with no newline, forcing the client to buffer the entire ru=
n
> +before the chunk size could be rejected.
> +
> +This caps the chunk-size line (and the trailing CRLF line) at _MAXLINE,
> +raising ProtocolError when exceeded, matching the behaviour read() alrea=
dy
> +had. Only the size line is bounded; chunk bodies still go through the si=
zed
> +_safe_read(), so legitimate large chunks are unaffected.
> +
> +Verified with a local malicious server streaming a 200 MiB unterminated
> +size line: stream() previously grew RSS by ~530 MB, now stays at ~1 MB a=
nd
> +fails fast, matching read(). A 5 MiB chunk body still streams correctly.
> +
> +* Fix a black formatting issue
> +
> +* Test chunked response trailer length limits
> +
> +* Fix number in the changelog entry
> +
> +---------
> +
> +Co-authored-by: Illia Volochii <illia.volochii@gmail.com>
> +
> +CVE: CVE-2026-97689
> +Upstream-Status: Backport [https://github.com/urllib3/urllib3/commit/cd7=
70b059b543be29298ea5c52afb0b1b090f5ed]
> +
> +Note:
> + - changeLog change is not backported
> + - Adjusted commit change as per current version

Do we need more detail on the adjustments made during backporting?

Best regards,

--=20
Paul Barker

