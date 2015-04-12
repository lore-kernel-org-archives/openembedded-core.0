Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id 6BA906AC1E
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Apr 2015 06:59:35 +0000 (UTC)
Received: by pabtp1 with SMTP id tp1so67720440pab.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Apr 2015 23:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=UtjV4MSQRQfbBg4+nhdnxf5tp/YdeDiA5BZagsSS4mU=;
	b=Mubu506Li4spv3RJX6rrbB4Iam6sFdIT81QHodXJ4CAXs1CxcyQ9lJ2SZxrxz/xiSI
	7x4XAxSOHSCAViOiRbR3npVLeyRwoQvqli6s93FGYyXTHIrWdmLRZ+gNUMmCMUA9yFx6
	h+2TR/oMOmWyAjWilFr6m3y3fn9LBOIbUjyOKD3yqj017pUtLnShpfexYQ1S1QxXS7S+
	Pe2aGrLiX0PiOFtdV3hmLr1BoZGgwquMeTQ1ux0vr+5nY7N8DIgD1OROsyds9a3glLtT
	984dFd8AtCgOd03d3nV+21/NkFCA3WnJXsU57E5cLAsU9G8Q+oKZa88zWyOrwVMkEKKB
	5ebA==
X-Received: by 10.68.134.165 with SMTP id pl5mr16316497pbb.134.1428821977074; 
	Sat, 11 Apr 2015 23:59:37 -0700 (PDT)
Received: from [192.168.0.13] (c-76-103-142-85.hsd1.ca.comcast.net.
	[76.103.142.85]) by mx.google.com with ESMTPSA id
	qp13sm3651523pdb.31.2015.04.11.23.59.36
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 11 Apr 2015 23:59:36 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <5527E5CE.7050706@windriver.com>
Date: Sat, 11 Apr 2015 23:59:34 -0700
Message-Id: <EC511907-3C99-40CE-83C8-B21F209864EB@gmail.com>
References: <1428674774-29364-1-git-send-email-Martin.Jansa@gmail.com>
	<5527E5CE.7050706@windriver.com>
To: Mark Hatle <mark.hatle@windriver.com>
X-Mailer: Apple Mail (2.2098)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] e2fsprogs: Package populate-extfs.sh and enable symlink install
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
X-List-Received-Date: Sun, 12 Apr 2015 06:59:37 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> On Apr 10, 2015, at 8:01 AM, Mark Hatle <mark.hatle@windriver.com> =
wrote:
>=20
> I'm a bit confused by this.  Why is symlink saving space over =
hardlink?
>=20
> The hardlinked items should retain their hard link status through the =
packaging
> and into the image.  If not, it sounds like there is a bug in the =
packaging
> mechanism you are using (opkg, deb, rpm?) and/or the image generation.
>=20
> And just because 'ls' shows the sizes, the fact they are hard linked =
means
> they're not taking up duplicate space.
>=20
> I know there is a lot more then just e2fsprogs that does a hard link =
vs symlinks
> for various command, which is why I'm trying to understand where we =
might have a
> problem.
>=20

This patch improves the recipe and problems with packaging hard links is =
orthogonal to it.
this patch should go in regardless


