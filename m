Subject: Re: Initramfs with OpenSBI for a RISCV SoC
To: openembedded-core@lists.openembedded.org
From: sathishmls@yahoo.com
X-Originating-Location: Chennai, Tamil Nadu, IN (117.248.32.222)
X-Originating-Platform: Linux Firefox 87
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 14 Apr 2021 20:12:29 -0700
References: <CAMKF1spF-OQ6Q5GnK89tD0KhgnerwOcDLyOPDQ_Zmn963hsxUw@mail.gmail.com>
In-Reply-To: <CAMKF1spF-OQ6Q5GnK89tD0KhgnerwOcDLyOPDQ_Zmn963hsxUw@mail.gmail.com>
Message-ID: <4917.1618456349740194827@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="Zk6nYfkumz6MKf0wcbLs"

--Zk6nYfkumz6MKf0wcbLs
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I found the issue.
The issue was that i have added "opensbi" using EXTRA_IMAGEDEPENDS through=
 conf/machine/<machine>.conf file and that has made "opensbi" as dependency=
 for initramfs image also.
This has created the circular dependency.

I added a EXTRA_IMAGEDEPENDS =3D "" to the core-image-minimal-initramfs.bb

This fixed the circular dependency issue.

--Zk6nYfkumz6MKf0wcbLs
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I found the issue.<br />The issue was that i have added "opensbi" using EXT=
RA_IMAGEDEPENDS through conf/machine/&lt;machine&gt;.conf file and that has=
 made "opensbi" as dependency for initramfs image also.<br />This has creat=
ed the circular dependency.<br /><br />I added a EXTRA_IMAGEDEPENDS =3D "" =
to the core-image-minimal-initramfs.bb<br /><br />This fixed the circular d=
ependency issue.

--Zk6nYfkumz6MKf0wcbLs--
