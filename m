Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SZhop-0002TT-7R
	for openembedded-core@lists.openembedded.org;
	Wed, 30 May 2012 14:16:03 +0200
Received: by eekd49 with SMTP id d49so1749257eek.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2012 05:05:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=aN25dNW1GwzRDhGBfDn38ek1J0PH28WGy2Xi6ttxlEE=;
	b=YD8njK26MgOMxlDy5IzfoTknqsmRlbPaxSdoDrmmD431eunLWA4UVjnU19qZtUxszf
	KyjB0yXtjY2tiiZG2AoQccJnpmkh8ZYRqn7q9gEBG7X5PUJApiQT+O+2cuIXjIWdVbkD
	V4nnVIPbkPVOEnVJTMFGz1cEGq1VDFtY2RpfFhSr8B/rPiNR+k111uEQ0Cunt18eSdkD
	wHKsHo9hwF1VmWbwEhKqvR6mLyTF/f+5O2UUzxYguvc+yB9UPnhIv3xJUp2beXk17ADX
	RGE4X+2u3uScsPEKV5lTqkLJysVueKz9XnF6Ng/DRjS5Zczd8ZaNBjaElRUYvExONnQZ
	FlZA==
Received: by 10.14.127.8 with SMTP id c8mr749046eei.148.1338379544512;
	Wed, 30 May 2012 05:05:44 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id y54sm59861996eef.10.2012.05.30.05.05.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 30 May 2012 05:05:43 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <cover.1338368508.git.edwin.zhai@intel.com>
Date: Wed, 30 May 2012 14:05:41 +0200
Message-Id: <6663334E-20E2-4678-8129-A79B0F05E88F@dominion.thruhere.net>
References: <cover.1338368508.git.edwin.zhai@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQl7ZV8mxLpjIaecCY4FZR+aQclVfqG1QZ1tfCJV0Ej4oJdhpT5+P+oxObFlUSOEMSjzZTpY
Subject: Re: [PATCH 0/1] Fix browser crash on PPC
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
X-List-Received-Date: Wed, 30 May 2012 12:16:03 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 30 mei 2012, om 11:08 heeft edwin.zhai@intel.com het volgende =
geschreven:

> From: Zhai Edwin <edwin.zhai@intel.com>
>=20
> All,
>    This patch use glib as unicode backend to avoid browser crash
>=20
> webkit-gtk depends on ICU for the unicode, but ICU is not safe when =
build and
> target system owns different endian. ICU's community is not responsive =
to make
> a patch for this, so glib is used as work around here.

That is a really big change since the backends don't have equivalent =
functionality.

> [YOCTO #1570] got fixed
>=20
>=20
> The following changes since commit =
f28209d9d3c67203a2c7a2b25cacfe31643d1bfa:
>=20
>  cooker.py: terminate the Parser processes (2012-05-25 11:39:33 +0100)
>=20
> are available in the git repository at:
>  git://git.pokylinux.org/poky-contrib gzhai/fix3
>  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Dgzhai/fix3

And that doesn't merge into oe-core, so I can't test it.=


