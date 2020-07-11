Subject: cmake is not getting installed
To: openembedded-core@lists.openembedded.org
From: "Pankaj  Vinadrao Joshi" <pankaj.vj@exaleapsemi.com>
X-Originating-Location: Pune, Maharashtra, IN (157.33.134.150)
X-Originating-Platform: Windows Chrome 83
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sat, 11 Jul 2020 03:16:26 -0700
Message-ID: <7ylM.1594462586409601210.8UWi@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="KGYV0vGsByn5FtRgEzXi"

--KGYV0vGsByn5FtRgEzXi
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,
i have built a minimal-image for RPI4 and i want cmake to be present on my=
 image i have added following line for cmake

IMAGE_INSTALL +=3D "libc6-dev virtual-libc-dev cmake"

but on image still i am getting an error like -sh cmake:commang not found

Also now i am facing same issue for ssh as well i have tried to add openss=
h and dropbear

CORE_IMAGE_EXTRA_INSTALL +=3D "bash e2fsprogs mtd-utils-ubifs openssh ssh-=
server-dropbear ssh-server-openssh"

but for this also i am getting error like *ssh command not found*

i have checked /usr/bin but i am not able to find it there why this doesnt=
 got installed though i have added it in local.conf??Kindly suggest

Thanks!

--KGYV0vGsByn5FtRgEzXi
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,<br />i have built a minimal-image for RPI4 and i want cmake to be prese=
nt on my image i have added following line for cmake<br /><br />
<div>IMAGE_INSTALL +=3D "libc6-dev virtual-libc-dev cmake"<br /><br />but =
on image still i am getting an error like -sh cmake:commang not found&nbsp;=
<br /><br />Also now i am facing same issue for ssh as well i have tried to=
 add openssh and dropbear<br /><br />
<div>CORE_IMAGE_EXTRA_INSTALL +=3D "bash e2fsprogs mtd-utils-ubifs openssh=
 ssh-server-dropbear ssh-server-openssh"</div>
<div><br />but for this also i am getting error like<strong> ssh command n=
ot found</strong><br /><br />i have checked /usr/bin but i am not able to f=
ind it there why this doesnt got installed though i have added it in local.=
conf??Kindly suggest</div>
<br />Thanks!</div>
<div>&nbsp;</div>

--KGYV0vGsByn5FtRgEzXi--
