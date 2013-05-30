Return-Path: <peter.kjellerstedt@axis.com>
Received: from ra.se.axis.com (ra.se.axis.com [195.60.68.13])
	by mail.openembedded.org (Postfix) with ESMTP id A21D660811
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 12:17:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by ra.se.axis.com (Postfix) with ESMTP id 45405349649;
	Thu, 30 May 2013 14:17:12 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ra.se.axis.com
Received: from ra.se.axis.com ([127.0.0.1])
	by localhost (ra.se.axis.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ZnHDM2qnst7b; Thu, 30 May 2013 14:17:11 +0200 (CEST)
Received: from boulder.localdomain (boulder.se.axis.com [10.0.2.104])
	by ra.se.axis.com (Postfix) with ESMTP id F261C11FD9;
	Thu, 30 May 2013 14:17:10 +0200 (CEST)
Received: from boulder.localdomain (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 8BD051198;
	Thu, 30 May 2013 14:14:51 +0200 (CEST)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.localdomain (Postfix) with ESMTP id 80E57A05;
	Thu, 30 May 2013 14:14:51 +0200 (CEST)
Received: from xmail3.se.axis.com (xmail3.se.axis.com [10.0.5.75])
	by thoth.se.axis.com (Postfix) with ESMTP id 7EB9E3405E;
	Thu, 30 May 2013 14:14:51 +0200 (CEST)
Received: from xmail3.se.axis.com ([10.0.5.75]) by xmail3.se.axis.com
	([10.0.5.75]) with mapi; Thu, 30 May 2013 14:14:51 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Thu, 30 May 2013 14:14:50 +0200
Thread-Topic: [OE-core] [PATCH v2 0/4] Fixes for makedevs
Thread-Index: Ac5dE/HAY/72jWY9TDyHXoZ8efXE0AAFtexw
Message-ID: <A612847CFE53224C91B23E3A5B48BAC7986359B025@xmail3.se.axis.com>
References: <cover.1369898198.git.pkj@axis.com>
	<13ef4ac6c35.2760.0f39ed3bcad52ef2c88c90062b7714dc@gmail.com>
In-Reply-To: <13ef4ac6c35.2760.0f39ed3bcad52ef2c88c90062b7714dc@gmail.com>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US, sv-SE
MIME-Version: 1.0
Subject: Re: [PATCH v2 0/4] Fixes for makedevs
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
X-List-Received-Date: Thu, 30 May 2013 12:17:11 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Bernhard Reutner-Fischer [mailto:rep.dot.nop@gmail.com]
> Sent: den 30 maj 2013 11:02
> To: Peter Kjellerstedt; openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH v2 0/4] Fixes for makedevs
>=20
> On 30 May 2013 09:19:54 Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> wrote:
> > When I wanted to create devices from a package I stumbled upon a
> couple
> > of problems with the makedevs program. Most notable was that it
> failed
> > to set the correct uid/gid for devices created as part of a block
> (i.e.,
> > with a count > 0).
> >
> > And now with Signed-off-by lines, as requested.
>=20
> Are these appropriate for or fixed already in upstream, I.e. Busybox?

I took a look at makdevs.c in BusyBox, and as far as I can tell=20
that version already has the relevant fixes.=20

It also made me notice another mistake in the current OE version=20
(it loops from start to count-1 rather than start to start+count-1)...
I will send an updated version of the patch series that fixes this.

//Peter


