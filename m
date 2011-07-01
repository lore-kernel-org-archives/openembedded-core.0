Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QccWr-00047X-8R
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Jul 2011 14:09:01 +0200
Received: by wwi18 with SMTP id 18so2676583wwi.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Jul 2011 05:05:16 -0700 (PDT)
Received: by 10.216.134.67 with SMTP id r45mr2850046wei.44.1309521916631;
	Fri, 01 Jul 2011 05:05:16 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id w8sm1602130wec.0.2011.07.01.05.05.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 01 Jul 2011 05:05:15 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <201107011352.08558.anders@chargestorm.se>
Date: Fri, 1 Jul 2011 14:05:09 +0200
Message-Id: <8E04AE3A-0304-4771-A3F9-C00EA0451205@dominion.thruhere.net>
References: <cover.1309503939.git.anders@chargestorm.se>
	<cf740fbc1c5f26487e14e8959cfc13f085ff95ff.1309503939.git.anders@chargestorm.se>
	<D041C15B-428E-432D-996B-EF7356B38E29@dominion.thruhere.net>
	<201107011352.08558.anders@chargestorm.se>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH v4 7/8] task-base: remove modutils reference.
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
X-List-Received-Date: Fri, 01 Jul 2011 12:09:01 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 1 jul 2011, om 13:52 heeft Anders Darander het volgende geschreven:

>=20
> * Koen Kooi Koen Kooi <koen@dominion.thruhere.net> [07/01/11 09:20 =
AM]:
>> Op 1 jul 2011, om 09:06 heeft Anders Darander het volgende =
geschreven:
>>> Also remove the other kernel24 references.
>>> Make everything dependent on kernel26 default.
>>=20
>> Since there will be only one of each, can we just completely scrap =
there
>> variables and put the items directly in the tasks?
>=20
> Sure, we could do that.
>=20
> One question though, how should I treat=20
>=20
> RRECOMMENDS_task-base-kernel26 =3D "\
>    kernel-module-nls-utf8 \
>    kernel-module-input \
>    kernel-module-uinput \
>    kernel-module-rtc-dev \
>    kernel-module-rtc-proc \
>    kernel-module-rtc-sysfs \
>    kernel-module-rtc-sa1100 \
>    kernel-module-unix"
>=20
> from task-base.bb? Should that part just be new, general
> RRECOMMENDS =3D "\
>    kernel-module-nls-utf8 \
>    kernel-module-input \
>    kernel-module-uinput \
>    kernel-module-rtc-dev \
>    kernel-module-rtc-proc \
>    kernel-module-rtc-sysfs \
>    kernel-module-rtc-sa1100 \
>    kernel-module-unix"?
>=20
> I guess that's the right thing, and I'll create a new pull request =
with that=20
> merged into the last patch.

The above is what I had in mind, but I do question the need for =
rtc-sa1100 in task-base, that should be in the machine.conf as =
MACHINE_EXTRA_RRECOMMENDS or so. But that is outside the scope of this =
patch I guess.

regards,

Koen=


