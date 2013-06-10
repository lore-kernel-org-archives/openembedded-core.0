Return-Path: <eric@eukrea.com>
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
	by mail.openembedded.org (Postfix) with ESMTP id 6F0B461FB9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 07:45:42 +0000 (UTC)
Received: from e6520eb (pac33-2-82-240-38-71.fbx.proxad.net [82.240.38.71])
	(Authenticated sender: eukrea)
	by smtp2-g21.free.fr (Postfix) with ESMTPSA id 31E7D4B021E;
	Mon, 10 Jun 2013 09:45:37 +0200 (CEST)
Date: Mon, 10 Jun 2013 09:45:36 +0200
From: Eric =?UTF-8?B?QsOpbmFyZA==?= <eric@eukrea.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20130610094536.36e83ecd@e6520eb>
In-Reply-To: <CAGDS+nnQjF9P9s61--FW+_1gs_-qbcugmKt7-xd2i6gwkVFpRw@mail.gmail.com>
References: <CAGDS+nnQjF9P9s61--FW+_1gs_-qbcugmKt7-xd2i6gwkVFpRw@mail.gmail.com>
Organization: =?UTF-8?B?RXVrcsOpYQ==?= Electromatique
X-Mailer: Claws Mail 3.9.0 (GTK+ 2.24.18; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Subject: Re: qt4e-demo-image with meta-fsl-arm: successful build?
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
X-List-Received-Date: Mon, 10 Jun 2013 07:45:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Le Sun, 9 Jun 2013 20:19:52 -0700,
Steve Sakoman <sakoman@gmail.com> a =C3=A9crit :

> Has anyone successfully built (and run!) the qt4e-demo-image with meta-fs=
l-arm?
>=20
> I tried a build for a machine based on imx28evk and get a broken image
> (i.e. demo fails to start at boot):
>=20
> QIconvCodec::convertFromUnicode: using Latin-1 for conversion, iconv_open=
 failed
> QIconvCodec::convertToUnicode: using Latin-1 for conversion, iconv_open f=
ailed
> Unable to load library icui18n "Cannot load library icui18n:
> (libicui18n.so.36: cannot open shared object file: No such file or
> directory)"
> qtdemo: cannot connect to X server
>=20
the strange thing is why do you get a X qtdemo when building
qt4e-demo-image ?
I've launched a build and will test on my imx28evk asap.

Eric

