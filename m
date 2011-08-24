Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QwFgr-00089R-L5
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Aug 2011 17:48:29 +0200
Received: by bkbzu17 with SMTP id zu17so1076499bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Aug 2011 08:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=kIWTr0pF0P7uD3Vph5TDhm0iAK7FOtfH+wN2BJZz3KU=;
	b=jNvOw8JYLTgcOWvEohyNsWXwFED860XiN9d2TMEavBZxKnlERVvrGZgbnlNGjdWMk+
	ZZEgXWnissqW9kAYXWsA5SbJJovZJyPFvY0PhOUYEzL2uWQR89PRj0k5NVx96g6JY0m9
	tZq4UsASHbrtJ4lij6JbLaERd9Bn5eTxU7hjw=
MIME-Version: 1.0
Received: by 10.204.149.15 with SMTP id r15mr2212409bkv.279.1314200621638;
	Wed, 24 Aug 2011 08:43:41 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.15.66 with HTTP; Wed, 24 Aug 2011 08:43:41 -0700 (PDT)
In-Reply-To: <9761e1c9c114d22ab7a06ff55bf10b6ccf27a54a.1314172740.git.jingdong.lu@windriver.com>
References: <cover.1314172740.git.jingdong.lu@windriver.com>
	<9761e1c9c114d22ab7a06ff55bf10b6ccf27a54a.1314172740.git.jingdong.lu@windriver.com>
Date: Wed, 24 Aug 2011 12:43:41 -0300
X-Google-Sender-Auth: YcmeUkFERgKdJ4y5nOv7VMVtdp0
Message-ID: <CAP9ODKqzVp3RqbU6_8L5qE3nCK+VcqRaQYp=vJazfL4qT-My=A@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] initrdscripts: fix init-live.sh for hddimg and livecd
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
X-List-Received-Date: Wed, 24 Aug 2011 15:48:29 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 24, 2011 at 05:25,  <Jingdong.Lu@windriver.com> wrote:
> Both hddimg and livecd use init-live.sh script to boot the rootfs.img.
> But the paths of rootfs.img in hddimg and livecd are different. So we add
> a variable "ISOLINUX" to provide a correct path.

I do like the patch and I think the way it fixes it is the right one
except by the variable name that has been choose; I'd use 'BASEDIR'
since this reflects more the reasoning of it to exist.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


