Return-Path: <prvs=1793cb2ed=Mikko.Rapeli@bmw.de>
Received: from esa2.bmw.c3s2.iphmx.com (esa2.bmw.c3s2.iphmx.com
	[68.232.133.169])
	by mail.openembedded.org (Postfix) with ESMTP id 571487F4F1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Oct 2019 07:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
	t=1570693308; x=1602229308;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-id:content-transfer-encoding: mime-version;
	bh=M9OHxi1jSVj59eFDL8jHfARFGuytzIPhcNi1KBqFiiw=;
	b=X7GOxM22sMCKiuT72C9JT8EGdiDepARpjkU3kwM7on5MaPjNzS8C/FBB
	ElN9GxgsvmeAFHWUDOPoFlNlRH6eXHH/kbgp8YPtQYb+l8dFI/oMDqtGs
	n9dJ7/0n1NpzCXBB5R8MnY5PPQrTQ6hAygdaxCZXD5Ur6Pamltqtg5VrU s=;
IronPort-SDR: FmWEm66C8Tyo4cBJXjos22yF5R+ndeeEBgMopPWZFsD8Px+H+HkbiYwrPmX5sI5hWBwRasyZkr
	51NrVviXQsr4fHcDiJiLNgOwNLX2tNbpVisugCnT8+3xfqJxAavqZK+76sknV1jEeMPN3xBul9
	IB6BvoNpaEcJsE67LOD+WNYCraph2TWJ13a2utOWVy0vGLJMO/A5MKe6hcH5+BeFlMOpu+0Pfq
	fMBXM1LHwPSiKl7MVBDz53t/IzKfgrxSJGX4W2ZBhXqv/YBE+uCdeepAM4OZW1W1HPxaM3E5d5
	klA=
Received: from esagw6.bmwgroup.com (HELO esagw6.muc) ([160.46.252.49]) by
	esa2.bmw.c3s2.iphmx.com with ESMTP/TLS; 10 Oct 2019 09:41:46 +0200
Received: from esabb2.muc ([160.50.100.34])  by esagw6.muc with ESMTP/TLS;
	10 Oct 2019 09:41:45 +0200
Received: from smucm10l.bmwgroup.net (HELO smucm10l.europe.bmw.corp)
	([160.48.96.48])
	by esabb2.muc with ESMTP/TLS; 10 Oct 2019 09:41:45 +0200
Received: from smucm10k.europe.bmw.corp (160.48.96.47) by
	smucm10l.europe.bmw.corp
	(160.48.96.48) with Microsoft SMTP Server (TLS;
	Thu, 10 Oct 2019 09:41:44 +0200
Received: from smucm10k.europe.bmw.corp ([160.48.96.47]) by
	smucm10k.europe.bmw.corp ([160.48.96.47]) with mapi id 15.00.1473.005;
	Thu, 10 Oct 2019 09:41:44 +0200
From: <Mikko.Rapeli@bmw.de>
To: <alex.kanavin@gmail.com>
Thread-Topic: [OE-core] [RFC PATCH 2/2] license_image.bbclass: check and
	reject packages which have incompatible licenses
Thread-Index: AQHVfs2QF9bQX1hQXk2MUAa9rMv5P6dSk/MAgADJPgA=
Date: Thu, 10 Oct 2019 07:41:44 +0000
Message-ID: <20191010074144.GF2964@hiutale>
References: <20191009144447.86018-1-alex.kanavin@gmail.com>
	<20191009144447.86018-2-alex.kanavin@gmail.com>
	<CABcZAN=fzjUJuKV44b-gpeOMW--w1icr4tzeFRONmJ2zYmLYxA@mail.gmail.com>
	<CANNYZj_AC=6LdUgvW7DZ=gJzDwejnEJX0WpJztoCiTXkX08vEQ@mail.gmail.com>
In-Reply-To: <CANNYZj_AC=6LdUgvW7DZ=gJzDwejnEJX0WpJztoCiTXkX08vEQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [192.168.221.34]
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC PATCH 2/2] license_image.bbclass: check and reject packages which have incompatible licenses
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
X-List-Received-Date: Thu, 10 Oct 2019 07:41:45 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <95700C3833514E43AB1A9D7019B8D25F@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 09, 2019 at 09:41:28PM +0200, Alexander Kanavin wrote:
> It wouldn't be too hard to add a condition that checks the (image-specifi=
c)
> whitelist, I just wanted to gather a bit of feedback for the overall idea=
 :)

I like the idea. I'm building images with e.g. GPLv3 forbidden but I enable=
 building
lots of GPLv3 components because they are needed in e.g. ptests. Resulting =
distro
config snippet is large with lots of lines like:

WHITELIST_GPL-3.0 +=3D "autoconf"
PACKAGE_EXCLUDE +=3D "autoconf-dbg autoconf-staticdev autoconf-dev autoconf=
-doc autoconf-locale autoconf"
WHITELIST_GPL-3.0 +=3D "ccache"
PACKAGE_EXCLUDE +=3D "ccache-sdktests-dbg ccache-sdktests ccache-dbg ccache=
-staticdev ccache-dev ccache-doc ccache-locale ccache"

In testing then I start with the pure product image without GPLv3 component=
s and extend it
with extra packages which are needed for the test execution. I have separat=
e product
feature and SW component test phases. Only in the latter case target SW is =
changed before
test execution.

I want to avoid building separate test images with GPLv3, because in the pa=
st
test vs. product images resulted in only the test images being actually tes=
ted.

But I can see that having separate product and test images from a single bu=
ild could
be useful.

Thanks for proposing this patch!

-Mikko=

