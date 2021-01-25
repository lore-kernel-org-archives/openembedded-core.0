Subject: Re: Question about security_flags.inc and CC_ARCH
To: openembedded-core@lists.openembedded.org
From: "Michael Ho" <Michael.Ho@bmw.de>
X-Originating-Location: Munich, Bavaria, DE (160.46.252.73)
X-Originating-Platform: Mac Firefox 68
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 25 Jan 2021 08:57:49 -0800
References: <CAMKF1sp-tFGr12OBL+J0d4-Ykf7es5JJoY-eeicLJkGP0UHEfA@mail.gmail.com>
In-Reply-To: <CAMKF1sp-tFGr12OBL+J0d4-Ykf7es5JJoY-eeicLJkGP0UHEfA@mail.gmail.com>
Message-ID: <5141.1611593869692038191@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="mZ5B5ww7K1KSMlBNwP86"

--mZ5B5ww7K1KSMlBNwP86
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Thanks for the info/comments. It's clear that it wouldn't be wise to diffe=
r the SDK compiler flags from the bitbake flags.

Maybe coming back to the original point, what would the recommended way be=
 for developers in an SDK to create debug builds of their software? Should =
they attempt to filter out FORTIFY_SOURCE from the compiler flags on their =
own?

Could it make sense to leave things like the stack-protector flags in CC_A=
RCH but move just FORTIFY_SOURCE to CFLAGS as FORTIFY_SOURCE does not do an=
ything without optimisations (which should not be part of CC/CXX)?

Thanks for any advice!

Kind regards,
Michael Ho

--mZ5B5ww7K1KSMlBNwP86
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi,<br /><br />Thanks for the info/comments. It's clear that it wouldn't be=
 wise to differ the SDK compiler flags from the bitbake flags.<br /><br />M=
aybe coming back to the original point, what would the recommended way be f=
or developers in an SDK to create debug builds of their software? Should th=
ey attempt to filter out FORTIFY_SOURCE from the compiler flags on their ow=
n?<br /><br />Could it make sense to leave things like the stack-protector =
flags in CC_ARCH but move just FORTIFY_SOURCE to CFLAGS as FORTIFY_SOURCE d=
oes not do anything without optimisations (which should not be part of CC/C=
XX)?<br /><br />Thanks for any advice!<br /><br />Kind regards,<br />Michae=
l Ho

--mZ5B5ww7K1KSMlBNwP86--
