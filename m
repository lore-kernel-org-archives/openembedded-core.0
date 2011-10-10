Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RDLre-0001EZ-0q
	for openembedded-core@lists.openembedded.org;
	Mon, 10 Oct 2011 21:50:18 +0200
Received: by bke11 with SMTP id 11so8922216bke.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Oct 2011 12:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=RGuwkYMe2LsqQ4KnizEV16cM/XbxJOoM2hUuHjeFZLw=;
	b=NjUyjuHQuzmCsMDNU/lx5haYDQelZBfCgAkVkRjoDk7pTCY0DI+R5gQo+CoxkpZHWP
	W7J8shN9oZX3xyagRRO+9BnZvJkd9sgYyQpzn1rsnQ64Vz7Y7qXsS7FdEIrvOz/aKdVK
	y4+SpUMPCIIfbeKi9YuP0r6xXricQKRoeZ/dA=
MIME-Version: 1.0
Received: by 10.204.148.84 with SMTP id o20mr7091498bkv.33.1318275875554; Mon,
	10 Oct 2011 12:44:35 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.138.72 with HTTP; Mon, 10 Oct 2011 12:44:35 -0700 (PDT)
Date: Mon, 10 Oct 2011 16:44:35 -0300
X-Google-Sender-Auth: MqhY4SyhdhmIHJPMbByTIe8abPU
Message-ID: <CAP9ODKqsZJmiU3Roi7grZPe5Oi6SmEdYdQF2GSuqMRRg9Rj8qg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Use of mingetty
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
X-List-Received-Date: Mon, 10 Oct 2011 19:50:18 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,

I've trying to build a minimal image here and found that it fails with
getty being not available.

I want to know how this is suppose to work since the only way I got it
more or less working is doing:

...
ROOTFS_POSTPROCESS_COMMAND +=3D "(cd ${IMAGE_ROOTFS}/sbin ; ln -s
mingetty getty); "
...

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


