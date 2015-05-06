Return-Path: <steffen.pankratz@elektrobit.com>
Received: from smtpgw1fi.elektrobit.com (smtpgw1fi.elektrobit.com
	[194.136.18.128])
	by mail.openembedded.org (Postfix) with ESMTP id 47CA373F34
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 May 2015 07:10:55 +0000 (UTC)
Received: from encgw2fi.ebgroup.elektrobit.com ([172.16.0.99])
	by smtpgw1fi.elektrobit.com (8.14.4/8.14.4) with ESMTP id
	t467Au9J028976
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL) for <openembedded-core@lists.openembedded.org>;
	Wed, 6 May 2015 10:10:56 +0300
Received: from deeres07.ebgroup.elektrobit.com
	(deeres07.ebgroup.elektrobit.com [10.0.10.10])
	by encgw2fi.ebgroup.elektrobit.com (Postfix) with ESMTPS
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 May 2015 10:10:55 +0300 (EEST)
Received: from DEERES07.ebgroup.elektrobit.com ([fe80::d1e0:156:8cce:d001]) by
	deeres07.ebgroup.elektrobit.com ([fe80::d1e0:156:8cce:d001%11]) with
	mapi id 14.03.0181.006; Wed, 6 May 2015 09:10:55 +0200
From: <Steffen.Pankratz@elektrobit.com>
To: <openembedded-core@lists.openembedded.org>
Thread-Topic: KBUILD_DEFCONFIG issue
Thread-Index: AdCHy8mNwemc7nqvT9WbRYFX+Nr+pg==
Date: Wed, 6 May 2015 07:10:55 +0000
Message-ID: <81B0EC78FE09F04E8E0FF9B9C2BF8A364938FBAB@deeres07.ebgroup.elektrobit.com>
Accept-Language: de-DE, en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.26.198]
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.12
	(smtpgw1fi.elektrobit.com [172.16.0.202]);
	Wed, 06 May 2015 10:10:56 +0300 (EEST)
X-Virus-Scanned: at elektrobit.com
X-Scanned-By: MIMEDefang 2.76 on 172.16.0.202
Subject: KBUILD_DEFCONFIG issue
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
X-List-Received-Date: Wed, 06 May 2015 07:10:56 -0000
X-Groupsio-MsgNum: 65180
Content-Language: en-US
Content-Type: multipart/mixed;
	boundary="_002_81B0EC78FE09F04E8E0FF9B9C2BF8A364938FBABdeeres07ebgroup_"

--_002_81B0EC78FE09F04E8E0FF9B9C2BF8A364938FBABdeeres07ebgroup_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi

I am in the process of creating a board support package (1) for NVIDIAs Jet=
son TK1 board (2).

In my kernel recipe I am using 'KBUILD_DEFCONFIG =3D "tegra_defconfig"' but=
 the build failed always.

I think the issue is in do_kernel_metadata (meta/classes/kernel-yocto.bbcla=
ss), if no defconfig exists, the config specified in KBUILD_DEFCONFIG is ne=
ver copied.
Attached you will find a possible patch for this issue.
Feedback is welcome.

Another, probably unrelated problem I face right now is, that basically mos=
t of the options of the tegra_defconfig get removed by kconf_check.
The kernel gets build, there are no warnings that things got removed but in=
 the files in .meta/cfg/standard/jetson-tk1  I see for example:

Value requested for CONFIG_ARCH_TEGRA_124_SOC not in final .config Requeste=
d value:  CONFIG_ARCH_TEGRA_124_SOC=3Dy Actual value:

Any ideas?


Kind regards
-Steffen

(1) https://bitbucket.org/kratz00/meta-jetson-tk1/src
(2) http://elinux.org/JetsonTK1

--
Steffen Pankratz
Expert, Software Integration & Services

EB - Driving the Future of Software
Phone:  +49 9131 7701-6605
Fax: +49 9131 7701 6333
steffen.pankratz@elektrobit.com
http://automotive.elektrobit.com/
PGP-Key: http://keyserver.elektrobit.com/

Elektrobit Automotive GmbH, Am Wolfsmantel 46, 91058 Erlangen, Germany Mana=
ging Directors Alexander Kocher, Gregor Zink Register Court F=FCrth HRB 488



----------------------------------------------------------------
Please note: This e-mail may contain confidential information
intended solely for the addressee. If you have received this
e-mail in error, please do not disclose it to anyone, notify
the sender promptly, and delete the message from your system.
Thank you.


