Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QRqhY-0006K6-Uz
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 21:03:33 +0200
Received: by wye20 with SMTP id 20so102444wye.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Jun 2011 12:00:21 -0700 (PDT)
Received: by 10.216.78.212 with SMTP id g62mr7670109wee.22.1306954820976;
	Wed, 01 Jun 2011 12:00:20 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id t79sm807078weq.5.2011.06.01.12.00.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 01 Jun 2011 12:00:20 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4DE68B24.8060503@windriver.com>
Date: Wed, 1 Jun 2011 21:00:18 +0200
Message-Id: <23B6B14F-2A30-4814-A83E-7D5EA9542C7B@dominion.thruhere.net>
References: <1306944074.2529.107.camel@phil-desktop>	
	<1306944235.2529.109.camel@phil-desktop>	
	<5DBF32A5-22D5-4499-AD32-9C48680B7EBA@dominion.thruhere.net>	
	<1306945014.2529.113.camel@phil-desktop>
	<4DE66D53.30505@windriver.com>	
	<1306947245.2529.148.camel@phil-desktop>
	<4DE66FC6.4030607@windriver.com>
	<1306948134.2529.158.camel@phil-desktop>
	<4DE68B24.8060503@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: rpmdeps, was Re: dbus-native --with-x
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
X-List-Received-Date: Wed, 01 Jun 2011 19:03:33 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 1 jun 2011, om 20:55 heeft Mark Hatle het volgende geschreven:

> On 6/1/11 12:08 PM, Phil Blundell wrote:
>> On Wed, 2011-06-01 at 11:58 -0500, Mark Hatle wrote:
>>> On 6/1/11 11:54 AM, Phil Blundell wrote:
>>>> On Wed, 2011-06-01 at 11:48 -0500, Mark Hatle wrote:
>>>>> So in the above, perl and python are really the only items that =
could be disabled.
>>>>=20
>>>> Just to be clear, in the list you mentioned, were you talking about =
the
>>>> usage of rpm-native for rpmdeps, or the usage by =
package_rpm.bbclass
>>>> itself?
>>>=20
>>> I was talking about rpm-native recipe in general, and how it's used.
>>>=20
>>> rpmdeps requires a good chunk of the rpm infrastructure (even if we =
don't end up
>>> using rpmbuild or rpm commands during the build..)
>>=20
>> Do you happen to have a list of what exactly rpmdeps does require?
>> Based on the descriptions you gave before, I'm guessing that it =
probably
>> doesn't need openssl (since, afaik, it doesn't do any signing) or =
pcre
>> (since it isn't building any packages) or acl, attr, bzip and zlib
>> (since it also isn't installing anything). =20
>=20
> rpmdeps uses, according to ldd:
>=20
>        linux-vdso.so.1
>        librpm-5.4.so
>        librpmdb-5.4.so
>        librpmio-5.4.so
>        librpmmisc-5.4.so
>        libm.so.6
>        libdl.so.2
>        libacl.so.1
>        libattr.so.1
>        libpcreposix.so.0
>        libdb-5.1.so
>        libmagic.so.1
>        liblzma.so.5
>        libbz2.so.0
>        libz.so.1
>        libpthread.so.0
>        librt.so.1
>        libelf.so.1
>        libpopt.so.0
>        libssl.so.0.9.8
>        libcrypto.so.0.9.8
>        libpcre.so.0
>        libc.so.6
>        libgcc_s.so.1
>        /lib64/ld-linux-x86-64.so.2 (0x0000003c51800000)
>=20
> The issue is that it uses the librpm, librpmdb, librpmio, and =
librpmmisc
> libraries.  These libraries provide and use all of the rest of the =
components.


What is rpmdeps actually used for in package.bbclass when you're not =
using rpm as package format?

regards,

Koen=


