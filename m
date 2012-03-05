Received: from mail-wi0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1S4Xux-0006Ye-AP
	for openembedded-core@lists.openembedded.org;
	Mon, 05 Mar 2012 14:25:35 +0100
Received: by wibhq12 with SMTP id hq12so1985935wib.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Mar 2012 05:17:00 -0800 (PST)
Received-SPF: pass (google.com: domain of koen@dominion.thruhere.net
	designates 10.180.95.1 as permitted sender)
	client-ip=10.180.95.1; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	koen@dominion.thruhere.net designates 10.180.95.1 as permitted
	sender) smtp.mail=koen@dominion.thruhere.net
Received: from mr.google.com ([10.180.95.1])
	by 10.180.95.1 with SMTP id dg1mr15131945wib.21.1330953420953 (num_hops
	= 1); Mon, 05 Mar 2012 05:17:00 -0800 (PST)
Received: by 10.180.95.1 with SMTP id dg1mr12012740wib.21.1330953420887;
	Mon, 05 Mar 2012 05:17:00 -0800 (PST)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id v4sm61875164wiy.9.2012.03.05.05.16.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 05 Mar 2012 05:16:59 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAAQYJAvQajmU+T1oGQLingBR7S7_G_A3KxtDeB+s6_tNnmoteg@mail.gmail.com>
Date: Mon, 5 Mar 2012 14:16:57 +0100
Message-Id: <6DFE7363-9063-4624-A0D3-9D5218520ADB@dominion.thruhere.net>
References: <CAAQYJAtC-SCxohUjEOcixWA_B+K62O9AMr-d4XWX+PBDpg6i=w@mail.gmail.com>
	<CAAQYJAvQajmU+T1oGQLingBR7S7_G_A3KxtDeB+s6_tNnmoteg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQlKQ7fHC9rg/TnGYqxQvbPfV/R+dm21YDRDVPUDDT5y0sv+0ENg+UxAXXJFKC4vUjkAhwLq
Subject: Re: [RFC] keymaps and kernel version
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
X-List-Received-Date: Mon, 05 Mar 2012 13:25:35 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 5 mrt. 2012, om 14:12 heeft Andrea Adami het volgende geschreven:

> On Sun, Mar 4, 2012 at 12:40 AM, Andrea Adami <andrea.adami@gmail.com> =
wrote:
>> Hi,
>> while testing some new kernels I found out a broken keymap.
>> After short research I could identify the cause in
>> recipes-bsp/keymaps/files/keymap.sh:
>> ...
>> KERNEL_MAJMIN=3D`uname -r | cut -d '.' -f 1,2`
>> if [ -e /etc/keymap-$KERNEL_MAJMIN.map ]; then
>>    loadkeys /etc/keymap-$KERNEL_MAJMIN.map
>> fi
>> ...
>>=20
>> $ uname -r | cut -d '.' -f 1,2
>> 3.2
>>=20
>>=20
>> I realized we are still using some old keymap-2.6.map and this =
doesn't
>> match with KERNEL_MAJMIN.
>> Now, renaming the keymaps to 3.2 would be only a band-aid,  3.3 is =
coming.
>>=20
>> Maybe we should check for keymap-3.map, i.e.
>>=20
>>  uname -r | cut -d '.' -f 1,1
>>=20
>>  or embed the machine name instead.
>>=20
>> Regards
>>=20
>> Andrea
>=20
> Actually this all sounds remnant of linux 2.4 vs. 2.6 times.
>=20
> Probably today we can just set:
> ...
> if [ -e /etc/keymap.map ]; then
> ...
>=20
> and the BSP layers will have to rename the overrides only once.

Or just drop it completely and let udev handle it?

regards,

Koen=


