Return-Path: <martin.jansa@gmail.com>
Received: from mail-la0-f54.google.com (unknown [209.85.215.54])
	by mail.openembedded.org (Postfix) with ESMTP id 1689361F16
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 May 2014 13:56:33 +0000 (UTC)
Received: by mail-la0-f54.google.com with SMTP id pv20so1581158lab.41
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 May 2014 06:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=hlJTNBsB6+LDjvFRjtsGoYriLoEfJoZMFvwcUQGqV04=;
	b=OHSbMOqn/v/zW2A3KJcSRryIUBoEMZs9gOIyxL5WErhcpctnE6KiN9hmaCnoQ8Rro8
	3QZuihcb5/oKUBGhzFwZCElOnWJnEQAAU+IQ2QYpxfyB11Q74OlFXM8C/DR3E7OrfUJx
	SnDSH4OfOKQQHZ0x0BS9pQxS7O40Gg19/qHxhd7Avjrgd34MsRHCyZdw88rUcUgOfCmJ
	3PCwQDyxYNQXi92tIbmQHR4+sdRm3c2pdy8NbUfG1fLRj+BijzMvZ8y7ZA0xFHrF1Hvo
	WcvyoAuItvIHLwet7/RN3PXmQHc5X0d22Zw6u3M5WBXLbKft4axzAArB65pgdfkaKuX9
	Fw4Q==
X-Received: by 10.152.37.166 with SMTP id z6mr1794926laj.70.1400680594078;
	Wed, 21 May 2014 06:56:34 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	xa9sm1867681lbb.36.2014.05.21.06.56.32 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 21 May 2014 06:56:32 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 21 May 2014 15:56:36 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: sujith h <sujith.h@gmail.com>
Message-ID: <20140521135636.GF2424@jama>
References: <CADyYWL=XuegRtbJsdOZv11Fbi6UQy1_TdpLPzWkijEvuL6=beg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADyYWL=XuegRtbJsdOZv11Fbi6UQy1_TdpLPzWkijEvuL6=beg@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [meta-qt5] Warnings while building Qt recipes
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
X-List-Received-Date: Wed, 21 May 2014 13:56:36 -0000
X-Groupsio-MsgNum: 53411
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OFj+1YLvsEfSXdCH"
Content-Disposition: inline

