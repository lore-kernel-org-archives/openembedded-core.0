Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QdVE9-0003za-CS
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Jul 2011 00:33:21 +0200
Received: by bwf20 with SMTP id 20so4260803bwf.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 03 Jul 2011 15:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=S2d6Bk/AA/V5odRjxgAasI0fGsBYx64OpwR7lSeMXr0=;
	b=KVSwMxlLKaGnA3JVfIa3mGdDZq6nydoLfJOSuTXNw6o8rv7XciMFtJJR/9K+tE1EgA
	6nsjWGOc97U1CXlTMwbRLge87ydw7hxrvGFgFsiAstSw3KSPBTOJtUyPUeiL3+p9N25B
	0c63/PHe1U+xlGJFU7BY9OsEIod97WgKm05ko=
MIME-Version: 1.0
Received: by 10.204.20.79 with SMTP id e15mr5070894bkb.147.1309732172906; Sun,
	03 Jul 2011 15:29:32 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.177.140 with HTTP; Sun, 3 Jul 2011 15:29:32 -0700 (PDT)
Date: Sun, 3 Jul 2011 19:29:32 -0300
X-Google-Sender-Auth: l8AkSJ3QwdxPRvQ_VKOsT44t_Xk
Message-ID: <CAP9ODKpeG=a71mZNRTRzt=Ehjy3iEBhBa0dPCA71vKnA-Cz30A@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: [RFH] Wrong behaviour regarding SDK native and target paths
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 03 Jul 2011 22:33:21 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,

I am looking for help to get our nativesdk working fine and I am quite
confused how does it can work after all.

I have looked at meta/recipes-qt/meta/meta-toolchain-qte.bb and it has:

QT_TOOLS_PREFIX =3D "${SDKPATHNATIVE}${bindir_nativesdk}"

Running it is expanded to:

QT_TOOLS_PREFIX=3D"/usr/local/oecore-i686-i586/sysroots/i686-oesdk-linux/us=
r/bin"

It seems right but in fact it is wrong since Qt binaries are installed into=
:

(devel)~/hacking/el% tar tjf
tmp-eglibc-eglibc/deploy/sdk/oecore-i686-i586-toolchain-devel.tar.bz2|
grep 'bin/moc4'
./usr/local/oecore-i686-i686/sysroots/i686-oesdk-linux/usr/bin/moc4

so, the generated information for the script won't work.

I am quite confused by all this is suppose to work. Someone help me?

Cheers,

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


