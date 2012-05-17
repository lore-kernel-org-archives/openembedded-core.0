Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SV5yY-0006mY-28
	for openembedded-core@lists.openembedded.org;
	Thu, 17 May 2012 21:03:02 +0200
Received: by eaal1 with SMTP id l1so590322eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 May 2012 11:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=WAFHviFUEn8T6EAWaJA0NY3tzPYaN9wEoPmMiSWaXao=;
	b=jUeK/QwPbqb0BaD6bWYv0v/mtjTk18fe8DHVGqVmno//OuTtVvIqE10fHlyW+pgeZV
	gNvKpmsLKP073SKF7WaX5a1ICZ7mGQ+zKpoFAnDSbALA4cBvEGu/3euJ8OFWm5uGzF1q
	Op0lFo5itqbrePRC7+duUj40wyPcQ2RoC4OqzQqOwXGdOlV/uBCUiyrqpioTQ2oGHGln
	CPhrAdm0scWyoCpIAPYNH/ceDmwFiFuPrJ1RfIAonkRrYfQyqcmumisw6Xq+/bs9jbXT
	PL7guSsKcNQHmzSGyh91F4lSbvRY5W5sprJ+LmvjIV4E9E/5Ymngb7RrO3F9hZ20iTr6
	IBcQ==
Received: by 10.213.110.20 with SMTP id l20mr915335ebp.117.1337280779299; Thu,
	17 May 2012 11:52:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.132 with HTTP; Thu, 17 May 2012 11:52:29 -0700 (PDT)
In-Reply-To: <4FB54847.5020102@windriver.com>
References: <cover.1337278931.git.mark.hatle@windriver.com>
	<6152dc105c0eecec81a65b329a3a5a0820eeed26.1337278931.git.mark.hatle@windriver.com>
	<CAMKF1sofgso3eS-AuwFMHh+DBhqgThi6PVDvepeyyaqQW_r7JA@mail.gmail.com>
	<4FB54847.5020102@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 17 May 2012 11:52:29 -0700
Message-ID: <CAMKF1srxfiTgKUKxpZCcQo-SZQtomOHTouUkV3CNWuYdVtWKdg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] rpm: Upgrade RPM to 5.4.8 (db to 5.3.15)
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
X-List-Received-Date: Thu, 17 May 2012 19:03:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, May 17, 2012 at 11:49 AM, Mark Hatle <mark.hatle@windriver.com> wro=
te:
>
> One thing I did forget to note in this message. =C2=A0If you are NOT usin=
g
> OEBasicHash,

since this is not default in OE-Core may be forces PR bumps for the affecte=
d
recipes along with this series would make sense.


