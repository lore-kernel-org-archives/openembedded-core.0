Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QF7sw-0002Q7-Rj
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Apr 2011 18:46:42 +0200
Received: by wye20 with SMTP id 20so1585612wye.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Apr 2011 09:44:11 -0700 (PDT)
Received: by 10.227.201.9 with SMTP id ey9mr2499125wbb.41.1303922651453;
	Wed, 27 Apr 2011 09:44:11 -0700 (PDT)
Received: from [172.20.2.72] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id o6sm569675wbo.54.2011.04.27.09.44.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 27 Apr 2011 09:44:09 -0700 (PDT)
References: <BANLkTimY=T0BNMLWm+Ez9N1ug+_XOdaGpg@mail.gmail.com>
In-Reply-To: <BANLkTimY=T0BNMLWm+Ez9N1ug+_XOdaGpg@mail.gmail.com>
Mime-Version: 1.0 (iPhone Mail 8H7)
Message-Id: <B7450533-1402-4465-A3C8-6CFF10BF4A82@dominion.thruhere.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: iPhone Mail (8H7)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 27 Apr 2011 18:44:05 +0200
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: eglibc 2.13 upgrade
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
X-List-Received-Date: Wed, 27 Apr 2011 16:46:42 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Why not move those srcrevs into the recipe? IIRC these ones aren't affected b=
y RPs concerns

Op 27 apr. 2011 om 18:21 heeft Khem Raj <raj.khem@gmail.com> het volgende ge=
schreven:

> Hi
>=20
> I have eglibc 2.13 upgrade done locally and has been building fine for
> all architectures. I have added 2.13 recipes and not
> deleted the 2.12, This works ok except when setting the SRCREV. Since
> we have a single file called
> conf/distro/include/poky-default-revisions.inc to store this
> information there can not be two SRCREV for two versions of same
> package unless we move them to
> recipes which is under work but not yet done. Thats one reason to hold
> these patches. I can propose them if we are ok with
> removing 2.12 recipes then it becomes straight forward
>=20
> Opinions ?
>=20
> -Khem
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


