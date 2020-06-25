Subject: Distro name
To: openembedded-core@lists.openembedded.org
From: "Pankaj  Vinadrao Joshi" <pankaj.vj@exaleapsemi.com>
X-Originating-Location: Pune, Maharashtra, IN (49.35.113.156)
X-Originating-Platform: Windows Chrome 83
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 25 Jun 2020 03:52:05 -0700
Message-ID: <QkZO.1593082325223977941.NSzh@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="n24P0OUfJF3ELQuKnAe4"

--n24P0OUfJF3ELQuKnAe4
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,
i have built image for=C2=A0raspberrypi4-64 using openembedded-core and i =
am trying to run some test specific to lkp but i am getting issue with the =
distro
which is=C2=A0nodistro.0 but the test needs distro for it

i am attaching the output of=C2=A0 os-realease
*ID=3Dnodistro*
*NAME=3D"OpenEmbedded"*
*VERSION=3D"nodistro.0"*
*VERSION_ID=3Dnodistro.0*
*PRETTY_NAME=3D"OpenEmbedded nodistro.0"

* i am getting following error with respect to lkp

ERROR: "Not a supported system, cannot install packages."

detect_system distro=3D$_system_name_lowercase
DISTRO=3D$distro export DISTRO
[ -x $LKP_SRC/distro/installer/$distro ] || { =C2=A0=C2=A0 =C2=A0echo "Not=
 a supported system, cannot install packages." =C2=A0=C2=A0 =C2=A0exit 1 }

can somebody help me how i can add distro for raspberrypi??

--n24P0OUfJF3ELQuKnAe4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,<br />i have built image for&nbsp;raspberrypi4-64 using openembedded-cor=
e and i am trying to run some test specific to lkp but i am getting issue w=
ith the distro<br />which is&nbsp;nodistro.0 but the test needs distro for =
it<br /><br />i am attaching the output of&nbsp; os-realease&nbsp;<br />
<div><strong>ID=3Dnodistro</strong></div>
<div><strong>NAME=3D"OpenEmbedded"</strong></div>
<div><strong>VERSION=3D"nodistro.0"</strong></div>
<div><strong>VERSION_ID=3Dnodistro.0</strong></div>
<div><strong>PRETTY_NAME=3D"OpenEmbedded nodistro.0"<br /><br /></strong>i=
 am getting following error with respect to lkp<br />
<div>
<div style=3D"font-family: 'Segoe UI', system-ui, 'Apple Color Emoji', 'Se=
goe UI Emoji', sans-serif;"><br />
<div>
<div>ERROR: "Not a supported system, cannot install packages."</div>
</div>
</div>
<div>&nbsp;</div>
<div style=3D"font-family: 'Segoe UI', system-ui, 'Apple Color Emoji', 'Se=
goe UI Emoji', sans-serif;">
<div>
<div>
<div>
<div>detect_system distro=3D$_system_name_lowercase</div>
<div>
<div>
<div>DISTRO=3D$distro export DISTRO</div>
<div>
<div>
<div>[ -x $LKP_SRC/distro/installer/$distro ] || { &nbsp;&nbsp; &nbsp;echo=
 "Not a supported system, cannot install packages." &nbsp;&nbsp; &nbsp;exit=
 1 }</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
<br /><br />can somebody help me how i can add distro for raspberrypi??</d=
iv>
<div>&nbsp;</div>

--n24P0OUfJF3ELQuKnAe4--
