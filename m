Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QKqrq-0001pR-2S
	for openembedded-core@lists.openembedded.org;
	Fri, 13 May 2011 13:49:14 +0200
Received: by wye20 with SMTP id 20so2086945wye.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 May 2011 04:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=rsRKIO+xzXdguIjlOl1Mh7cxIDvmDOaWMDeu7ayTLE8=;
	b=haZzRQSoJ3mwq8KKVsm/NXhOkNEL9ZAlhkxUYWhLlEjwHSZ294497NVYrVhuxPcf3H
	N7054uPV+HV0JX4bfbNqMCRo4hPJ3cpZ/wQ7JMKIN0Ovp9zr33ejmGNIzQS4LSRsrYVf
	67j/xbuB3keXXdpKtWaUImV+Ww16LXiK6yTFw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=iieBUrN6l2VxVYbPlz3uCAPO0PQwU4zLdILGzXTJ2lkSd885qgY+klbzykjc0yRpGo
	IQVUa9vRkjU3boGRjY/sVZz8i78ijfCXEfWCsfrZjvYfAVrZB9fmgj6ltsZM2jBR0ct/
	pEn+LuTYwaIguDVDh0+OhcMUO3Pw3k+ljUvoY=
MIME-Version: 1.0
Received: by 10.216.50.142 with SMTP id z14mr258120web.37.1305287185186; Fri,
	13 May 2011 04:46:25 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.216.93.195 with HTTP; Fri, 13 May 2011 04:46:25 -0700 (PDT)
In-Reply-To: <A8547C1F-B908-46D2-B77D-9CEEB73E8BCD@dominion.thruhere.net>
References: <1305157370-3264-1-git-send-email-yanok@emcraft.com>
	<201105131117.29367.paul.eggleton@linux.intel.com>
	<A8547C1F-B908-46D2-B77D-9CEEB73E8BCD@dominion.thruhere.net>
Date: Fri, 13 May 2011 08:46:25 -0300
X-Google-Sender-Auth: 76wsYLWOsTKXcGmLJp_NeDl9YJI
Message-ID: <BANLkTikM6CULces4sHCYVcxnaZSczSsmCA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	"poky@yoctoproject.org" <poky@yoctoproject.org>,
	Ilya Yanok <yanok@emcraft.com>
Subject: Re: [poky] [RFC][PATCH] qt4: add target qmake to qt4-tools package
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
X-List-Received-Date: Fri, 13 May 2011 11:49:14 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, May 13, 2011 at 08:05, Koen Kooi <koen@dominion.thruhere.net> wrote=
:
> Putting it in qttools would be fine by me

It would be much better to use qt4-native as being done on OE dev currently=
.
--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


