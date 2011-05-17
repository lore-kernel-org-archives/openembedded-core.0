Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QMOay-0002V5-I1
	for openembedded-core@lists.openembedded.org;
	Tue, 17 May 2011 20:02:12 +0200
Received: by wye20 with SMTP id 20so657758wye.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2011 10:59:18 -0700 (PDT)
Received: by 10.216.143.7 with SMTP id k7mr859505wej.95.1305655150750;
	Tue, 17 May 2011 10:59:10 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id g58sm404065wen.20.2011.05.17.10.59.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 May 2011 10:59:09 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1305640047.3424.233.camel@rex>
Date: Tue, 17 May 2011 19:59:02 +0200
Message-Id: <DF1B4F7C-51BD-4A6E-8250-86A45F195D28@dominion.thruhere.net>
References: <1305635287.2429.195.camel@phil-desktop>
	<1305640047.3424.233.camel@rex>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [patch] update-rc.d: point SRC_URI to new devel repo
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
X-List-Received-Date: Tue, 17 May 2011 18:02:12 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 17 mei 2011, om 15:47 heeft Richard Purdie het volgende geschreven:

> On Tue, 2011-05-17 at 13:28 +0100, Phil Blundell wrote:
>> handhelds.org cvs is down and doesn't seem to be coming back.
>> update-rc.d now has a new upstream home, point SRC_URI to that.
>>=20
>> Signed-off-by: Phil Blundell <philb@gnu.org>
>> ---
>> meta/recipes-core/update-rc.d/update-rc.d_0.7.bb |    5 ++---
>> 1 files changed, 2 insertions(+), 3 deletions(-)
>>=20
>> diff --git a/meta/recipes-core/update-rc.d/update-rc.d_0.7.bb =
b/meta/recipes-core/update-rc.d/update-rc.d_0.7.bb
>> index accb385..8ba6644 100644
>> --- a/meta/recipes-core/update-rc.d/update-rc.d_0.7.bb
>> +++ b/meta/recipes-core/update-rc.d/update-rc.d_0.7.bb
>> @@ -9,11 +9,10 @@ LIC_FILES_CHKSUM =3D =
"file://update-rc.d;beginline=3D5;endline=3D15;md5=3D148a48321b10eb
>>=20
>> PR =3D "r3"
>>=20
>> -SRC_URI =3D "${HANDHELDS_CVS};module=3Dapps/update-rc.d;tag=3Dr0_7 \
>> +SRC_URI =3D =
"git://github.com/philb/update-rc.d.git;tag=3Dupdate-rc.d_${PV};protocol=3D=
git \
>>            file://add-verbose.patch;apply=3Dyes"
>>=20
>>=20
>=20
> Applied, thanks (when I can push to the repo).
>=20
> I had to apply this manually as something was wrong with this patch...

There's more wrong with this:

NOTE: package update-rc.d-native-0.7-r3: task do_patch: Started
ERROR: Cannot proceed with manual patch resolution - 'xterm -T =
"$TERMWINDOWTITLE" -e $SHELLCMDS' not found. Check TERMCMDRUN variable.
ERROR: Function 'patch_do_patch' failed
ERROR: Logfile of failure stored in: =
/OE/tentacle/build/tmp-angstrom_2010_x-uclibc/work/x86_64-linux/update-rc.=
d-native-0.7-r3/temp/log.do_patch.1324
Log data follows:
| NOTE: Applying patch 'add-verbose.patch' =
(sources/openembedded-core/meta/recipes-core/update-rc.d/update-rc.d/add-v=
erbose.patch)
| ERROR: ld.so: object 'libpseudo.so' from LD_PRELOAD cannot be =
preloaded: ignored.
| xterm Xt error: Can't open display:
| xterm:  DISPLAY is not set
| ERROR: Cannot proceed with manual patch resolution - 'xterm -T =
"$TERMWINDOWTITLE" -e $SHELLCMDS' not found. Check TERMCMDRUN variable.
| ERROR: Function 'patch_do_patch' failed
NOTE: package update-rc.d-native-0.7-r3: task do_patch: Failed



