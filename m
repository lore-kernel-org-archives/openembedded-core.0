Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6289.1795182499837689686
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2026 05:48:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=kO8wmSu2;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=SJ4nYK0l;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.158, mailfrom: paul@pbarker.dev)
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 070B67A037E
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 08:48:19 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Fri, 20 Nov 2026 08:48:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1795182498;
	 x=1795268898; bh=LPAsixKyJB/OLhgr6FMvIfYGTImZYT9YsMjoChPE0Ag=; b=
	kO8wmSu2BHU0aEHjb9tm3epahmreCdQ6s+3MlUnOKL9/fdyM8Rz//X7VbG/jgo61
	JYDy5gTOMznRFhvD7CoUlBJEXiXCfMUz3v4AP46JVMtY3LDUtQOLc5N8aOSIHn7U
	mQQ6ecUEQKc2niLzvh01365Xd5tcGZcYuT1QO2I7l36xB2FRoDihKG+MNlJqMuEA
	Ir2mc6xE8wUZjIzXbjKJWp2V0iqdQ4jSav+ezSAbWqhIlWFc65o+dDC2hlbHjMMA
	uMjlLfj0KDz6itcciBixE43tkxKUgumWl06wQ8Gk4XtI+EShHHx6UN9ThfBqOlXB
	Jh+0cltXR888dH2JJuQSsQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795182498; x=
	1795268898; bh=LPAsixKyJB/OLhgr6FMvIfYGTImZYT9YsMjoChPE0Ag=; b=S
	J4nYK0lXjYY2EFfPW2ugDSNXpGjcDs4Dm8lECa9G8o95oQd1LOxWUgs81aHJjZ4J
	TN335hVKVo1po0393jbvDXnDj1q6CxU9Hoo7C24DvAu5SLzrq/iheap38qJWLFG3
	rvu8pAyx2oXC8ZSE+Cs4DhS9l7M8xBXKgsX6gItwxFSmEDeRj8BuLaWghtByKMzI
	o9mzOLj3RxRuVjSABXctbLooOnK8K/x+448VMDM6iV5181EtnR95lqjgJm0TIPCp
	xakXA9N2Za08JUPZeq0oN5uJEl/h4Dk+/QMtf+P0NCe2XJPkSt7t8TnN0imUW2GT
	e/NZ5YxTrCOUNS+minXCQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=pbarker.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795182498; d=pbarker.dev;
	mf=PHBhdWxAcGJhcmtlci5kZXY+;
	rt=PG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+;
	s=fm2:rsa-sha256:gcaLQ2GEeHqMHIVVp9TJPs9MUQKLWAeg8GA3uMLEsKI7S5r
	FenzifWlTGY6Vb+Y668td2WHTAikwIIyMUSeSYJoa82Pggc22/8xn0sPTXzYk9iZ
	yWJ1YmSQc0lgxMiKVvpjm9dWR8GlMWBbQ/KkCqAIa1mfnnfKeAanZ3YQf9+64iRo
	aIXrTiBD89TMUbGbOk80w5/PkM6nDx0ck01xKWUrxUDBwUfEzGxUUPYPVxrI6DGm
	r/dypkKxVwD0jhLtXaZLK7eZqGrXVgNvgFEu+mzukuzuB/hCS3WPZ7im8guwkExS
	T7O7mmLxmZmYeQopXsYsw5DsW6nVladNykdwh4w==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:GV/MDidCeJrY/WIdN+pPLyD/V53lcpbM1QOky8gMNBU=:iDE2AzcfUNBPfmGDVEJllW6evMH6+v3r70aWPsQ6xwk=;
X-ME-Sender: <xms:ok8Aa_sfdBVuecW40GIZRHBKsX37DsUwBX6bIwQEmD0RU6DZm1HysA>
    <xme:ok8Aa34XY04o9A4DS08bENBNbMInCFIlBgdEbbU4gj_nhYDgqsC7XhBOhQkWps4v_
    vyqvwdkCjVLapNLQedwiiiOgkVMoKi8xwxj-oUoxVqHNkK0414Xn3xR>
