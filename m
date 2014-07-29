Return-Path: <kirgene@gmail.com>
Received: from mail-qg0-f41.google.com (mail-qg0-f41.google.com
	[209.85.192.41])
	by mail.openembedded.org (Postfix) with ESMTP id 79E19708D7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jul 2014 06:55:19 +0000 (UTC)
Received: by mail-qg0-f41.google.com with SMTP id q107so9935706qgd.28
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jul 2014 23:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=7FjVBCqQPVRLrDYrBJ1kuPHAxzwrKSdpNftv6BeCsOA=;
	b=uK2SId6lEMHzt5WnQu2N907xG3DnyvSOQSU3fz2St2g0h7GJNghBUZSotH8D0ykzmx
	Xe8ksMYTtGm1cbgBAqHc8p8hraa7h3JlegcZUAnSFngajxwH9Z3pzw9hiP3/Z/e2cuYU
	bTkuQMAuN88LkESAISXa3KpQwz5pbHhAwG3cKyrCcrsywKR8CKGB5JOyYzqOn1evNHzK
	tSPCIOLvolvlnRJirf6pAXF3Pp060WlG9tRWhUPJy7xDZvTf47PEBRt66PelrzVxL3nR
	1Ud5Q3MtW3ML7sD4wpgykNeeqOm5KuAQcQirjo8vGog7gGR2BtEiJUv0TiBwE0bZhksc
	w4jw==
MIME-Version: 1.0
X-Received: by 10.224.156.145 with SMTP id x17mr30666qaw.49.1406616920153;
	Mon, 28 Jul 2014 23:55:20 -0700 (PDT)
Received: by 10.140.50.198 with HTTP; Mon, 28 Jul 2014 23:55:20 -0700 (PDT)
Date: Tue, 29 Jul 2014 09:55:20 +0300
Message-ID: <CADV-EXGEW1dQb1x6+20myn3X4JfUjPRfkBj2hon8kuX35ap91g@mail.gmail.com>
From: Yevhen Kyriukha <kirgene@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Specifying MACHINE inside distro config only
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 29 Jul 2014 06:55:28 -0000
Content-Type: multipart/alternative; boundary=089e0158c74edc889404ff4f859f

--089e0158c74edc889404ff4f859f
Content-Type: text/plain; charset=ISO-8859-1

I have several distro config files. I bind each of them to single machine
like this:

# cat conf/distro/mydistro.conf

DISTRO = "mydistro"
DISTRO_NAME = "My Distro"
DISTRO_VERSION = "1.01"
MACHINE = "cedartrail"
...

I also created "conf/auto.conf" file with following content:
DISTRO = "mydistro"
to specify distro to build.

The problem is that without specifying MACHINE in "conf/auto.conf" I get
following error:

ERROR:  OE-core's config sanity checker detected a potential
misconfiguration.
    Either fix the cause of this error or at your own risk disable the
checker (see sanity.conf).
    Following is the list of potential problems / advisories:

    TUNE_ARCH is unset. Please ensure your MACHINE configuration includes a
valid tune configuration file which will set this correctly.
Error, the PACKAGE_ARCHS variable does not contain TUNE_PKGARCH
().Toolchain tunings invalid:
No tuning found for default multilib.


I use a script to change distro (in "auto.conf") and each distro knows its
machine to build for. So specifying MACHINE in "auto.conf" isn't desirable.

Can someone tell what did I miss?

-- 
Best regards,
Yevhen

--089e0158c74edc889404ff4f859f
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>I have several distro config files. I bind each =
of them to single machine like this:<br><br></div><div># cat conf/distro/my=
distro.conf<br><br></div><div>DISTRO =3D &quot;mydistro&quot;<br>DISTRO_NAM=
E =3D &quot;My Distro&quot;<br>
DISTRO_VERSION =3D &quot;1.01&quot;<br>MACHINE =3D &quot;cedartrail&quot;<b=
r>...<br><br></div>I also created &quot;conf/auto.conf&quot; file with foll=
owing content:<br>DISTRO =3D &quot;mydistro&quot;<br></div><div></div>to sp=
ecify distro to build.<br clear=3D"all">
<div><div><div><br></div><div>The problem is that without specifying MACHIN=
E in &quot;conf/auto.conf&quot; I get following error:<br><br>ERROR:=A0 OE-=
core&#39;s config sanity checker detected a potential misconfiguration.<br>
=A0=A0=A0 Either fix the cause of this error or at your own risk disable th=
e checker (see sanity.conf).<br>=A0=A0=A0 Following is the list of potentia=
l problems / advisories:<br><br>=A0=A0=A0 TUNE_ARCH is unset. Please ensure=
 your MACHINE configuration includes a valid tune configuration file which =
will set this correctly.<br>
Error, the PACKAGE_ARCHS variable does not contain TUNE_PKGARCH ().Toolchai=
n tunings invalid:<br>No tuning found for default multilib.<br></div><div><=
br><br></div><div>I use a script to change distro (in &quot;auto.conf&quot;=
) and each distro knows its machine to build for. So specifying MACHINE in =
&quot;auto.conf&quot; isn&#39;t desirable.<br>
<br></div><div>Can someone tell what did I miss?<br></div><br><div>-- <br>B=
est regards,<br>Yevhen
</div></div></div></div>

--089e0158c74edc889404ff4f859f--
