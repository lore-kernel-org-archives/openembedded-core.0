Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QKrVy-0002ml-Ns
	for openembedded-core@lists.openembedded.org;
	Fri, 13 May 2011 14:30:42 +0200
Received: by wye20 with SMTP id 20so2114798wye.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 May 2011 05:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=ogBJZhTGDvkpSThxEB+49uQBOl9vF/ful5ZlyEE22+Y=;
	b=gwoFtopbmVF5QpLbJs+UfEjrC2K0YTYutgaybSH77xYceKCUvmaRzbXpL0SsZBI++B
	ZkPyTfegiX7rKFe5n8MmrGHYW084aQvFfZF8YI7Sdx9cGBEYrYefOccp7e7IG4e/q0+v
	OdBvVcjFFXKJPSN4Hr9BakcXPw5ihROB8FZU0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=nh/X2LaI9kss9OdN0nDaEn5cKA9DdzmXz5XOXrk7nnXtbPmaTILNE3vy/K+wMXlCS+
	EqIsmM2qmiwSeUvgzXeO7pjL0EcF7KbfOpeuXJcS8oeFy782TdDofbtTNorFfN9MaekM
	TcyvA/8+l3xP1eYQ3kIFWvRwxcAE0JKMbrqg8=
MIME-Version: 1.0
Received: by 10.216.78.212 with SMTP id g62mr1390781wee.22.1305289673873; Fri,
	13 May 2011 05:27:53 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.216.93.195 with HTTP; Fri, 13 May 2011 05:27:53 -0700 (PDT)
In-Reply-To: <4DCD2355.4020902@emcraft.com>
References: <1305157370-3264-1-git-send-email-yanok@emcraft.com>
	<201105131117.29367.paul.eggleton@linux.intel.com>
	<A8547C1F-B908-46D2-B77D-9CEEB73E8BCD@dominion.thruhere.net>
	<BANLkTikM6CULces4sHCYVcxnaZSczSsmCA@mail.gmail.com>
	<4DCD2355.4020902@emcraft.com>
Date: Fri, 13 May 2011 09:27:53 -0300
X-Google-Sender-Auth: _xsMSpzQ4aGWmhySy-qnkHPiuDE
Message-ID: <BANLkTimDvoiH0BKQXO=wP69181FrtNKLJA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Ilya Yanok <yanok@emcraft.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	"poky@yoctoproject.org" <poky@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Fri, 13 May 2011 12:30:42 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, May 13, 2011 at 09:25, Ilya Yanok <yanok@emcraft.com> wrote:
> To use qt4-native for what? We are talking about _target_ version of
> qmake which is currently not provided by any package...

Oh ok; I missed this.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


