Received: from [8.20.30.154] (helo=mx1.devonhealth.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <igeiser@devonit.com>) id 1U0Z9f-0000Xu-BZ
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Jan 2013 16:00:53 +0100
Received: from emfserver.devonintlgroup.com (10.0.7.48) by mx1.devonhealth.com
	(10.0.20.154) with Microsoft SMTP Server id 8.3.213.0;
	Wed, 30 Jan 2013 09:43:52 -0500
Received: from [10.0.2.240] by emfserver.devonintlgroup.com over TLS secured
	channel with ESMTP (Devon Health Services, Inc Email Firewall SMTP Relay
	(Email Firewall v6.5)); Wed, 30 Jan 2013 09:43:49 -0500
X-Server-Uuid: 6CB55748-6642-4D3C-9211-397BC4E7A815
Received: from SOUTHSIDE.devonintlgroup.com ([10.0.2.2]) by
	kingston.devonintlgroup.com ([10.0.2.240]) with mapi; Wed, 30 Jan 2013
	09:43:49 -0500
From: Ian Geiser <igeiser@devonit.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Wed, 30 Jan 2013 09:43:48 -0500
Thread-Topic: [OE-core] [PATCH 17/17] directfb: Explictly disable mesa
Thread-Index: Ac3+9iUCgTzr5855TJa7ORuAR4kJ+wAAd71A
Message-ID: <B57A220D1EE1644685BA9AD5C790D20526BE045DD5@SOUTHSIDE.devonintlgroup.com>
References: <cover.1359554291.git.richard.purdie@linuxfoundation.org>
	<c9683f65462fdbe2c0f3034f1740fd6bad721bf4.1359554291.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <c9683f65462fdbe2c0f3034f1740fd6bad721bf4.1359554291.git.richard.purdie@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-WSS-ID: 7D17EE2F4CW1009231-01-01
Subject: Re: [PATCH 17/17] directfb: Explictly disable mesa
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 30 Jan 2013 15:00:53 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Richard Purdie
> Sent: Wednesday, January 30, 2013 9:01 AM
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 17/17] directfb: Explictly disable mesa
>=20
> Without this, directfb might build with mesa enabled if present.
>=20
Is it possible to make this tunable?  We use directfb with the mesa dri dri=
vers for opengl.  Maybe enable it only if the distro features contains open=
gl?

Thanks!



