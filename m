Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QREAG-00040d-Hg
	for openembedded-core@lists.openembedded.org;
	Tue, 31 May 2011 03:54:36 +0200
Received: by bwz5 with SMTP id 5so3728091bwz.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 May 2011 18:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:date:x-google-sender-auth
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=ySEBMcbf7Sw+2Ntz18xs7jTYBz8Y3+JNVk6ayHU/B7c=;
	b=AH08AUh1cqMCpjtSkdBPIM2UIlLahQi7hem3FXkZWJ7aHD+XCbSCbpcwCpAvfggtWe
	5Zg7J0j5+krKJ4LrkYgtqSVPWaoAqtQ/QlMset7qce2Ka8KZbvAqdZmIsIQZwZQfGG2B
	9EkeivlKrspMC46y2yM9bMh15OGqmCfhUfupE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	b=CfpxfA3P8FX++4+hLpEWb1krHQS45b8g3oGf62lcSB/YhMbDYD2ceaAlVLt4WDvNmI
	N7oydNi+2dEvhnv4Hx8umfPo8XIXkp8hnLDsryj3ZEQ5gE+6aFRdWD+J4OHrore+NMqw
	kdt+KtYYVRA1Ot/P2Gh0x8mktPVYTG6WY8lY4=
MIME-Version: 1.0
Received: by 10.204.47.103 with SMTP id m39mr4753434bkf.4.1306806683692; Mon,
	30 May 2011 18:51:23 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.78.203 with HTTP; Mon, 30 May 2011 18:51:23 -0700 (PDT)
Date: Tue, 31 May 2011 01:51:23 +0000
X-Google-Sender-Auth: Yhp45yuaILtTnhj-eCwLDzMLhP8
Message-ID: <BANLkTi=MccvuwcbiMPDPmAw+ac15LHJQZg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Chicken toolchain progress
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
X-List-Received-Date: Tue, 31 May 2011 01:54:36 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,

Here at O.S. Systems we use Chicken (Scheme) a lot and we deliver it
on our embedded OS ofthenly. Since we're moving to oe-core we're
working at migrating it to it and we then decided to include it as a
meta-oe layer for later proposal for merging.

Currently we got most of it done but the cross compiler is failing.

Our recipe can be seen at
https://github.com/OSSystems/meta-oe/commit/3d29a0ca35e29cc9629a7628dfe1973=
4bc28b229#diff-0

It seems to build fine but sstate and sysroot lacks the binaries so we
can't use it to build the target binaries.

Any clue?

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


