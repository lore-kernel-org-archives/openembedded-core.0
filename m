Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lei.mei@intel.com>) id 1QWOfK-0002Io-5M
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Jun 2011 10:08:02 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 14 Jun 2011 01:04:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,363,1304319600"; d="scan'208";a="12348289"
Received: from pgsmsx601.gar.corp.intel.com ([10.221.43.69])
	by azsmga001.ch.intel.com with ESMTP; 14 Jun 2011 01:04:34 -0700
Received: from shsmsx601.ccr.corp.intel.com (10.239.4.112) by
	pgsmsx601.gar.corp.intel.com (10.221.43.69) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Tue, 14 Jun 2011 16:04:28 +0800
Received: from shsmsx501.ccr.corp.intel.com ([10.239.4.141]) by
	shsmsx601.ccr.corp.intel.com ([10.239.4.112]) with mapi;
	Tue, 14 Jun 2011 16:04:26 +0800
From: "Mei, Lei" <lei.mei@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 14 Jun 2011 16:04:26 +0800
Thread-Topic: [OE-core] [PATCH 1/1] gupnp: upgrade from 0.16.0 to 0.16.1
Thread-Index: AcwqZyazlosxQfemQFSF372m8U3bHQAAEtcg
Message-ID: <749B9D3DBF0F054390025D9EAFF47F224C6526EA@shsmsx501.ccr.corp.intel.com>
References: <cover.1308030161.git.lei.mei@intel.com>
	<c3921b032b4db674706a2e17e6100d97c30ba994.1308030161.git.lei.mei@intel.com>
	<3520C10B-8657-4900-8C2E-6A4EE6AA7FC3@dominion.thruhere.net>
In-Reply-To: <3520C10B-8657-4900-8C2E-6A4EE6AA7FC3@dominion.thruhere.net>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: zh-CN, en-US
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] gupnp: upgrade from 0.16.0 to 0.16.1
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
X-List-Received-Date: Tue, 14 Jun 2011 08:08:02 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



>-----Original Message-----
>From: openembedded-core-bounces@lists.openembedded.org
>[mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
>Koen Kooi
>Sent: Tuesday, June 14, 2011 3:46 PM
>To: Patches and discussions about the oe-core layer
>Subject: Re: [OE-core] [PATCH 1/1] gupnp: upgrade from 0.16.0 to 0.16.1
>
>
>Op 14 jun 2011, om 07:59 heeft Mei Lei het volgende geschreven:
>
>> Signed-off-by: Mei Lei <lei.mei@intel.com>
>> ---
>> .../gupnp/{gupnp_0.16.0.bb =3D> gupnp_0.16.1.bb}     |    7 +++++--
>> 1 files changed, 5 insertions(+), 2 deletions(-)
>> rename meta/recipes-connectivity/gupnp/{gupnp_0.16.0.bb =3D>
>gupnp_0.16.1.bb} (79%)
>>
>> diff --git a/meta/recipes-connectivity/gupnp/gupnp_0.16.0.bb
>b/meta/recipes-connectivity/gupnp/gupnp_0.16.1.bb
>> similarity index 79%
>> rename from meta/recipes-connectivity/gupnp/gupnp_0.16.0.bb
>> rename to meta/recipes-connectivity/gupnp/gupnp_0.16.1.bb
>> index 07b6b90..5b23134 100644
>> --- a/meta/recipes-connectivity/gupnp/gupnp_0.16.0.bb
>> +++ b/meta/recipes-connectivity/gupnp/gupnp_0.16.1.bb
>> @@ -7,8 +7,8 @@ DEPENDS =3D "e2fsprogs gssdp libsoup-2.4 libxml2
>gnome-icon-theme"
>>
>> SRC_URI =3D "http://gupnp.org/sites/all/files/sources/${BPN}-${PV}.tar.g=
z"
>>
>> -SRC_URI[md5sum] =3D "61b240c1a9fdf8ca82c5c3adde0d6757"
>> -SRC_URI[sha256sum] =3D
>"1b77201866b7632fb68bc2a3bdea22ef8ead34ba850b3ee367797432cfc0f04a"
>> +SRC_URI[md5sum] =3D "021bb237741532af4bca50157ff326e4"
>> +SRC_URI[sha256sum] =3D
>"f01a1f4fd36ce161a3df29fa83e1a0a2fb40d3c9f30f6b403e7791688ad24cfe"
>>
>> PR =3D "r0"
>>
>> @@ -19,6 +19,9 @@ inherit autotools pkgconfig
>> FILES_${PN} =3D "${libdir}/*.so.*"
>> FILES_${PN}-dev +=3D "${bindir}/gupnp-binding-tool"
>>
>> +do_configure_prepend() {
>> +	sed -i -e
>'s:GOBJECT_INTROSPECTION_CHECK(\[0.6.4\]):AM_CONDITIONAL([HAVE_INTR
>OSPECTION], [false]):g' ${S}/configure.ac
>> +}
>> SYSROOT_PREPROCESS_FUNCS +=3D "gupnp_sysroot_preprocess"
>
>Does adding 'gobject-introspection' to DEPENDS or --disable-introspection =
to
>EXTRA_OECONF fix the build issue?

"--disable-introspection to EXTRA_OECONF" didn't fix the configure issue.
Adding depends is my first option, but that will trigger a do_compile failu=
re of 'gobject-introspection'.
So decide to upgrade it to the latest version in this way.

Thanks
Lei=20

>
>regards,
>
>Koen
>_______________________________________________
>Openembedded-core mailing list
>Openembedded-core@lists.openembedded.org
>http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


