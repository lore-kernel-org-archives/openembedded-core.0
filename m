Subject: Re: ALTERNATIVE_LINK_NAME in bash recipe doesn't create /bin/sh
To: openembedded-core@lists.openembedded.org
From: "Devendra Tewari" <devendra.tewari@gmail.com>
X-Originating-Location: Recife, Pernambuco, BR (177.19.53.12)
X-Originating-Platform: Mac Safari 14.1
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 09 Aug 2021 14:36:12 -0700
References: <i9kg.1628541764875972527.mOQ9@lists.openembedded.org>
In-Reply-To: <i9kg.1628541764875972527.mOQ9@lists.openembedded.org>
Message-ID: <17540.1628544972358866806@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="REzulVdFhwVQVBt7PuMO"

--REzulVdFhwVQVBt7PuMO
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

To provide more context, these are the ALTERNATIVE variables in the recipe =
around=C2=A0ALTERNATIVE_LINK_NAME[sh]

ALTERNATIVE:${PN} =3D "bash sh"
ALTERNATIVE_LINK_NAME[bash] =3D "${base_bindir}/bash"
ALTERNATIVE_TARGET[bash] =3D "${base_bindir}/bash"
ALTERNATIVE_LINK_NAME[sh] =3D "${base_bindir}/sh"
ALTERNATIVE_TARGET[sh] =3D "${base_bindir}/bash.${BPN}"

Based on earlier messages on=C2=A0ALTERNATIVE_LINK_NAME and ALTERNATIVE_TAR=
GET, I have arrived at the conclusion that a link should be created but isn=
't.

Thanks,
Devendra

--REzulVdFhwVQVBt7PuMO
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<span style=3D"caret-color: #ffffff; color: #ffffff; font-family: Helvetica=
; font-size: 12px; --darkreader-inline-color: #e8e6e3;" data-darkreader-inl=
ine-color=3D"">To provide more context, these are the ALTERNATIVE variables=
 in the recipe around&nbsp;ALTERNATIVE_LINK_NAME[sh]</span><br style=3D"car=
et-color: #ffffff; color: #ffffff; font-family: Helvetica; font-size: 12px;=
 --darkreader-inline-color: #e8e6e3;" data-darkreader-inline-color=3D"" /><=
br style=3D"caret-color: #ffffff; color: #ffffff; font-family: Helvetica; f=
ont-size: 12px; --darkreader-inline-color: #e8e6e3;" data-darkreader-inline=
-color=3D"" />
<div style=3D"caret-color: #ffffff; color: #ffffff; font-family: Helvetica;=
 font-size: 12px; --darkreader-inline-color: #e8e6e3;" data-darkreader-inli=
ne-color=3D"">ALTERNATIVE:${PN} =3D "bash sh"</div>
<div style=3D"caret-color: #ffffff; color: #ffffff; font-family: Helvetica;=
 font-size: 12px; --darkreader-inline-color: #e8e6e3;" data-darkreader-inli=
ne-color=3D"">ALTERNATIVE_LINK_NAME[bash] =3D "${base_bindir}/bash"</div>
<div style=3D"caret-color: #ffffff; color: #ffffff; font-family: Helvetica;=
 font-size: 12px; --darkreader-inline-color: #e8e6e3;" data-darkreader-inli=
ne-color=3D"">ALTERNATIVE_TARGET[bash] =3D "${base_bindir}/bash"</div>
<div style=3D"caret-color: #ffffff; color: #ffffff; font-family: Helvetica;=
 font-size: 12px; --darkreader-inline-color: #e8e6e3;" data-darkreader-inli=
ne-color=3D"">ALTERNATIVE_LINK_NAME[sh] =3D "${base_bindir}/sh"</div>
<div style=3D"caret-color: #ffffff; color: #ffffff; font-family: Helvetica;=
 font-size: 12px; --darkreader-inline-color: #e8e6e3;" data-darkreader-inli=
ne-color=3D"">ALTERNATIVE_TARGET[sh] =3D "${base_bindir}/bash.${BPN}"</div>
<div style=3D"caret-color: #ffffff; color: #ffffff; font-family: Helvetica;=
 font-size: 12px; --darkreader-inline-color: #e8e6e3;" data-darkreader-inli=
ne-color=3D""><br />Based on earlier messages on&nbsp;ALTERNATIVE_LINK_NAME=
 and ALTERNATIVE_TARGET, I have arrived at the conclusion that a link shoul=
d be created but isn't.</div>
<div style=3D"caret-color: #ffffff; color: #ffffff; font-family: Helvetica;=
 font-size: 12px; --darkreader-inline-color: #e8e6e3;" data-darkreader-inli=
ne-color=3D""><br />Thanks,<br />Devendra</div>

--REzulVdFhwVQVBt7PuMO--
