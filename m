Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QbZls-0000gT-7n
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Jun 2011 17:00:12 +0200
Received: by bwf20 with SMTP id 20so305473bwf.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jun 2011 07:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=DAJDA66yy4+dtrrIjEg9AvXH2AbI5bst+dvPwzPEZ10=;
	b=iw4WVq/Rbzewu3mQ5w/uPwnQPX7Rq3Sdi2eXHLBL5p6m/urZPT2vn9UCFqJl03hN73
	XyPIOJms0SFUP2RFCPoqJOFTxJOwG2VsVrZ6+paoPCRQFHt78qXumnce6Yuf0eV3QA3c
	UlamlGKrPAqRAABXDsINNulS65axLB6uz5Mw0=
MIME-Version: 1.0
Received: by 10.204.38.136 with SMTP id b8mr5742248bke.146.1309272986860; Tue,
	28 Jun 2011 07:56:26 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.73.70 with HTTP; Tue, 28 Jun 2011 07:56:26 -0700 (PDT)
Date: Tue, 28 Jun 2011 11:56:26 -0300
X-Google-Sender-Auth: _buXJryl-q8sJoKOrFDNM4T_rSc
Message-ID: <BANLkTi=GQS+Rwv+srtcctpD3jDwu7RWv2Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: [RFH] Native SDK wirdness
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
X-List-Received-Date: Tue, 28 Jun 2011 15:00:12 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,

I am probably doing something stupid but I couldn't figure it myself
so I am looking for some help here. Basically I need to prepare a SDK
for usage by our team mates to develop to our embedded OS. In theory I
got most of it already done but when I build the meta-toolchain recipe
the built sdk tarball lacks GCC and like.

Any idea where I ought to look for a good example? Or any clue what I
am doing wrong?

Best,

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