X-ME-Received: <xmr:ok8AawI98oddXU107AcSb099yzA53c8W0pesaBKkPxTI8-fze6g8Ox6zw_CCaisCnhO_aTWmfTSiSKzGBzcC6r9viJVm>
X-ME-Proxy-Cause: dmFkZTEaZ0z2/c30TI35pj/z6IyeOuxIUHUPKRA4NGOb7OSr+xl/7Wq2h+M/sPncMgBo11
    V5wcsUqTCau6uvfz7ZpTV9nsQfygFEBZ93ATqEtXKWFBDyrun6U5XTsWHvA4w4+kO7J8X5
    aml6eo3PnqRJxiAa7bt1zEOGYS3MAMxHNuHjeBwdqxFb7a4gtSgQPKiGiV+apIA4YYjFMQ
    6/qa4dcYwcR7gpYuXnO/pURcHvl25X8zyKB+78YiL7hDLTLNItnvoOvUURcRQGpIsuSh0y
    CH3dxpkMJw+D0EYSfkbsIh4FAus4M2NyaPwGRpIxax+c5QH7DVY5iWym6nJKjOXYdPIllM
    h37mcL7d4R1sO0/k3aXnV70Y0jilthQcxnJCRVahy6MjexuhYfLec+tRWmP3IAVV84F316
    HiNVx1NHDiSvJg22fk89Z8fYR75r2C8N/acTBRx8SxZHRsZJyrij2thEDgxDII/IoGw02K
    PtZQsCcytSZaH6Uj+t1oHkgkP+DVXdTT9/xGEX68+ewTP52a/kHc/i2xUZoOw2oL1PyzRT
    KEhw3ngf+tVvQkJO+X7B/5sgDGczmI0BhdvShJjRH0HfxC/4Zr9Ke0TRSeagy+aRqkQRfS
    TlwjT7+DeOAgw1WkqOA2a5yPAr48y0mBMvMueen80eOPKbGYM4JMalWDT2pA
