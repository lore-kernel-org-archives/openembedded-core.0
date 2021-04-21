Subject: Re: [yocto-security] [PATCH] busybox: use openssl for TLS connections whenever possible
To: openembedded-core@lists.openembedded.org
From: "Shachar Menashe" <shachar@vdoo.com>
X-Originating-Location: Tel Aviv, IL (62.90.9.149)
X-Originating-Platform: Windows Chrome 89
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 21 Apr 2021 02:22:14 -0700
References: <CAJ86T=W1995MMCUqA9pjWf=DVp9ws+Dpq7kPttksfOUNPT2Uyg@mail.gmail.com>
In-Reply-To: <CAJ86T=W1995MMCUqA9pjWf=DVp9ws+Dpq7kPttksfOUNPT2Uyg@mail.gmail.com>
Message-ID: <1397.1618996934194619727@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="J4Msq1xJZrvk1zCbJxOw"

--J4Msq1xJZrvk1zCbJxOw
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 20, 2021 at 1:46 PM Shachar Menashe <shachar@vdoo.com> wrote:

>=20
>=20
> Last time we talked about this I thought we would need to change somethi=
ng
> in openssl build settings to make the openssl binary get built just for
> this solution, and that was what got rejected.
> But actually now I see (or perhaps it got changed) that the openssl bina=
ry
> is built anyways, in any build that already relies on openssl.
> So my suggestion is to enable this feature. Like I said in builds with
> openssl it will make everything more secure in a transparent manner, and
> in builds without openssl it will display a warning just like today.
> I wouldn't consider it a hacky solution since this is the official
> solution for this issue.

It's very clearly a hack. Maybe it's the "official solution" for
supporting https with busybox wget, but OE has a wider scope - we're
not limited to busybox wget if a better overall solution is available.

>=20
> This is also exacerbated due to the fact that there are no other
> alternatives for secure download from CLI (ex. the sato build doesn't
> contain the "curl" standalone binary)

I don't see an issue with adding curl to any OE reference image which
needs an https client.

>=20
> OK, so do you suggest adding curl and removing wget? (that would be a
> patch with a configuration change to busybox)

--J4Msq1xJZrvk1zCbJxOw
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 20, 2021 at 1:46 PM Shachar Menashe &lt;shachar@vdoo.com&gt; wr=
ote:<br />
<blockquote><br />Last time we talked about this I thought we would need t=
o change something in openssl build settings to make the openssl binary get=
 built just for this solution, and that was what got rejected.<br />But act=
ually now I see (or perhaps it got changed) that the openssl binary is buil=
t anyways, in any build that already relies on openssl.<br />So my suggesti=
on is to enable this feature. Like I said in builds with openssl it will ma=
ke everything more secure in a transparent manner, and in builds without op=
enssl it will display a warning just like today.<br />I wouldn't consider i=
t a hacky solution since this is the official solution for this issue.</blo=
ckquote>
It's very clearly a hack. Maybe it's the "official solution" for<br />supp=
orting https with busybox wget, but OE has a wider scope - we're<br />not l=
imited to busybox wget if a better overall solution is available.<br /><br =
/>
<blockquote>This is also exacerbated due to the fact that there are no oth=
er alternatives for secure download from CLI (ex. the sato build doesn't co=
ntain the "curl" standalone binary)</blockquote>
I don't see an issue with adding curl to any OE reference image which<br /=
>needs an https client.<br /><br />
<blockquote>OK, so do you suggest adding curl and removing wget? (that wou=
ld be a patch with a configuration change to busybox)</blockquote>

--J4Msq1xJZrvk1zCbJxOw--
