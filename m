Received: from mail-vb0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1SUlT4-0003ZY-Ge
	for openembedded-core@lists.openembedded.org;
	Wed, 16 May 2012 23:09:10 +0200
Received: by vbbfr13 with SMTP id fr13so1195554vbb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 May 2012 13:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=BtAsxQN840rHX60Rzr+GBTE3VWIvWs6fTzhtCb1NPMc=;
	b=urZHwoctH2xtXyOXqdCdPruSBBBEONzS6+W+wuFtxdKRXGJ1gzpH5tqTbKN7JakYq6
	IWdhpKLZLMFY4q0J243FdEKooZfNjctMok8a4mrqj7d48gbHJYgFTlJhHRHWqycFiE11
	SCU48nzH7jyY71WME4uJ1oH47JPBNrJVigzFBiJFkWMzLMXcbR7n4Dj3/PV2VYkpYlFo
	c80HtbYrdbLpdvmpkAbvmFyva3xxEKO3V6BGtoiDBAa63/o7Uj82+zViQUDSaNd2ZwZt
	GDJPCZWKiGxw4CGhfC9mQanKm+PqnN/ray0HWHEQP0V/AbaQkBmqkeh2fZNFWgbY/d4s
	Gw4Q==
MIME-Version: 1.0
Received: by 10.52.34.73 with SMTP id x9mr2938419vdi.27.1337201948354; Wed, 16
	May 2012 13:59:08 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.220.152.82 with HTTP; Wed, 16 May 2012 13:59:08 -0700 (PDT)
In-Reply-To: <A0753188-2AE3-44F8-A33B-07C97112D8A4@dominion.thruhere.net>
References: <1337197900-23107-1-git-send-email-daiane.angolini@freescale.com>
	<A0753188-2AE3-44F8-A33B-07C97112D8A4@dominion.thruhere.net>
Date: Wed, 16 May 2012 17:59:08 -0300
X-Google-Sender-Auth: KeGjKUSUkV7hTgATVN7AK3HOaZc
Message-ID: <CAP9ODKoavGcE6mtQsbn---sE3_Z7ow9oFSAxKGxwRGmBHe5D5w@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Daiane Angolini <daiane.angolini@freescale.com>
Subject: Re: [PATCH] evtest: Add evtest 1.30 support
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
X-List-Received-Date: Wed, 16 May 2012 21:09:10 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, May 16, 2012 at 5:55 PM, Koen Kooi <koen@dominion.thruhere.net> wro=
te:
> Op 16 mei 2012 om 21:51 heeft Daiane Angolini <daiane.angolini@freescale.=
com> het volgende geschreven:
>> Port recipe from Meta-OE at 4bf0e7e02544e9ffa54aa0ead966c411d7dbd0be
>> and update to version 1.30 using FreeDesktop GIT as source.
>
> Why bloat oe-core? Nothing is using it oe-core

Have it in oe-core allow for inclusion of it with other test utilities
and easier to use for Yocto people. Why do you object in have it
there?

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


