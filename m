Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id EEE30788FF
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jul 2018 21:46:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id D5A751848E;
	Wed,  4 Jul 2018 23:46:53 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id jNfDg26Ey3Lj; Wed,  4 Jul 2018 23:46:53 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id EEABC18556;
	Wed,  4 Jul 2018 23:46:52 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DA7C91E099;
	Wed,  4 Jul 2018 23:46:52 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CE9521E096;
	Wed,  4 Jul 2018 23:46:52 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Wed,  4 Jul 2018 23:46:52 +0200 (CEST)
Received: from XBOX01.axis.com (xbox01.axis.com [10.0.5.15])
	by seth.se.axis.com (Postfix) with ESMTP id C202B26B6;
	Wed,  4 Jul 2018 23:46:52 +0200 (CEST)
Received: from xbox12.axis.com (10.0.5.26) by XBOX01.axis.com (10.0.5.15) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Wed, 4 Jul 2018 23:46:52 +0200
Received: from XBOX02.axis.com (10.0.5.16) by xbox12.axis.com (10.0.5.26) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Wed, 4 Jul 2018 23:46:52 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1365.000; Wed, 4 Jul 2018 23:46:52 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	OE-core <openembedded-core@lists.openembedded.org>,
	Olof Johansson <olofjn@axis.com>
Thread-Topic: [OE-core] [PATCH] rpm: Avoid leaking temporary scriplet files
Thread-Index: AQHUDGbRtg5uQUcSh0Gznw0gTT9wcKRw1YuAgAA4agCAACregIAABlCAgAD4ygCABZaUAIAAcLGAgAURnACAAAjWAIACS+/g
Date: Wed, 4 Jul 2018 21:46:52 +0000
Message-ID: <a5d95932f8e04fb497081c1d4533f1f9@XBOX02.axis.com>
References: <20180625092738.17962-1-olofjn@axis.com>
	<CANNYZj_kMAYH6=EcXM4ACwZhUp3qzzZdv9k6nev-v2oitWO6SQ@mail.gmail.com>
	<7693ed11-5b51-52f6-08f9-4e4f9b76fa90@windriver.com>
	<CANNYZj-MKfxraD-Ho6_Rej3R8dXSAWo3-JtZvQ4SanH183uWvA@mail.gmail.com>
	<CANNYZj_tSbtCh13rCUVYW0iqozQ65q+OufCgVGSW96J11wibEA@mail.gmail.com>
	<CANNYZj-8KYbZw-kcaAU0DQNd9=Lmy4eog75iY+6rtr2as5hEDA@mail.gmail.com>
	<20180629235346.qsg3sjhpsaqqqcxi@axis.com>
	<CANNYZj_t-68JsYddLZDu+8JMBCDggtNLKEEMFLpafDFfwn1WgQ@mail.gmail.com>
	<20180703120126.2xrdx77jwcvvfn5b@axis.com>
	<CANNYZj9ocLf4uQXwnLWUZB3UHReFxcv4i0Obzjzfj7=UeVuw9g@mail.gmail.com>
In-Reply-To: <CANNYZj9ocLf4uQXwnLWUZB3UHReFxcv4i0Obzjzfj7=UeVuw9g@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCH] rpm: Avoid leaking temporary scriplet files
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
X-List-Received-Date: Wed, 04 Jul 2018 21:46:54 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Once this hits master, it should also be cherry-picked to Rocko and Sumo.=20
Should be straightforward as the patch hasn't changed since it was=20
introduced.

//Peter

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Alexander Kanavin
> Sent: den 3 juli 2018 14:33
> To: OE-core <openembedded-core@lists.openembedded.org>; Olof Johansson
> <Olof.Johansson@axis.com>
> Subject: Re: [OE-core] [PATCH] rpm: Avoid leaking temporary scriplet
> files
>=20
> Thanks, looks good now!
>=20
> Alex
>=20
> 2018-07-03 14:01 GMT+02:00 Olof Johansson <olof.johansson@axis.com>:
> > On 18-06-30 08:37 +0200, Alexander Kanavin wrote:
> >> Ideally, "/" should've been replaced with rpmtsRootDir(ts), but ts
> is
> >> not accessible from the function, or from its parent, or parent
> >> parent. So yes, I concede this would be too invasive to pass that
> down
> >> the call stack. So if you can amend the above patch of mine with
> your
> >> change, commit message, and SOB, that should be best. These changes
> >> really belong together, as a custom fix for the oe build
> environment.
> >
> > Thanks for the feedback, I just sent a v2 of the patch. Hope it
> > is in line with what you asked for.
> >
> > --
> > olofjn
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

