Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RGkIb-0005iQ-2p
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Oct 2011 06:32:09 +0200
Received: by bkat8 with SMTP id t8so3247503bka.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Oct 2011 21:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=Mcv8/qig6adoD2HIgt7qNQ6+x9ldH9KP6ULqkbohkDY=;
	b=b3TRfyNf3Iq1uSg6IjDaj7URIxnwdtLjQsthlARviC4W3HiASDK2yGM91SSUFxP7pw
	RnhTCzP54fKv5P2yLJaFzt9whUx3fXkU1+0IsWOYhDB40meUN5aW22QmNVcd2tMFeONo
	FXBjIvGBWX6h0rul4RHd7B5lqmDGJ4OwGPl44=
MIME-Version: 1.0
Received: by 10.204.156.1 with SMTP id u1mr6774616bkw.18.1319084775698; Wed,
	19 Oct 2011 21:26:15 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.205.114.204 with HTTP; Wed, 19 Oct 2011 21:26:15 -0700 (PDT)
Date: Thu, 20 Oct 2011 02:26:15 -0200
X-Google-Sender-Auth: 59IK4S6mlpifQDINpo6eUQlIVh8
Message-ID: <CAP9ODKp+c9sXx6A7Bw9VnRXOKgNP_3q2uJmJEpvBwWT=dgXdBQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: useradd class not working
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
X-List-Received-Date: Thu, 20 Oct 2011 04:32:09 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,

I am using useradd in a recipe and it needs to add a group in the
rootfs at build time. This doesn't work.

it seems groupadd does nothing.

Has someone used or tried it?

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


