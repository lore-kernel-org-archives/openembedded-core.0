Subject: git do_unpack
To: openembedded-core@lists.openembedded.org
From: "John Klug" <john.klug@multitech.com>
X-Originating-Location: Saint Paul, Minnesota, US (68.47.37.93)
X-Originating-Platform: Linux Chrome 83
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sun, 28 Jun 2020 10:27:16 -0700
Message-ID: <e5Dw.1593365236614554114.mV8j@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="QJgpCXvK1sZjkPWyvnVI"

--QJgpCXvK1sZjkPWyvnVI
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Recently it has come to my attention that in morty, and maybe later, do_unp=
ack for git does not use the downloads directory, and attempts to contact t=
he git server.

This is unfortunate, as we often do bitbake -c fetchall and give tarballs =
of our workspace to customers, thinking it would save something, but it app=
ears the savings are limited, and now I have a customer complaint about thi=
s, since I have one recipe that uses a private repository.

What is the logic of not using the downloads directory for the source of t=
he unpack?

I recently fixed a recipe by writing an unpack that does not use networkin=
g and does a clone of the downloads directory to get around this.=C2=A0 Why=
 is this not done by openembedded-core?

Thanks.

--QJgpCXvK1sZjkPWyvnVI
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Recently it has come to my attention that in morty, and maybe later, do_unp=
ack for git does not use the downloads directory, and attempts to contact t=
he git server.<br /><br />This is unfortunate, as we often do bitbake -c fe=
tchall and give tarballs of our workspace to customers, thinking it would s=
ave something, but it appears the savings are limited, and now I have a cus=
tomer complaint about this, since I have one recipe that uses a private rep=
ository.<br /><br />What is the logic of not using the downloads directory =
for the source of the unpack?<br /><br />I recently fixed a recipe by writi=
ng an unpack that does not use networking and does a clone of the downloads=
 directory to get around this.&nbsp; Why is this not done by openembedded-c=
ore?<br /><br />Thanks.<br />

--QJgpCXvK1sZjkPWyvnVI--
