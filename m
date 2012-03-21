Received: from mail-vb0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1SAAg0-00063I-DZ
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Mar 2012 02:49:24 +0100
Received: by vbbfr13 with SMTP id fr13so335564vbb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2012 18:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=DyR2v9jx/XRndOTid1mDGXA02kSOg6bMZZCrWTU4te4=;
	b=qMDdntGVwxsiBEMakez/Dt1NpbB3H995IPSx0xpxRGVhenN84I+xKcB7r9Nh2tjhkm
	5HAlG1AqhMgMUxCwZjOTuIYcpZEICnDUwYc0ZtUKZVeazNdolsAveLLBKxP7MqsdDsph
	NhqjsQrbsatikYdGOv2pmHw4nIr1+Jeq7E+7/jVJRuxiTkHC/rDrShTDgJ21vS/XPV9D
	pwpflzQCyxvtNEI59ZTlWrReJyMuWtFTnKGguAGXNR5L7IkybGJkvGpUD04rtssFAdC3
	bSQzJs1Wz13es1KDceoBV/B2LWrUUY6sX3bkpKZmdbQyPGEODwCB8R9+VmSEtnSqcX+Y
	t8FQ==
MIME-Version: 1.0
Received: by 10.220.115.8 with SMTP id g8mr1027007vcq.8.1332294030871; Tue, 20
	Mar 2012 18:40:30 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.220.7.208 with HTTP; Tue, 20 Mar 2012 18:40:30 -0700 (PDT)
Date: Tue, 20 Mar 2012 22:40:30 -0300
X-Google-Sender-Auth: tp0o-gp-8YCi5zXf6h-k49oR81Y
Message-ID: <CAP9ODKq3vD6u4TQnWw4Ux9c5L5fB3FVcstY_pCkmzp_HWddhRg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Build failures due zlib problem
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
X-List-Received-Date: Wed, 21 Mar 2012 01:49:24 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

| NOTE: Unpacking
/home/ostt-devel/src/embedded-systems/downloads/gcc-4_6-branch_gcc.gnu.org_=
.svn.gcc.branches_184847_.tar.gz
to /home/ostt-devel/src/embedded-systems/tmp-eglibc-eglibc/work-shared/gcc-=
4.6.3+svnr184847-r28/
| gzip: /usr/lib/libz.so.1: version `ZLIB_1.2.5.1' not found (required by g=
zip)
| tar: Child returned status 1

Does anyone sees it? Our autobuilder is failing this way.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