--OFj+1YLvsEfSXdCH
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 21, 2014 at 06:19:02PM +0530, sujith h wrote:
> Hi,
>=20
> While building qtbase, qtsensors, qtmultimedia, qtquick1 etc I was getting
> lot of warnings. Below is the warning messages I were gtting:
>=20
> WARNING: QA Issue: qtbase-examples-dev: found library in wrong location:
> /usr/share/qt5/examples/widgets/tools/echoplugin/plugin/libechoplugin.so
> qtbase-examples-dev: found library in wrong location:
> /usr/share/qt5/examples/widgets/tools/plugandpaint/plugins/libpnp_extrafi=
lters.so
> qtbase-examples-dev: found library in wrong location:
> /usr/share/qt5/examples/widgets/tools/styleplugin/styles/libsimplestylepl=
ugin.so
> qtbase-examples-dbg: found library in wrong location:
> /usr/share/qt5/examples/widgets/tools/echoplugin/plugin/.debug/libechoplu=
gin.so
> qtbase-examples-dbg: found library in wrong location:
> /usr/share/qt5/examples/widgets/tools/plugandpaint/plugins/.debug/libpnp_=
extrafilters.so
> qtbase-examples-dbg: found library in wrong location:
> /usr/share/qt5/examples/widgets/tools/styleplugin/styles/.debug/libsimple=
styleplugin.so
> WARNING: QA Issue: qtdeclarative-examples-dev: found library in wrong
> location:
> /usr/share/qt5/examples/qml/qmlextensionplugins/imports/TimeExample/libqm=
lqtimeexampleplugin.so
> qtdeclarative-examples-dev: found library in wrong location:
> /usr/share/qt5/examples/quick/customitems/painteditem/TextBalloonPlugin/l=
ibqmltextballoonplugin.so
> qtdeclarative-examples-dev: found library in wrong location:
> /usr/share/qt5/examples/quick/imageprovider/ImageProviderCore/libqmlimage=
providerplugin.so
> qtdeclarative-examples-dbg: found library in wrong location:
> /usr/share/qt5/examples/qml/qmlextensionplugins/imports/TimeExample/.debu=
g/libqmlqtimeexampleplugin.so
> qtdeclarative-examples-dbg: found library in wrong location:
> /usr/share/qt5/examples/quick/customitems/painteditem/TextBalloonPlugin/.=
debug/libqmltextballoonplugin.so
> qtdeclarative-examples-dbg: found library in wrong location:
> /usr/share/qt5/examples/quick/imageprovider/ImageProviderCore/.debug/libq=
mlimageproviderplugin.so
> WARNING: The recipe qtsystems is trying to install files into a shared ar=
ea
> when those files already exist. Those files and their manifest location a=
re:
>=20
> /home/sujith/MEL7/mastertest/atpomap5/tmp/sysroots/mel-omap5-evm/usr/shar=
e/qt5/examples/
> examples.pro
>    Matched in manifest-mel-omap5-evm-qtbase.populate_sysroot
> Please verify which package should provide the above files.
> WARNING: QA Issue: qtsensors-examples-dbg: found library in wrong locatio=
n:
> /usr/share/qt5/examples/sensors/grue/.debug/libgruesensor.so.1.0.0
> qtsensors-examples-dbg: found library in wrong location:
> /usr/share/qt5/examples/sensors/grue/Grue/.debug/libdeclarative_grue.so
> qtsensors-examples-dbg: found library in wrong location:
> /usr/share/qt5/examples/sensors/grue/sensors/.debug/libqtsensors_grue.so
> qtsensors-examples-dbg: found library in wrong location:
> /usr/share/qt5/examples/sensors/sensor_explorer/Explorer/.debug/libdeclar=
ative_explorer.so
> qtsensors-examples-dev: found library in wrong location:
> /usr/share/qt5/examples/sensors/grue/libgruesensor.so
> qtsensors-examples-dev: found library in wrong location:
> /usr/share/qt5/examples/sensors/grue/Grue/libdeclarative_grue.so
> qtsensors-examples-dev: found library in wrong location:
> /usr/share/qt5/examples/sensors/grue/sensors/libqtsensors_grue.so
> qtsensors-examples-dev: found library in wrong location:
> /usr/share/qt5/examples/sensors/sensor_explorer/Explorer/libdeclarative_e=
xplorer.so
> qtsensors-examples: found library in wrong location:
> /usr/share/qt5/examples/sensors/grue/libgruesensor.so.1.0
> qtsensors-examples: found library in wrong location:
> /usr/share/qt5/examples/sensors/grue/libgruesensor.so.1.0.0
>=20
> qtsensors-examples: found library in wrong location:
> /usr/share/qt5/examples/sensors/grue/libgruesensor.so.1
>=20
> WARNING: QA Issue: qtmultimedia-examples-dbg: found library in wrong
> location:
> /usr/share/qt5/examples/multimedia/spectrum/.debug/libfftreal.so.1.0.0
> qtmultimedia-examples-dev: found library in wrong location:
> /usr/share/qt5/examples/multimedia/spectrum/libfftreal.so
> qtmultimedia-examples: found library in wrong location:
> /usr/share/qt5/examples/multimedia/spectrum/libfftreal.so.1
> qtmultimedia-examples: found library in wrong location:
> /usr/share/qt5/examples/multimedia/spectrum/libfftreal.so.1.0
> qtmultimedia-examples: found library in wrong location:
> /usr/share/qt5/examples/multimedia/spectrum/libfftreal.so.1.0.0
> WARNING: QA Issue: qtquick1-examples-dbg: found library in wrong location:
> /usr/share/qt5/examples/declarative/cppextensions/plugins/.debug/libqmlqw=
idgetsplugin.so
> qtquick1-examples-dbg: found library in wrong location:
> /usr/share/qt5/examples/declarative/cppextensions/plugins/org/qtproject/T=
imeExample/.debug/libqmlqtimeexampleplugin.so
> qtquick1-examples-dbg: found library in wrong location:
> /usr/share/qt5/examples/declarative/cppextensions/imageprovider/ImageProv=
iderCore/.debug/libqmlimageproviderplugin.so
> qtquick1-examples-dbg: found library in wrong location:
> /usr/share/qt5/examples/declarative/tutorials/gettingStarted/filedialog/.=
debug/libFileDialog.so
> qtquick1-examples-dbg: found library in wrong location:
> /usr/share/qt5/examples/declarative/tutorials/extending/chapter6-plugins/=
=2Edebug/libchapter6-plugins.so
> qtquick1-examples-dev: found library in wrong location:
> /usr/share/qt5/examples/declarative/cppextensions/plugins/libqmlqwidgetsp=
lugin.so
> qtquick1-examples-dev: found library in wrong location:
> /usr/share/qt5/examples/declarative/cppextensions/plugins/org/qtproject/T=
imeExample/libqmlqtimeexampleplugin.so
> qtquick1-examples-dev: found library in wrong location:
> /usr/share/qt5/examples/declarative/cppextensions/imageprovider/ImageProv=
iderCore/libqmlimageproviderplugin.so
>=20
> qtquick1-examples-dev: found library in wrong location:
> /usr/share/qt5/examples/declarative/tutorials/gettingStarted/filedialog/l=
ibFileDialog.so
>=20
> qtquick1-examples-dev: found library in wrong location:
> /usr/share/qt5/examples/declarative/tutorials/extending/chapter6-plugins/=
libchapter6-plugins.so
>=20
>=20
>=20
>=20
> To overcome this I gave:
>=20
> WARN_QA :=3D "${@oe_filter_out('libdir', WARN_QA, d)}"
>=20
> May I know a better option to resolve this warnings?

See INSANE_SKIP variable.

>=20
> Thanks,
> Sujith H
>=20
> --=20
> =E0=B4=B8=E0=B5=81=E0=B4=9C=E0=B4=BF=E0=B4=A4=E0=B5=8D =E0=B4=B9=E0=B4=B0=
=E0=B4=BF=E0=B4=A6=E0=B4=BE=E0=B4=B8=E0=B4=A8=E0=B5=8D
> Bangalore
> <Project>Contributor to KDE project
> http://fci.wikia.com/wiki/Anti-DRM-Campaign
> <Blog> http://sujithh.info

> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--OFj+1YLvsEfSXdCH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlN8sJQACgkQN1Ujt2V2gByykACfZlJ3WBEe0IqroUHWS3yLxgGk
G9AAnR7vxVSgtS3ktdadIlcnZzymNzwo
=+BnB
-----END PGP SIGNATURE-----

--OFj+1YLvsEfSXdCH--
