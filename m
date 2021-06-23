Subject: Re: [PATCH] pypi: set SRC_URI with =, not with +=
To: openembedded-core@lists.openembedded.org
From: "Konrad Weihmann" <kweihmann@outlook.com>
X-Originating-Location: Heusenstamm, Hesse, DE (178.13.242.252)
X-Originating-Platform: Linux Firefox 89
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 23 Jun 2021 00:01:07 -0700
References: <20210622192723.2041345-1-alex.kanavin@gmail.com>
In-Reply-To: <20210622192723.2041345-1-alex.kanavin@gmail.com>
Message-ID: <3324.1624431667479717516@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="d33XM5KBRuixmHTVQEPx"

--d33XM5KBRuixmHTVQEPx
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

That doesn't look completely right to me.

You're absolutely right about devtool expecting the tarball in as the 1st =
item, but this patch here breaks existing recipes like

SRC_URI +=3D "file://some.patch"

inherit pypi

as the patch will now be dropped.

I would suggest to go for SRC_URI_prepend =3D "${PYPI_SRC_URI} " which fix=
es the issue *and* doesn't break exisiting setups

--d33XM5KBRuixmHTVQEPx
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<p>That doesn't look completely right to me.<br /><br />You're absolutely r=
ight about devtool expecting the tarball in as the 1st item, but this patch=
 here breaks existing recipes like<br /><br />SRC_URI +=3D "file://some.pat=
ch"<br /><br />inherit pypi<br /><br />as the patch will now be dropped.</p=
>
<p>&nbsp;</p>
<p>I would suggest to go for SRC_URI_prepend =3D "${PYPI_SRC_URI} " which =
fixes the issue *and* doesn't break exisiting setups</p>

--d33XM5KBRuixmHTVQEPx--
