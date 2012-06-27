Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Sjm6O-0003rM-Pe
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jun 2012 08:51:48 +0200
Received: by eaal1 with SMTP id l1so225671eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jun 2012 23:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=ppCpa5jIlo6hJE4xXuhA7trhecFUJK+alw/QthQtCH8=;
	b=aDBzu2b/EdCF/RvHWh6zYXqm4QYvNdXOdN5qJDRvSTUgQq6qmU/rzaHsemeeT4BVi8
	PvWYsM8N0CgvcnuNTAADQlbAxfW5IeJwQUbD9nBErqdUQDw8g7jFOIOnkr9/NocnaNli
	6VGZ0k/m/lHkJ2g4N4j/5qIM7vlX+pwG4dP22bytkaqECYrpcnHnrwCnc4TxAyFewY1d
	WaWhWWJ7edMPayjSuryPkcpXwiaMse1CRsyMORf8MLEKg4kWvGU/TQL3wf+uy0ouUNXg
	QRrpvKf3eSsQ9cfMsSOHyWZ57oq/6hhQGLBt4vLxPySopVeZnMtLDqAIc2vq5tc+/eTk
	IoWA==
Received: by 10.14.53.4 with SMTP id f4mr3885930eec.93.1340779255735; Tue, 26
	Jun 2012 23:40:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.219.71 with HTTP; Tue, 26 Jun 2012 23:40:25 -0700 (PDT)
In-Reply-To: <CAF1ZMEcMxTQUhyHdmMWV_PA6TY=RTz9rq-EahKU0p=DFFPw+Ew@mail.gmail.com>
References: <CAF1ZMEcMxTQUhyHdmMWV_PA6TY=RTz9rq-EahKU0p=DFFPw+Ew@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 26 Jun 2012 23:40:25 -0700
Message-ID: <CAMKF1srKXavMswBxM+E_-HHGXdDphYuPfNKbXHAZf4=w1nsMUw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: yocto@yoctoproject.org
Subject: Re: bring mipsel support (little endian mode)
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
X-List-Received-Date: Wed, 27 Jun 2012 06:51:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 26, 2012 at 11:25 PM, Dennis.Yxun <dennis.yxun@gmail.com> wrote=
:
> HI ALL:
> =C2=A0 Sorry for crossing post, but I'm quite new here, so if I did
> something wrong, please point me the right direction. thanks
> =C2=A0 I'm using oe-core, and notice that mipsel support(o32, little
> endian mode) is missing (current available choose is: qemumips,
> qemumips64, qemumips64el).
> =C2=A0 So, here I'm trying to bring up qemumipsel support . My first
> attempt would just make qemumipsel work,
> further would make it running on real board, thus maybe mips4kec,
> mips24k, mips74k chips.
> =C2=A0 What I achieved here current:
> =C2=A01) toolchain/basic libs, utilities should works ,only one changes,
> see my patch [a]
> =C2=A0 for mipsel we also have to filter out -march=3Dmips32, previously =
we
> only handle mips (the big endian?)
> =C2=A0 don't have the error message now, but if you request, I can provid=
e.
> =C2=A02) attempt to =C2=A0compile kernel to support qemumipsel, unfortuna=
tely it fail.
> The point here is linux-yocto doesn't support qemumipsel, but merely
> support those other three mips arches,
> So here is my attempt patch [b], and the fail log [c], complied out
> binary still big endian.
>
> =C2=A0 Could my patch [a] be accepted? or should I send with another mail
> for better review?
> =C2=A0 Is it better to request a ticket in yocto's bugzilla? or just
> report here, I'm not quite sure.
>
> Dennis
>
> [a] 0001-eglibc-support-mipsel-little-endian-filter-out-march.patch

This patch is appropriate for OE-Core, I will add it to my tree.

> [b] 0002-qemu-attempt-to-add-mipsel-little-endian-support-but.patch

This looks good to me but I will leave it to Bruce to decide.

> [c] build_log.txt
> [d] log.do_package
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


