Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Qb8Ej-0004Eq-2Z
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Jun 2011 11:36:09 +0200
Received: by wyg30 with SMTP id 30so1118924wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jun 2011 02:32:29 -0700 (PDT)
Received: by 10.227.179.14 with SMTP id bo14mr5295622wbb.90.1309167149079;
	Mon, 27 Jun 2011 02:32:29 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id fi5sm3943577wbb.22.2011.06.27.02.32.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 27 Jun 2011 02:32:28 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4E074ABB.80405@gmail.com>
Date: Mon, 27 Jun 2011 11:32:22 +0200
Message-Id: <48356C52-61A1-42BE-92AA-704FB136D8A3@dominion.thruhere.net>
References: <CFB391EB-D84F-4616-887D-DAFAB036EA42@dominion.thruhere.net>
	<4E0699D1.9090308@gmail.com> <4E074ABB.80405@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: gcc-cross-kernel problems
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
X-List-Received-Date: Mon, 27 Jun 2011 09:36:09 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 26 jun 2011, om 17:05 heeft Khem Raj het volgende geschreven:

> On 06/25/2011 07:30 PM, Khem Raj wrote:
>> so in you kernel recipe somewhere patch the below code
>>=20
>> PATH_prepend =3D "${STAGING_BINDIR_TOOLCHAIN}.gcc-cross-kernel:"
>=20
> I guess it has 4.2.1 in the path for you as I see so you might need
>=20
> PATH_prepend =3D "${STAGING_BINDIR_TOOLCHAIN}.gcc-cross-kernel-4.2.1:"

I did it a bit differently and symlinked it into the regular toolchain =
bin and I not get an 'as' error about '-EL' not being a valid option.It =
looks like gcc is calling an unprefixed 'as'. Is this due to =
gcc-cross-kernel being bitrotted, the recipe missing patches or =
something else?

regards,

Koen




