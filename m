Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QtGXY-0007OF-QO
	for openembedded-core@lists.openembedded.org;
	Tue, 16 Aug 2011 12:06:32 +0200
Received: by wwe32 with SMTP id 32so4685357wwe.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Aug 2011 03:01:55 -0700 (PDT)
Received: by 10.216.173.73 with SMTP id u51mr2974561wel.11.1313488915166;
	Tue, 16 Aug 2011 03:01:55 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id fn12sm5255654wbb.21.2011.08.16.03.01.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 16 Aug 2011 03:01:54 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CALT56yOjagzqqBj80DMC5bqhPLBA+nY3LM5+K8XYe0XLyTbn9g@mail.gmail.com>
Date: Tue, 16 Aug 2011 12:01:52 +0200
Message-Id: <1B2857D4-35D1-49D2-A6A5-CACC033BEA32@dominion.thruhere.net>
References: <1313482064-18951-1-git-send-email-dbaryshkov@gmail.com>
	<97823985-D914-4E7A-B47C-4554AE323D76@dominion.thruhere.net>
	<CALT56yOjagzqqBj80DMC5bqhPLBA+nY3LM5+K8XYe0XLyTbn9g@mail.gmail.com>
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
X-Mailer: Apple Mail (2.1244.3)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] binutils-2.20.1: import several patches from Debian
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
X-List-Received-Date: Tue, 16 Aug 2011 10:06:32 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 16 aug. 2011, om 11:44 heeft Dmitry Eremin-Solenikov het volgende =
geschreven:

> On 8/16/11, Koen Kooi <koen@dominion.thruhere.net> wrote:
>>=20
>> Op 16 aug. 2011, om 10:07 heeft Dmitry Eremin-Solenikov het volgende
>> geschreven:
>>=20
>>> Import several patches from Debian to improve --no-add-needed =
handling
>>> vs. weak symbols and branching to weak symbols on arm.
>>=20
>> Out of curiousity, which platforms did you test this on?
>=20
> I'm building sato and systemd-gnome-image for tosa and w/o these
> patches building fails (e.g. during build of musicbrainz). Haven't =
done full
> rebuild, but probably I can do it if you require it. Runtime tested in =
qemu.

I'm doing a full rebuild myself for beagleboard, but it's good to know =
that it works in qemu-arm already=


