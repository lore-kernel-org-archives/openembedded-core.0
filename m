Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QY21p-00027x-CR
	for openembedded-core@lists.openembedded.org;
	Sat, 18 Jun 2011 22:22:01 +0200
Received: by bwz5 with SMTP id 5so669000bwz.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jun 2011 13:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:date:x-google-sender-auth
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=eyDYjhNei3YJFyF5aDGaBc2VtvIrgnkhNxCdOfFpymE=;
	b=TiBjnBoWq+zaMCzMrCQn992bQi5jakYVi6UV51M8AnlrcICgZWxZKs5xXyqb3FWxI4
	+/EJXUd/62e9MOX9ixuAXCR4JqKNpbaERSnGaacuQLfgUCQacLH/vMcMeoKucUytYmaR
	8E32B+8HEciVdEuwbhe4/P8uMd7Wz5EoGptSg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	b=GDSZtUWZZTEBVWqvJL8oZwTocCJMrBE8j4Azr0ezawaM916MwRaMY1gHn41TmqOngG
	rBCLE6ExsM9JJm/w+VxKwva10iRhyi1LSEMFG5+mkskDHbqbiJImKxcjirmXFGug+/Sy
	oEMb2sfa/zq82LJmutIHk98g4Pnq6OylkN03M=
MIME-Version: 1.0
Received: by 10.204.85.79 with SMTP id n15mr2757102bkl.38.1308428311138; Sat,
	18 Jun 2011 13:18:31 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.120.74 with HTTP; Sat, 18 Jun 2011 13:18:31 -0700 (PDT)
Date: Sat, 18 Jun 2011 20:18:31 +0000
X-Google-Sender-Auth: CpOyfOiGsm1tRR35qXI_VhxPxTg
Message-ID: <BANLkTin20ZXvBnT9phab1KZcZ1iCkO8RaQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: BUG: intltool depends on libxml-parser-perl to be installed on host
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
X-List-Received-Date: Sat, 18 Jun 2011 20:22:01 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,

It seems that intltool depends on libxml-parser-perl being installed
into host system to it to build.

Cheers,

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


