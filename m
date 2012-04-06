Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SG9Os-0003vm-Fj
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Apr 2012 15:40:26 +0200
Received: by pbcum15 with SMTP id um15so2180823pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Apr 2012 06:31:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=references:in-reply-to:mime-version:content-transfer-encoding
	:content-type:message-id:cc:x-mailer:from:subject:date:to
	:x-gm-message-state;
	bh=Zd4i9K3Bn2IWBh1G2pRvs4utoySewYc+eDavD3kNPv8=;
	b=DyjUaQCHYJ3g7u3a0DnXm1du0OC2VSXPg911VEJT9WRepXiuwjU85G+aemywjEK0ow
	SkcEf2xvAHw9yCf3eqBzfdlQteqOHtRtvZdFyVrW0kLgZfj2V5AOauwwk6LOThUqONui
	Y1Esct5YQ4gDdcIgSyD5iz9Yv5+7wfXgFo8Hx4hN85R9xByUNX9xBvonE5hWnyxnQP7M
	o2ewuXmPm73p/pj95GJXN9sKAeybsogxCpD9x7DhgeoAX2GKS2F16x1omVNcs6yitVa8
	co1NFh8vN0oD3bkFgO4P2+OTGsqhaDw9BFIfNTcleo0GHbKNGoE7iL8uMBIZvxkB+E86
	SUfA==
Received: by 10.68.216.234 with SMTP id ot10mr15808900pbc.107.1333719072934;
	Fri, 06 Apr 2012 06:31:12 -0700 (PDT)
Received: from [192.168.68.136] ([207.239.114.206])
	by mx.google.com with ESMTPS id v6sm6305431pbu.41.2012.04.06.06.31.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 06 Apr 2012 06:31:09 -0700 (PDT)
References: <1333622218-5230-1-git-send-email-stefan@herbrechtsmeier.net>
	<4F7E6066.2080907@linux.intel.com>
In-Reply-To: <4F7E6066.2080907@linux.intel.com>
Mime-Version: 1.0 (1.0)
Message-Id: <9F60AC4C-D174-4A8C-930A-6397842763AF@dominion.thruhere.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: iPhone Mail (9B179)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 6 Apr 2012 06:31:08 -0700
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQm4SBI+SyXWdtWSmfe11ekkNuiqxhbeqci6Y6Ry4PE7R1p+/O4dEcslUS1cyrxi2okTBI1z
Subject: Re: [PATCH] linux-firmware: keep version string in libertas firmware
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
X-List-Received-Date: Fri, 06 Apr 2012 13:40:26 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



Op 5 apr. 2012 om 20:17 heeft Saul Wold <sgw@linux.intel.com> het volgende g=
eschreven:

> On 04/05/2012 03:36 AM, Stefan Herbrechtsmeier wrote:
>> Recent Linux kernel tries to load the libertas firmware with the version
>> string in its name first. This results in a delayed firmware load on
>> system boot. Keep the default libertas firmware name and add a link for
>> older driver versions.
>>=20
>> Signed-off-by: Stefan Herbrechtsmeier<stefan@herbrechtsmeier.net>
>> ---
>>  .../linux-firmware/linux-firmware_git.bb           |   10 +++++++---
>>  1 files changed, 7 insertions(+), 3 deletions(-)
>>=20
>> diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/m=
eta/recipes-kernel/linux-firmware/linux-firmware_git.bb
>> index 52929fa..3675978 100644
>> --- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
>> +++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
>> @@ -38,8 +38,8 @@ do_install() {
>>      cp -r * ${D}/lib/firmware/
>>=20
>>      # Libertas sd8686
>> -    install -m 0644 libertas/sd8686_v9.bin ${D}/lib/firmware/sd8686.bin
>> -    install -m 0644 libertas/sd8686_v9_helper.bin ${D}/lib/firmware/sd86=
86_helper.bin
>> +    ln -sf libertas/sd8686_v9.bin ${D}/lib/firmware/sd8686.bin
>> +    ln -sf libertas/sd8686_v9_helper.bin ${D}/lib/firmware/sd8686_helper=
.bin
>>=20
>>      # Realtek rtl8192*
>>      install -m 0644 LICENCE.rtlwifi_firmware.txt ${D}/lib/firmware/rtlwi=
fi/LICENCE.rtlwifi_firmware.txt
>> @@ -51,7 +51,11 @@ do_install() {
>>  PACKAGES =3D+ "${PN}-sd8686 ${PN}-rtl8192cu linux-firmware-rtl8192ce lin=
ux-firmware-rtl8192su ${PN}-wl12xx"
>>=20
>>  LICENSE_${PN}-sd8686 =3D "Firmware:LICENSE.libertas"
>> -FILES_${PN}-sd8686 =3D "/lib/firmware/sd8686* /lib/firmware/LICENCE.libe=
rtas"
>> +FILES_${PN}-sd8686 =3D " \
>> +  /lib/firmware/libertas/sd8686_v9* \
>> +  /lib/firmware/sd8686* \
>> +  /lib/firmware/LICENCE.libertas \
>> +"
>>=20
>>  LICENSE_${PN}-rtl8192cu =3D "Firmware:LICENCE.rtlwifi_firmware"
>>  FILES_${PN}-rtl8192cu =3D " \
>=20
> Merged into OE-Core

why? It's missing a PR bump. We're close to a release, can we please stop pu=
shing broken commits, especially when a large part of the developers are tra=
velling?


>=20
> Thanks
>    Sau!
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


