Subject: Re: [PATCH v3 12/20] gstreamer1.0-python: upgrade to version 1.18.0
To: openembedded-core@lists.openembedded.org
From: "Jose Quaresma" <quaresma.jose@gmail.com>
X-Originating-Location: Torres Vedras, Lisbon, PT (89.115.57.176)
X-Originating-Platform: Linux Chrome 86
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 19 Oct 2020 03:29:03 -0700
References: <0cee3989-5bb3-2705-39ce-2a729418cdba@mailbox.org>
In-Reply-To: <0cee3989-5bb3-2705-39ce-2a729418cdba@mailbox.org>
Message-ID: <11807.1603103343461617494@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="GrFLIngLMvMr0BfyAtOr"

--GrFLIngLMvMr0BfyAtOr
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I think you are using the V2 pacth the V3 pacth have this fixed

-DEPENDS =3D "gstreamer1.0 python3-pygobject"
-RDEPENDS_${PN} +=3D "gstreamer1.0 python3-pygobject"
+DEPENDS =3D "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
+RDEPENDS_${PN} +=3D "gstreamer1.0 gstreamer1.0-plugins-base python3-pygob=
ject"

--GrFLIngLMvMr0BfyAtOr
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I think you are using the V2 pacth the V3 pacth have this fixed<br /><br />=
<span style=3D"white-space: pre-wrap;">-DEPENDS =3D "gstreamer1.0 python3-p=
ygobject"</span><br style=3D"white-space: pre-wrap;" /><span style=3D"white=
-space: pre-wrap;">-RDEPENDS_${PN} +=3D "gstreamer1.0 python3-pygobject"</s=
pan><br style=3D"white-space: pre-wrap;" /><span style=3D"white-space: pre-=
wrap;">+DEPENDS =3D "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobje=
ct"</span><br style=3D"white-space: pre-wrap;" /><span style=3D"white-space=
: pre-wrap;">+RDEPENDS_${PN} +=3D "gstreamer1.0 gstreamer1.0-plugins-base p=
ython3-pygobject"<br /></span>

--GrFLIngLMvMr0BfyAtOr--
