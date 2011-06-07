Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QU0R4-0007Da-4C
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Jun 2011 19:51:26 +0200
Received: by wwb17 with SMTP id 17so4371807wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Jun 2011 10:48:08 -0700 (PDT)
Received: by 10.227.5.194 with SMTP id 2mr6695579wbw.93.1307468888479;
	Tue, 07 Jun 2011 10:48:08 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id et5sm3732851wbb.67.2011.06.07.10.48.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Jun 2011 10:48:07 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <BANLkTim4y6zp6nMOhNNhfxmZPdYuWjOimA@mail.gmail.com>
Date: Tue, 7 Jun 2011 19:48:05 +0200
Message-Id: <78A72393-6EF4-4508-AD33-AB232EFF50F4@dominion.thruhere.net>
References: <1307102133.2529.260.camel@phil-desktop>
	<1307439362.2529.4741.camel@phil-desktop>
	<BANLkTim4y6zp6nMOhNNhfxmZPdYuWjOimA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH] uclibc: remove PACKAGE_ARCH, fix compilation on i586
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
X-List-Received-Date: Tue, 07 Jun 2011 17:51:26 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 7 jun 2011, om 19:43 heeft Khem Raj het volgende geschreven:

> On Tue, Jun 7, 2011 at 2:36 AM, Phil Blundell <pb@pbcl.net> wrote:
>> Ping?
>=20
> Both changes are fine.
>=20
> change from being machine specific is futuristic it will not work for
> all architectures that
> uclibc supports but is sufficient for what we support/use in oe for =
now.

If uclibc is *really* machine specific then everything that links =
against it should be machine specific as well. Since, as you say, the =
current configs are rather generic we should make that clear by making =
uclibc stop pretending to be machine specific.

regards,

Koen=


