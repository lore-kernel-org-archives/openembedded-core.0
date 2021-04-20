Subject: Re: [yocto-security] [PATCH] busybox: use openssl for TLS connections whenever possible
To: openembedded-core@lists.openembedded.org
From: "Shachar Menashe" <shachar@vdoo.com>
X-Originating-Location: Tel Aviv, IL (62.90.9.149)
X-Originating-Platform: Windows Chrome 89
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 20 Apr 2021 13:45:59 -0700
References: <CAJ86T=XGxEyZYc7pH3Me1_Cx+H1+OAjNjo45veLhyPFv+eEWsA@mail.gmail.com>
In-Reply-To: <CAJ86T=XGxEyZYc7pH3Me1_Cx+H1+OAjNjo45veLhyPFv+eEWsA@mail.gmail.com>
Message-ID: <1397.1618951559627472345@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="NSIZ3yYOcesRoGUoPe51"

--NSIZ3yYOcesRoGUoPe51
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Last time we talked about this I thought we would need to change something =
in openssl build settings to make the openssl binary get built just for thi=
s solution, and that was what got rejected.
But actually now I see (or perhaps it got changed) that the openssl binary=
 is built anyways, in any build that already relies on openssl.
So my suggestion is to enable this feature. Like I said in builds with ope=
nssl it will make everything more secure in a transparent manner, and in bu=
ilds without openssl it will display a warning just like today.
I wouldn't consider it a hacky solution since this is the official solutio=
n for this issue.
This is also exacerbated due to the fact that there are no other alternati=
ves for secure download from CLI (ex. the sato build doesn't contain the "c=
url" standalone binary)

--NSIZ3yYOcesRoGUoPe51
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Last time we talked about this I thought we would need to change something =
in openssl build settings to make the openssl binary get built just for thi=
s solution, and that was what got rejected.<br />But actually now I see (or=
 perhaps it got changed) that the openssl binary is built anyways, in any b=
uild that already relies on openssl.<br />So my suggestion is to enable thi=
s feature. Like I said in builds with openssl it will make everything more =
secure in a transparent manner, and in builds without openssl it will displ=
ay a warning just like today.<br />I wouldn't consider it a hacky solution =
since this is the official solution for this issue.<br />This is also exace=
rbated due to the fact that there are no other alternatives for secure down=
load from CLI (ex. the sato build doesn't contain the "curl" standalone bin=
ary)

--NSIZ3yYOcesRoGUoPe51--
