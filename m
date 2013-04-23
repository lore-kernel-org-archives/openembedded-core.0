Received: from stoexhub03.domain01.net ([83.145.59.144])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1UUX7j-0003jC-Mb
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Apr 2013 08:54:44 +0200
Received: from 2.67.243.187.mobile.tre.se (2.67.243.187) by
	stoexhub03.domain01.net (10.12.10.3) with Microsoft SMTP Server (TLS)
	id 8.3.279.1; Tue, 23 Apr 2013 08:37:01 +0200
User-Agent: K-9 Mail for Android
In-Reply-To: <1366665407-32136-1-git-send-email-kirgene@gmail.com>
References: <1366665407-32136-1-git-send-email-kirgene@gmail.com>
MIME-Version: 1.0
From: Anders Darander <anders@chargestorm.se>
Date: Tue, 23 Apr 2013 08:36:54 +0200
To: Yevhen Kyriukha <kirgene@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Message-ID: <c1ba3096-22f4-40be-8db8-c9ed3694da5b@email.android.com>
X-GFI-SMTP-Submission: 1
Subject: Re: [PATCH v3] systemd: added python-systemd package	generation.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 23 Apr 2013 06:54:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable



Yevhen Kyriukha <kirgene@gmail.com> wrote:

>---
> meta/recipes-core/systemd/systemd_199.bb |   19 +++++++++++++++----
> 1 file changed, 15 insertions(+), 4 deletions(-)
>
>diff --git a/meta/recipes-core/systemd/systemd_199.bb
>b/meta/recipes-core/systemd/systemd_199.bb
>index 5240443..9a68960 100644
>--- a/meta/recipes-core/systemd/systemd_199.bb
>+++ b/meta/recipes-core/systemd/systemd_199.bb
>@@ -11,12 +11,18 @@ PROVIDES =3D "udev"
> PE =3D "1"
> PR =3D "r2"
>=20
>-DEPENDS =3D "kmod docbook-sgml-dtd-4.1-native intltool-native
>gperf-native acl readline dbus libcap libcgroup tcp-wrappers glib-2.0"
>+DEPENDS =3D "kmod docbook-sgml-dtd-4.1-native intltool-native
>gperf-native acl readline dbus libcap libcgroup tcp-wrappers glib-2.0
>python"

Would out be possible to change this patch to use PACKAGECONFIG instead? Ot=
herwise we're going to always drag in Python, which will increase build tim=
es for systems that are not already building / using Python in the image.=20

I think that I've discussed this at some earlier point when a similar chang=
ed was proposed, though I don't remember there were some problems with that=
 approach.=20

Cheers,=20
Anders=20
--=20
ChargeStorm AB / eStorm AB


