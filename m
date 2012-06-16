Received: from mail-vc0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1SfxE2-0007ac-Ep
	for openembedded-core@lists.openembedded.org;
	Sat, 16 Jun 2012 19:55:54 +0200
Received: by vcbfl15 with SMTP id fl15so2185904vcb.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Jun 2012 10:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=LxRbhZfzCM8v26Ux8uVoKyJGsACjbV3RRY2Xf+/GeDY=;
	b=GmG/8Rk+hC9JYQwY56t2Nkkg35nk00Cx9TCefiU3Og9Ep/lcnoJg1ZL943JnIBPFtq
	KaGN+9wlSa8AfZFda79/BM+vfRpvbQpN/+jvvY3+ojiWvgkOPGqRTHMhyuHBnODL6l+I
	pPFYlLeAfZ/WYdowR1309NppPatIkRzP0eZK58HdT4ZYl9aNkrOp0bxbMOOPCzIakCeD
	LezObOAuED2FQ0kfpVTESk5/hBq8RbEevch+T/PY7Ivfu2mCFoTvGTI4eONCRvdNxfxC
	ZjF5Waf52L2+fgdbRoYdGFM7B4wEYfkJZlkcMF67g6WlxQSXZBwbbTo3inZRUlygzTHE
	bikQ==
MIME-Version: 1.0
Received: by 10.52.33.100 with SMTP id q4mr4152409vdi.59.1339868714224; Sat,
	16 Jun 2012 10:45:14 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.220.155.130 with HTTP; Sat, 16 Jun 2012 10:45:14 -0700 (PDT)
In-Reply-To: <CAF6bG8dn4scUh_pWX84iEZH_6L4ZEzCX1VO=oa1+_G3AA-kakQ@mail.gmail.com>
References: <CANBf+V3=LvWkE28TR1qNR-NpLd60EGroEqmXQqypXAUUZ0pv-Q@mail.gmail.com>
	<4FDB57DB.5090407@gmail.com>
	<CAP9ODKrkmDNCzXcK3wDqypxZW6Le44004rcO7e5CiW4HD5o-AA@mail.gmail.com>
	<CAK18fxGOAi40Tzduw99=fQMf_cn9sySqr=dvJzRncNCutjjyaw@mail.gmail.com>
	<4FDB9332.6010807@balister.org>
	<CAF6bG8dn4scUh_pWX84iEZH_6L4ZEzCX1VO=oa1+_G3AA-kakQ@mail.gmail.com>
Date: Sat, 16 Jun 2012 14:45:14 -0300
X-Google-Sender-Auth: B2zeGtzYEO9Bhhd0iX_6F3qdADM
Message-ID: <CAP9ODKp6=yeY1HDpKhgBQbg9JWq=gvPAJRS-+NdJ5U4Tqn+Oxw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Proposal: Creating meta-networking
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
X-List-Received-Date: Sat, 16 Jun 2012 17:55:54 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 16, 2012 at 2:36 PM, Marko Lindqvist <cazfi74@gmail.com> wrote:
> =A0Need to clone many separate repos for building your own system
> (bitbake, oe-core, oe-meta, oe-networking, your own sw) is a minor
> annoyance in itself, but need to synchronize between them (what
> revisions of the first repo are compatible with given revision of the
> second) could lead to headaches for someone having additional
> constraints of the production level system maintenance (i.e. when one
> cannot simply take HEAD of everything).

I've been working using repo for this and it works very nice! easy to
have a stable release when it is desired and easy to follow upstream
otherwise.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


