Return-Path: <prvs=094023b04=Mikko.Rapeli@bmw.de>
Received: from esa4.bmw.c3s2.iphmx.com (esa4.bmw.c3s2.iphmx.com
	[68.232.139.62])
	by mail.openembedded.org (Postfix) with ESMTP id 559F27ECAA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2019 12:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
	t=1563366282; x=1594902282;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-id:content-transfer-encoding: mime-version;
	bh=DwH5IRvumlTKnj8qu7ekfTXGqcxDMtH8NU88CepzPwU=;
	b=YmCSF/JBSk0+gVNtUmfau0gghMab4CsbLWPV6Dx6TeK4Wo05a+i7P+7Q
	to1C6EZQ4dq84cgvd0UWkRxdfyKD3swkpzkVOCXVHXomrDFU8y+IE38mo
	cGCWsr5Zg7amAbfdwkChhsHMKuFpMRu1/6sx1Uy8hujr91ulV+TnR2Ty1 k=;
IronPort-SDR: zCRP0aHesYGMQcDzvfUDZ+FjeEg0IcF5ExQX6TYfK7VN2hIeEVMgR97HjqtULb+nbWEFan4QfQ
	xxvwgaqKGeB1SZbxSC4j2zLqYF2gIieae8Rywu+TW+t4xo9YxTP8r/hskTg/2Nt/4zMGfglFwG
	1pff5h9RfU/mAvg69M5Zy5Xd3VkigsxeAVYPHNRdNhatSeX1RW5y9Twx47BFvN3kouFY23cVRT
	wY2eczeVGy/S6t574XDWQ7mU2jFNGxUNx4ugzIPqM/XOPhhU+jDMowJH75+x0FfyU7niDcGNH7
	U1s=
Received: from esagw5.bmwgroup.com (HELO esagw5.muc) ([160.46.252.46]) by
	esa4.bmw.c3s2.iphmx.com with ESMTP/TLS; 17 Jul 2019 14:24:41 +0200
Received: from esabb4.muc ([160.50.100.33])  by esagw5.muc with ESMTP/TLS;
	17 Jul 2019 14:24:40 +0200
Received: from smucm10m.bmwgroup.net (HELO smucm10m.europe.bmw.corp)
	([160.48.96.49])
	by esabb4.muc with ESMTP/TLS; 17 Jul 2019 14:24:40 +0200
Received: from smucm10k.europe.bmw.corp (160.48.96.47) by
	smucm10m.europe.bmw.corp
	(160.48.96.49) with Microsoft SMTP Server (TLS;
	Wed, 17 Jul 2019 14:24:39 +0200
Received: from smucm10k.europe.bmw.corp ([160.48.96.47]) by
	smucm10k.europe.bmw.corp ([160.48.96.47]) with mapi id 15.00.1473.005;
	Wed, 17 Jul 2019 14:24:39 +0200
From: <Mikko.Rapeli@bmw.de>
To: <richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [PATCH 1/2] busybox: enable unicode support
Thread-Index: AQHVPH9YnaoGoDRNRUWbTIvMkKnyB6bOj5MAgAALHIA=
Date: Wed, 17 Jul 2019 12:24:39 +0000
Message-ID: <20190717122439.GD3459@hiutale>
References: <1563354517-31850-1-git-send-email-mikko.rapeli@bmw.de>
	<a098852b41fcdb4adcda5060a3fd87694391e0ea.camel@linuxfoundation.org>
In-Reply-To: <a098852b41fcdb4adcda5060a3fd87694391e0ea.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [192.168.221.38]
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] busybox: enable unicode support
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
X-List-Received-Date: Wed, 17 Jul 2019 12:24:40 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <43065C8B721A8840823D6AE185FE5BFA@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 17, 2019 at 12:44:54PM +0100, Richard Purdie wrote:
> On Wed, 2019-07-17 at 12:08 +0300, Mikko Rapeli wrote:
> > While creating and deleting files with unicode or other
> > encodings works, it's annoying when ls and other core utils
> > show questionmarks instead of the unicode characters.
> > In 2019, it's quite common that users of embedded devices
> > based on yocto need unicode support. Debugging a box with
> > unicode encoded file names is a bit annoying when core utils
> > from busybox don't support them.
> >=20
> > The unicode config fragment has the same config as Debian in their
> > deb and udeb builds of version 1:1.30.1-4.
> >=20
> > If developers do not want this or other default yocto features in
> > busybox,
> > or optimize the configuration for size, then they likely run a
> > completely
> > custom configuration. Thus I think it's safe to enable unicode
> > support
> > by default.
> >=20
> > Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
> > ---
> >  meta/recipes-core/busybox/busybox/unicode.cfg | 10 ++++++++++
> >  meta/recipes-core/busybox/busybox_1.31.0.bb   |  1 +
> >  2 files changed, 11 insertions(+)
> >  create mode 100644 meta/recipes-core/busybox/busybox/unicode.cfg
>=20
> Can you give an idea of the size implications of this change?

buildhistory isn't working for me, or maybe it is since the size difference
is zero bytes for busybox binaries and package. tmp has this patch,
tmp_master doesn't:

$ ls -l tmp*/deploy/images/qemux86/tmp/bin/busybox.*
-rwxr-xr-x 1 mcfrisk mcfrisk 612024 Jul 17 10:45 tmp/deploy/images/qemux86/=
tmp/bin/busybox.nosuid
-rwxr-xr-x 1 mcfrisk mcfrisk  54656 Jul 17 10:45 tmp/deploy/images/qemux86/=
tmp/bin/busybox.suid
-rwxr-xr-x 1 mcfrisk mcfrisk 612024 Jul 17 13:56 tmp_master/deploy/images/q=
emux86/tmp/bin/busybox.nosuid
-rwxr-xr-x 1 mcfrisk mcfrisk  54656 Jul 17 13:56 tmp_master/deploy/images/q=
emux86/tmp/bin/busybox.suid

Just to be sure, the files differ:

$ sha1sum tmp*/deploy/images/qemux86/tmp/bin/busybox.*
8866ced8ad8aa335bb5dfc8b229851b6e09397d7  tmp/deploy/images/qemux86/tmp/bin=
/busybox.nosuid
01cb28f1254f4200b005122ce03114b034b3aaec  tmp/deploy/images/qemux86/tmp/bin=
/busybox.suid
91ed5b26083c9b6f944344036b04ebf2aa5af6ff  tmp_master/deploy/images/qemux86/=
tmp/bin/busybox.nosuid
d4a3ee35246c0f42ba4f0a8a34cd96269b89e906  tmp_master/deploy/images/qemux86/=
tmp/bin/busybox.suid

buildhistory shows that busybox-dbg PKGSIZE increases from 4523596 to 45463=
96,=20
busybox-ptest PKGSIZE decreases from 458949 to 458908 even when
/usr/lib/busybox/ptest/testsuite/tar.utf8.tar.bz2 is added, busybox-src
PKGSIZE increases from 4130952 to 4163274.

I found that hard to believe so I didn't trust buildhistory anymore.

-Mikko=

