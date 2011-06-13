Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jay@jay-tech.ru>) id 1QWFZx-0002lQ-SZ
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Jun 2011 00:25:53 +0200
Received: by bwz5 with SMTP id 5so4867084bwz.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jun 2011 15:22:29 -0700 (PDT)
Received: by 10.204.80.74 with SMTP id s10mr4904264bkk.4.1308003749291; Mon,
	13 Jun 2011 15:22:29 -0700 (PDT)
MIME-Version: 1.0
Sender: jay@jay-tech.ru
Received: by 10.204.54.80 with HTTP; Mon, 13 Jun 2011 15:22:09 -0700 (PDT)
X-Originating-IP: [93.81.3.157]
In-Reply-To: <1307985976-22648-1-git-send-email-anders@chargestorm.se>
References: <1307985976-22648-1-git-send-email-anders@chargestorm.se>
From: Yury Bushmelev <jay4mail@gmail.com>
Date: Tue, 14 Jun 2011 02:22:09 +0400
X-Google-Sender-Auth: jMhB24xzwNl6Vkh2h6Yy6kZY_L8
Message-ID: <BANLkTimkU94WYhGGac5P88GMUA6mk7NCKg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] runqemu: take TMPDIR from bitbake
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
X-List-Received-Date: Mon, 13 Jun 2011 22:25:54 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2011/6/13 Anders Darander <anders@chargestorm.se>:
> + =A0 =A0 =A0 =A0# We have bitbake in PATH, get TMPDIR from bitbake
> + =A0 =A0 =A0 =A0TMPDIR=3D`bitbake -e | grep TMPDIR=3D\" | cut -d '=3D' -=
f2 | cut -d '"' -f2`

This change inspired me just another crazy idea.
Getting some variable from bitbake is frequently used task. May be our
bitbake people will add some special mode to bitbake for this? E.b.
like bsd make have (make -V KERNCONF)[1].

I would suggest syntax like 'bitbake -V TMPDIR'

[1] http://www.freebsd.org/cgi/man.cgi?query=3Dmake&manpath=3DFreeBSD+8.2-R=
ELEASE

--=20
Yury Bushmelev


