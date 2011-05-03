Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QHGI3-0004dN-Ph
	for openembedded-core@lists.openembedded.org;
	Tue, 03 May 2011 16:09:29 +0200
Received: by wye20 with SMTP id 20so99756wye.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 May 2011 07:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:date:x-google-sender-auth
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=f69ke0Q7wU6CzE7FcV7u+2A7QfQdYQbW6GZjAC6ckv4=;
	b=pqJTQkqqUke8iOY8XgJoVtPw46xxC+h4H9C1fvHPZPOR3VtStx7tzbZ5pRz3zMU2dA
	WcAAZC7MPPGK/R26Mc6qOt6KpjA+xfMSN2YAe3FHR/gv1ScRY5d58X8hiaUzH1UO4hzt
	DpRxhvle1yp5R6amo1c13q45ZNbfQGWiv+1PE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	b=aHYEnu8guIii/UDGLwef+lAEH7RAztBoU+sVHmbmIrsFAdWgl57PV3fuGR6LLlBkSG
	IcVwO9uyjk9kklGPcJ2jFl9yrjui0xT1usNPoh3WQkKu7jtGDma+EGMpmPSi+LXAvZor
	N/L1XlGKKr5TYoigLbBJjuMqKMqeBfTeikx7s=
MIME-Version: 1.0
Received: by 10.216.121.200 with SMTP id r50mr3765019weh.7.1304431604856; Tue,
	03 May 2011 07:06:44 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.216.93.195 with HTTP; Tue, 3 May 2011 07:06:44 -0700 (PDT)
Date: Tue, 3 May 2011 11:06:44 -0300
X-Google-Sender-Auth: zzrRDaqUV1FZbNyWCI2O6VqPRAw
Message-ID: <BANLkTinK3Cqk=JxH-TH=xM395JUXN5rfTg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: fuse update
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
X-List-Received-Date: Tue, 03 May 2011 14:09:29 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,

I am migrating some stuff to oe-core and found it has fuse at
meta-demoapps. It seems no recipes depends on fuse in oe-core and thus
I am wondering how is better to deal with its updating as:

 - should it be done in oe-core?
 - should it be moved to meta-oe?

The requirement for me to update it is due it being required by a new
recipe I am adding to meta-oe and then it seems more logical to me to
move fuse to meta-oe but I am curious to hear from others about it.

Cheers,

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


