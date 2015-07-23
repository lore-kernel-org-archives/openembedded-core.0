Return-Path: <Abdur_Rehman@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 0E5A7761D8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jul 2015 14:55:21 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-04.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1ZIHu5-0001eB-RT from Abdur_Rehman@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Jul 2015 07:55:22 -0700
Received: from EU-MBX-01.mgc.mentorg.com ([169.254.1.194]) by
	SVR-IES-FEM-04.mgc.mentorg.com ([137.202.0.110]) with mapi id
	14.03.0224.002; Thu, 23 Jul 2015 15:55:20 +0100
From: "Rehman, Abdur" <Abdur_Rehman@mentor.com>
To: "Ahsan, Noor" <Noor_Ahsan@mentor.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [meta-oe][PATCH] sed: rrec on locale-base-ru-ru, not
	rdep
Thread-Index: AQHQxUxWtzksgYdrTka6r6ZeFdPgWZ3pEh6AgAASaCM=
Date: Thu, 23 Jul 2015 14:55:19 +0000
Message-ID: <8663FA6B07BCC94795FAD21C9CC5ACF73783AF98@EU-MBX-01.mgc.mentorg.com>
References: <1437658412-12051-1-git-send-email-abdur_rehman@mentor.com>,
	<365E1805BC95084CBE82381A0B86999401095B1CF6@EU-MBX-01.mgc.mentorg.com>
In-Reply-To: <365E1805BC95084CBE82381A0B86999401095B1CF6@EU-MBX-01.mgc.mentorg.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.202.0.68]
MIME-Version: 1.0
Cc: "Larson, Chris" <Chris_Larson@mentor.com>
Subject: Re: [meta-oe][PATCH] sed: rrec on locale-base-ru-ru, not rdep
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
X-List-Received-Date: Thu, 23 Jul 2015 14:55:22 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

meta-oe got included in the subject by accident.=0A=
I will update and send the patch again.=0A=
=0A=
Thanks,=0A=
AbdurRehman=0A=
________________________________________=0A=
From: Ahsan, Noor=0A=
Sent: Thursday, July 23, 2015 7:49 PM=0A=
To: Rehman, Abdur; openembedded-core@lists.openembedded.org=0A=
Cc: Larson, Chris=0A=
Subject: RE: [OE-core] [meta-oe][PATCH] sed: rrec on locale-base-ru-ru, not=
 rdep=0A=
=0A=
This should be sent to openembedded mailing list not on oe-core mailing lis=
t.=0A=
=0A=
Noor=0A=
=0A=
-----Original Message-----=0A=
From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of Rehman, Abdur=0A=
Sent: Thursday, July 23, 2015 6:34 PM=0A=
To: openembedded-core@lists.openembedded.org=0A=
Cc: Larson, Chris=0A=
Subject: [OE-core] [meta-oe][PATCH] sed: rrec on locale-base-ru-ru, not rde=
p=0A=
=0A=
This locale package isn't guaranteed to exist, depending on the value of GL=
IBC_GENERATE_LOCALES.=0A=
=0A=
The value of GLIBC_GENERATE_LOCALES can be specified to not contain locale-=
base-ru-ru, thus resulting in unsatisfied dependency. Its better to remove =
hardcoded dependency upon locale-base-ru-ru in favor of a recommendation, a=
s this locale isn't always available depending upon the value of GLIBC_GENE=
RATE_LOCALES.=0A=
=0A=
Signed-off-by: Christopher Larson <chris_larson@mentor.com>=0A=
Signed-off-by: Abdur Rehman <abdur_rehman@mentor.com>=0A=
---=0A=
 meta/recipes-extended/sed/sed_4.2.2.bb |    3 ++-=0A=
 1 file changed, 2 insertions(+), 1 deletion(-)=0A=
=0A=
diff --git a/meta/recipes-extended/sed/sed_4.2.2.bb b/meta/recipes-extended=
/sed/sed_4.2.2.bb=0A=
index a1e3483..5da3355 100644=0A=
--- a/meta/recipes-extended/sed/sed_4.2.2.bb=0A=
+++ b/meta/recipes-extended/sed/sed_4.2.2.bb=0A=
@@ -15,7 +15,8 @@ SRC_URI[md5sum] =3D "4111de4faa3b9848a0686b2f260c5056"=0A=
 SRC_URI[sha256sum] =3D "fea0a94d4b605894f3e2d5572e3f96e4413bcad3a085aae736=
7c2cf07908b2ff"=0A=
=0A=
 inherit autotools texinfo update-alternatives gettext ptest -RDEPENDS_${PN=
}-ptest +=3D "make locale-base-ru-ru ${PN}"=0A=
+RDEPENDS_${PN}-ptest +=3D "make ${PN}"=0A=
+RRECOMMENDS_${PN}-ptest +=3D "locale-base-ru-ru"=0A=
=0A=
 EXTRA_OECONF =3D "--disable-acl \=0A=
                 ${@bb.utils.contains('PTEST_ENABLED', '1', '--enable-regex=
-tests', '', d)}"=0A=
--=0A=
1.7.9.5=0A=
=0A=
--=0A=
_______________________________________________=0A=
Openembedded-core mailing list=0A=
Openembedded-core@lists.openembedded.org=0A=
http://lists.openembedded.org/mailman/listinfo/openembedded-core=0A=

