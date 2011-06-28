Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QbTpp-0006zS-HG
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Jun 2011 10:39:53 +0200
Received: by wwi18 with SMTP id 18so354901wwi.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jun 2011 01:36:12 -0700 (PDT)
Received: by 10.227.177.12 with SMTP id bg12mr6384372wbb.59.1309250172284;
	Tue, 28 Jun 2011 01:36:12 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id fu18sm2119435wbb.44.2011.06.28.01.36.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 28 Jun 2011 01:36:11 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4E098D41.4060808@intel.com>
Date: Tue, 28 Jun 2011 10:36:05 +0200
Message-Id: <D552A863-6204-4F54-9B5A-07DC755B830E@dominion.thruhere.net>
References: <cover.1309246787.git.edwin.zhai@intel.com>	<7bf8a7025dddd0b251ff9c37a55f28b7e099fad7.1309246787.git.edwin.zhai@intel.com>
	<E91A85C8-4484-4C15-A75D-3A87EB475B4F@dominion.thruhere.net>
	<4E098D41.4060808@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH 2/3] webkit-gtk: recommends glib-networking to	access https web page
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
X-List-Received-Date: Tue, 28 Jun 2011 08:39:53 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 28 jun 2011, om 10:13 heeft Zhai, Edwin het volgende geschreven:

>=20
>=20
> Koen Kooi wrote:
>>=20
>> Op 28 jun 2011, om 09:42 heeft edwin.zhai@intel.com het volgende =
geschreven:
>>=20
>> > From: Zhai Edwin <edwin.zhai@intel.com>
>> >
>> > [YOCTO #1037] got fixed
>> >
>> > Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
>> > ---
>> > meta/recipes-sato/webkit/webkit-gtk_svn.bb |    3 +++
>> > 1 files changed, 3 insertions(+), 0 deletions(-)
>> >
>> > diff --git a/meta/recipes-sato/webkit/webkit-gtk_svn.bb =
b/meta/recipes-sato/webkit/webkit-gtk_svn.bb
>> > index 6d134ad..c9ded4e 100644
>> > --- a/meta/recipes-sato/webkit/webkit-gtk_svn.bb
>> > +++ b/meta/recipes-sato/webkit/webkit-gtk_svn.bb
>> > @@ -10,6 +10,9 @@ LIC_FILES_CHKSUM =3D =
"file://WebCore/rendering/RenderApplet.h;endline=3D22;md5=3Dfb969
>> > DEPENDS =3D "enchant gnome-keyring libsoup-2.4 curl icu libxml2 =
cairo libxslt libxt libidn gnutls gtk+ gstreamer gst-plugins-base =
flex-native gperf-native perl-native-runtime sqlite3"
>>=20
>> > DEPENDS_darwin8 =3D "curl icu libxml2 cairo libxslt libidn gnutls =
gtk+ gstreamer flex-native gperf-native perl-native-runtime sqlite3"
>>=20
>> >
>> > +# To access ssl web pages
>> > +RRECOMMENDS_${PN} +=3D "glib-networking"
>>=20
>> Since webkit uses soup and curl, wouldn't it be better to add the =
RRECOMMENDS to soup instead? Webkit knows nothing about GIO.
>>=20
>=20
> I have considered it. But the drawback is that many other recipes =
depend on libsoup, so glib-networking will be built =
unnecessarily(webkit-gtk is not in core-image-sato). glib-netwoking just =
provides some plug-in style modules, so I think RRECOMMENDS from =
webkit-gtk should be okay( not RDEPENDS).
>=20
> In future, other recipes besides webkit-gtk may ask for =
glib-networking, maybe we can change it that time?
> What's your opinion?

I'd either put it in the lib that uses it (soup) or the app that needs =
it (web-webkit), something in between is just confusing.

regards,

Koen=


