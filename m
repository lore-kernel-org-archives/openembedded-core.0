Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f51.google.com (mail-wg0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 057B56013D;
	Mon, 11 May 2015 06:25:43 +0000 (UTC)
Received: by wgbhc8 with SMTP id hc8so17825887wgb.2;
	Sun, 10 May 2015 23:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=P87Vuu2+N2YaWtmnAtkbwwwokOiU8c+DF9v9asizjhw=;
	b=pttQmMHoY0H2r2iHuOgEYSNRf3rWtHAJIkfK82BnIq6Aw56oYeQ+GkMsNfPz0AxbHu
	2H0vxLBqLLlH77/rNC5T31VXFT5EgszPCN3sgpIeRRHGGYaNQM6hL9zvhwJeV7PVkJ4P
	LnxpXE93ow1sEa0NPUn23n87ei5BsW4D3VoqO1NvvpI4eYUKLiBAUTfXGeLmHJWCtGRi
	UGbbo7hwgsUWRlOk2MeAgFCLVui3zdA9ViYdIs3pEojDoyMDDqZYG/5zEJAGk+bsGHvJ
	1AQjisDCI78+8MMRZxx8HegoIXvu+6gRazApfvYs1BRPZQj2Iwp1G00c6QEej8kmXUb9
	Rnbg==
X-Received: by 10.194.23.197 with SMTP id o5mr17463990wjf.75.1431325544607;
	Sun, 10 May 2015 23:25:44 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id
	di9sm11590888wib.16.2015.05.10.23.25.43
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 May 2015 23:25:43 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 11 May 2015 08:26:15 +0200
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20150511062615.GE2400@jama>
References: <20150501160602.GA5885@denix.org>
	<CAAQYJAvpGUdZyAzOay+VuDz+tdZF72ny0bgDfkTFomCFbVrMhQ@mail.gmail.com>
	<554A67AB.1000800@dresearch-fe.de>
	<20150506233137.GH5885@denix.org> <20150508192852.GJ5885@denix.org>
	<20150508210907.GK5885@denix.org>
	<1431160561.8074.345.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <1431160561.8074.345.camel@linuxfoundation.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: opkg_install_pkg: Package <name> md5sum mismatch. Either the opkg or the package index are corrupt.
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
X-List-Received-Date: Mon, 11 May 2015 06:25:44 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 09, 2015 at 09:36:01AM +0100, Richard Purdie wrote:
> On Fri, 2015-05-08 at 17:09 -0400, Denys Dmytriyenko wrote:
> > weston-init RDEPENDS on weston and kbd.
> >=20
> > $ bitbake-diffsigs 1.0-r0.do_package_write_ipk.sigdata.eb3921bfc9623056=
f7ffaef4be8549ab 1.0-r0.do_package_write_ipk.sigdata.90c2978497847912cd64f6=
6039927f7d=20
> > Hash for dependent task waylandweston_1.6.0.bb.do_packagedata changed f=
rom 551b3b5ac7b3c41bfced58b88db2d824 to f3eb9cd1861c186382e47f90e82e3295
> > Hash for dependent task kbdkbd_2.0.1.bb.do_packagedata changed from 53a=
5dc88b80dc5ab559fbecd14277650 to 950fbc7fe3c33564e781743f2c260670
> >=20
> > Then, comparing signatures for weston, for exaple, gives all the change=
s=20
> > caused by different DEFAULTTUNEs, TUNE_FEATURES and ARMPKGARCH - obviou=
sly,=20
> > since one machine is cortexa8, while another is cortexa9.
> >=20
> > But why would an allarch package even care about machine tunes in depen=
dant=20
> > packages, when it only RDEPENDS on them?
>=20
> If A DEPENDS on B and B changes, the package name may change (thanks to
> debian.bbclass) so A has to repackage. Very very annoying but
> technically correct :/.
>=20
> > And how should I fix this? Thanks.
>=20
> See SIGGEN_EXCLUDERECIPES_ABISAFE in layer.conf of OE-Core. You probably
> need to add weston-init to the list.

IIRC this won't help, he would need to add weston and kbd to
SIGGEN_EXCLUDERECIPES_ABISAFE which will exclude it from signature of
all other recipes as well.

Maybe you meant SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS.

SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS +=3D "\
  weston-init->weston \
  weston-init->kbd \
"

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

