Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QUhH8-0002cR-2I
	for openembedded-core@lists.openembedded.org;
	Thu, 09 Jun 2011 17:36:02 +0200
Received: by wwb17 with SMTP id 17so1522732wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jun 2011 08:32:42 -0700 (PDT)
Received: by 10.227.196.82 with SMTP id ef18mr962268wbb.114.1307633562405;
	Thu, 09 Jun 2011 08:32:42 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id en1sm1310116wbb.35.2011.06.09.08.32.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 09 Jun 2011 08:32:41 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <BANLkTik3Th6hbkg9jjipYOmjp83cWmssKw@mail.gmail.com>
Date: Thu, 9 Jun 2011 17:32:39 +0200
Message-Id: <2862CB86-0B37-4279-A3F4-C8A63FA386C8@dominion.thruhere.net>
References: <233337C7-346F-4E05-887C-776008F90E5F@dominion.thruhere.net>
	<BANLkTik3Th6hbkg9jjipYOmjp83cWmssKw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: List of bbappends without matching recipes
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
X-List-Received-Date: Thu, 09 Jun 2011 15:36:02 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 9 jun 2011, om 17:24 heeft Bruce Ashfield het volgende geschreven:

> On Thu, Jun 9, 2011 at 11:15 AM, Koen Kooi =
<koen@dominion.thruhere.net> wrote:
>> Hey,
>>=20
>> I ran bitbake layers on a stock angstrom setup and it reported a lot =
of 'broken' bbappends:
>>=20
>> meta-intel:
>>  =
/OE/tentacle/sources/meta-intel/meta-sugarbay/../common/recipes-core/initr=
dscripts/initramfs-live-install_1.0.bbappend
>>  =
/OE/tentacle/sources/meta-intel/meta-crownbay/../common/recipes-core/initr=
dscripts/initramfs-live-install_1.0.bbappend
>>  =
/OE/tentacle/sources/meta-intel/meta-jasperforest/../common/recipes-core/i=
nitrdscripts/initramfs-live-install_1.0.bbappend
>>  =
/OE/tentacle/sources/meta-intel/meta-sugarbay/recipes-kernel/linux/linux-y=
octo_git.bbappend
>>  =
/OE/tentacle/sources/meta-intel/meta-crownbay/recipes-kernel/linux/linux-y=
octo_git.bbappend
>>  =
/OE/tentacle/sources/meta-intel/meta-emenlow/recipes-kernel/linux/linux-yo=
cto_git.bbappend
>>  =
/OE/tentacle/sources/meta-intel/meta-fishriver/recipes-kernel/linux/linux-=
yocto_git.bbappend
>>  =
/OE/tentacle/sources/meta-intel/meta-jasperforest/recipes-kernel/linux/lin=
ux-yocto_git.bbappend
>>  =
/OE/tentacle/sources/meta-intel/meta-n450/recipes-kernel/linux/linux-yocto=
_git.bbappend
>>  =
/OE/tentacle/sources/meta-intel/meta-crownbay/recipes-kernel/linux/linux-y=
octo-stable_git.bbappend
>>  =
/OE/tentacle/sources/meta-intel/meta-emenlow/recipes-kernel/linux/linux-yo=
cto-stable_git.bbappend
>>  =
/OE/tentacle/sources/meta-intel/meta-fishriver/recipes-kernel/linux/linux-=
yocto-stable_git.bbappend
>>  =
/OE/tentacle/sources/meta-intel/meta-jasperforest/recipes-kernel/linux/lin=
ux-yocto-stable_git.bbappend
>>  =
/OE/tentacle/sources/meta-intel/meta-n450/recipes-kernel/linux/linux-yocto=
-stable_git.bbappend
>=20
> Don't these match the -stable (soon to be 2.6.34) kernel recipe ?
>=20
> =
http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-kernel/li=
nux/linux-yocto-stable_git.bb
>=20
> or maybe I'm just missing something, you did have 'broken' in
> quotes :)

I but it in quotes because I have a hard time believing that the =
linux-yocto appends are really broken :) But this is what 'bitbake =
layers' outputs, so there is *something* wrong, but I don't know where. =
RP is doing some heavy work on bitbake/master and bitbake/poky-master so =
I might have triggered a bug(fix) somewhere by updating bitbake. I don't =
want to discourage RP from bitbake work, just saying that I'm tracking =
bitbake master closely.=


