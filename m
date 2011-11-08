Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RNm2w-0004JP-N8
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Nov 2011 14:49:02 +0100
Received: by bkbzs2 with SMTP id zs2so372701bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Nov 2011 05:42:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=xeu3UxVeKOEQ0gQbZgpw3JMa1676Tn1iDU2SDk0p9hI=;
	b=vTDe8a0rudLb5vrgLuPLOLgDNPKlwdy+St54jOyaz0E/iIfjshjl7IC6Qra2bfMcrV
	2CiYVKpjPtDhvPda4c6CUUKN64g58CSFv++RxtIT560wEFw9KtJOy+IRZL8g7a0ZdSUt
	S0YeC21buk6TNGIr35QF5DryQH+RpVSYVVFN0=
MIME-Version: 1.0
Received: by 10.205.128.138 with SMTP id he10mr6511117bkc.13.1320759768547;
	Tue, 08 Nov 2011 05:42:48 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.48.208 with HTTP; Tue, 8 Nov 2011 05:42:48 -0800 (PST)
In-Reply-To: <1320758932-4181-1-git-send-email-dima_ch@emcraft.com>
References: <1320758932-4181-1-git-send-email-dima_ch@emcraft.com>
Date: Tue, 8 Nov 2011 11:42:48 -0200
X-Google-Sender-Auth: W2Yg9-HI_3sBFiyjhaLeD6EtAbc
Message-ID: <CAP9ODKofAOYwaa_VsXf35u4EkdpMsXrpmzbjgkNnXOTcJaXhTA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qt-mobility: qa_configure stage failed
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
X-List-Received-Date: Tue, 08 Nov 2011 13:49:02 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 8, 2011 at 11:28, Dmitry Cherukhin <dima_ch@emcraft.com> wrote:
...
> + =A0 =A0 $QMAKE_EXEC $QMKSPEC "$relpath/config.tests/$2/$2.pro" 2>> "$CO=
NFIG_LOG" >> "$CONFIG_LOG"
> ++ =A0 =A0cp Makefile Makefile.old
> ++ =A0 =A0sed -e 's@-L/usr/lib@@' <Makefile.old >Makefile
...

You can use 'sed -i '

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