X-ME-Proxy: <xmx:ok8Aa35Jlmf6D5U5s3tK4zSrT0FA6gQOepDC8jo2fhOqi0QRK_uZAQ>
    <xmx:ok8Aazz6jY-p7R6Njww2up_vxYIAynpW7FFdv6WT_MkzrGRnEQu2YA>
    <xmx:ok8Aa7b0JnDe5V4G6JiJu3PKXvQLYsOAC1YkyXsNHZjfpeDxEQSZzA>
    <xmx:ok8Aa1S_DJpSVYz3YGUwLwla-fAR3dBvifMGFKMpbMpEa9IIseaZUw>
    <xmx:ok8Aa3KBOAlawdfnQ1VOn1_-Hbmtw_JjHJenpfM2--ltGPwGloo-lmAd>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 20 Nov 2026 08:48:17 -0500 (EST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Nov 2026 13:48:16 +0000
Message-Id: <DN03322GA5UM.38O14Q1M8OARI@pbarker.dev>
Subject: Re: [PATCH v2 2/3] lib/oe/distro_check: fix the openSUSE Leap
 package lists
From: "Paul Barker" <paul@pbarker.dev>
To: "Tim Orling" <ticotimo@gmail.com>,
 <openembedded-core@lists.openembedded.org>
Cc: "Tim Orling" <tim.orling@konsulko.com>
X-Mailer: aerc 0.22.0
References: <20261116165032.1829-1-tim.orling@konsulko.com>
 <20261116165032.1829-3-tim.orling@konsulko.com>
In-Reply-To: <20261116165032.1829-3-tim.orling@konsulko.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 13:48:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250792

On Mon Nov 16, 2026 at 4:50 PM GMT, Tim Orling wrote:
> download.opensuse.org's listings now link to "./15.6/", which
> find_latest_numeric_release() couldn't parse, so the Leap URLs had an
> empty release and failed with HTTP 404. Accept "./" links, ignore Leap
> 42.x (which came before 15.0), read the source RPMs from repo/oss/src/,
> where they now are, and allow for there being no update repository, as
> for Leap 16.
>
> Tested against download.opensuse.org: Leap 16.1 is fetched again.
>
> [YOCTO #16510]
>
> AI-Generated: Claude Opus 5.5
> Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> ---
> Changes in v2: use str.removeprefix() for the "./" links
>
>  meta/lib/oe/distro_check.py                   | 27 ++++++++++++++++---
>  .../oeqa/selftest/cases/oelib/distro_check.py | 19 +++++++++++++
>  2 files changed, 42 insertions(+), 4 deletions(-)
>
> diff --git a/meta/lib/oe/distro_check.py b/meta/lib/oe/distro_check.py
> index 814b35b8d8..b5c05a6765 100644
> --- a/meta/lib/oe/distro_check.py
> +++ b/meta/lib/oe/distro_check.py
> @@ -22,7 +22,8 @@ def get_links_from_url(url, d):
>      soup =3D BeautifulSoup(create_socket(url,d), "html.parser", parse_on=
ly=3DSoupStrainer("a"))
>      hyperlinks =3D []
>      for line in soup.find_all('a', href=3DTrue):
> -        hyperlinks.append(line['href'].strip('/'))
> +        # Some listings (e.g. MirrorCache) link to "./name/"
> +        hyperlinks.append(line['href'].removeprefix('./').strip('/'))
>      return hyperlinks
> =20
>  def find_latest_numeric_release(url, d):
> @@ -84,12 +85,30 @@ def get_latest_released_fedora_source_package_list(d)=
:
>      package_names |=3D get_source_package_list_from_url_by_letter("http:=
//archive.fedoraproject.org/pub/fedora/linux/updates/%s/SRPMS/" % latest, "=
updates", d)
>      return latest, package_names
> =20
> +def find_latest_opensuse_leap_release(url, d):
> +    "Find the latest Leap release on the given url, ignoring Leap 42.x, =
which came before 15.0"
> +    releases =3D []
> +    for link in get_links_from_url(url, d):
> +        try:
> +            version =3D tuple(int(n) for n in link.split("."))
> +        except ValueError:
> +            continue
> +        if version[0] !=3D 42:
> +            releases.append((version, link))
> +    return max(releases)[1] if releases else "_NotFound_"
> +
>  def get_latest_released_opensuse_source_package_list(d):
>      "Returns list of all the name os packages in the latest opensuse dis=
tro"
> -    latest =3D find_latest_numeric_release("http://download.opensuse.org=
/source/distribution/leap", d)
> +    from urllib.error import HTTPError
> +    latest =3D find_latest_opensuse_leap_release("http://download.opensu=
se.org/source/distribution/leap/", d)
> =20
> -    package_names =3D get_source_package_list_from_url("http://download.=
opensuse.org/source/distribution/leap/%s/repo/oss/suse/src/" % latest, "mai=
n", d)
> -    package_names |=3D get_source_package_list_from_url("http://download=
.opensuse.org/update/leap/%s/oss/src/" % latest, "updates", d)
> +    package_names =3D get_source_package_list_from_url("http://download.=
opensuse.org/source/distribution/leap/%s/repo/oss/src/" % latest, "main", d=
)
> +    # Leap 16 has no separate update repository
> +    try:
> +        package_names |=3D get_source_package_list_from_url("http://down=
load.opensuse.org/update/leap/%s/oss/src/" % latest, "updates", d)
> +    except HTTPError as e:
> +        if e.code !=3D 404:
> +            raise
>      return latest, package_names
> =20
>  def get_latest_released_clear_source_package_list(d):
> diff --git a/meta/lib/oeqa/selftest/cases/oelib/distro_check.py b/meta/li=
b/oeqa/selftest/cases/oelib/distro_check.py
> index 7545fa0c42..7add8d70f9 100644
> --- a/meta/lib/oeqa/selftest/cases/oelib/distro_check.py
> +++ b/meta/lib/oeqa/selftest/cases/oelib/distro_check.py
> @@ -57,6 +57,25 @@ class TestFindLatestUbuntuRelease(TestCase):
>          with mock.patch.object(oe.distro_check, "create_socket", return_=
value=3Dio.BytesIO(META_RELEASE)):
>              self.assertEqual(oe.distro_check.find_latest_ubuntu_release(=
None), "resolute")
> =20
> +class TestOpenSUSE(TestCase):
> +    LISTING =3D b"""<a href=3D"../">..</a> <a href=3D"./15.0-Current/">1=
5.0-Current/</a>
> +<a href=3D"./15.6/">15.6/</a> <a href=3D"./16.0/">16.0/</a> <a href=3D".=
/42.3/">42.3/</a>"""
> +
> +    def test_links_relative_to_current_directory(self):
> +        try:
> +            from bs4 import BeautifulSoup, SoupStrainer

Hi Tim,

This has been merged to master, but I still wonder... Should this use
our vendored copy of bs4 from bitbake (bb._vendor.bs4)?

Best regards,

--=20
Paul Barker

