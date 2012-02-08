Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Rv5My-0007XT-3O
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Feb 2012 12:07:24 +0100
Received: by wgbdt11 with SMTP id dt11so6272281wgb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Feb 2012 02:59:21 -0800 (PST)
Received: by 10.216.139.197 with SMTP id c47mr6522975wej.15.1328698760981;
	Wed, 08 Feb 2012 02:59:20 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id bj10sm38927675wib.9.2012.02.08.02.59.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 08 Feb 2012 02:59:20 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <2211037.GJWb2du2Sd@helios>
Date: Wed, 8 Feb 2012 11:59:13 +0100
Message-Id: <5D6A3267-0656-473D-8940-33AE3CEB53C2@dominion.thruhere.net>
References: <CAGiJk9f9Mc06KbPVBcTFi_icr=P3ZGuBYrDT7oH+gC5dKVKpbA@mail.gmail.com>
	<2211037.GJWb2du2Sd@helios>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1251.1)
X-Gm-Message-State: ALoCoQnFa9w7dV1TdDAmO8g0jjQzf+MryF2Xcmaety8EA+dHJQWOWe64fdXbI1LYxnw7dLmTJi3z
Subject: Re: RFC: Porting KDE Plasma Active (WIP)
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
X-List-Received-Date: Wed, 08 Feb 2012 11:07:24 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 8 feb. 2012, om 11:09 heeft Paul Eggleton het volgende geschreven:

> Hi Samuel,
>=20
> On Thursday 02 February 2012 12:50:16 Samuel Stirtzel wrote:
>> for some time now I've been working on a port of Plasma Active, the
>> next generation touch user interface from KDE.
>=20
> This is something I'd been wanting to do as well. I got as far as =
being able=20
> to build cleaned up versions of the KDE recipes we had in OE-Classic =
(not very=20
> many) but that was it. Looks like you're doing really well!

Indeed! The main problem with this kde stuff is that the developers want =
to write everything in QT, so instead of running sed on a file they =
build a qt app to do that. Guess what goes wrong when you want to =
crosscompile it...

regards,

Koen=


