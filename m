Received: from mail-pz0-f44.google.com ([209.85.210.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QiEkr-0004u5-Ig
	for openembedded-core@lists.openembedded.org;
	Sun, 17 Jul 2011 01:58:41 +0200
Received: by pzk5 with SMTP id 5so3631838pzk.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Jul 2011 16:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=references:in-reply-to:mime-version:content-transfer-encoding
	:content-type:message-id:cc:x-mailer:from:subject:date:to;
	bh=xSeRN2zwawGObnr28mTGISCbrE5RDYBtk6TfvEp02SI=;
	b=TAmpj00UOL9YRNkj6pfrwItb3d7VVmy/OwIxWuWi2NPhfiM/C40kSK+nJOEHp3XTCU
	zeDG2L31EeVCArU/39pdngtOXuvuChcYKvHKMUeV4INZrRD14l2yqxDUvlhdv6vwZffL
	YiTSSIz4BU2gB5T6SuyXt+nevkrxWxQMOjGTo=
Received: by 10.142.43.6 with SMTP id q6mr2177225wfq.421.1310860476807;
	Sat, 16 Jul 2011 16:54:36 -0700 (PDT)
Received: from [192.168.1.81] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id d1sm1517180pbj.40.2011.07.16.16.54.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 16 Jul 2011 16:54:36 -0700 (PDT)
References: <201107170122.49326.schnitzeltony@gmx.de>
In-Reply-To: <201107170122.49326.schnitzeltony@gmx.de>
Mime-Version: 1.0 (iPad Mail 8J2)
Message-Id: <796ECE90-6B1E-4AC0-AD49-98BE5512E0B5@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: iPad Mail (8J2)
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 16 Jul 2011 16:55:19 -0700
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: How to force rebuild of a recipe
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
X-List-Received-Date: Sat, 16 Jul 2011 23:58:41 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



On Jul 16, 2011, at 4:22 PM, Andreas Mueller <schnitzeltony@gmx.de> wrote:

> Hi
>=20
> in oe during development I forced a full recipe rebuild by
>=20
> bitbake -cclean recipe && bitbake recipe
>=20
> in oe-core environment this does not seem to work. I found out that it=20
> additional needs manual deleting of the archives belonging to the recipe i=
n the=20
> build folder sstate-cache. Is it a bug that -cclean does not delete these?=
 Or=20
> how do I force a rebuild of a recipe under oe-core?

Use -c cleansstate or -c cleanall

>=20
> Thanks
>=20
> Andreas
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