--_002_81B0EC78FE09F04E8E0FF9B9C2BF8A364938FBABdeeres07ebgroup_
Content-Type: application/octet-stream;
	name="0001-Fixed-KBUILD_DEFCONFIG-feature-if-no-defconfig-file-.patch"
Content-Description: 0001-Fixed-KBUILD_DEFCONFIG-feature-if-no-defconfig-file-.patch
Content-Disposition: attachment;
	filename="0001-Fixed-KBUILD_DEFCONFIG-feature-if-no-defconfig-file-.patch";
	size=1209; creation-date="Wed, 06 May 2015 06:45:45 GMT";
	modification-date="Wed, 06 May 2015 06:45:45 GMT"
Content-Transfer-Encoding: base64

RnJvbSAwOTk5NWUwMzM0MDEyMGZlNTMyZGJhMGQ4OWFiODJlZGI0Mjg5ODA4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTdGVmZmVuIFBhbmtyYXR6IDxzdGVmZmVuLnBhbmtyYXR6QGVs
ZWt0cm9iaXQuY29tPgpEYXRlOiBXZWQsIDYgTWF5IDIwMTUgMDY6NDE6MjUgKzAwMDAKU3ViamVj
dDogW1BBVENIXSBGaXhlZCBLQlVJTERfREVGQ09ORklHIGZlYXR1cmUsIGlmIG5vIGRlZmNvbmZp
ZyBmaWxlIGV4aXN0cwoKU2lnbmVkLW9mZi1ieTogU3RlZmZlbiBQYW5rcmF0eiA8c3RlZmZlbi5w
YW5rcmF0ekBlbGVrdHJvYml0LmNvbT4KLS0tCiBtZXRhL2NsYXNzZXMva2VybmVsLXlvY3RvLmJi
Y2xhc3MgfCA2ICsrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9tZXRhL2NsYXNzZXMva2VybmVsLXlvY3RvLmJiY2xhc3Mg
Yi9tZXRhL2NsYXNzZXMva2VybmVsLXlvY3RvLmJiY2xhc3MKaW5kZXggNjUwYWU1YS4uZjNmMGU0
MiAxMDA2NDQKLS0tIGEvbWV0YS9jbGFzc2VzL2tlcm5lbC15b2N0by5iYmNsYXNzCisrKyBiL21l
dGEvY2xhc3Nlcy9rZXJuZWwteW9jdG8uYmJjbGFzcwpAQCAtMTAxLDEwICsxMDEsMTAgQEAgZG9f
a2VybmVsX21ldGFkYXRhKCkgewogCQkJCWNtcCAiJHtXT1JLRElSfS9kZWZjb25maWciICIke1N9
L2FyY2gvJHtBUkNIfS9jb25maWdzLyR7S0JVSUxEX0RFRkNPTkZJR30iCiAJCQkJaWYgWyAkPyAt
bmUgMCBdOyB0aGVuCiAJCQkJCWJibm90ZSAiZGVmY29uZmlnIGRldGVjdGVkIGluIFdPUktESVIu
ICR7S0JVSUxEX0RFRkNPTkZJR30gc2tpcHBlZCIKLQkJCQllbHNlCi0JCQkJCWNwIC1mICR7U30v
YXJjaC8ke0FSQ0h9L2NvbmZpZ3MvJHtLQlVJTERfREVGQ09ORklHfSAke1dPUktESVJ9L2RlZmNv
bmZpZwotCQkJCQlzY2NzPSIke1dPUktESVJ9L2RlZmNvbmZpZyIKIAkJCQlmaQorCQkJZWxzZQor
CQkJCWNwIC1mICR7U30vYXJjaC8ke0FSQ0h9L2NvbmZpZ3MvJHtLQlVJTERfREVGQ09ORklHfSAk
e1dPUktESVJ9L2RlZmNvbmZpZworCQkJCXNjY3M9IiR7V09SS0RJUn0vZGVmY29uZmlnIgogCQkJ
ZmkKIAkJZWxzZQogCQkJYmJmYXRhbCAiQSBLQlVJTERfREVDT05GSUcgJyR7S0JVSUxEX0RFRkNP
TkZJR30nIHdhcyBzcGVjaWZpZWQsIGJ1dCBub3QgcHJlc2VudCBpbiB0aGUgc291cmNlIHRyZWUi
Ci0tIAoxLjkuMQoK

--_002_81B0EC78FE09F04E8E0FF9B9C2BF8A364938FBABdeeres07ebgroup_--
