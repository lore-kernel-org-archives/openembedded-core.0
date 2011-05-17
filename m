Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QM8nG-0002RA-QV
	for openembedded-core@lists.openembedded.org;
	Tue, 17 May 2011 03:09:50 +0200
Received: by bwz5 with SMTP id 5so108980bwz.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2011 18:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:date:x-google-sender-auth
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=s8lI085uG1op1JYjXKAp8dNzC3S7dZGatyLgONCOqgk=;
	b=DINeUDGSV3i6pc0niSwtChITxHM1Di2qzeFrT8h793+j29038KWOI2XkKgMgkS2lYF
	RdqhKT7P4g3n9pTiEi1RXL3JTTBAs2lSvctzebn8qy0vE/9AnVhklL4/soVEA8Wd1nbS
	aKh7ssgFPAuYamKJAe0c/qlEdXie0UBqfJIms=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	b=QMJ9dSTaaWiNITWaqHW8NH/LobIewDaLNDvVh2yz+FE4HsSaMH72FEXl9YP5uzW2R2
	COsMGjmhcnaV0D15bepxqg7I2Neu28lQ5BrlT/IwK8owve/lcGqCsHY7a5SEBhKrNIyt
	m5P3D4yFxTyCdJoWM7qag4LmSW6rRYLp8N3Wg=
MIME-Version: 1.0
Received: by 10.204.163.130 with SMTP id a2mr46571bky.108.1305594413967; Mon,
	16 May 2011 18:06:53 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.79.70 with HTTP; Mon, 16 May 2011 18:06:53 -0700 (PDT)
Date: Mon, 16 May 2011 22:06:53 -0300
X-Google-Sender-Auth: tE1oSe59ZuusPlYjBuOwpyDENMU
Message-ID: <BANLkTinbwVAWzRGzCW32b=OPnxyUSj5ZYA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: gitpkgv stopped working
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
X-List-Received-Date: Tue, 17 May 2011 01:09:50 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,

I noticed today that gitpkgv is not working for some recipes. I could
reproduce the problem using freerdp recipe today.

It seems GITPKGVTAG is expanded but bitbake doesn't notice it. Does
someone has any idea about the reason behind it?

Cheers,

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


