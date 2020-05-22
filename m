Subject: Re: gtest and gmock not added to SDK
To: openembedded-core@lists.openembedded.org
From: "Tom Hochstein" <tom.hochstein@nxp.com>
X-Originating-Location: Austin, Texas, US (63.246.163.70)
X-Originating-Platform: Windows Chrome 81
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 22 May 2020 15:50:32 -0700
References: <CAJ86T=VDtvME1EVBfVOBW5U+84dkpD03ksHJdik15CSOG84Xgg@mail.gmail.com>
In-Reply-To: <CAJ86T=VDtvME1EVBfVOBW5U+84dkpD03ksHJdik15CSOG84Xgg@mail.gmail.com>
Message-ID: <22249.1590187832432063263@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="Lyw5KqN27RiCjsE2jL1v"

--Lyw5KqN27RiCjsE2jL1v
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 22, 2020 at 03:33 PM, Andre McCurdy wrote:

>=20
> On Fri, May 22, 2020 at 2:29 PM Otavio Salvador
> <otavio.salvador@ossystems.com.br> wrote:
>=20
>> On Fri, May 22, 2020 at 5:48 PM Tom Hochstein <tom.hochstein@nxp.com>
>> wrote:
>>=20
>>> The gtest and gmock packages provided by googletest are not added to t=
he
>>> SDK by default. I assume it is because the googletest main package is
>>> empty?
>>=20
>>=20
>=20
> Are you including googletest in the image used to create the SDK or
> gmock and gtest?
>=20
> It looks like gmock and gtest are only mentioned in the googletest
> recipe as PROVIDES, so they are aliases for build time dependencies
> only. For run time dependencies you should use googletest.

Right, I should have mentioned that. I have a DEPENDS on gtest for a packa=
ge in my image. To fix the SDK, I added an RDEPENDS on googletest from the =
same package.

>=20
>=20
>=20
>>=20
>>> I added an RDEPENDS_${PN} from the dependent package to fix it. Is the=
re a
>>> better solution?
>>=20
>> You can change the packages to have their `-dev` to rdepends on
>> `gtest/gmock-dev` for example.
>>=20
>> --
>> Otavio Salvador O.S. Systems
>> http://www.ossystems.com.br http://code.ossystems.com.br
>> Mobile: +55 (53) 9 9981-7854 Mobile: +1 (347) 903-9750
>=20
>

--Lyw5KqN27RiCjsE2jL1v
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 22, 2020 at 03:33 PM, Andre McCurdy wrote:<br />
<blockquote>On Fri, May 22, 2020 at 2:29 PM Otavio Salvador<br />&lt;otavi=
o.salvador@ossystems.com.br&gt; wrote:<br />
<blockquote>On Fri, May 22, 2020 at 5:48 PM Tom Hochstein &lt;tom.hochstei=
n@nxp.com&gt; wrote:<br />
<blockquote>The gtest and gmock packages provided by googletest are not ad=
ded to the SDK by default. I assume it is because the googletest main packa=
ge is empty?</blockquote>
</blockquote>
Are you including googletest in the image used to create the SDK or<br />g=
mock and gtest?<br /><br />It looks like gmock and gtest are only mentioned=
 in the googletest<br />recipe as PROVIDES, so they are aliases for build t=
ime dependencies<br />only. For run time dependencies you should use google=
test.</blockquote>
Right, I should have mentioned that. I have a DEPENDS on gtest for a packa=
ge in my image. To fix the SDK, I added an RDEPENDS on googletest from the =
same package.<br /><br />
<blockquote><br />
<blockquote>
<blockquote>I added an RDEPENDS_${PN} from the dependent package to fix it=
. Is there a better solution?</blockquote>
You can change the packages to have their `-dev` to rdepends on<br />`gtes=
t/gmock-dev` for example.<br /><br />--<br />Otavio Salvador O.S. Systems<b=
r /><a href=3D"http://www.ossystems.com.br" target=3D"_blank" rel=3D"noopen=
er">http://www.ossystems.com.br</a> <a href=3D"http://code.ossystems.com.br=
" target=3D"_blank" rel=3D"noopener">http://code.ossystems.com.br</a><br />=
Mobile: +55 (53) 9 9981-7854 Mobile: +1 (347) 903-9750</blockquote>
</blockquote>

--Lyw5KqN27RiCjsE2jL1v--
