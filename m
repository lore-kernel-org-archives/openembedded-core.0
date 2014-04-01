Return-Path: <cristian.iorga@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 2C2146B25F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Apr 2014 13:28:16 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 01 Apr 2014 06:28:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,772,1389772800"; d="scan'208";a="504326226"
Received: from irsmsx102.ger.corp.intel.com ([163.33.3.155])
	by fmsmga001.fm.intel.com with ESMTP; 01 Apr 2014 06:27:33 -0700
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.78]) by
	IRSMSX102.ger.corp.intel.com ([169.254.2.45]) with mapi id
	14.03.0123.003; Tue, 1 Apr 2014 14:27:29 +0100
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: "Iorga, Cristian" <cristian.iorga@intel.com>, "Sarbu, Florin-Ionut (Wind
	River)" <florin.sarbu@windriver.com>
Thread-Topic: [OE-core] [PATCH] connman.inc: Add PACKAGECONFIG support for
	bluez5
Thread-Index: AQHPTZKJhiyv5K9pxUm65LZ9kMsX3pr8hKmAgAAX3FCAAAL+AIAAH7GAgAABtlA=
Date: Tue, 1 Apr 2014 13:27:29 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB1CE76E47@IRSMSX105.ger.corp.intel.com>
References: <1396346945-3782-1-git-send-email-florin.sarbu@windriver.com>
	<1396349467.1432.4.camel@ted>
	<969F26A8BAB325438E7EB80D3C3134FB1CE76D4F@IRSMSX105.ger.corp.intel.com>
	<533AB0A2.1000608@windriver.com>
	<969F26A8BAB325438E7EB80D3C3134FB1CE76E2B@IRSMSX105.ger.corp.intel.com>
In-Reply-To: <969F26A8BAB325438E7EB80D3C3134FB1CE76E2B@IRSMSX105.ger.corp.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.180]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] connman.inc: Add PACKAGECONFIG support for bluez5
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 01 Apr 2014 13:28:18 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,
I meant, of course, BlueZ5, connman is ready for BlueZ5.

-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of Iorga, Cristian
Sent: Tuesday, April 1, 2014 4:23 PM
To: Sarbu, Florin-Ionut (Wind River)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] connman.inc: Add PACKAGECONFIG support for b=
luez5

Hmm,

I am quite sure that connman is ready for BlueZ4 for some time.
I am not sure about libpcap, to be honest, did not investigate that.
Can you please provide some facts related to your statements?
Regards,
Cristian

-----Original Message-----
From: Florin Sarbu [mailto:florin.sarbu@windriver.com]
Sent: Tuesday, April 1, 2014 3:27 PM
To: Iorga, Cristian
Cc: openembedded-core@lists.openembedded.org; Richard Purdie
Subject: Re: [OE-core] [PATCH] connman.inc: Add PACKAGECONFIG support for b=
luez5

Please see inline.

On 04/01/2014 02:23 PM, Iorga, Cristian wrote:
> Hi all,
>
> I would also say that is an important change, with some possible unforese=
en consequences.
> The YP is in the stabilization phase for 1.6 release.
> In my opinion, the support for and change to BlueZ (overall) should be po=
stponed to 1.7.
> Also, this not the proper solution, because, in the end, if BlueZ4 will s=
till be around in 1.7 (which is not my intention, to be honest), this will =
be worked out with a Bluetooth stack provider (which can be BZ4 or, prefera=
bly, BZ5).
>
> I vote against this patch.
The idea was that people could just have bluetooth in DISTRO_FEATURES and t=
hings would be unchanged, as in use bluez4 like now, and if somebody else w=
ants bluez5, just add bluez5 to PACKAGECONFIG in some .bbappend's and not r=
ely on the bluetooth DISTRO_FEATURE until bluez5 supersedes bluez4.
At the moment, one cannot use bluez5 as connman and libpcap explicitly depe=
nd on bluez4.
>
> Regards,
> Cristian Iorga
> YP
> Intel Corporation
>
> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of=20
> Richard Purdie
> Sent: Tuesday, April 1, 2014 1:51 PM
> To: Sarbu, Florin-Ionut (Wind River)
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH] connman.inc: Add PACKAGECONFIG support=20
> for bluez5
>
> On Tue, 2014-04-01 at 13:09 +0300, Florin Sarbu wrote:
>> Currently connman can only RDEPEND on bluez4.
>> This patch adds support for having bluez5 in PACKAGECONFIG and get=20
>> connman RDEPEND on bluez5 if desired.
>>
>> Signed-off-by: Florin Sarbu <florin.sarbu@windriver.com>
>> ---
>>   meta/recipes-connectivity/connman/connman.inc | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-connectivity/connman/connman.inc
>> b/meta/recipes-connectivity/connman/connman.inc
>> index b3147c9..53a6a4f 100644
>> --- a/meta/recipes-connectivity/connman/connman.inc
>> +++ b/meta/recipes-connectivity/connman/connman.inc
>> @@ -32,7 +32,7 @@ EXTRA_OECONF +=3D "\
>>
>>   PACKAGECONFIG ??=3D "wispr \
>>                      ${@base_contains('DISTRO_FEATURES', 'wifi','wifi', =
'', d)} \
>> -                   ${@base_contains('DISTRO_FEATURES', 'bluetooth','blu=
etooth', '', d)} \
>> +                   ${@base_contains('DISTRO_FEATURES',
>> + 'bluetooth','bluez4', '', d)} \
>>                      ${@base_contains('DISTRO_FEATURES', '3g','3g',=20
>> '', d)} \  "
>>
>> @@ -42,6 +42,7 @@ PACKAGECONFIG ??=3D "wispr \
>>
>>   PACKAGECONFIG[wifi] =3D "--enable-wifi, --disable-wifi, wpa-supplicant=
"
>>   PACKAGECONFIG[bluetooth] =3D "--enable-bluetooth, --disable-bluetooth,=
 bluez4"
> You renamed the option above but didn't here and hence broke bluez4.
> This is not the quality of patch expected at -rc time for a release :(.
Sorry, I overlooked the change in that one and the others remaining after t=
hat.
>
> Cheers,
>
> Richard
>
>> +PACKAGECONFIG[bluez5] =3D "--enable-bluetooth, --disable-bluetooth, blu=
ez5"
Also, to not get it disable bluetooth when using bluez4, the above line sho=
uld look something like:

+PACKAGECONFIG[bluez5] =3D "--enable-bluetooth, , bluez5"

Want me to send another patch or we just drop it and people just do what th=
ey need in their own .bbappend's in order to have bluez5 in?

Thank you,
Florin

>>   PACKAGECONFIG[3g] =3D "--enable-ofono, --disable-ofono, ofono"
>>   PACKAGECONFIG[tist] =3D "--enable-tist,--disable-tist,"
>>   PACKAGECONFIG[openvpn] =3D "--enable-openvpn --with-openvpn=3D${sbindi=
r}/openvpn,--disable-openvpn,,openvpn"
>> @@ -114,6 +115,7 @@ RPROVIDES_${PN} =3D "\  RDEPENDS_${PN} =3D "\
>>        dbus \
>>        ${@base_contains('PACKAGECONFIG', 'bluetooth', 'bluez4', '',=20
>> d)} \
>> +     ${@base_contains('PACKAGECONFIG', 'bluez5', 'bluez5', '', d)} \
>>        ${@base_contains('PACKAGECONFIG', 'wifi','wpa-supplicant', '', d)=
} \
>>        ${@base_contains('PACKAGECONFIG', '3g','ofono', '', d)} \
>>        xuser-account \
>> --
>> 1.9.1
>>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--
_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-core

