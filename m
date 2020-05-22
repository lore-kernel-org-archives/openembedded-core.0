Subject: gtest and gmock not added to SDK
To: openembedded-core@lists.openembedded.org
From: "Tom Hochstein" <tom.hochstein@nxp.com>
X-Originating-Location: Austin, Texas, US (63.246.163.70)
X-Originating-Platform: Windows Chrome 81
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 22 May 2020 13:48:44 -0700
Message-ID: <Lixb.1590180524317566740.JvZm@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="OnCO2WotUyv4t1c6N0Uq"

--OnCO2WotUyv4t1c6N0Uq
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The gtest and gmock packages provided by googletest are not added to the SD=
K by default. I assume it is because the googletest main package is empty?

I added an RDEPENDS_${PN} from the dependent package to fix it. Is there a=
 better solution?

Tom

--OnCO2WotUyv4t1c6N0Uq
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The gtest and gmock packages provided by googletest are not added to the SD=
K by default. I assume it is because the googletest main package is empty?<=
br /><br />I added an RDEPENDS_${PN} from the dependent package to fix it. =
Is there a better solution?<br /><br />Tom

--OnCO2WotUyv4t1c6N0Uq--
