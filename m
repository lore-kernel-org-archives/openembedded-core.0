Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1SHRVN-0000oN-HL
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Apr 2012 05:12:29 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 09 Apr 2012 20:03:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="87170185"
Received: from azsmsx601.amr.corp.intel.com ([10.2.121.193])
	by AZSMGA002.ch.intel.com with ESMTP; 09 Apr 2012 20:03:11 -0700
Received: from shsmsx101.ccr.corp.intel.com (10.239.4.153) by
	azsmsx601.amr.corp.intel.com (10.2.121.193) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Mon, 9 Apr 2012 20:03:10 -0700
Received: from shsmsx102.ccr.corp.intel.com ([169.254.2.125]) by
	SHSMSX101.ccr.corp.intel.com ([169.254.1.142]) with mapi id
	14.01.0355.002; Tue, 10 Apr 2012 11:03:10 +0800
From: "Lu, Lianhao" <lianhao.lu@intel.com>
To: Saul Wold <sgw@linux.intel.com>, Patches and discussions about the oe-core
	layer <openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 1/1] connman: ensure ofono package is generated.
Thread-Index: AQHNE74MXGyev1wJCkueoP/rnHeuxpaSf+iAgADkWEA=
Date: Tue, 10 Apr 2012 03:03:09 +0000
Message-ID: <857BE142E5399E46B20FD45B9DB8A7BC0FD33527@SHSMSX102.ccr.corp.intel.com>
References: <cover.1333693070.git.lianhao.lu@intel.com>
	<af03fd7f8452c7795fce23e3276e456dc431266f.1333693070.git.lianhao.lu@intel.com>
	<4F8352E3.1040902@linux.intel.com>
In-Reply-To: <4F8352E3.1040902@linux.intel.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] connman: ensure ofono package is generated.
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
X-List-Received-Date: Tue, 10 Apr 2012 03:12:29 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


Saul Wold wrote on 2012-04-10:
> On 04/05/2012 11:20 PM, Lianhao Lu wrote:
>> Make sure ofono package is generated when buidling connman, because
>> dynamic package connman-plugin-ofono has a RDEPENDS on ofono.
>>=20
> Since this is for a plugin, can the connman-plugin-ofono be generated in
> a separate package (or possibly even a separate recipe that depends on
> ofono, instead of making connman depend on ofono, I am not sure the
> solution below is correct either.

connman-plugin-ofono is already generated in a separate dynamic package, ju=
st like other dynamic connman-plugin-bluez4. I think we'd better build the =
connman-plugin-ofono based on the value distro_features, just like we did f=
or connman-plugin-bluez4 in commit http://git.yoctoproject.org/cgit/cgit.cg=
i/poky/commit?id=3D1288313411f8db7628e9ec4c04f2ad7f830e994d. I'll remake th=
e patch.=20

-Lianhao=20

> Sau!
>=20
>> Signed-off-by: Lianhao Lu<lianhao.lu@intel.com>
>> ---
>>   meta/recipes-connectivity/connman/connman.inc |    2 ++
>>   1 files changed, 2 insertions(+), 0 deletions(-)
>> diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipe=
s-connectivity/connman/connman.inc
>> index 1a6dd1b..3ed5667 100644
>> --- a/meta/recipes-connectivity/connman/connman.inc
>> +++ b/meta/recipes-connectivity/connman/connman.inc
>> @@ -39,6 +39,8 @@ EXTRA_OECONF +=3D "\
>>       --disable-ntpd \
>>   "
>> +do_package[depends] =3D "${MLPREFIX}ofono:do_package"
>> +
>>   INITSCRIPT_NAME =3D "connman"
>>   INITSCRIPT_PARAMS =3D "start 05 5 2 3 . stop 22 0 1 6 ."

Best Regards,
Lianhao




