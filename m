Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RIbM4-0005yy-Tg
	for openembedded-core@lists.openembedded.org;
	Tue, 25 Oct 2011 09:23:24 +0200
Received: by wyg19 with SMTP id 19so170941wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Oct 2011 00:17:27 -0700 (PDT)
Received: by 10.216.163.203 with SMTP id a53mr7791716wel.35.1319527047426;
	Tue, 25 Oct 2011 00:17:27 -0700 (PDT)
Received: from [10.132.231.241] ([84.241.210.197])
	by mx.google.com with ESMTPS id fi11sm43362617wbb.9.2011.10.25.00.17.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 25 Oct 2011 00:17:25 -0700 (PDT)
References: <cover.1319132699.git.nitin.a.kamble@intel.com>
	<c12754ae1baee14c13a2467e31efd975f7f33258.1319132699.git.nitin.a.kamble@intel.com>
	<20111025070642.GE3602@jama.jama.net>
In-Reply-To: <20111025070642.GE3602@jama.jama.net>
Mime-Version: 1.0 (1.0)
Message-Id: <07537711-5DFF-43FE-8A23-4C173BDA4921@dominion.thruhere.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: iPhone Mail (9A334)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 25 Oct 2011 09:17:11 +0200
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] perl: upgrade from 5.12.3 to 5.14.2
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
X-List-Received-Date: Tue, 25 Oct 2011 07:23:25 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



Op 25 okt. 2011 om 09:06 heeft Martin Jansa <martin.jansa@gmail.com> het vol=
gende geschreven:

> On Thu, Oct 20, 2011 at 10:47:08AM -0700, nitin.a.kamble@intel.com wrote:
>> From: Nitin A Kamble <nitin.a.kamble@intel.com>
>>=20
>> parallel build fix patches are not needed as they are upstream now.
>> Got a new set of debian patch set for 5.14.2
>=20
> I know that nobody wants PR bumps and nobody cares so much about upgrade
> paths on target

I care :) But I'm waiting on the python upgrade to go in so I can fix 2 brea=
kages in one go.




> , but after this all perl stuff is still in
>=20
> tmp/sysroots/x86_64-linux/usr/lib/perl-native/perl/5.12.3/
> tmp/sysroots/*/usr/lib/perl/5.12.3
> and also /usr/lib/perl/5.12.3 on target
>=20
> so it won't work until someone manually rebuilds *perl*-native and
> target recipes with perl modules and user opkg install -force-reinstall
> them all..
>=20
> I have just noticed because pulseaudio fails again:
> | checking for perl >=3D 5.8.1... 5.14.2
> | checking for XML::Parser... configure: error: XML::Parser perl module
> is required for intltool
> | + bbfatal 'oe_runconf failed'
> | + echo 'ERROR: oe_runconf failed'
> | ERROR: oe_runconf failed
> | + exit 1
> | ERROR: Function 'do_configure' failed (see
> /OE/shr-core/tmp/work/armv4t-oe-linux-gnueabi/pulseaudio-0.9.23-r6/temp/lo=
g.do_configure.16391
> for further information)
> NOTE: package pulseaudio-0.9.23-r6: task do_configure: Failed
>=20
> This time not because of wrong perl being used..
>=20
> Regards,
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


