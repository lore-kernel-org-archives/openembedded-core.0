Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@beagleboard.org>)
	id 1PyXIv-0001WZ-Mi; Sat, 12 Mar 2011 23:28:57 +0100
Received: by eye27 with SMTP id 27so1097393eye.6
	for <multiple recipients>; Sat, 12 Mar 2011 14:27:18 -0800 (PST)
Received: by 10.213.98.206 with SMTP id r14mr2160757ebn.89.1299967471977;
	Sat, 12 Mar 2011 14:04:31 -0800 (PST)
Received: from [192.168.1.72] (ip51cca9fc.adsl-surfen.hetnet.nl
	[81.204.169.252])
	by mx.google.com with ESMTPS id x54sm4609803eeh.5.2011.03.12.14.04.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 12 Mar 2011 14:04:30 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1082)
From: Koen Kooi <koen@beagleboard.org>
In-Reply-To: <AANLkTimiahf+8xJ_nNePkXzB3Lhton2+5JqquPmruN24@mail.gmail.com>
Date: Sat, 12 Mar 2011 23:03:12 +0100
Message-Id: <EC0F161F-7C09-42FD-929D-67914A54AC25@dominion.thruhere.net>
References: <1299958038-25216-1-git-send-email-otavio@ossystems.com.br>
	<1299958038-25216-6-git-send-email-otavio@ossystems.com.br>
	<AANLkTimiahf+8xJ_nNePkXzB3Lhton2+5JqquPmruN24@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
X-Mailer: Apple Mail (2.1082)
X-Mailman-Approved-At: Sat, 12 Mar 2011 23:32:05 +0100
Cc: Koen Kooi <koen@openembedded.org>,
	openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 05/11] udev (165): move ConsoleKit support to udev-consolekit package
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
X-List-Received-Date: Sat, 12 Mar 2011 22:28:57 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 12 mrt 2011, om 21:21 heeft Otavio Salvador het volgende geschreven:

> On Sat, Mar 12, 2011 at 16:27, Otavio Salvador =
<otavio@ossystems.com.br> wrote:
> ...
>> -PACKAGES =3D+ "libudev libgudev udev-utils"
>> +PACKAGES =3D+ "libudev libgudev udev-utils udev-consolekit"
> ...
>=20
> Koen, can you take a look on this change?
>=20
> It seems Angstrom is the only used of this version and seems better to
> not provide support for consolekit by default so adding it as
> recommends or suggests seems wrong to me.

If someone can quickly explain me what it does then we can see what =
needs to get changed. Without having looked into it I think adding =
RRECOMMENDS_${PN} +=3D "udev-consolekit" to the consolekit recipe should =
fix most possible breakage.

Adding oe-core to CC:

What are the plans in oe-core for udev? There currently is a recipe =
overlayed in meta-oe because I haven't had time to look into the =
differences between the oe-dev and oe-core version. If we're going to =
touch udev we might as well do it properly :)


regards,

Koen



