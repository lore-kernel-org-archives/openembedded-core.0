Subject: Re: master/main branch renaming and bitbake
To: openembedded-core@lists.openembedded.org
From: "Benjamin Gilbert" <bgilbert@backtick.net>
X-Originating-Location: New York, New York, US (98.7.211.151)
X-Originating-Platform: Linux Firefox 88
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 13 May 2021 12:54:09 -0700
References: <CANNYZj_LDz9xV9iCW-N03xcGho0S12AaCQEvLb54UJw40FYPMw@mail.gmail.com>
In-Reply-To: <CANNYZj_LDz9xV9iCW-N03xcGho0S12AaCQEvLb54UJw40FYPMw@mail.gmail.com>
Message-ID: <5132.1620935649772798876@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="tw5zc6XOKr2exYTgCLSX"

--tw5zc6XOKr2exYTgCLSX
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 13, 2021 at 12:36 PM, Alexander Kanavin wrote:

>=20
> They're not useless though. As a layer maintainer I absolutely want thos=
e
> checks, as I want to be aware of any branch configuration changes
> upstream, and to ensure I'm not accepting a change in source revision th=
at
> points to an unattached commit, or one from a branch that's not supposed
> to be used at all.
>=20

Yup, if downstream packagers want to manually review such cases, no object=
ion from me.=C2=A0 My concern is upstream getting bug reports that say "ple=
ase reinstate this branch and never delete it again or you'll break our bui=
lds".=C2=A0 See https://github.com/ostreedev/ostree/issues/2360 and https:/=
/github.com/coreos/go-systemd/issues/371 for examples.

Best,
--Benjamin Gilbert

--tw5zc6XOKr2exYTgCLSX
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 13, 2021 at 12:36 PM, Alexander Kanavin wrote:<br />
<blockquote>
<div>They're not useless though. As a layer maintainer I absolutely want t=
hose checks, as I want to be aware of any branch configuration changes upst=
ream, and to ensure I'm not accepting a change in source revision that poin=
ts to an unattached commit, or one from a branch that's not supposed to be =
used at all.</div>
</blockquote>
Yup, if downstream packagers want to manually review such cases, no object=
ion from me.&nbsp; My concern is upstream getting bug reports that say "ple=
ase reinstate this branch and never delete it again or you'll break our bui=
lds".&nbsp; See <a href=3D"https://github.com/ostreedev/ostree/issues/2360"=
 target=3D"_blank" rel=3D"noopener">https://github.com/ostreedev/ostree/iss=
ues/2360</a> and <a href=3D"https://github.com/coreos/go-systemd/issues/371=
" target=3D"_blank" rel=3D"noopener">https://github.com/coreos/go-systemd/i=
ssues/371</a> for examples.<br /><br />Best,<br />--Benjamin Gilbert

--tw5zc6XOKr2exYTgCLSX--
