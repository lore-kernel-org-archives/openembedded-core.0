Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id 24DDD601F5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Jan 2015 02:45:22 +0000 (UTC)
Received: by mail-pa0-f49.google.com with SMTP id eu11so22012109pac.22
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Dec 2014 18:45:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=A5Jg3C5WM8zwx1SRWJhPBPBo3i0fGxmzDnj5/SkbsQI=;
	b=SmyLv/FTQYF5oh4cez+LIMY8gtLCZi4asx902f1okdFSRQBZWo3z451fG0jtGSIDNn
	Ot9NREveXUb35RltnmfV95xOb9nQn7IwMig5uPiYpGbuZhShFjuyx6sEpB4tY+6aKlLs
	qHujZAIhdlUFpChQePjEVxK+ao5VU3DNaN2/QzOBFMslmCYpzRMA1wEQOvyLgf2xfY6N
	6BZybI9nM7WPhiNl+tFc/vW8nSuhbXHUYZuTgBuo6U7CgcQx+poygHpZiHjglo4l/Yzd
	s7d2/UYPkZcW+kiUZdOR1tUcVOEZw3bW97CzmCRRCgjEnRdC+5ileu+2Eh27AxKrPX1O
	mARA==
X-Received: by 10.66.166.171 with SMTP id zh11mr111707214pab.85.1420080323179; 
	Wed, 31 Dec 2014 18:45:23 -0800 (PST)
Received: from ?IPv6:2601:9:3580:84c:57d:8d0:eedc:6d7a?
	([2601:9:3580:84c:57d:8d0:eedc:6d7a])
	by mx.google.com with ESMTPSA id k3sm42528207pdj.2.2014.12.31.18.45.21
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 31 Dec 2014 18:45:22 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.1 \(1993\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <ly4mst9pe7.fsf@ensc-virt.intern.sigma-chemnitz.de>
Date: Wed, 31 Dec 2014 18:45:20 -0800
Message-Id: <867ADA85-0712-43F0-B151-8ACA7D4947E2@gmail.com>
References: <548EBDE0.3080704@dresearch-fe.de>
	<lyiohcubq7.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<548FEF09.80304@dresearch-fe.de>
	<1418897346.5106.18.camel@linuxfoundation.org>
	<ly4mst9pe7.fsf@ensc-virt.intern.sigma-chemnitz.de>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-Mailer: Apple Mail (2.1993)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: "qemu-arm udevadm hwdb --update" eats swap space after build host update to openSUSE 13.2
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 01 Jan 2015 02:45:29 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


> On Dec 18, 2014, at 3:19 AM, Enrico Scholz =
<enrico.scholz@sigma-chemnitz.de> wrote:
>=20
> Richard Purdie <richard.purdie@linuxfoundation.org> writes:
>=20
>>> I had a big subtree from earlier local openSUSE Build Service runs
>>> below toplevel /var/run. After deleting this the build succeeds.
>>>=20
>>> But manually deleting such files before running OE builds cannot
>>> really be a reasonable solution. :(
>>=20
>> Agreed, we need to figure out which tool is suffering issues with
>> circular symlinks,
>=20
> Circular symlinks are not the issue but absolute symlinks (like /tmp =
->
> /var/tmp due to local changes).  I can not find absolute symlinks to
> directories in my images anymore, so Steffen's problem might be caused
> by local changes too.
>=20
> Chroot unaware tools (qemu) are the real problem=E2=80=A6=20

I think in this case one could use qemu=E2=80=99s -E option ( -E =
TMPDIR=3D/x/y/z) to pass target specific TMPDIR
to udevadm=

