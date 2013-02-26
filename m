Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1UAIBT-00034G-U5
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Feb 2013 11:55:13 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 26 Feb 2013 02:38:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,739,1355126400"; d="scan'208";a="206373787"
Received: from irsmsx104.ger.corp.intel.com ([163.33.3.159])
	by AZSMGA002.ch.intel.com with ESMTP; 26 Feb 2013 02:38:34 -0800
Received: from irsmsx102.ger.corp.intel.com ([169.254.2.108]) by
	IRSMSX104.ger.corp.intel.com ([169.254.5.48]) with mapi id
	14.01.0355.002; Tue, 26 Feb 2013 10:38:33 +0000
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: "ml@communistcode.co.uk" <ml@communistcode.co.uk>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH V2] connman: enable connman client
Thread-Index: AQHOEzUE2iKuVfbinEmGBsVPApBjE5iKQ6bwgAD8iYCAAJ/UAIAAE3+g
Date: Tue, 26 Feb 2013 10:38:32 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB162063D2@IRSMSX102.ger.corp.intel.com>
References: <1361782141-18273-1-git-send-email-cristian.iorga@intel.com>
	<969F26A8BAB325438E7EB80D3C3134FB16205C3C@IRSMSX102.ger.corp.intel.com>
	<512BF975.90206@linux.intel.com> <512C7F88.8030907@communistcode.co.uk>
In-Reply-To: <512C7F88.8030907@communistcode.co.uk>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.180]
MIME-Version: 1.0
Subject: Re: [PATCH V2] connman: enable connman client
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Feb 2013 10:55:14 -0000
X-List-Received-Date: Tue, 26 Feb 2013 10:55:14 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello all,

So, what is the general agreement here?

I placed connmanctl in the same package as connman because it is a very val=
uable tool, which should go in by default if connman is present also.
It should not belong to connman-test, because it is used to control connman=
, not test it.
If you want it to be in a connman-ctl package, just let me know and I will =
do the changes, re-test, and re-send the patch.

Regards,
Cristian

-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of Jack Mitchell
Sent: Tuesday, February 26, 2013 11:25 AM
To: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH V2] connman: enable connman client

On 25/02/13 23:53, Saul Wold wrote:
> On 02/25/2013 12:51 AM, Iorga, Cristian wrote:
>> Changes from V1:
>>     - connman client is explicitly enabled
>>     - ${B} is used instead of ${S} (in this specific case are the=20
>> same, it will be changed later on)
>>
> Please add these to a proper commit message.
>
> Also, there was some discussion prior about putting the connmanctl in=20
> a separate package, that does not seem to have happened here.
>
> It could go into the -tools packages that already exists or it's own=20
> package connman-ctl?
>
> I know Jack M. mentioned looking into this also, so let's be sure to=20
> coordinate this.

Yes, that was my suggestion. I'm blocked at the moment by a binutils failur=
e I can't shift, so currently unable to contribute. I would suggest putting=
 it in a new connman-client package which is a 2 minute change and test.

>
> Thanks
>     Sau!
>
>> I know Jack M. mentioned looking into this also, so let's be sure to=20
>> coordinate this. -----Original Message-----
>> From: Iorga, Cristian
>> Sent: Monday, February 25, 2013 10:49 AM
>> To: openembedded-core@lists.openembedded.org
>> Cc: Iorga, Cristian
>> Subject: [PATCH V2] connman: enable connman client
>>
>> connmanctl is now included when connman is installed
>>
>> Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
>> ---
>>   meta/recipes-connectivity/connman/connman.inc |    5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-connectivity/connman/connman.inc
>> b/meta/recipes-connectivity/connman/connman.inc
>> index b61e2af..b0ede60 100644
>> --- a/meta/recipes-connectivity/connman/connman.inc
>> +++ b/meta/recipes-connectivity/connman/connman.inc
>> @@ -20,7 +20,7 @@ DEPENDS  =3D "dbus glib-2.0 ppp iptables gnutls \
>>               ${@base_contains('DISTRO_FEATURES', '3g','ofono', '',=20
>> d)} \
>>               "
>>
>> -INC_PR =3D "r17"
>> +INC_PR =3D "r18"
>>
>>   TIST =3D "--enable-tist"
>>   TIST_powerpc =3D ""
>> @@ -38,7 +38,7 @@ EXTRA_OECONF +=3D "\
>>       --enable-tools \
>>       --enable-test \
>>       --disable-polkit \
>> -    --disable-client \
>> +    --enable-client \
>>       --enable-fake \
>>       ${@base_contains('DISTRO_FEATURES', 'systemd',=20
>> '--with-systemdunitdir=3D${systemd_unitdir}/system/', '', d)} \  "
>> @@ -73,6 +73,7 @@ do_install_append() {
>>       install -d ${D}${bindir}
>>       install -m 0755 ${S}/tools/*-test ${D}${bindir}
>>       install -m 0755 ${S}/tools/wispr ${D}${bindir}
>> +    install -m 0755 ${B}/client/connmanctl ${D}${bindir}
>>
>>       # We don't need to package an empty directory
>>       rmdir ${D}${libdir}/connman/scripts
>> --
>> 1.7.10.4
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


--=20

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--


_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


