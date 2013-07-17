Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id 8A0D36B215
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2013 20:52:15 +0000 (UTC)
Received: by mail-pa0-f48.google.com with SMTP id kp12so2358277pab.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2013 13:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=7ATpHs3oq6vmgJHh/sg5z8io7NZ2VeWsakVhF6/NxJY=;
	b=LG4/egrd+OQ8suRNqQFPjaMAE4EkmK69m3Yk+6UQqOlinH1jbwvSWMEhKNgd8Mzr0C
	Un7yp2Rs26CIyJMxIC1HR+FMvMOdMPd5UHnWpPbc6IG5YIYDzbZ3b3Qw/+qhYGkkbBUy
	FEoWBzNzyKDpTdwr7abVt03F6C6qweo8m+HZLUkCNEMzPo6dqxv7C3BfKzgxRRUZ+7ke
	tCBNhUoKk31Jf+M9BWrg0vBkVs6utsMbE0i5+dxx5wJvV5mnAkdNDGC1emP0GpE0O2vH
	6lNouwgne7JSCPvQEHSOe+VRlYM2gCPE6gzbijZ2ZAI41U2woXpufVlRmyfN3e/b9xvP
	5icw==
X-Received: by 10.68.98.33 with SMTP id ef1mr8727524pbb.59.1374094336476;
	Wed, 17 Jul 2013 13:52:16 -0700 (PDT)
Received: from ddeviny-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36]) by mx.google.com with ESMTPSA id
	sq5sm12355247pab.11.2013.07.17.13.52.14 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 17 Jul 2013 13:52:15 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <cover.1374084357.git.bruce.ashfield@windriver.com>
Date: Wed, 17 Jul 2013 13:52:13 -0700
Message-Id: <F31491D0-DB80-4D33-B126-69440CB4605A@gmail.com>
References: <cover.1374084357.git.bruce.ashfield@windriver.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
X-Mailer: Apple Mail (2.1508)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [v2 PATCH 0/3] linux-yocto: mips changes
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
X-List-Received-Date: Wed, 17 Jul 2013 20:52:15 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Jul 17, 2013, at 11:07 AM, Bruce Ashfield =
<bruce.ashfield@windriver.com> wrote:

> This *3* patch series fixes gcc 4.8 compilation of mips in=20
> the 3.4 kernel, and corrects a mistake I made when updating
> the 3.8 kernel that inadvertently dropped the qemumips64
> SRCREV.=20
>=20
> The 3rd patch, which was dropped in version 1 is meta branch
> changes for the latest emgd driver.
>=20
> Cheers,
>=20
> Bruce
> The following changes since commit =
3dee534f1e25109e0bdb681de0746c336f4b8840:
>=20
>  lib/oeqa: fix dependecy check (2013-07-16 10:04:17 +0100)
>=20
> are available in the git repository at:
>=20
>  git://git.pokylinux.org/poky-contrib zedd/kernel
>  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Dzedd/kernel
>=20
> Bruce Ashfield (3):
>  linux-yocto/3.8: update META srcrev
>  linux-yocto/3.4: mips: fix gcc 4.8 compilation
>  linux-yocto/3.8: restore qemumips64 SRCREV
>=20

qemumips64/3.8 kernel is booting again w/ systemd images with this patch =
set so for whole set.

Acked-by: Khem Raj <raj.khem@gmail.com>



