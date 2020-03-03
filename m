Return-Path: <peter.kjellerstedt@axis.com>
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
	by mail.openembedded.org (Postfix) with ESMTP id 1F3346191C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Mar 2020 12:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=axis.com; l=1206; q=dns/txt; s=axis-central1;
	t=1583238774; x=1614774774;
	h=from:to:subject:date:message-id:references:in-reply-to:
	content-transfer-encoding:mime-version;
	bh=vo8M/QCsQLAbUbrTm97xcnDkIJGHQLtAnrqupqlrPNA=;
	b=dfkRS5r9xwX8MpS7yJwrEB+Js1nJzKAO3PMcJYy3JKwr3Kc6S2t6CtUg
	X2Ink5VHWMB+DuR3Q60J+LUq2HnA0qYKwbHsOWOfoqr55Fl1KtzqXLTk5
	+hT8nNThjqAB4seNFEPOujPURULR/HWKyqmxMGpXOFPu1eybzkYrexVH4
	5bbqFBZmz6rD5cE9bwrxX/Kt02FW8CCYtMI/+68Vc6JgxdpXqZ2WplPVz
	aGOvFB8UN+ji9ZGbEkuLB/9vfgWotmrnABXGt8Y4B45CTjdKv2mWA7BRC
	qr7RiHSochAnViqtUchay6qDZBZbIYV8oT151D74kpZhWa7j1v5ebzJEe Q==;
IronPort-SDR: rcBTf4kGsb6RRe7vVcl1ooXC4biA9kc8p2+Be4/zJt4KbY3F1DQfq5LquoMOJSzVKOcM6asEXf
	RWlXj642Cx+caSgZAngkj3AK2t4LgWRux7UdJHf1FTZGQacnxJz2B8zn+3rqR5o1lAMkxs2rJ0
	6w2gWGwI4K3JhjGTHtipcG0V4thxOBFLiughjV2k/cJA11cItOueiOnSIwNxFZ047jIKI6VxKM
	Ifk9pDPEMo8fZRVIRH6NDa4rdUI1+p7oZq3prr9+hrlvACXnm4Pe7SkyQuLFuHf4JE5uvkTs0a
	hO0=
X-IronPort-AV: E=Sophos;i="5.70,511,1574118000"; 
   d="scan'208";a="6040590"
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "rpjday@crashcourse.ca" <rpjday@crashcourse.ca>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] how to cleanly centralize a zillion BBCLASSEXTEND +=
	"nativesdk" settings?
Thread-Index: AQHV8I/SiosnJCtFNkaTaleURDlGTag2zaDw
Date: Tue, 3 Mar 2020 12:32:52 +0000
Message-ID: <52350a7bd080413c9dbc6e1783f14e2c@XBOX03.axis.com>
References: <20200302074035.Horde.5xguZSt_-_Yd241eE1Zo8Pb@crashcourse.ca>
In-Reply-To: <20200302074035.Horde.5xguZSt_-_Yd241eE1Zo8Pb@crashcourse.ca>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Subject: Re: how to cleanly centralize a zillion BBCLASSEXTEND += "nativesdk" settings?
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
X-List-Received-Date: Tue, 03 Mar 2020 12:32:52 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org <openembedded-core=
-
> bounces@lists.openembedded.org> On Behalf Of rpjday@crashcourse.ca
> Sent: den 2 mars 2020 13:41
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] how to cleanly centralize a zillion BBCLASSEXTEND +=3D
> "nativesdk" settings?
>=20
> layer i'm currently perusing has many, many bbappend files, of which
> quite a number are nothing more than the single line:
>=20
>    BBCLASSEXTEND +=3D "nativesdk"
>=20
> literally, at least a hundred append files are like that. so rather
> than clutter up the layer with all those trivial .bbappend files,
> can one cram all that into a single .conf file? as i read it, can i
> do something like:
>=20
>    BBCLASSEXTEND_append_pn-pkg1 =3D " nativesdk"
>    BBCLASSEXTEND_append_pn-pkg2 =3D " nativesdk"
>    ... and on and on ...
>=20
> and toss all that into a distro.conf file or something?
>=20
>    and even if that works, is it considered good coding style?
>=20
> rday

Sounds perfectly fine. We do something similar, but in our case we need=20
to add "native" to BBCLASSEXTEND for a whole bunch of recipes.

//Peter


