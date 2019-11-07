Return-Path: <prvs=20756b77e=Mikko.Rapeli@bmw.de>
Received: from esa7.bmw.c3s2.iphmx.com (esa7.bmw.c3s2.iphmx.com
	[68.232.133.109])
	by mail.openembedded.org (Postfix) with ESMTP id 95A877F685
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Nov 2019 09:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
	t=1573118408; x=1604654408;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-id:content-transfer-encoding: mime-version;
	bh=VU1/3fgUnVIw2XMibTO9v3NQT/beFCXlrPNy4dQPk54=;
	b=kRk56viOX830SFi37VHGQ4nOXVeKpCas7px/OvAn55m3/s+9R/EDY24W
	IhQrqSRKwyOYWI2khs7bDgq9TatKvrGnKT03vRW+4QydLDmk4heaNK++3
	M6hF3OCfW2woKWys0NWdsDnwvut6ilchZj90ABw9CMdwwFSI1oy5no4qZ M=;
IronPort-SDR: of1gvUjhO9aswo20ziP+yeazfe8pWcmzJA5yIUL0XiNg8JZ/rWO5ZenbXzp/PoNFnl7W/pxaCq
	K/VB6KzLnyBfSEHr3M2gEeX7/Nr+nlNtJQYrajI9o0hk0/n98KPmH3SwH/QPzy8JEeSS8RECXr
	s8b5AxYRscL10poidJYrHJdXPZujGsKt7IvDXx2Q8JyOQr9JCYWVWshPV0X6zVN6XTTAYAz3SW
	TWQ0yp4I5e6czVb8Vap9/YgVUO8JN7PaoopUbVO/FKHLOzzRcjDD+ZhYYfLBcWClNOnJBeFYSX
	kKY=
Received: from esagw3.bmwgroup.com (HELO esagw3.muc) ([160.46.252.35]) by
	esa7.bmw.c3s2.iphmx.com with ESMTP/TLS; 07 Nov 2019 10:14:05 +0100
Received: from esabb1.muc ([160.50.100.31])  by esagw3.muc with ESMTP/TLS;
	07 Nov 2019 10:14:05 +0100
Received: from smucm10m.bmwgroup.net (HELO smucm10m.europe.bmw.corp)
	([160.48.96.49])
	by esabb1.muc with ESMTP/TLS; 07 Nov 2019 10:14:05 +0100
Received: from smucm10k.europe.bmw.corp (160.48.96.47) by
	smucm10m.europe.bmw.corp
	(160.48.96.49) with Microsoft SMTP Server (TLS;
	Thu, 7 Nov 2019 10:14:05 +0100
Received: from smucm10k.europe.bmw.corp ([160.48.96.47]) by
	smucm10k.europe.bmw.corp ([160.48.96.47]) with mapi id 15.00.1473.005;
	Thu, 7 Nov 2019 10:14:04 +0100
From: <Mikko.Rapeli@bmw.de>
To: <akuster808@gmail.com>
Thread-Topic: [OE-core] [PATCH RFC CFH][sumo 00/47] CVE check backport
Thread-Index: AQHVlLhK4pyyLXeJaESUhX6AksA91ad+nP6AgADANAA=
Date: Thu, 7 Nov 2019 09:14:04 +0000
Message-ID: <20191107091404.GG2398@hiutale>
References: <cover.1573047194.git.mikko.rapeli@bmw.de>
	<ec8a8c61-25a0-7e87-efee-b76e6c954d07@gmail.com>
In-Reply-To: <ec8a8c61-25a0-7e87-efee-b76e6c954d07@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH RFC CFH][sumo 00/47] CVE check backport
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
X-List-Received-Date: Thu, 07 Nov 2019 09:20:07 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <4077BB9FF013B64590F578C9088BD08B@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Nov 06, 2019 at 01:46:09PM -0800, akuster808 wrote:
> Hello Mikko;
<snip>=20
> I have collected other patches for sumo and built them locally but I
> have no way to inform Richard they pass an AB=A0 builds or automated
> testing for them to get=A0 into mainline sumo.
>=20
> I am placing them into
> https://git.openembedded.org/openembedded-core-contrib/log/?h=3Dstable/su=
mo-community

Wow, I had no idea of this tree. Looks like the content is quite liberal
with version updates which may be necessary to maintain decent CVE fix stat=
us
with the resources at hand.

What is the relationship to thud?

Comparing oe-core sumo branch to contrib/stable/sumo-community shows for ex=
ample:

--- a/meta-selftest/conf/layer.conf
+++ b/meta-selftest/conf/layer.conf
@@ -9,4 +9,4 @@ BBFILE_COLLECTIONS +=3D "selftest"
 BBFILE_PATTERN_selftest =3D "^${LAYERDIR}/"
 BBFILE_PRIORITY_selftest =3D "5"
=20
-LAYERSERIES_COMPAT_selftest =3D "sumo"
+LAYERSERIES_COMPAT_selftest =3D "thud"

--- a/meta-skeleton/conf/layer.conf
+++ b/meta-skeleton/conf/layer.conf
@@ -14,4 +14,4 @@ LAYERVERSION_skeleton =3D "1"
=20
 LAYERDEPENDS_skeleton =3D "core"
=20
-LAYERSERIES_COMPAT_skeleton =3D "sumo"
+LAYERSERIES_COMPAT_skeleton =3D "thud"

--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -7,12 +7,12 @@ BBFILE_COLLECTIONS +=3D "core"
 BBFILE_PATTERN_core =3D "^${LAYERDIR}/"
 BBFILE_PRIORITY_core =3D "5"
=20
-LAYERSERIES_CORENAMES =3D "sumo"
+LAYERSERIES_CORENAMES =3D "thud"
=20
 # This should only be incremented on significant changes that will
 # cause compatibility issues with other layers
 LAYERVERSION_core =3D "11"
-LAYERSERIES_COMPAT_core =3D "sumo"
+LAYERSERIES_COMPAT_core =3D "thud"
=20
...

Cheers,

-Mikko=

