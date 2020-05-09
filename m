Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web11.5403.1589059504992479810
 for <openembedded-core@lists.openembedded.org>;
 Sat, 09 May 2020 14:25:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: linux.intel.com, ip: 192.55.52.93, mailfrom: timothy.t.orling@linux.intel.com)
IronPort-SDR: TZE17X9TEl6DaTJ6XwF2M/8wHeHCo1YOEHimGKHAxlKpnHGof/g2oLkVvaz7DLT+2uMM3AfLn0
 RkjsRtNdNu/w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2020 14:25:04 -0700
IronPort-SDR: TN9sz7Z7LuWO3GyO7UWOWuqfxjyxcJjNLmj2beN/Xp0OqBlc4kZxcSHXAhmUBHezShdXGPgh61
 uLQWT5jRjseg==
X-IronPort-AV: E=Sophos;i="5.73,373,1583222400"; 
   d="scan'208,217";a="250097605"
Received: from phwu-mobl1.amr.corp.intel.com ([10.252.128.127])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2020 14:25:03 -0700
From: "Tim Orling" <timothy.t.orling@linux.intel.com>
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [OE-core] [PATCH] pypi.bbclass: use new pypi UPSTREAM_CHECK_URI
Date: Sat, 9 May 2020 14:25:03 -0700
References: <160D791C255B772D.4203@lists.openembedded.org>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
In-Reply-To: <160D791C255B772D.4203@lists.openembedded.org>
Message-Id: <90B7CDD7-A094-47D3-A020-134AEEF5F8DA@linux.intel.com>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_4AB7FFD0-8646-4B5A-93AD-1D3F42C603E5"

--Apple-Mail=_4AB7FFD0-8646-4B5A-93AD-1D3F42C603E5
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Note that this is applied after Konrad=E2=80=99s UPSTREAM_CHECK_REGEX patch
https://patchwork.openembedded.org/patch/172442/ <https://patchwork.openem=
bedded.org/patch/172442/>

> On May 9, 2020, at 2:23 PM, Tim Orling <timothy.t.orling@linux.intel.com=
> wrote:
>=20
> Upstream https://pypi.python.org/pypi/${PYPI_PACKAGE}/
> redirects to https://pypi.org/project/${PYPI_PACKAGE}/
>=20
> Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
> ---
> meta/classes/pypi.bbclass | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/classes/pypi.bbclass b/meta/classes/pypi.bbclass
> index ffa8aa3ff44..87b4c85fc09 100644
> --- a/meta/classes/pypi.bbclass
> +++ b/meta/classes/pypi.bbclass
> @@ -22,5 +22,5 @@ SECTION =3D "devel/python"
> SRC_URI +=3D "${PYPI_SRC_URI}"
> S =3D "${WORKDIR}/${PYPI_PACKAGE}-${PV}"
>=20
> -UPSTREAM_CHECK_URI ?=3D "https://pypi.python.org/pypi/${PYPI_PACKAGE}/"
> +UPSTREAM_CHECK_URI ?=3D "https://pypi.org/project/${PYPI_PACKAGE}/"
> UPSTREAM_CHECK_REGEX ?=3D "/${PYPI_PACKAGE}/(?P<pver>(\d+[\.\-_]*)+)/"
> --=20
> 2.24.0
>=20
>=20


--Apple-Mail=_4AB7FFD0-8646-4B5A-93AD-1D3F42C603E5
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; charset=
=
=3Dutf-8"></head><body style=3D"word-wrap: break-word; -webkit-nbsp-mode: =
space; line-break: after-white-space;" class=3D"">Note that this is applied=
 after Konrad=E2=80=99s UPSTREAM_CHECK_REGEX patch<div class=3D""><a href=
=3D"https://patchwork.openembedded.org/patch/172442/" class=3D"">https://p=
atchwork.openembedded.org/patch/172442/</a><br class=3D""><div><br class=3D=
""><blockquote type=3D"cite" class=3D""><div class=3D"">On May 9, 2020, at =
2:23 PM, Tim Orling &lt;<a href=3D"mailto:timothy.t.orling@linux.intel.com"=
 class=3D"">timothy.t.orling@linux.intel.com</a>&gt; wrote:</div><br class=
=3D"Apple-interchange-newline"><div class=3D""><div class=3D"">Upstream <a=
 href=3D"https://pypi.python.org/pypi/${PYPI_PACKAGE}/" class=3D"">https://=
pypi.python.org/pypi/${PYPI_PACKAGE}/</a><br class=3D"">redirects to <a hre=
f=3D"https://pypi.org/project/${PYPI_PACKAGE}/" class=3D"">https://pypi.org=
/project/${PYPI_PACKAGE}/</a><br class=3D""><br class=3D"">Signed-off-by: T=
im Orling &lt;<a href=3D"mailto:timothy.t.orling@linux.intel.com" class=3D"=
">timothy.t.orling@linux.intel.com</a>&gt;<br class=3D"">---<br class=3D"">=
 meta/classes/pypi.bbclass | 2 +-<br class=3D""> 1 file changed, 1 insertio=
n(+), 1 deletion(-)<br class=3D""><br class=3D"">diff --git a/meta/classes/=
pypi.bbclass b/meta/classes/pypi.bbclass<br class=3D"">index ffa8aa3ff44..8=
7b4c85fc09 100644<br class=3D"">--- a/meta/classes/pypi.bbclass<br class=3D=
"">+++ b/meta/classes/pypi.bbclass<br class=3D"">@@ -22,5 +22,5 @@ SECTION =
=
=3D "devel/python"<br class=3D""> SRC_URI +=3D "${PYPI_SRC_URI}"<br class=
=3D""> S =3D "${WORKDIR}/${PYPI_PACKAGE}-${PV}"<br class=3D""><br class=3D=
"">-UPSTREAM_CHECK_URI ?=3D "<a href=3D"https://pypi.python.org/pypi/${PYPI=
_PACKAGE}/" class=3D"">https://pypi.python.org/pypi/${PYPI_PACKAGE}/</a>"<b=
r class=3D"">+UPSTREAM_CHECK_URI ?=3D "<a href=3D"https://pypi.org/project/=
${PYPI_PACKAGE}/" class=3D"">https://pypi.org/project/${PYPI_PACKAGE}/</a>"=
<br class=3D""> UPSTREAM_CHECK_REGEX ?=3D "/${PYPI_PACKAGE}/(?P&lt;pver&gt;=
(\d+[\.\-_]*)+)/"<br class=3D"">-- <br class=3D"">2.24.0<br class=3D""><br =
class=3D""><br class=3D""></div></div></blockquote></div><br class=3D""></d=
iv></body></html>

--Apple-Mail=_4AB7FFD0-8646-4B5A-93AD-1D3F42C603E5--
