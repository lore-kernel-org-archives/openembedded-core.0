Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RLg3F-0007aY-QX
	for openembedded-core@lists.openembedded.org;
	Wed, 02 Nov 2011 20:00:41 +0100
Received: by bkbzv3 with SMTP id zv3so470145bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Nov 2011 11:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=gLV6orZLKZgd6jLaZaVh6klwEJXe0sFcpWnWOFzda44=;
	b=BJsIXMuOthXJwrcG3wrwAcsqUP4nR8I9pZhIX92cZ51270Nrl/1c8DVH/Vdz3GNXuK
	tR4z1VqlNLux6zqnUJe0TC1TVBMhEP7XotpMQ+euF+XZX4RsVLn08XVetLypSr/DNSLR
	62jQBNn+GDFMXREmA/VujvL1iUYQGca/A982A=
MIME-Version: 1.0
Received: by 10.204.145.130 with SMTP id d2mr4877496bkv.78.1320260074270; Wed,
	02 Nov 2011 11:54:34 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.48.208 with HTTP; Wed, 2 Nov 2011 11:54:34 -0700 (PDT)
In-Reply-To: <5f42fbce6e383b6330efde454da2cfe0a38df5cf.1320183757.git.sgw@linux.intel.com>
References: <cover.1320183757.git.sgw@linux.intel.com>
	<5f42fbce6e383b6330efde454da2cfe0a38df5cf.1320183757.git.sgw@linux.intel.com>
Date: Wed, 2 Nov 2011 16:54:34 -0200
X-Google-Sender-Auth: 8CgARSogMsor8h_0Aa2P5_rgjGA
Message-ID: <CAP9ODKo+BrVout44UaDOLfk5mEz+dFA4qGvx3L-B6ZP0Bjakbg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [Pull v2 3/4] connman: create xuser
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
X-List-Received-Date: Wed, 02 Nov 2011 19:00:41 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 1, 2011 at 19:44, Saul Wold <sgw@linux.intel.com> wrote:
> We create xuser here as a backup incase that xerver-nodm-init
> is not on the system.

This is wrong. If xserver-nodm-init (btw, there's a typo on the commit
message) is not in the image user is suppose to know what he/she is
doing so we shouldn't add users not required to make their life
easier.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


