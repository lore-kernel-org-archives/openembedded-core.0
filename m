Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1STlTc-0006my-N9
	for openembedded-core@lists.openembedded.org;
	Mon, 14 May 2012 04:57:36 +0200
Received: by werg55 with SMTP id g55so1744857wer.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 May 2012 19:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=g6GRhvIOL+4MVp5DRRUw4E1cThvfahhaZ1Kck0/iDR8=;
	b=jX/hhlUXS/ZEaBDNZaog1CoxQ/kJi2PxNF+H/zWIaRBvJGCV+Ie8DLOFXzv+tFe8Ab
	r5l6Facwrbn2gXWycC/o2YAqEKSxVG/pBXAz107UFCxn1ZXt1Ab6vtOzI9kaVFxkZbge
	2HXHg0U4AhqUgnDCWwUvMUfWv/Ok996a+izV28A9fk1bDqpgHV77o+GW+MJeo0rq8VIw
	Nc+s0PEn1diyysdpqVJ5Z9QOoxXTGguItt0Wkq3Z5e5MvMXKbutsLS2XfCKzrnho6rdW
	GdOrLe6SysGhy3o344wEhDWVyQGp7rLUTEowX8p794EMEfxF9Kjmvg6rb8J2huFlolz4
	Tmpg==
Received: by 10.216.204.217 with SMTP id h67mr3965938weo.68.1336963658443;
	Sun, 13 May 2012 19:47:38 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.181.16 with HTTP; Sun, 13 May 2012 19:47:18 -0700 (PDT)
In-Reply-To: <1336962502-7271-1-git-send-email-jason.wessel@windriver.com>
References: <1336962502-7271-1-git-send-email-jason.wessel@windriver.com>
From: Chris Larson <clarson@kergoth.com>
Date: Sun, 13 May 2012 19:47:18 -0700
X-Google-Sender-Auth: G28XMokkOYUaW5jPdcfPKztdwU8
Message-ID: <CABcZANnvJHzuTb7UTXAXvFzbHjWxAzoJNwvWp_zaeoNK3-z07Q@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] RFC - CCACHE_DIR to not impact sstate
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
X-List-Received-Date: Mon, 14 May 2012 02:57:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, May 13, 2012 at 7:28 PM, Jason Wessel
<jason.wessel@windriver.com> wrote:
> I am not exactly sure how to fix this, so I thought I might ask in the
> form of a working patch. =C2=A0The problem is that I want to use an
> external CCACHE_DIR on some build servers, but use the defaults on
> others. =C2=A0Ultimately the sstate sums should be the same in either cas=
e,
> but they are not due to the way that bitbake tracks the "export"
> variables for inclusion i the sum dependencies. =C2=A0My example test is =
to
> simply set CCACHE_DIR =3D "/tmp/ccache" in the local.conf and recompile
> the quilt-native package.
>
> I ended up adding another check to the dependency generator because
> simply trying to use "unexport" had undesired effects. =C2=A0If there is =
a
> better or correct way of fixing this such that CCACHE_DIR will not
> impact the sstate sum, I would really like to know how to do this. :-)

Add it to BB_HASHBASE_WHITELIST next to other variables like TMPDIR,
FILE, and BBPATH.
--=20
Christopher Larson


